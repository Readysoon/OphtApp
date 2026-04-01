import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/ophthalmology.dart';

class CategoryBrowser extends StatefulWidget {
  const CategoryBrowser({super.key});

  @override
  State<CategoryBrowser> createState() => _CategoryBrowserState();
}

class _CategoryBrowserState extends State<CategoryBrowser> {
  Category? _selectedCategory;
  Condition? _selectedCondition;
  Examination? _selectedExamination;

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
      );
    }
    if (_selectedCategory != null) {
      return _CategoryDetail(
        category: _selectedCategory!,
        onBack: () => setState(() => _selectedCategory = null),
        onSelectCondition: (c) => setState(() => _selectedCondition = c),
      );
    }

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        Text(
          'Kategorien',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ...categories.map((cat) => _CategoryTile(
              category: cat,
              onTap: () => setState(() => _selectedCategory = cat),
            )),
        const SizedBox(height: 28),
        Text(
          'Spezialuntersuchungen',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...examinations.map((exam) => _ExaminationTile(
              examination: exam,
              onTap: () => setState(() => _selectedExamination = exam),
            )),
      ],
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
                      '${category.conditions.length} Erkrankungen',
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
  });

  final Category category;
  final VoidCallback onBack;
  final ValueChanged<Condition> onSelectCondition;

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

class _ConditionDetail extends StatelessWidget {
  const _ConditionDetail({required this.condition, required this.onBack});

  final Condition condition;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final urgencyConfig = {
      Urgency.low: (label: 'Niedrige Dringlichkeit', color: Colors.green),
      Urgency.medium: (label: 'Mittlere Dringlichkeit', color: Colors.amber),
      Urgency.high: (label: 'Hohe Dringlichkeit', color: Colors.red),
    };
    final config = urgencyConfig[condition.urgency]!;

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
