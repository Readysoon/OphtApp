import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../services/local_storage.dart';

class GlassesPrescriptionTab extends StatefulWidget {
  const GlassesPrescriptionTab({super.key});

  @override
  State<GlassesPrescriptionTab> createState() => _GlassesPrescriptionTabState();
}

class _GlassesPrescriptionTabState extends State<GlassesPrescriptionTab> {
  final Map<String, String> _right = {'sphere': '', 'cylinder': '', 'axis': '', 'addition': '', 'pd': ''};
  final Map<String, String> _left = {'sphere': '', 'cylinder': '', 'axis': '', 'addition': '', 'pd': ''};
  final Map<String, String> _contactRight = {'sphere': '', 'bc': '', 'dia': ''};
  final Map<String, String> _contactLeft = {'sphere': '', 'bc': '', 'dia': ''};
  String _notes = '';
  bool _contactOpen = false;
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await loadGlassesPrescription();
    if (data != null) {
      _applyMap(_right, data['right']);
      _applyMap(_left, data['left']);
      _applyMap(_contactRight, data['contactRight']);
      _applyMap(_contactLeft, data['contactLeft']);
      _notes = (data['notes'] as String?) ?? '';
    }
    if (mounted) setState(() => _loading = false);
  }

  void _applyMap(Map<String, String> target, dynamic source) {
    if (source is! Map) return;
    for (final k in target.keys) {
      if (source[k] != null) target[k] = source[k].toString();
    }
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    await saveGlassesPrescription({
      'right': _right,
      'left': _left,
      'contactRight': _contactRight,
      'contactLeft': _contactLeft,
      'notes': _notes,
    });
    if (mounted) {
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Brillenpass gespeichert')));
    }
  }

  Future<void> _exportPdf() async {
    final pdf = pw.Document();
    final now = DateTime.now();
    final dateStr = '${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}';

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Text('Brillenpass', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 4),
              pw.Text('Erstellt am: $dateStr', style: const pw.TextStyle(fontSize: 10)),
              pw.SizedBox(height: 20),
              pw.Table(
                columnWidths: {
                  0: const pw.FlexColumnWidth(1.2),
                  1: const pw.FlexColumnWidth(1.5),
                  2: const pw.FlexColumnWidth(1.5),
                  3: const pw.FlexColumnWidth(1),
                  4: const pw.FlexColumnWidth(1.5),
                  5: const pw.FlexColumnWidth(1),
                },
                children: [
                  pw.TableRow(
                    decoration: const pw.BoxDecoration(color: PdfColors.grey300),
                    children: ['Auge', 'Sphäre', 'Zylinder', 'Achse', 'Addition', 'PD']
                        .map((s) => pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(s, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)))).toList(),
                  ),
                  pw.TableRow(
                    children: ['Rechts (R)', _right['sphere'] ?? '', _right['cylinder'] ?? '', _right['axis'] ?? '', _right['addition'] ?? '', _right['pd'] ?? '']
                        .map((s) => pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(s.isEmpty ? '-' : s))).toList(),
                  ),
                  pw.TableRow(
                    children: ['Links (L)', _left['sphere'] ?? '', _left['cylinder'] ?? '', _left['axis'] ?? '', _left['addition'] ?? '', _left['pd'] ?? '']
                        .map((s) => pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(s.isEmpty ? '-' : s))).toList(),
                  ),
                ],
              ),
              if (_contactRight['sphere']!.isNotEmpty || _contactRight['bc']!.isNotEmpty || _contactRight['dia']!.isNotEmpty ||
                  _contactLeft['sphere']!.isNotEmpty || _contactLeft['bc']!.isNotEmpty || _contactLeft['dia']!.isNotEmpty) ...[
                pw.SizedBox(height: 16),
                pw.Text('Kontaktlinsen', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 8),
                pw.Table(
                  columnWidths: {0: const pw.FlexColumnWidth(1.5), 1: const pw.FlexColumnWidth(1.5), 2: const pw.FlexColumnWidth(1.5), 3: const pw.FlexColumnWidth(1.5)},
                  children: [
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(color: PdfColors.grey300),
                      children: ['Auge', 'Stärke (dpt)', 'BC (mm)', 'DIA (mm)']
                          .map((s) => pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(s, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)))).toList(),
                    ),
                    pw.TableRow(
                      children: ['Rechts (R)', _contactRight['sphere'] ?? '', _contactRight['bc'] ?? '', _contactRight['dia'] ?? '']
                          .map((s) => pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(s.isEmpty ? '-' : s))).toList(),
                    ),
                    pw.TableRow(
                      children: ['Links (L)', _contactLeft['sphere'] ?? '', _contactLeft['bc'] ?? '', _contactLeft['dia'] ?? '']
                          .map((s) => pw.Padding(padding: const pw.EdgeInsets.all(4), child: pw.Text(s.isEmpty ? '-' : s))).toList(),
                    ),
                  ],
                ),
              ],
              if (_notes.isNotEmpty) ...[
                pw.SizedBox(height: 16),
                pw.Text('Notizen:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 4),
                pw.Text(_notes),
              ],
              pw.Spacer(),
              pw.Text('Erstellt mit AugenCheck', style: pw.TextStyle(fontSize: 8, color: PdfColors.grey)),
            ],
          );
        },
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/brillenpass.pdf');
    await file.writeAsBytes(await pdf.save());
    if (mounted) {
      await OpenFile.open(file.path);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('PDF wurde gespeichert und geöffnet')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    Widget eyeFields(String side, Map<String, String> values) {
      final labels = {'sphere': 'Sphäre (dpt)', 'cylinder': 'Zylinder (dpt)', 'axis': 'Achse (°)', 'addition': 'Addition (dpt)', 'pd': 'PD (mm)'};
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(side, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: labels.entries.map((e) {
              return SizedBox(
                width: 90,
                child: TextField(
                  decoration: InputDecoration(labelText: e.value, isDense: true),
                  onChanged: (v) => setState(() => values[e.key] = v),
                ),
              );
            }).toList(),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Mein Brillenpass', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 16),
                  eyeFields('Rechtes Auge (R)', _right),
                  const SizedBox(height: 20),
                  eyeFields('Linkes Auge (L)', _left),
                  const SizedBox(height: 16),
                  ExpansionTile(
                    title: const Text('Kontaktlinsen'),
                    initiallyExpanded: _contactOpen,
                    onExpansionChanged: (v) => setState(() => _contactOpen = v == true),
                    children: [
                      eyeContactFields('Rechtes Auge (R)', _contactRight),
                      eyeContactFields('Linkes Auge (L)', _contactLeft),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Notizen (z.B. Gleitsichtgläser, Entspiegelung)',
                      hintText: 'Zusätzliche Informationen...',
                    ),
                    controller: TextEditingController(text: _notes),
                    onChanged: (v) => setState(() => _notes = v),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: _saving ? null : _save,
                          icon: _saving ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.save, size: 18),
                          label: const Text('Speichern'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _exportPdf,
                          icon: const Icon(Icons.picture_as_pdf, size: 18),
                          label: const Text('PDF Export'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget eyeContactFields(String side, Map<String, String> values) {
    final theme = Theme.of(context);
    final labels = {'sphere': 'Stärke (dpt)', 'bc': 'BC (mm)', 'dia': 'DIA (mm)'};
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(side, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Row(
            children: labels.entries.map((e) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  width: 85,
                  child: TextField(
                    decoration: InputDecoration(labelText: e.value, isDense: true),
                    controller: TextEditingController(text: values[e.key]),
                    onChanged: (v) => setState(() => values[e.key] = v),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
