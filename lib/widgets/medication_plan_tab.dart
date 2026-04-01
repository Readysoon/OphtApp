import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../services/local_storage.dart';

class MedicationPlanTab extends StatefulWidget {
  const MedicationPlanTab({
    super.key,
    required this.patientName,
    required this.patientBirthDate,
  });

  final String patientName;
  final String patientBirthDate;

  @override
  State<MedicationPlanTab> createState() => _MedicationPlanTabState();
}

class _MedicationPlanTabState extends State<MedicationPlanTab> {
  final List<Map<String, dynamic>> _medications = [];
  bool _loading = true;
  String _name = '';
  String _type = 'drops';
  String _dosage = '';
  String _frequency = '3x';
  String _eye = 'both';
  String _notes = '';

  static const List<Map<String, String>> _frequencyOptions = [
    {'value': '30min', 'label': '1/2-Stündlich'},
    {'value': '1h', 'label': 'Stündlich'},
    {'value': '2h', 'label': '2-stündlich'},
    {'value': '6x', 'label': '6x täglich'},
    {'value': '4x', 'label': '4x täglich'},
    {'value': '3x', 'label': '3x täglich'},
    {'value': '2x', 'label': '2x täglich'},
    {'value': '1x', 'label': '1x täglich'},
  ];

  static const List<Map<String, String>> _eyeOptions = [
    {'value': 'left', 'label': 'Linkes Auge (LA)'},
    {'value': 'right', 'label': 'Rechtes Auge (RA)'},
    {'value': 'both', 'label': 'Beide Augen (BA)'},
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final list = await loadMedications();
    if (mounted) {
      setState(() {
        _medications.clear();
        for (final e in list) {
          _medications.add(Map<String, dynamic>.from(e));
        }
        _loading = false;
      });
    }
  }

  String _getFrequencyLabel(String value) => _frequencyOptions.firstWhere((o) => o['value'] == value, orElse: () => {'label': value})['label']!;
  String _getEyeLabel(String value) => _eyeOptions.firstWhere((o) => o['value'] == value, orElse: () => {'label': value})['label']!;

  void _addMedication() {
    final name = _name.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bitte Medikamentennamen eingeben.')));
      return;
    }
    if (_type != 'tablets' && _dosage.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bitte Dosierung eingeben.')));
      return;
    }
    setState(() {
      _medications.add({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': _type == 'drops' && !name.toUpperCase().endsWith('AT') ? '$name AT' : (_type == 'ointment' && !name.toUpperCase().endsWith('AS') ? '$name AS' : name),
        'type': _type,
        'dosage': _dosage.trim().isEmpty ? (_type == 'drops' ? '1 Tropfen' : '1 cm Strang') : _dosage.trim(),
        'frequency': _frequency,
        'eye': _eye,
        'notes': _notes,
      });
      _name = '';
      _dosage = '';
      _notes = '';
    });
    saveMedications(_medications);
  }

  void _removeMedication(String id) {
    setState(() => _medications.removeWhere((m) => m['id'] == id));
    saveMedications(_medications);
  }

  Future<void> _exportPdf() async {
    if (widget.patientName.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bitte Patientennamen unter Patientendaten eingeben.')));
      return;
    }
    if (_medications.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bitte mindestens ein Medikament hinzufügen.')));
      return;
    }

    final pdf = pw.Document();
    final now = DateTime.now();
    final dateStr = '${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year}';

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          final children = <pw.Widget>[
            pw.Text('Medikationsplan', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 12),
            pw.Text('Patient: ${widget.patientName}'),
            if (widget.patientBirthDate.isNotEmpty) pw.Text('Geburtsdatum: ${widget.patientBirthDate}'),
            pw.Text('Erstellt am: $dateStr'),
            pw.SizedBox(height: 16),
            pw.Divider(),
            pw.SizedBox(height: 12),
          ];
          final drops = _medications.where((m) => m['type'] == 'drops').toList();
          final ointment = _medications.where((m) => m['type'] == 'ointment').toList();
          final tablets = _medications.where((m) => m['type'] == 'tablets').toList();
          if (drops.isNotEmpty) {
            children.add(pw.Text('Augentropfen', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)));
            for (final m in drops) {
              children.add(pw.Text('• ${m['name']} - ${m['dosage']} - ${_getFrequencyLabel(m['frequency'] as String)} (${_getEyeLabel(m['eye'] as String)})'));
              if ((m['notes'] as String?)?.isNotEmpty == true) children.add(pw.Text('  Hinweis: ${m['notes']}', style: pw.TextStyle(fontStyle: pw.FontStyle.italic)));
            }
            children.add(pw.SizedBox(height: 8));
          }
          if (ointment.isNotEmpty) {
            children.add(pw.Text('Augensalbe', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)));
            for (final m in ointment) {
              children.add(pw.Text('• ${m['name']} - ${m['dosage']} - ${_getFrequencyLabel(m['frequency'] as String)} (${_getEyeLabel(m['eye'] as String)})'));
              if ((m['notes'] as String?)?.isNotEmpty == true) children.add(pw.Text('  Hinweis: ${m['notes']}', style: pw.TextStyle(fontStyle: pw.FontStyle.italic)));
            }
            children.add(pw.SizedBox(height: 8));
          }
          if (tablets.isNotEmpty) {
            children.add(pw.Text('Tabletten', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)));
            for (final m in tablets) {
              children.add(pw.Text('• ${m['name']} - ${m['dosage']}'));
              if ((m['notes'] as String?)?.isNotEmpty == true) children.add(pw.Text('  Hinweis: ${m['notes']}', style: pw.TextStyle(fontStyle: pw.FontStyle.italic)));
            }
          }
          children.add(pw.SizedBox(height: 16));
          children.add(pw.Divider());
          children.add(pw.SizedBox(height: 8));
          children.add(pw.Text('Bitte befolgen Sie die Anweisungen Ihres Arztes.', style: pw.TextStyle(fontSize: 9, fontStyle: pw.FontStyle.italic)));
          children.add(pw.Text('Bei Fragen oder Nebenwirkungen kontaktieren Sie Ihren Augenarzt.', style: pw.TextStyle(fontSize: 9, fontStyle: pw.FontStyle.italic)));
          return children;
        },
      ),
    );

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/Medikationsplan_${widget.patientName.replaceAll(' ', '_')}_$dateStr.pdf');
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
                  Text('Medikament hinzufügen', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'drops', label: Text('Tropfen'), icon: Icon(Icons.water_drop, size: 18)),
                      ButtonSegment(value: 'ointment', label: Text('Salbe'), icon: Icon(Icons.circle, size: 18)),
                      ButtonSegment(value: 'tablets', label: Text('Tabletten'), icon: Icon(Icons.medication, size: 18)),
                    ],
                    selected: {_type},
                    onSelectionChanged: (s) => setState(() => _type = s.first),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Medikamentenname',
                      hintText: _type == 'drops' ? 'z.B. Timolol 0.5%' : _type == 'ointment' ? 'z.B. Floxal EDO' : 'z.B. Diamox',
                    ),
                    onChanged: (v) => setState(() => _name = v),
                  ),
                  if (_type != 'tablets') ...[
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Dosierung',
                        hintText: _type == 'drops' ? 'z.B. 1 Tropfen' : 'z.B. 1 cm Strang',
                      ),
                      onChanged: (v) => setState(() => _dosage = v),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _frequency,
                      decoration: const InputDecoration(labelText: 'Häufigkeit'),
                      items: _frequencyOptions.map((o) => DropdownMenuItem(value: o['value'], child: Text(o['label']!))).toList(),
                      onChanged: (v) => setState(() => _frequency = v ?? '3x'),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _eye,
                      decoration: const InputDecoration(labelText: 'Auge'),
                      items: _eyeOptions.map((o) => DropdownMenuItem(value: o['value'], child: Text(o['label']!))).toList(),
                      onChanged: (v) => setState(() => _eye = v ?? 'both'),
                    ),
                  ],
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Hinweise (optional)', hintText: 'z.B. Vor dem Schlafengehen'),
                    onChanged: (v) => setState(() => _notes = v),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: _addMedication,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Medikament hinzufügen'),
                  ),
                ],
              ),
            ),
          ),
          if (_medications.isNotEmpty) ...[
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Aktuelle Medikation', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    ..._medications.map((m) => ListTile(
                          title: Text('${m['name']} (${m['type'] == 'drops' ? 'Tropfen' : m['type'] == 'ointment' ? 'Salbe' : 'Tabletten'})'),
                          subtitle: Text('${m['dosage']} · ${_getFrequencyLabel(m['frequency'] as String)}${m['eye'] != null ? ' · ${_getEyeLabel(m['eye'] as String)}' : ''}'),
                          trailing: IconButton(icon: const Icon(Icons.delete_outline), onPressed: () => _removeMedication(m['id'] as String)),
                        )),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: _exportPdf,
                      icon: const Icon(Icons.picture_as_pdf, size: 18),
                      label: const Text('Medikationsplan als PDF herunterladen'),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (_medications.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(Icons.medication, size: 48, color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5)),
                    const SizedBox(height: 12),
                    Text('Noch keine Medikamente hinzugefügt.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
