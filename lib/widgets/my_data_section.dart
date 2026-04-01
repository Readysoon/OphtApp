import 'package:flutter/material.dart';
import '../services/local_storage.dart';
import 'glasses_prescription_tab.dart';
import 'eye_pressure_tab.dart';
import 'medication_plan_tab.dart';

class MyDataSection extends StatefulWidget {
  const MyDataSection({super.key});

  @override
  State<MyDataSection> createState() => _MyDataSectionState();
}

class _MyDataSectionState extends State<MyDataSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  String _patientName = '';
  String _patientBirthDate = '';
  bool _patientLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadPatient();
  }

  Future<void> _loadPatient() async {
    final info = await loadPatientInfo();
    if (mounted) {
      _nameController.text = info['name'] ?? '';
      _birthController.text = info['birthDate'] ?? '';
      setState(() {
        _patientName = info['name'] ?? '';
        _patientBirthDate = info['birthDate'] ?? '';
        _patientLoading = false;
      });
    }
  }

  Future<void> _savePatient() async {
    await savePatientInfo(_patientName, _patientBirthDate);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.person_outline, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Text('Patientendaten', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Diese Daten werden für alle Bereiche (Augendruck, Medikamente, PDF-Export) verwendet.',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 16),
                if (_patientLoading)
                  const Center(child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()))
                else ...[
                  if (_patientName.isNotEmpty || _patientBirthDate.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        'Erfasst: ${_patientName.isNotEmpty ? _patientName : "—"}${_patientBirthDate.isNotEmpty ? " · $_patientBirthDate" : ""}',
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name', hintText: 'Max Mustermann'),
                    onChanged: (v) {
                      setState(() => _patientName = v);
                      _savePatient();
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _birthController,
                    decoration: const InputDecoration(labelText: 'Geburtsdatum', hintText: 'TT.MM.JJJJ oder YYYY-MM-DD'),
                    keyboardType: TextInputType.datetime,
                    onChanged: (v) {
                      setState(() => _patientBirthDate = v);
                      _savePatient();
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.dashboard), text: 'Brillenpass'),
            Tab(icon: Icon(Icons.show_chart), text: 'Augendruck'),
            Tab(icon: Icon(Icons.medication), text: 'Medikamente'),
          ],
        ),
        SizedBox(
          height: 520,
          child: TabBarView(
            controller: _tabController,
            children: [
              const GlassesPrescriptionTab(),
              EyePressureTab(patientName: _patientName, patientBirthDate: _patientBirthDate),
              MedicationPlanTab(patientName: _patientName, patientBirthDate: _patientBirthDate),
            ],
          ),
        ),
      ],
    );
  }
}
