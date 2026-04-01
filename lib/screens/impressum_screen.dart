import 'package:flutter/material.dart';

class ImpressumScreen extends StatelessWidget {
  const ImpressumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onSurface,
    );
    final labelStyle = theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: theme.colorScheme.onSurface,
    );
    final bodyStyle = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      height: 1.6,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Impressum'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Impressum',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),

                // Medizinischer Inhalt
                Text('Medizinischer Inhalt', style: headingStyle),
                const SizedBox(height: 12),
                Text('Verantwortlich fuer den medizinischen Inhalt:', style: labelStyle),
                const SizedBox(height: 4),
                Text('Robert Luda', style: bodyStyle),
                Text('Kaiser-Josef-Strasse 1', style: bodyStyle),
                Text('6020 Innsbruck', style: bodyStyle),
                Text('Oesterreich', style: bodyStyle),
                const SizedBox(height: 32),

                // Technische Umsetzung
                Text('Technische Umsetzung', style: headingStyle),
                const SizedBox(height: 12),
                Text('Verantwortlich fuer Entwicklung und Betrieb der App:', style: labelStyle),
                const SizedBox(height: 4),
                Text('Philipp Gallaschik', style: bodyStyle),
                Text('Kaiser-Josef-Strasse 1', style: bodyStyle),
                Text('6020 Innsbruck', style: bodyStyle),
                Text('Oesterreich', style: bodyStyle),
                const SizedBox(height: 32),

                // Hinweis
                Divider(color: theme.colorScheme.outlineVariant),
                const SizedBox(height: 16),
                Text('Haftungshinweis', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Die medizinischen Inhalte dieser App wurden mit groesster Sorgfalt erstellt. '
                  'Fuer die Richtigkeit, Vollstaendigkeit und Aktualitaet der Inhalte kann jedoch keine Gewaehr uebernommen werden. '
                  'Die Nutzung der Inhalte erfolgt auf eigene Verantwortung. '
                  'Naehere Informationen finden Sie in unseren Nutzungsbedingungen.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
