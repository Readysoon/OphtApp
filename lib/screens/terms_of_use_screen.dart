import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

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
        title: const Text('Nutzungsbedingungen'),
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
                  'Nutzungsbedingungen & Haftungsausschluss',
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
                  'Durch die Nutzung der App AugenCheck erklaeren Sie sich mit den nachfolgenden Nutzungsbedingungen einverstanden. Bitte lesen Sie diese sorgfaeltig durch.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 24),

                // 1
                Text('1. Zweck der App', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'AugenCheck ist eine Informations- und Orientierungshilfe im Bereich der Augenheilkunde. '
                  'Die App richtet sich an Personen, die sich ueber ophthalmologische Symptome, Krankheitsbilder und Notfaelle informieren moechten. '
                  'Die bereitgestellten Inhalte dienen ausschliesslich der allgemeinen Aufklaerung und Gesundheitsinformation.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 2
                Text('2. Kein Ersatz fuer aerztliche Beratung', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '2.1 Die in dieser App enthaltenen Informationen stellen keine medizinische Beratung, Diagnose oder Therapieempfehlung dar. '
                  'Sie ersetzen in keinem Fall die persoenliche Untersuchung, Beratung oder Behandlung durch eine qualifizierte aerztliche Fachperson.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '2.2 Insbesondere der Symptom-Checker liefert lediglich eine grobe Orientierung auf Basis der eingegebenen Symptome. '
                  'Die Ergebnisse sind weder abschliessend noch diagnostisch verbindlich. '
                  'Bei gesundheitlichen Beschwerden \u2013 insbesondere bei ploetzlich auftretenden oder sich verschlechternden Symptomen \u2013 suchen Sie unverzueglich einen Augenarzt oder eine Notaufnahme auf.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '2.3 Zwischen Ihnen und den Betreibern dieser App entsteht durch die Nutzung kein Arzt-Patienten-Verhaeltnis und keine sonstige Beratungsbeziehung.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 3
                Text('3. Richtigkeit und Aktualitaet der Inhalte', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '3.1 Die Betreiber sind bemueht, die Inhalte der App aktuell, vollstaendig und richtig zu halten. '
                  'Dennoch kann keine Gewaehrleistung oder Zusicherung fuer die jederzeitige Richtigkeit, Vollstaendigkeit oder Aktualitaet der bereitgestellten Informationen uebernommen werden.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '3.2 Medizinisches Wissen unterliegt einem stetigen Wandel. Informationen, die zum Zeitpunkt der Erstellung korrekt waren, koennen durch neue Erkenntnisse ueberholt sein. '
                  'Die Betreiber behalten sich das Recht vor, Inhalte jederzeit und ohne vorherige Ankuendigung zu aendern, zu ergaenzen oder zu entfernen.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '3.3 Angaben zu Arzneimitteln, Wirkstoffen oder Therapieverfahren in der App sind allgemeiner Natur. '
                  'Fuer die Verschreibung und Anwendung von Arzneimitteln ist stets die behandelnde aerztliche Fachperson zustaendig.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 4
                Text('4. Haftungsausschluss', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '4.1 Die Nutzung der App erfolgt auf eigene Gefahr und Verantwortung. '
                  'Die Betreiber haften nicht fuer Schaeden jeglicher Art, die direkt oder indirekt aus der Nutzung oder Nichtnutzung der App oder ihrer Inhalte entstehen \u2013 '
                  'einschliesslich, aber nicht beschraenkt auf gesundheitliche Schaeden, entgangenen Gewinn oder Datenverlust.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '4.2 Insbesondere uebernehmen die Betreiber keine Haftung fuer Entscheidungen oder Handlungen, die auf Grundlage der in dieser App bereitgestellten Informationen getroffen werden. '
                  'Jede gesundheitsbezogene Entscheidung liegt in der alleinigen Verantwortung des Nutzers bzw. der behandelnden aerztlichen Fachperson.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '4.3 Soweit gesetzlich zulaessig, ist jegliche Haftung fuer Folgeschaeden, mittelbare Schaeden oder Schaeden aus entgangenem Gewinn ausgeschlossen.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 5
                Text('5. Verfuegbarkeit und technische Hinweise', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '5.1 Die Betreiber uebernehmen keine Garantie fuer die jederzeitige Verfuegbarkeit, das fehlerfreie Funktionieren oder die Sicherheit der App. '
                  'Der Zugriff auf die App kann jederzeit und ohne vorherige Ankuendigung eingeschraenkt oder unterbrochen werden.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '5.2 Die Betreiber haften nicht fuer Schaeden, die durch technische Stoerungen, Datenverlust, Viren oder andere schaedliche Komponenten entstehen.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 6
                Text('6. Datenspeicherung und Datenschutz', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '6.1 Saemtliche personenbezogenen Daten, die Sie in der App eingeben (z.\u00A0B. Brillenpass, Augendruckwerte, Medikamentenplaene), werden ausschliesslich lokal auf Ihrem Geraet gespeichert. '
                  'Es erfolgt keine Uebermittlung an externe Server oder Dritte.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '6.2 Sie sind selbst dafuer verantwortlich, Ihre Daten durch geeignete Massnahmen (z.\u00A0B. Geraetesperre, regelmaessige Sicherung) vor unbefugtem Zugriff und Verlust zu schuetzen.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '6.3 Bei Deinstallation der App werden alle lokal gespeicherten Daten unwiderruflich geloescht. Die Betreiber uebernehmen keine Haftung fuer den Verlust dieser Daten.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 7
                Text('7. Geistiges Eigentum', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '7.1 Saemtliche Inhalte der App \u2013 einschliesslich Texte, Grafiken, Symbole, Strukturen und Software \u2013 sind urheberrechtlich geschuetzt. '
                  'Alle Rechte liegen bei den Betreibern oder deren Lizenzgebern.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '7.2 Das Abrufen und Anzeigen der Inhalte fuer den persoenlichen, nicht-kommerziellen Gebrauch ist gestattet. '
                  'Jede darueber hinausgehende Nutzung \u2013 insbesondere die Vervielfaeltigung, Verbreitung, oeffentliche Zugaenglichmachung oder kommerzielle Verwertung \u2013 bedarf der vorherigen schriftlichen Zustimmung der Betreiber.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '7.3 Die automatisierte Abfrage oder Extraktion von Inhalten (z.\u00A0B. durch Scraping, Crawling oder zur Verwendung fuer KI-Trainingszwecke) ist ohne ausdrueckliche Genehmigung untersagt.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 8
                Text('8. Pflichten des Nutzers', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '8.1 Der Nutzer verpflichtet sich, die App nur fuer den vorgesehenen Zweck der persoenlichen Gesundheitsinformation zu verwenden.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '8.2 Gesundheitsbezogene Informationen, die ueber die App bereitgestellt werden, sind vom Nutzer stets eigenverantwortlich und kritisch zu bewerten. '
                  'Der Nutzer traegt die alleinige Verantwortung fuer alle Entscheidungen, die er auf Grundlage der App-Inhalte trifft.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 9
                Text('9. Externe Inhalte und Verlinkungen', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  '9.1 Die App kann Verweise auf externe Ressourcen enthalten (z.\u00A0B. Notrufnummern, Webseiten). '
                  'Die Betreiber uebernehmen keine Verantwortung fuer Inhalte, Verfuegbarkeit oder Angebote externer Seiten.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  '9.2 Das Aufrufen externer Links erfolgt auf eigenes Risiko des Nutzers.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 10
                Text('10. Aenderungen der Nutzungsbedingungen', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Die Betreiber behalten sich vor, diese Nutzungsbedingungen jederzeit zu aendern. '
                  'Die jeweils aktuelle Fassung ist in der App einsehbar. '
                  'Durch die fortgesetzte Nutzung der App nach einer Aenderung erklaeren Sie sich mit den neuen Bedingungen einverstanden.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 20),

                // 11
                Text('11. Anwendbares Recht und Gerichtsstand', style: headingStyle),
                const SizedBox(height: 8),
                Text(
                  'Es gilt oesterreichisches Recht. Gerichtsstand ist der Sitz der Betreiber, soweit gesetzlich zulaessig.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 40),

                // Closing
                Divider(color: theme.colorScheme.outlineVariant),
                const SizedBox(height: 16),
                Text(
                  'Bei Fragen zu diesen Nutzungsbedingungen wenden Sie sich bitte an die Betreiber der App.',
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
}
