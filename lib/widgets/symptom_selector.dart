import 'package:flutter/material.dart';
import '../data/ophthalmology.dart';

class SymptomSelector extends StatelessWidget {
  const SymptomSelector({
    super.key,
    required this.selectedSymptoms,
    required this.onToggleSymptom,
  });

  final List<String> selectedSymptoms;
  final ValueChanged<String> onToggleSymptom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welche Symptome haben Sie?',
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 400 ? 3 : 2;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.2,
                ),
                itemCount: symptoms.length,
                itemBuilder: (context, index) {
                  final symptom = symptoms[index];
                  final isSelected = selectedSymptoms.contains(symptom.id);
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onToggleSymptom(symptom.id),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? theme.colorScheme.primaryContainer.withOpacity(0.5)
                              : theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Text(symptom.icon, style: const TextStyle(fontSize: 22)),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    symptom.name,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: isSelected ? theme.colorScheme.primary : null,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            if (isSelected)
                              Positioned(
                                top: 4,
                                right: 4,
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: theme.colorScheme.primary,
                                  child: Icon(Icons.check, size: 14, color: theme.colorScheme.onPrimary),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
