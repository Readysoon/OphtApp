import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onSurface,
    );
    final bodyStyle = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      height: 1.6,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Datenschutz'),
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
                  'Datenschutzerklaerung',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Gueltig ab: April 2026',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Der Schutz Ihrer persoenlichen Daten ist uns ein besonderes Anliegen. '
                  'In dieser Datenschutzerklaerung informieren wir Sie ueber die Verarbeitung personenbezogener Daten bei der Nutzung der App AugenCheck.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 24),

                // 1
                Text('1. Verantwortlicher', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Verantwortlich fuer die Datenverarbeitung im Sinne der Datenschutz-Grundverordnung (DSGVO) ist:',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text('Philipp Gallaschik', style: bodyStyle),
                Text('Kaiser-Josef-Strasse 1', style: bodyStyle),
                Text('6020 Innsbruck, Oesterreich', style: bodyStyle),
                Text('E-Mail: p.gallaschik@gmail.com', style: bodyStyle),
                const SizedBox(height: 20),

                // 2
                Text('2. Grundsatz: Lokale Datenverarbeitung', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'AugenCheck wurde nach dem Prinzip der Datensparsamkeit entwickelt. '
                  'Saemtliche personenbezogenen Daten, die Sie in der App eingeben, werden ausschliesslich lokal auf Ihrem Endgeraet gespeichert. '
                  'Es findet keine Uebermittlung Ihrer Gesundheitsdaten an Server, Cloud-Dienste oder Dritte statt.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 3
                Text('3. Art der verarbeiteten Daten', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Im Rahmen der Nutzung koennen Sie folgende Daten freiwillig eingeben, die lokal auf Ihrem Geraet gespeichert werden:',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                _buildBullet('Personenstammdaten: Name und Geburtsdatum', bodyStyle),
                _buildBullet('Brillenpass: Refraktionswerte (Sphaere, Zylinder, Achse, Addition) fuer beide Augen', bodyStyle),
                _buildBullet('Augendruckwerte: Messwerte des intraokularen Drucks mit Datum und Uhrzeit sowie Pachymetriewerte (Hornhautdicke)', bodyStyle),
                _buildBullet('Medikamentenplan: Bezeichnungen und Dosierungen Ihrer Augenmedikamente', bodyStyle),
                _buildBullet('Symptomeingaben: Auswahl von Symptomen im Symptom-Checker (werden nicht gespeichert)', bodyStyle),
                const SizedBox(height: 8),
                Text(
                  'Bei den gespeicherten Gesundheitsdaten handelt es sich um besondere Kategorien personenbezogener Daten im Sinne von Art.\u00A09 DSGVO. '
                  'Die Verarbeitung erfolgt ausschliesslich auf Grundlage Ihrer ausdruecklichen Einwilligung (Art.\u00A09 Abs.\u00A02 lit.\u00A0a DSGVO), '
                  'die Sie durch die freiwillige Eingabe der Daten erteilen.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 4
                Text('4. Zweck der Datenverarbeitung', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Ihre Daten werden ausschliesslich zu folgenden Zwecken verarbeitet:',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                _buildBullet('Darstellung und Verwaltung Ihrer persoenlichen Augenbefunde innerhalb der App', bodyStyle),
                _buildBullet('Erstellung von PDF-Dokumenten (Brillenpass, Augendruckverlauf, Medikamentenplan) auf Ihrem Geraet', bodyStyle),
                _buildBullet('Orientierungshilfe durch den Symptom-Checker auf Basis Ihrer Eingaben', bodyStyle),
                const SizedBox(height: 20),

                // 5
                Text('5. Datenspeicherung und Speicherdauer', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '5.1 Alle Daten werden mittels der geraeteeigenen Speichermechanismen (SharedPreferences) lokal auf Ihrem Endgeraet abgelegt. '
                  'Es erfolgt keine Synchronisation mit externen Diensten.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '5.2 Ihre Daten bleiben gespeichert, bis Sie diese selbst innerhalb der App loeschen oder die App deinstallieren. '
                  'Bei Deinstallation werden saemtliche lokal gespeicherten Daten unwiderruflich entfernt.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 6
                Text('6. Keine Weitergabe an Dritte', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Da Ihre Daten ausschliesslich lokal gespeichert werden, erfolgt keine Weitergabe an Dritte. '
                  'Weder die Betreiber der App noch sonstige Dienstleister haben Zugriff auf die von Ihnen eingegebenen Daten.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 7
                Text('7. Berechtigungen der App', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Die App fordert ausschliesslich die technisch erforderlichen Berechtigungen an:',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                _buildBullet('Internetzugriff: Fuer das Oeffnen externer Links (z.\u00A0B. Google Maps zur Augenarztsuche, Notrufnummern)', bodyStyle),
                _buildBullet('Dateizugriff: Fuer das Erstellen und Speichern von PDF-Dokumenten auf Ihrem Geraet', bodyStyle),
                const SizedBox(height: 8),
                Text(
                  'Die App greift nicht auf Kamera, Mikrofon, Standort, Kontakte oder andere sensible Geraetfunktionen zu.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 8
                Text('8. Keine Analyse- oder Tracking-Dienste', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'AugenCheck verwendet keine Analyse-Tools, Werbe-SDKs, Crash-Reporting-Dienste oder sonstige Tracking-Technologien. '
                  'Es werden keine Nutzungsstatistiken erhoben und kein Nutzerverhalten ausgewertet.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 9
                Text('9. Ihre Rechte', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Gemaess der DSGVO stehen Ihnen folgende Rechte zu:',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                _buildBullet('Recht auf Auskunft (Art.\u00A015 DSGVO): Da alle Daten lokal auf Ihrem Geraet gespeichert sind, haben Sie jederzeit direkten Zugang zu Ihren Daten ueber die App.', bodyStyle),
                _buildBullet('Recht auf Berichtigung (Art.\u00A016 DSGVO): Sie koennen Ihre Daten jederzeit direkt in der App aendern.', bodyStyle),
                _buildBullet('Recht auf Loeschung (Art.\u00A017 DSGVO): Sie koennen Ihre Daten jederzeit in der App loeschen oder durch Deinstallation der App alle Daten entfernen.', bodyStyle),
                _buildBullet('Recht auf Datenportabilitaet (Art.\u00A020 DSGVO): Die App bietet die Moeglichkeit, Ihre Daten als PDF-Dokument zu exportieren.', bodyStyle),
                _buildBullet('Recht auf Widerruf der Einwilligung (Art.\u00A07 Abs.\u00A03 DSGVO): Sie koennen Ihre Einwilligung jederzeit mit Wirkung fuer die Zukunft widerrufen, indem Sie Ihre Daten loeschen oder die App deinstallieren.', bodyStyle),
                _buildBullet('Recht auf Beschwerde (Art.\u00A077 DSGVO): Sie haben das Recht, sich bei einer Datenschutzaufsichtsbehoerde zu beschweren. Die zustaendige Behoerde in Oesterreich ist die Oesterreichische Datenschutzbehoerde, Barichgasse 40-42, 1030 Wien.', bodyStyle),
                const SizedBox(height: 20),

                // 10
                Text('10. Datensicherheit', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Die Sicherheit Ihrer lokal gespeicherten Daten haengt von den Schutzmassnahmen Ihres Endgeraets ab. '
                  'Wir empfehlen Ihnen:',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                _buildBullet('Ihr Geraet mit einer Bildschirmsperre (PIN, Fingerabdruck oder Gesichtserkennung) zu schuetzen', bodyStyle),
                _buildBullet('Regelmaessige Betriebssystem-Updates durchzufuehren', bodyStyle),
                _buildBullet('Keine App-Daten auf unverschluesselten externen Speichermedien zu sichern', bodyStyle),
                const SizedBox(height: 20),

                // 11
                Text('11. Aenderungen dieser Datenschutzerklaerung', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Wir behalten uns vor, diese Datenschutzerklaerung bei Bedarf anzupassen, etwa bei Aenderungen der App-Funktionalitaet oder geaenderten gesetzlichen Anforderungen. '
                  'Die jeweils aktuelle Fassung ist in der App einsehbar.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 12
                Text('12. Kontakt', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Bei Fragen zum Datenschutz oder zur Ausuebung Ihrer Rechte koennen Sie sich jederzeit an uns wenden:',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text('Philipp Gallaschik', style: bodyStyle),
                Text('Kaiser-Josef-Strasse 1', style: bodyStyle),
                Text('6020 Innsbruck, Oesterreich', style: bodyStyle),
                Text('E-Mail: p.gallaschik@gmail.com', style: bodyStyle),
                const SizedBox(height: 40),

                Divider(color: theme.colorScheme.outlineVariant),
                const SizedBox(height: 16),
                Text(
                  'Diese Datenschutzerklaerung wurde in Uebereinstimmung mit der Verordnung (EU) 2016/679 (Datenschutz-Grundverordnung) und dem oesterreichischen Datenschutzgesetz (DSG) erstellt.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildBullet(String text, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('\u2022  ', style: style),
          Expanded(child: Text(text, style: style)),
        ],
      ),
    );
  }
}
