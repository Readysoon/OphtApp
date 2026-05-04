import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/ophthalmology.dart';

class CategoryBrowser extends StatefulWidget {
  const CategoryBrowser({super.key});

  @override
  State<CategoryBrowser> createState() => _CategoryBrowserState();
}

class _CategoryBrowserState extends State<CategoryBrowser> {
  final List<Category> _categoryPath = [];
  Condition? _selectedCondition;
  Examination? _selectedExamination;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Condition? _findConditionRecursive(String id, List<Category> cats) {
    for (final cat in cats) {
      for (final cond in cat.conditions) {
        if (cond.id == id) return cond;
      }
      final inSub = _findConditionRecursive(id, cat.subCategories);
      if (inSub != null) return inSub;
    }
    return null;
  }

  /// Collects all conditions with their category path (breadcrumb) for searching.
  List<({Condition condition, List<String> path})> _collectAllConditions(
      List<Category> cats, List<String> currentPath) {
    final result = <({Condition condition, List<String> path})>[];
    for (final cat in cats) {
      final newPath = [...currentPath, cat.name];
      for (final cond in cat.conditions) {
        result.add((condition: cond, path: newPath));
      }
      result.addAll(_collectAllConditions(cat.subCategories, newPath));
    }
    return result;
  }

  /// Strips markdown syntax from text for cleaner snippet display.
  String _stripMarkdown(String text) {
    var s = text;
    // Remove markdown links [text](url) → text
    s = s.replaceAllMapped(RegExp(r'\[([^\]]+)\]\([^)]+\)'), (m) => m.group(1)!);
    // Remove headers (## text → text)
    s = s.replaceAll(RegExp(r'^#{1,6}\s+', multiLine: true), '');
    // Remove bold/italic markers (** and __ and * and _)
    s = s.replaceAllMapped(RegExp(r'\*\*([^*]+)\*\*'), (m) => m.group(1)!);
    s = s.replaceAllMapped(RegExp(r'__([^_]+)__'), (m) => m.group(1)!);
    s = s.replaceAllMapped(RegExp(r'(?<!\*)\*([^*\n]+)\*(?!\*)'), (m) => m.group(1)!);
    s = s.replaceAllMapped(RegExp(r'(?<!_)_([^_\n]+)_(?!_)'), (m) => m.group(1)!);
    // Remove blockquote markers
    s = s.replaceAll(RegExp(r'^>\s*', multiLine: true), '');
    // Remove list markers
    s = s.replaceAll(RegExp(r'^[\s]*[-*+]\s+', multiLine: true), '');
    s = s.replaceAll(RegExp(r'^[\s]*\d+\.\s+', multiLine: true), '');
    // Remove table separators (lines with only | - :)
    s = s.replaceAll(RegExp(r'^[\s|:\-]+$', multiLine: true), '');
    // Remove pipe characters from tables
    s = s.replaceAll('|', ' ');
    // Remove horizontal rules
    s = s.replaceAll(RegExp(r'^---+$', multiLine: true), '');
    // Remove inline code
    s = s.replaceAllMapped(RegExp(r'`([^`]+)`'), (m) => m.group(1)!);
    // Collapse whitespace
    s = s.replaceAll(RegExp(r'\s+'), ' ').trim();
    return s;
  }

  /// Searches for the query in a condition. Returns list of (field, snippet) matches.
  List<({String field, String snippet})> _searchInCondition(Condition cond, String query) {
    final matches = <({String field, String snippet})>[];
    final qLower = query.toLowerCase();

    void addMatch(String field, String rawText) {
      final cleanText = _stripMarkdown(rawText);
      final tLower = cleanText.toLowerCase();
      final idx = tLower.indexOf(qLower);
      if (idx == -1) return;
      // Build snippet: 70 chars before + match + 90 chars after
      final start = (idx - 70).clamp(0, cleanText.length);
      final end = (idx + query.length + 90).clamp(0, cleanText.length);
      var snippet = cleanText.substring(start, end).trim();
      if (start > 0) snippet = '…$snippet';
      if (end < cleanText.length) snippet = '$snippet…';
      matches.add((field: field, snippet: snippet));
    }

    if (cond.name.toLowerCase().contains(qLower)) {
      matches.add((field: 'Titel', snippet: cond.name));
    }
    if (cond.description.toLowerCase().contains(qLower)) {
      addMatch('Beschreibung', cond.description);
    }
    if (cond.wikiContent != null) {
      addMatch('Inhalt', cond.wikiContent!);
    }
    if (cond.wikiSummary != null) {
      addMatch('Kurzfassung', cond.wikiSummary!);
    }
    for (final t in cond.treatment) {
      if (t.toLowerCase().contains(qLower)) {
        matches.add((field: 'Therapie', snippet: _stripMarkdown(t)));
        break;
      }
    }
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedExamination != null) {
      return _ExaminationDetail(
        examination: _selectedExamination!,
        onBack: () => setState(() => _selectedExamination = null),
      );
    }
    if (_selectedCondition != null) {
      return _ConditionDetail(
        condition: _selectedCondition!,
        onBack: () => setState(() => _selectedCondition = null),
        onNavigateToCondition: (conditionId) {
          final cond = _findConditionRecursive(conditionId, categories);
          if (cond != null) setState(() => _selectedCondition = cond);
        },
      );
    }
    if (_categoryPath.isNotEmpty) {
      return _CategoryDetail(
        category: _categoryPath.last,
        onBack: () => setState(() => _categoryPath.removeLast()),
        onSelectCondition: (c) => setState(() => _selectedCondition = c),
        onSelectSubCategory: (c) => setState(() => _categoryPath.add(c)),
      );
    }

    final theme = Theme.of(context);
    final isSearching = _searchQuery.trim().length >= 2;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        // Search field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: InputDecoration(
              hintText: 'Stichwort suchen (z.B. Glaukom, Pelli-Robson)…',
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close, size: 18),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _searchQuery = '';
                        });
                      },
                    )
                  : null,
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withOpacity(0.4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              isDense: true,
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (isSearching) ..._buildSearchResults(theme) else ..._buildCategoryList(theme),
      ],
    );
  }

  List<Widget> _buildSearchResults(ThemeData theme) {
    final query = _searchQuery.trim();
    final allConditions = _collectAllConditions(categories, []);
    final results = <({Condition cond, List<String> path, List<({String field, String snippet})> matches})>[];

    for (final entry in allConditions) {
      final matches = _searchInCondition(entry.condition, query);
      if (matches.isNotEmpty) {
        results.add((cond: entry.condition, path: entry.path, matches: matches));
      }
    }

    if (results.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.search_off, size: 48, color: theme.colorScheme.onSurfaceVariant),
                const SizedBox(height: 8),
                Text(
                  'Keine Ergebnisse für "$query"',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ];
    }

    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Text(
          '${results.length} Treffer',
          style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
      ),
      ...results.map((r) => _SearchResultCard(
            condition: r.cond,
            path: r.path,
            matches: r.matches,
            query: query,
            onTap: () => setState(() => _selectedCondition = r.cond),
          )),
    ];
  }

  List<Widget> _buildCategoryList(ThemeData theme) {
    return [
      Text(
        'Kategorien',
        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20),
      ...categories.map((cat) => _CategoryTile(
            category: cat,
            onTap: () => setState(() => _categoryPath.add(cat)),
          )),
      const SizedBox(height: 28),
      Text(
        'Spezialuntersuchungen',
        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 16),
      ...examinations.map((exam) => _ExaminationTile(
            examination: exam,
            onTap: () => setState(() => _selectedExamination = exam),
          )),
    ];
  }
}

class _SearchResultCard extends StatelessWidget {
  const _SearchResultCard({
    required this.condition,
    required this.path,
    required this.matches,
    required this.query,
    required this.onTap,
  });

  final Condition condition;
  final List<String> path;
  final List<({String field, String snippet})> matches;
  final String query;
  final VoidCallback onTap;

  /// Builds a RichText with the query highlighted in the snippet.
  Widget _highlightedSnippet(BuildContext context, String snippet) {
    final theme = Theme.of(context);
    final qLower = query.toLowerCase();
    final sLower = snippet.toLowerCase();
    final spans = <TextSpan>[];
    var idx = 0;
    while (idx < snippet.length) {
      final found = sLower.indexOf(qLower, idx);
      if (found == -1) {
        spans.add(TextSpan(text: snippet.substring(idx)));
        break;
      }
      if (found > idx) {
        spans.add(TextSpan(text: snippet.substring(idx, found)));
      }
      spans.add(TextSpan(
        text: snippet.substring(found, found + query.length),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          backgroundColor: theme.colorScheme.primaryContainer.withOpacity(0.6),
          color: theme.colorScheme.onPrimaryContainer,
        ),
      ));
      idx = found + query.length;
    }
    return RichText(
      text: TextSpan(
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          height: 1.4,
        ),
        children: spans,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumb path
              if (path.isNotEmpty)
                Text(
                  path.join(' › '),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              const SizedBox(height: 4),
              // Condition name
              Text(
                condition.name,
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              // Match snippets
              ...matches.take(3).map((m) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            m.field,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 10,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        _highlightedSnippet(context, m.snippet),
                      ],
                    ),
                  )),
              if (matches.length > 3)
                Text(
                  '+ ${matches.length - 3} weitere Treffer',
                  style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.category, required this.onTap});

  final Category category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Text(category.icon, style: const TextStyle(fontSize: 28)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.name, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(
                      category.description,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      () {
                        final parts = <String>[];
                        if (category.subCategories.isNotEmpty) {
                          parts.add('${category.subCategories.length} Unterkategorien');
                        }
                        if (category.conditions.isNotEmpty) {
                          parts.add('${category.conditions.length} Erkrankungen');
                        }
                        return parts.join(' · ');
                      }(),
                      style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExaminationTile extends StatelessWidget {
  const _ExaminationTile({required this.examination, required this.onTap});

  final Examination examination;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primaryContainer.withOpacity(0.3),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(Icons.biotech, color: theme.colorScheme.primary, size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(examination.name, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(
                      examination.description,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryDetail extends StatelessWidget {
  const _CategoryDetail({
    required this.category,
    required this.onBack,
    required this.onSelectCondition,
    required this.onSelectSubCategory,
  });

  final Category category;
  final VoidCallback onBack;
  final ValueChanged<Condition> onSelectCondition;
  final ValueChanged<Category> onSelectSubCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final urgencyColors = {Urgency.low: Colors.green, Urgency.medium: Colors.amber, Urgency.high: Colors.red};
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        TextButton.icon(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back, size: 18),
          label: const Text('Zurück'),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(category.icon, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.name, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                  Text(category.description, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ...category.subCategories.map((sub) => Card(
              child: InkWell(
                onTap: () => onSelectSubCategory(sub),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(sub.icon, style: const TextStyle(fontSize: 22)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(sub.name, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(
                              sub.description,
                              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              () {
                                final parts = <String>[];
                                if (sub.subCategories.isNotEmpty) parts.add('${sub.subCategories.length} Unterkategorien');
                                if (sub.conditions.isNotEmpty) parts.add('${sub.conditions.length} Erkrankungen');
                                return parts.join(' · ');
                              }(),
                              style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
                    ],
                  ),
                ),
              ),
            )),
        ...category.conditions.map((c) => Card(
              child: InkWell(
                onTap: () => onSelectCondition(c),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(color: urgencyColors[c.urgency], shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(c.name, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(
                              c.description,
                              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

class _ConditionDetail extends StatefulWidget {
  const _ConditionDetail({required this.condition, required this.onBack, this.onNavigateToCondition});

  final Condition condition;
  final VoidCallback onBack;
  final ValueChanged<String>? onNavigateToCondition;

  @override
  State<_ConditionDetail> createState() => _ConditionDetailState();
}

class _ConditionDetailState extends State<_ConditionDetail> {
  bool _showSummary = false;
  final _referencesKey = GlobalKey();
  final Set<int> _expandedSections = {};
  bool _allExpanded = false;
  bool _referencesExpanded = false;

  void _toggleAll(int sectionCount) {
    setState(() {
      if (_allExpanded) {
        _expandedSections.clear();
        _allExpanded = false;
      } else {
        _expandedSections.addAll(List.generate(sectionCount, (i) => i));
        _allExpanded = true;
      }
    });
  }

  /// Converts unicode superscripts to clickable footnote links.
  /// Single regex pass: matches any superscript and replaces with markdown link.
  /// Skips table rows to avoid rendering issues.
  String _linkifyFootnotes(String content) {
    const superscripts = {'¹': '1', '²': '2', '³': '3', '⁴': '4', '⁵': '5', '⁶': '6', '⁷': '7', '⁸': '8', '⁹': '9'};
    final pattern = RegExp(r'[¹²³⁴⁵⁶⁷⁸⁹]');
    final lines = content.split('\n');
    final result = <String>[];
    for (final line in lines) {
      if (line.trimLeft().startsWith('|')) {
        result.add(line);
      } else {
        // Single pass over the line — each superscript replaced exactly once
        result.add(line.replaceAllMapped(pattern, (m) {
          final ch = m.group(0)!;
          final num = superscripts[ch]!;
          return '[$ch](#ref-$num)';
        }));
      }
    }
    return result.join('\n');
  }

  /// Splits body into overview + all ## sections.
  /// Returns (overview, list of (title, content) pairs) or null if fewer than 2 sections.
  (String overview, List<(String title, String content)> sections)? _splitSections(String body) {
    final sectionPattern = RegExp(r'^## ', multiLine: true);
    final matches = sectionPattern.allMatches(body).toList();
    if (matches.length < 2) return null;

    final overview = body.substring(0, matches.first.start).trimRight();
    final sections = <(String title, String content)>[];

    for (var i = 0; i < matches.length; i++) {
      final start = matches[i].start;
      final end = i + 1 < matches.length ? matches[i + 1].start : body.length;
      final sectionText = body.substring(start, end).trim();
      final firstNewline = sectionText.indexOf('\n');
      final titleLine = firstNewline == -1 ? sectionText : sectionText.substring(0, firstNewline);
      var title = titleLine.replaceFirst(RegExp(r'^## (\d+\.\s+)?'), '').trim();
      // Remove footnote links and unicode superscripts from section titles
      title = title.replaceAll(RegExp(r'\[([¹²³⁴⁵⁶⁷⁸⁹⁰]+)\]\(#ref-\d+\)'), '');
      title = title.replaceAll(RegExp(r'[¹²³⁴⁵⁶⁷⁸⁹⁰]+'), '');
      title = title.trim();
      final content = firstNewline == -1 ? '' : sectionText.substring(firstNewline).trim();
      sections.add((title, content));
    }

    return (overview, sections);
  }

  /// Splits wikiContent into body (before ## Referenzen) and references (the list).
  (String body, String? references) _splitContent(String content) {
    final refIndex = content.indexOf('## Referenzen');
    if (refIndex == -1) return (content, null);
    final body = content.substring(0, refIndex).trimRight();
    // Extract just the list items after the heading
    final refSection = content.substring(refIndex + '## Referenzen'.length).trim();
    return (body, refSection);
  }

  void _scrollToReferences() {
    setState(() => _referencesExpanded = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _referencesKey.currentContext;
      if (ctx != null) {
        Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      }
    });
  }

  Widget _buildImage(Uri uri, String? title, String? alt) {
    final uriStr = uri.toString();
    if (uriStr.startsWith('asset:')) {
      final assetPath = uriStr.substring('asset:'.length);
      return _CollapsibleImage(assetPath: assetPath, caption: alt);
    }
    return Image.network(uriStr);
  }

  void _handleTapLink(String text, String? href, String title) {
    if (href != null && href.startsWith('#ref-')) {
      _scrollToReferences();
    } else if (href != null && href.startsWith('#') && !href.startsWith('#ref-')) {
      final conditionId = href.substring(1);
      widget.onNavigateToCondition?.call(conditionId);
    } else if (href != null) {
      launchUrl(Uri.parse(href), mode: LaunchMode.externalApplication);
    }
  }

  MarkdownStyleSheet _buildMarkdownStyle(ThemeData theme) {
    return MarkdownStyleSheet(
      h2: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.primary,
      ),
      h3: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.onSurface,
      ),
      p: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
      strong: TextStyle(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface),
      listBullet: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
      listBulletPadding: const EdgeInsets.only(right: 8),
      listIndent: 20,
      blockquoteDecoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.25),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        border: Border(
          left: BorderSide(color: theme.colorScheme.primary, width: 4),
        ),
      ),
      blockquotePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.colorScheme.outlineVariant.withOpacity(0.5), width: 1),
        ),
      ),
      h2Padding: const EdgeInsets.only(top: 24, bottom: 10),
      h3Padding: const EdgeInsets.only(top: 18, bottom: 8),
      a: TextStyle(
        color: theme.colorScheme.primary,
        decoration: TextDecoration.underline,
        decorationColor: theme.colorScheme.primary.withOpacity(0.4),
      ),
      tableHead: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      tableBody: theme.textTheme.bodyMedium,
      tableBorder: TableBorder.all(color: theme.colorScheme.outlineVariant, width: 0.5),
      tableHeadAlign: TextAlign.left,
      tableCellsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      tableColumnWidth: const IntrinsicColumnWidth(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final condition = widget.condition;
    final urgencyConfig = {
      Urgency.low: (label: 'Niedrige Dringlichkeit', color: Colors.green),
      Urgency.medium: (label: 'Mittlere Dringlichkeit', color: Colors.amber),
      Urgency.high: (label: 'Hohe Dringlichkeit', color: Colors.red),
    };
    final config = urgencyConfig[condition.urgency]!;

    if (condition.wikiContent != null) {
      final isSummary = _showSummary && condition.wikiSummary != null;
      final rawContent = isSummary ? condition.wikiSummary! : condition.wikiContent!;
      final (bodyContent, referencesContent) = _splitContent(rawContent);
      final linkedBody = _linkifyFootnotes(bodyContent);

      return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          TextButton.icon(
            onPressed: widget.onBack,
            icon: const Icon(Icons.arrow_back, size: 18),
            label: const Text('Zurück'),
          ),
          // Header card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          condition.name,
                          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: config.color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: config.color.withOpacity(0.5)),
                        ),
                        child: Text(config.label, style: theme.textTheme.labelSmall?.copyWith(color: config.color, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  if (condition.wikiSummary != null) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            condition.description,
                            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                          ),
                        ),
                        const SizedBox(width: 12),
                        FilledButton.tonalIcon(
                          onPressed: () => setState(() => _showSummary = !_showSummary),
                          icon: Icon(_showSummary ? Icons.article_outlined : Icons.summarize_outlined, size: 18),
                          label: Text(_showSummary ? 'Volltext' : 'Kurzfassung', style: const TextStyle(fontSize: 12)),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Content – split into collapsible sections
          ...() {
            final sections = _splitSections(linkedBody);
            if (sections != null) {
              final sectionList = sections.$2;
              return <Widget>[
                if (sections.$1.isNotEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: MarkdownBody(
                        data: sections.$1,
                        selectable: true,
                        imageBuilder: _buildImage,
                        onTapLink: _handleTapLink,
                        styleSheet: _buildMarkdownStyle(theme),
                      ),
                    ),
                  ),
                // Expand/collapse all button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () => _toggleAll(sectionList.length),
                        icon: Icon(
                          _allExpanded ? Icons.unfold_less : Icons.unfold_more,
                          size: 18,
                          color: theme.colorScheme.primary,
                        ),
                        label: Text(
                          _allExpanded ? 'Alle zuklappen' : 'Alle aufklappen',
                          style: TextStyle(fontSize: 12, color: theme.colorScheme.primary),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                    ],
                  ),
                ),
                ...sectionList.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final section = entry.value;
                  final isExpanded = _expandedSections.contains(idx);
                  return Card(
                    key: ValueKey('section_$idx\_${isExpanded}'),
                    child: Theme(
                      data: theme.copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: isExpanded,
                        onExpansionChanged: (expanded) {
                          setState(() {
                            if (expanded) {
                              _expandedSections.add(idx);
                            } else {
                              _expandedSections.remove(idx);
                            }
                            _allExpanded = _expandedSections.length == sectionList.length;
                          });
                        },
                        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        childrenPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                        leading: Icon(Icons.article_outlined, color: theme.colorScheme.primary, size: 22),
                        title: Text(
                          section.$1,
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        children: [
                          MarkdownBody(
                            data: section.$2,
                            selectable: true,
                            imageBuilder: _buildImage,
                            onTapLink: _handleTapLink,
                            styleSheet: _buildMarkdownStyle(theme),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ];
            }
            // Fallback: single content card (no ## sections)
            return <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: MarkdownBody(
                    data: linkedBody,
                    selectable: true,
                    imageBuilder: _buildImage,
                    onTapLink: _handleTapLink,
                    styleSheet: _buildMarkdownStyle(theme),
                  ),
                ),
              ),
            ];
          }(),
          // References card (collapsible)
          if (referencesContent != null) ...[
            const SizedBox(height: 4),
            Card(
              key: _referencesKey,
              color: theme.colorScheme.surfaceContainerLow,
              child: Theme(
                data: theme.copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  key: ValueKey('refs_$_referencesExpanded'),
                  initiallyExpanded: _referencesExpanded,
                  onExpansionChanged: (expanded) {
                    setState(() => _referencesExpanded = expanded);
                  },
                  tilePadding: const EdgeInsets.symmetric(horizontal: 20),
                  childrenPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
                  leading: Icon(Icons.menu_book_rounded, size: 20, color: theme.colorScheme.primary),
                  title: Text(
                    'Referenzen',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  children: [
                    MarkdownBody(
                      data: referencesContent,
                      selectable: true,
                      onTapLink: (text, href, title) {
                        if (href != null && !href.startsWith('#')) {
                          launchUrl(Uri.parse(href), mode: LaunchMode.externalApplication);
                        }
                      },
                      styleSheet: _buildMarkdownStyle(theme).copyWith(
                        p: theme.textTheme.bodySmall?.copyWith(height: 1.5, color: theme.colorScheme.onSurfaceVariant),
                        a: TextStyle(
                          color: theme.colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: theme.colorScheme.primary.withOpacity(0.4),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      );
    }

    // Fallback for conditions without wikiContent
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        TextButton.icon(
          onPressed: widget.onBack,
          icon: const Icon(Icons.arrow_back, size: 18),
          label: const Text('Zurück'),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        condition.name,
                        style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: config.color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: config.color.withOpacity(0.5)),
                      ),
                      child: Text(config.label, style: theme.textTheme.labelSmall?.copyWith(color: config.color, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(condition.description, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                const SizedBox(height: 20),
                if (condition.diagnostics != null && condition.diagnostics!.isNotEmpty) ...[
                  Text('DIAGNOSTIK', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  ...condition.diagnostics!.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.only(top: 6),
                              decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(s, style: theme.textTheme.bodySmall)),
                          ],
                        ),
                      )),
                  const SizedBox(height: 16),
                ],
                Text('THERAPIE', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                ...condition.treatment.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(color: theme.colorScheme.primary, shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: Text(s, style: theme.textTheme.bodySmall)),
                        ],
                      ),
                    )),
                const SizedBox(height: 12),
                Text('Follow-up: ${condition.followUp}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                if (condition.complications != null && condition.complications!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('KOMPLIKATIONEN', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: Colors.red)),
                  const SizedBox(height: 8),
                  ...condition.complications!.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.warning_amber_rounded, size: 16, color: Colors.red),
                            const SizedBox(width: 8),
                            Expanded(child: Text(s, style: theme.textTheme.bodySmall?.copyWith(color: Colors.red.shade700))),
                          ],
                        ),
                      )),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ExaminationDetail extends StatelessWidget {
  const _ExaminationDetail({required this.examination, required this.onBack});

  final Examination examination;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        TextButton.icon(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back, size: 18),
          label: const Text('Zurück'),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.biotech, color: theme.colorScheme.primary, size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        examination.name,
                        style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(examination.description, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                const SizedBox(height: 20),
                Text('DURCHFÜHRUNG', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                ...examination.procedure.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(color: theme.colorScheme.primary, shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: Text(s, style: theme.textTheme.bodySmall)),
                        ],
                      ),
                    )),
                if (examination.normalValues != null && examination.normalValues!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('NORMALWERTE', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(examination.normalValues!, style: theme.textTheme.bodySmall),
                  ),
                ],
                const SizedBox(height: 16),
                Text('INTERPRETATION', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                ...examination.interpretation.map((s) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.lightbulb_outline, size: 16, color: Colors.blue.shade700),
                          const SizedBox(width: 8),
                          Expanded(child: Text(s, style: theme.textTheme.bodySmall)),
                        ],
                      ),
                    )),
                const SizedBox(height: 16),
                Text('INDIKATIONEN', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: examination.indications
                      .map((ind) => Chip(
                            label: Text(ind, style: theme.textTheme.labelSmall),
                            backgroundColor: theme.colorScheme.primaryContainer.withOpacity(0.5),
                          ))
                      .toList(),
                ),
                if (examination.equipment != null && examination.equipment!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('MATERIAL', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  ...examination.equipment!.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text('• $s', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                      )),
                ],
                if (examination.tips != null && examination.tips!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('TIPPS', style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  ...examination.tips!.map((s) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.lightbulb_outline, size: 16, color: Colors.amber.shade700),
                            const SizedBox(width: 8),
                            Expanded(child: Text(s, style: theme.textTheme.bodySmall)),
                          ],
                        ),
                      )),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CollapsibleImage extends StatefulWidget {
  const _CollapsibleImage({required this.assetPath, this.caption});

  final String assetPath;
  final String? caption;

  @override
  State<_CollapsibleImage> createState() => _CollapsibleImageState();
}

class _CollapsibleImageState extends State<_CollapsibleImage> {
  bool _expanded = false;

  void _openFullscreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black87,
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: _FullscreenImageViewer(
              assetPath: widget.assetPath,
              caption: widget.caption,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withOpacity(0.25),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  Icon(
                    _expanded ? Icons.image : Icons.image_outlined,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.caption ?? 'Bild anzeigen',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 20,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded) ...[
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _openFullscreen(context),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200, maxHeight: 150),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(widget.assetPath, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _FullscreenImageViewer extends StatefulWidget {
  const _FullscreenImageViewer({required this.assetPath, this.caption});

  final String assetPath;
  final String? caption;

  @override
  State<_FullscreenImageViewer> createState() => _FullscreenImageViewerState();
}

class _FullscreenImageViewerState extends State<_FullscreenImageViewer> {
  final TransformationController _controller = TransformationController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {},
                child: InteractiveViewer(
                  transformationController: _controller,
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(widget.assetPath, fit: BoxFit.contain),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: SafeArea(
                child: IconButton.filled(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: Colors.black54),
                ),
              ),
            ),
            if (widget.caption != null && widget.caption!.isNotEmpty)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    color: Colors.black54,
                    child: Text(
                      widget.caption!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
