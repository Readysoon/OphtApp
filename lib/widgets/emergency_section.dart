import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencySection extends StatelessWidget {
  const EmergencySection({super.key});

  static const _emergencies = [
    (id: 'chemical_burn', name: 'Verätzung', description: 'Chemikalien im Auge (Säure, Lauge, Reinigungsmittel)', action: 'SOFORT 15-20 Minuten mit Wasser spülen, dann Notfall aufsuchen', urgency: 'immediate', timeframe: 'Sofort'),
    (id: 'retinal_detachment', name: 'Netzhautablösung', description: 'Plötzliche Blitze, Russregen, Schatten im Gesichtsfeld', action: 'Sofort Augenarzt oder Notfall aufsuchen', urgency: 'immediate', timeframe: 'Innerhalb Stunden'),
    (id: 'acute_glaucoma', name: 'Akuter Glaukomanfall', description: 'Starke Augenschmerzen, Übelkeit, verschwommenes Sehen, Regenbogenfarben', action: 'Sofort Augenarzt oder Notfall aufsuchen', urgency: 'immediate', timeframe: 'Innerhalb Stunden'),
    (id: 'central_artery_occlusion', name: 'Zentralarterienverschluss', description: 'Plötzliche, schmerzlose Erblindung eines Auges', action: 'Sofort Notfall aufsuchen - jede Minute zählt', urgency: 'immediate', timeframe: 'Innerhalb Minuten'),
    (id: 'penetrating_injury', name: 'Perforierende Verletzung', description: 'Fremdkörper durchdringt das Auge', action: 'Nicht berühren, Auge abdecken, sofort Notfall', urgency: 'immediate', timeframe: 'Sofort'),
    (id: 'severe_infection', name: 'Schwere Infektion', description: 'Starke Rötung, Eiter, Schwellung, Fieber', action: 'Augenarzt am gleichen Tag aufsuchen', urgency: 'urgent', timeframe: 'Innerhalb 24h'),
    (id: 'sudden_vision_loss', name: 'Plötzlicher Sehverlust', description: 'Schneller Verlust der Sehkraft ohne erkennbare Ursache', action: 'Sofort Augenarzt oder Notfall aufsuchen', urgency: 'immediate', timeframe: 'Sofort'),
    (id: 'severe_trauma', name: 'Schweres Augentrauma', description: 'Stumpfe Gewalt, Prellung, Blutung im Auge', action: 'Augenarzt oder Notfall aufsuchen', urgency: 'urgent', timeframe: 'Innerhalb Stunden'),
  ];

  static const _contacts = {
    'Österreich': [
      (name: 'Rettung', number: '144', description: 'Rettungsdienst Österreich'),
      (name: 'Ärztefunkdienst Wien', number: '141', description: 'Ärztlicher Bereitschaftsdienst'),
      (name: 'Vergiftungszentrale', number: '01 406 43 43', description: 'AKH Wien (24h)'),
      (name: 'Euronotruf', number: '112', description: 'Europaweiter Notruf'),
    ],
    'Deutschland': [
      (name: 'Notruf', number: '112', description: 'Europaweiter Notruf'),
      (name: 'Ärztlicher Bereitschaftsdienst', number: '116117', description: 'Kassenärztlicher Notdienst'),
      (name: 'Giftnotruf', number: '030 19240', description: 'Charité Berlin (24h)'),
    ],
  };

  Future<void> _launchTel(String number) async {
    final uri = Uri(scheme: 'tel', path: number.replaceAll(' ', ''));
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> _openMaps(String query) async {
    final uri = Uri.parse('https://www.google.com/maps/search/${Uri.encodeComponent(query)}');
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        Card(
          color: theme.colorScheme.errorContainer.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone, color: theme.colorScheme.error),
                    const SizedBox(width: 8),
                    Text(
                      'Notfallnummern',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: theme.colorScheme.error),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ..._contacts.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key == 'Österreich' ? '🇦🇹 Österreich' : '🇩🇪 Deutschland',
                          style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        ...entry.value.map((c) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: InkWell(
                                onTap: () => _launchTel(c.number),
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.surface,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: theme.colorScheme.outlineVariant),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 24,
                                        backgroundColor: theme.colorScheme.errorContainer,
                                        child: Text(c.number, style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onErrorContainer)),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(c.name, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                                            Text(c.description, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          color: theme.colorScheme.primaryContainer.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.medical_services, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Text('Augenarzt & Augenklinik finden', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Öffnen Sie Google Maps, um Augenärzte oder Augenkliniken mit Notaufnahme in Ihrer Nähe zu finden.',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => _openMaps('Augenarzt'),
                        icon: const Icon(Icons.medical_services, size: 18),
                        label: const Text('Augenarzt'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: FilledButton.tonalIcon(
                        onPressed: () => _openMaps('Augenklinik Notaufnahme'),
                        icon: const Icon(Icons.local_hospital, size: 18),
                        label: const Text('Klinik'),
                        style: FilledButton.styleFrom(backgroundColor: theme.colorScheme.errorContainer.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          color: theme.colorScheme.primaryContainer.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(Icons.warning_amber_rounded, color: theme.colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Erste Hilfe bei Verätzung', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(
                        'Bei Chemikalien im Auge: Sofort 15-20 Minuten mit klarem Wasser spülen, auch unter den Lidern. Erst danach zum Arzt. Diese Erstmassnahme ist entscheidend!',
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Icon(Icons.schedule, color: theme.colorScheme.primary, size: 22),
            const SizedBox(width: 8),
            Text('Ophthalmologische Notfälle', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 12),
        ..._emergencies.map((e) => Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: e.urgency == 'immediate' ? theme.colorScheme.errorContainer : theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            e.timeframe,
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: e.urgency == 'immediate' ? theme.colorScheme.onErrorContainer : theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(e.name, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(e.description, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    Text('→ ${e.action}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )),
        const SizedBox(height: 16),
        Text(
          'Bei Unsicherheit immer ärztlichen Rat einholen. Diese Informationen ersetzen keine professionelle medizinische Beratung.',
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
