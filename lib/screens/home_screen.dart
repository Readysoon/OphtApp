import 'package:flutter/material.dart';
import '../widgets/app_header.dart';
import '../widgets/hero_section.dart';
import '../widgets/symptom_selector.dart';
import '../widgets/diagnosis_results.dart';
import '../widgets/category_browser.dart';
import '../widgets/emergency_section.dart';
import '../widgets/my_data_section.dart';
import '../widgets/app_footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _selectedSymptoms = [];

  void _toggleSymptom(String id) {
    setState(() {
      if (_selectedSymptoms.contains(id)) {
        _selectedSymptoms.remove(id);
      } else {
        _selectedSymptoms.add(id);
      }
    });
  }

  void _resetSymptoms() {
    setState(() => _selectedSymptoms.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: const [
                      Tab(icon: Icon(Icons.search), text: 'Symptom-Checker'),
                      Tab(icon: Icon(Icons.menu_book), text: 'Krankheiten-Wiki'),
                      Tab(icon: Icon(Icons.person), text: 'Meine Daten'),
                      Tab(icon: Icon(Icons.warning_amber_rounded), text: 'Notfälle'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 900),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const HeroSection(),
                                SymptomSelector(
                                  selectedSymptoms: _selectedSymptoms,
                                  onToggleSymptom: _toggleSymptom,
                                ),
                                DiagnosisResults(
                                  selectedSymptoms: _selectedSymptoms,
                                  onReset: _resetSymptoms,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 900),
                            child: const CategoryBrowser(),
                          ),
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 900),
                            child: const MyDataSection(),
                          ),
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 900),
                            child: const EmergencySection(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
