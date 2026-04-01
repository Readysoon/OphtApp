import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../services/local_storage.dart';

class EyePressureTab extends StatefulWidget {
  const EyePressureTab({
    super.key,
    required this.patientName,
    required this.patientBirthDate,
  });

  final String patientName;
  final String patientBirthDate;

  @override
  State<EyePressureTab> createState() => _EyePressureTabState();
}

class _EyePressureTabState extends State<EyePressureTab> {
  String _pachyLeft = '';
  String _pachyRight = '';
  final List<Map<String, String>> _entries = [];
  bool _loading = true;
  String _newDate = '';
  String _newTime = '';
  String _newLeft = '';
  String _newRight = '';
  String _newNotes = '';

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _newDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    _newTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
    _load();
  }

  Future<void> _load() async {
    final pachy = await loadPachymetry();
    final entries = await loadPressureEntries();
    if (mounted) {
      setState(() {
        _pachyLeft = pachy['leftEye'] ?? '';
        _pachyRight = pachy['rightEye'] ?? '';
        _entries.clear();
        for (final e in entries) {
          _entries.add({
            'id': e['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
            'date': e['date'] ?? '',
            'time': e['time'] ?? '',
            'leftEye': e['leftEye'] ?? '',
            'rightEye': e['rightEye'] ?? '',
            'notes': e['notes'] ?? '',
          });
        }
        _loading = false;
      });
    }
  }

  Future<void> _savePachymetry() async {
    await savePachymetry(_pachyLeft, _pachyRight);
  }

  void _addEntry() {
    if (_newLeft.isEmpty && _newRight.isEmpty) return;
    setState(() {
      _entries.insert(0, {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'date': _newDate,
        'time': _newTime,
        'leftEye': _newLeft,
        'rightEye': _newRight,
        'notes': _newNotes,
      });
      _newLeft = '';
      _newRight = '';
      _newNotes = '';
    });
    savePressureEntries(_entries.map((e) => Map<String, dynamic>.from(e)).toList());
  }

  void _deleteEntry(String id) {
    setState(() => _entries.removeWhere((e) => e['id'] == id));
    savePressureEntries(_entries.map((e) => Map<String, dynamic>.from(e)).toList());
  }

  Future<void> _exportPdf() async {
    final pdf = pw.Document();
    final now = DateTime.now();
    final dateStr = '${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}';

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          final children = <pw.Widget>[
            pw.Text('Augendruck-Tagebuch', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 4),
            pw.Text('Erstellt am: $dateStr'),
            pw.SizedBox(height: 16),
          ];
          if (widget.patientName.isNotEmpty || widget.patientBirthDate.isNotEmpty) {
            children.add(pw.Text('Patientendaten', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)));
            if (widget.patientName.isNotEmpty) children.add(pw.Text('Name: ${widget.patientName}'));
            if (widget.patientBirthDate.isNotEmpty) children.add(pw.Text('Geburtsdatum: ${widget.patientBirthDate}'));
            children.add(pw.SizedBox(height: 12));
          }
          if (_pachyLeft.isNotEmpty || _pachyRight.isNotEmpty) {
            children.add(pw.Text('Pachymetrie (Hornhautdicke)', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)));
            children.add(pw.Text('Linkes Auge: ${_pachyLeft.isEmpty ? "nicht erfasst" : "${_pachyLeft} µm"}'));
            children.add(pw.Text('Rechtes Auge: ${_pachyRight.isEmpty ? "nicht erfasst" : "${_pachyRight} µm"}'));
            children.add(pw.Text('Normalwert: 520-560 µm', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey)));
            children.add(pw.SizedBox(height: 16));
          }
          if (_entries.isNotEmpty) {
            children.add(pw.Text('Augendruckwerte', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)));
            children.add(pw.SizedBox(height: 8));
            final sorted = List<Map<String, String>>.from(_entries)
              ..sort((a, b) => '${a['date']}${a['time']}'.compareTo('${b['date']}${b['time']}'));
            for (final e in sorted) {
              children.add(pw.Text('${e['date']} ${e['time']}  L: ${e['leftEye']!.isEmpty ? "-" : "${e['leftEye']} mmHg"}  R: ${e['rightEye']!.isEmpty ? "-" : "${e['rightEye']} mmHg"}'));
              if ((e['notes'] ?? '').isNotEmpty) {
                children.add(pw.Text('  Notiz: ${e['notes']}', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey)));
              }
            }
            children.add(pw.SizedBox(height: 8));
            children.add(pw.Text('Normalwert: 10-21 mmHg', style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey)));
          }
          return children;
        },
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/augendruck-tagebuch.pdf');
    await file.writeAsBytes(await pdf.save());
    if (mounted) {
      await OpenFile.open(file.path);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('PDF wurde gespeichert')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (_loading) return const Center(child: CircularProgressIndicator());

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
                  Text('Pachymetrie (Hornhautdicke)', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text('Tragen Sie hier Ihre Hornhautdicke-Werte ein (in µm).', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(labelText: 'Linkes Auge (µm)', hintText: 'z.B. 545'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) {
                            setState(() => _pachyLeft = v);
                            _savePachymetry();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(labelText: 'Rechtes Auge (µm)', hintText: 'z.B. 550'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) {
                            setState(() => _pachyRight = v);
                            _savePachymetry();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Normalwert: 520-560 µm.', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Neuen Augendruckwert eintragen', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(labelText: 'Datum'),
                          onChanged: (v) => setState(() => _newDate = v),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(labelText: 'Uhrzeit'),
                          onChanged: (v) => setState(() => _newTime = v),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(labelText: 'Linkes Auge (mmHg)', hintText: 'z.B. 16'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) => setState(() => _newLeft = v),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(labelText: 'Rechtes Auge (mmHg)', hintText: 'z.B. 15'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) => setState(() => _newRight = v),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Notizen (optional)'),
                    onChanged: (v) => setState(() => _newNotes = v),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      FilledButton.icon(onPressed: _addEntry, icon: const Icon(Icons.add, size: 18), label: const Text('Eintrag hinzufügen')),
                      const SizedBox(width: 12),
                      if (_entries.isNotEmpty)
                        OutlinedButton.icon(onPressed: _exportPdf, icon: const Icon(Icons.download, size: 18), label: const Text('PDF exportieren')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_entries.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Ihre Augendruckwerte', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    ..._entries.map((e) => ListTile(
                          title: Text('${e['date']} ${e['time']}  L: ${(e['leftEye'] ?? '').toString().isEmpty ? "-" : "${e['leftEye']} mmHg"}  R: ${(e['rightEye'] ?? '').toString().isEmpty ? "-" : "${e['rightEye']} mmHg"}'),
                          subtitle: (e['notes'] ?? '').isNotEmpty ? Text(e['notes']!) : null,
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => _deleteEntry(e['id']!),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
          if (_entries.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(Icons.show_chart, size: 48, color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5)),
                    const SizedBox(height: 12),
                    Text('Noch keine Einträge. Fügen Sie Ihren ersten Augendruckwert hinzu.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
