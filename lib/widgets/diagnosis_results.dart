import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/ophthalmology.dart';

class DiagnosisResults extends StatelessWidget {
  const DiagnosisResults({
    super.key,
    required this.selectedSymptoms,
    required this.onReset,
  });

  final List<String> selectedSymptoms;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final conditions = findConditions(selectedSymptoms);
    final theme = Theme.of(context);

    if (selectedSymptoms.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mögliche Ursachen (${conditions.length})',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: onReset,
                child: const Text('Zurücksetzen'),
              ),
            ],
          ),
          if (conditions.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(Icons.info_outline, size: 48, color: theme.colorScheme.onSurfaceVariant),
                    const SizedBox(height: 16),
                    Text(
                      'Wählen Sie mehr Symptome aus, um eine genauere Einschätzung zu erhalten.',
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          else ...[
            ...conditions.map((c) => _ConditionCard(condition: c)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Text(
                'Wichtig: Diese Einschätzung ersetzt keine ärztliche Diagnose. Bei anhaltenden oder schweren Beschwerden suchen Sie bitte einen Augenarzt auf.',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ConditionCard extends StatelessWidget {
  const _ConditionCard({required this.condition});

  final Condition condition;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final urgencyConfig = {
      Urgency.low: (label: 'Niedrige Dringlichkeit', color: Colors.green, icon: Icons.check_circle_outline),
      Urgency.medium: (label: 'Mittlere Dringlichkeit', color: Colors.amber, icon: Icons.info_outline),
      Urgency.high: (label: 'Hohe Dringlichkeit', color: Colors.red, icon: Icons.warning_amber_rounded),
    };
    final config = urgencyConfig[condition.urgency]!;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        condition.name,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        condition.description,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: config.color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: config.color.withOpacity(0.5)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(config.icon, size: 16, color: config.color),
                      const SizedBox(width: 6),
                      Text(config.label, style: theme.textTheme.labelSmall?.copyWith(color: config.color, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            if (condition.diagnostics != null && condition.diagnostics!.isNotEmpty) ...[
              _SectionTitle(icon: Icons.info_outline, title: 'Diagnostik', color: Colors.blue),
              const SizedBox(height: 8),
              ...condition.diagnostics!.map((s) => _Bullet(text: s)),
              const SizedBox(height: 12),
            ],
            _SectionTitle(icon: Icons.arrow_forward, title: 'Therapie', color: theme.colorScheme.primary),
            const SizedBox(height: 8),
            ...condition.treatment.map((s) => _Bullet(text: s)),
            const SizedBox(height: 8),
            Text('Kontrolle: ${condition.followUp}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            if (condition.complications != null && condition.complications!.isNotEmpty) ...[
              const SizedBox(height: 12),
              _SectionTitle(icon: Icons.warning_amber_rounded, title: 'Komplikationen', color: Colors.red),
              const SizedBox(height: 8),
              ...condition.complications!.map((s) => _Bullet(text: s, color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.title, required this.color});

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: color ?? theme.colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: theme.textTheme.bodySmall?.copyWith(color: color))),
        ],
      ),
    );
  }
}
