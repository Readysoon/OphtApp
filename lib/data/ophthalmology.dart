// Ophthalmology data – ported from Lovable reference.

enum Urgency { low, medium, high }

class Condition {
  final String id;
  final String name;
  final String description;
  final List<String> symptoms;
  final Urgency urgency;
  final List<String> treatment;
  final String followUp;
  final String? source;
  final List<String>? diagnostics;
  final List<String>? complications;
  final String? wikiContent;
  final String? wikiSummary;

  const Condition({
    required this.id,
    required this.name,
    required this.description,
    required this.symptoms,
    required this.urgency,
    required this.treatment,
    required this.followUp,
    this.source,
    this.diagnostics,
    this.complications,
    this.wikiContent,
    this.wikiSummary,
  });
}

class Category {
  final String id;
  final String name;
  final String icon;
  final String description;
  final List<Condition> conditions;
  final List<Category> subCategories;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    this.conditions = const [],
    this.subCategories = const [],
  });
}

class Symptom {
  final String id;
  final String name;
  final String icon;
  final List<String> relatedConditions;

  const Symptom({
    required this.id,
    required this.name,
    required this.icon,
    required this.relatedConditions,
  });
}

class Examination {
  final String id;
  final String name;
  final String description;
  final List<String> procedure;
  final String? normalValues;
  final List<String> interpretation;
  final List<String> indications;
  final List<String>? equipment;
  final List<String>? tips;

  const Examination({
    required this.id,
    required this.name,
    required this.description,
    required this.procedure,
    this.normalValues,
    required this.interpretation,
    required this.indications,
    this.equipment,
    this.tips,
  });
}

// Symptoms list
final List<Symptom> symptoms = [
  const Symptom(id: 'redness', name: 'Rötung', icon: '🔴', relatedConditions: ['bacterial_conjunctivitis', 'viral_conjunctivitis', 'allergic_conjunctivitis', 'episcleritis', 'scleritis', 'uveitis_anterior', 'acute_glaucoma', 'keratitis']),
  const Symptom(id: 'itching', name: 'Juckreiz', icon: '👆', relatedConditions: ['allergic_conjunctivitis', 'blepharitis', 'dry_eye', 'demodex']),
  const Symptom(id: 'pain', name: 'Schmerzen', icon: '⚡', relatedConditions: ['scleritis', 'uveitis_anterior', 'acute_glaucoma', 'keratitis', 'endophthalmitis', 'orbital_cellulitis']),
  const Symptom(id: 'blurred_vision', name: 'Verschwommenes Sehen', icon: '👁️', relatedConditions: ['cataract', 'amd', 'diabetic_retinopathy', 'uveitis', 'keratoconus', 'retinal_detachment', 'macular_hole', 'dry_eye']),
  const Symptom(id: 'tearing', name: 'Tränenfluss', icon: '💧', relatedConditions: ['dry_eye', 'conjunctivitis', 'dacryocystitis', 'corneal_erosion', 'trichiasis']),
  const Symptom(id: 'light_sensitivity', name: 'Lichtempfindlichkeit', icon: '☀️', relatedConditions: ['uveitis_anterior', 'keratitis', 'corneal_erosion', 'migraine']),
  const Symptom(id: 'swelling', name: 'Schwellung', icon: '🫧', relatedConditions: ['chalazion', 'hordeolum', 'orbital_cellulitis', 'dacryoadenitis', 'allergic_reaction', 'sjogren']),
  const Symptom(id: 'discharge', name: 'Ausfluss/Sekret', icon: '💦', relatedConditions: ['bacterial_conjunctivitis', 'dacryocystitis', 'canaliculitis', 'blepharitis']),
  const Symptom(id: 'floaters', name: 'Mouches volantes', icon: '⚫', relatedConditions: ['pvd', 'retinal_tear', 'retinal_detachment', 'uveitis']),
  const Symptom(id: 'flashes', name: 'Lichtblitze', icon: '✨', relatedConditions: ['pvd', 'retinal_tear', 'retinal_detachment', 'migraine']),
  const Symptom(id: 'double_vision', name: 'Doppelbilder', icon: '👀', relatedConditions: ['strabismus', 'cranial_nerve_palsy', 'thyroid_eye', 'myasthenia']),
  const Symptom(id: 'dry_eyes', name: 'Trockene Augen', icon: '🏜️', relatedConditions: ['dry_eye', 'blepharitis', 'sjogren', 'meibom_dysfunction', 'evaporative_dry_eye']),
  const Symptom(id: 'foreign_body', name: 'Fremdkörpergefühl', icon: '🪨', relatedConditions: ['corneal_erosion', 'foreign_body', 'dry_eye', 'trichiasis', 'pterygium']),
  const Symptom(id: 'vision_loss_sudden', name: 'Plötzlicher Sehverlust', icon: '🚨', relatedConditions: ['retinal_artery_occlusion', 'retinal_vein_occlusion', 'retinal_detachment', 'vitreous_hemorrhage', 'optic_neuritis', 'a_aion', 'n_aion']),
  const Symptom(id: 'headache', name: 'Kopfschmerzen', icon: '🤕', relatedConditions: ['a_aion', 'migraine']),
  const Symptom(id: 'jaw_claudication', name: 'Kauschmerzen', icon: '🦷', relatedConditions: ['a_aion']),
  const Symptom(id: 'scalp_tenderness', name: 'Kopfhautempfindlichkeit', icon: '💆', relatedConditions: ['a_aion']),
  const Symptom(id: 'amaurosis_fugax', name: 'Amaurosis fugax', icon: '⏱️', relatedConditions: ['a_aion', 'retinal_artery_occlusion']),
  const Symptom(id: 'vision_loss_gradual', name: 'Langsamer Sehverlust', icon: '📉', relatedConditions: ['glaucoma', 'cataract', 'amd', 'diabetic_retinopathy']),
  const Symptom(id: 'halos', name: 'Lichthöfe', icon: '🌈', relatedConditions: ['acute_glaucoma', 'cataract', 'corneal_edema']),
  const Symptom(id: 'burning', name: 'Brennen', icon: '🔥', relatedConditions: ['dry_eye', 'blepharitis', 'chemical_burn', 'sjogren', 'meibom_dysfunction']),
  const Symptom(id: 'lid_drooping', name: 'Hängendes Lid', icon: '😑', relatedConditions: ['ptosis', 'horner', 'myasthenia', 'third_nerve_palsy']),
  const Symptom(id: 'polymyalgia', name: 'Schulter-/Beckenschmerzen', icon: '💪', relatedConditions: ['a_aion']),
  const Symptom(id: 'sand_sensation', name: 'Sandgefühl', icon: '🏝️', relatedConditions: ['dry_eye', 'sjogren', 'corneal_filaments']),
  const Symptom(id: 'dry_mouth', name: 'Mundtrockenheit', icon: '👄', relatedConditions: ['sjogren']),
  const Symptom(id: 'sticky_secretion', name: 'Zähes Sekret', icon: '🍯', relatedConditions: ['dry_eye', 'blepharitis', 'meibom_dysfunction']),
  const Symptom(id: 'crusty_lids', name: 'Verkrustete Lider', icon: '🧊', relatedConditions: ['blepharitis', 'meibom_dysfunction', 'dry_eye']),
];

// Examinations
final List<Examination> examinations = [
  const Examination(
    id: 'schirmer_test',
    name: 'Schirmer-Test',
    description: 'Quantitative Messung der Tränenproduktion mittels Filterpapierstreifen.',
    procedure: [
      'Filterpapierstreifen (5mm breit, 35mm lang) am Knick falten',
      'In das untere Fornix einhängen (temporales Drittel)',
      'Patient schliesst die Augen für 5 Minuten',
      'Ablesen der Befeuchtungslänge ab Knick',
    ],
    normalValues: 'Schirmer I (ohne Anästhesie): >10mm in 5 Min. | Schirmer II (mit Anästhesie): >6mm',
    interpretation: [
      '<10mm ohne Anästhesie: Verdacht auf Tränenmangel',
      '<6mm mit Anästhesie: Basissekretion reduziert',
      '<5mm wiederholt: Indikation für permanenten Punctum-Verschluss',
      'Hohe Variabilität - Wiederholung empfohlen',
    ],
    indications: ['Trockenes Auge', 'Sjögren-Syndrom', 'Präoperativ vor refraktiver Chirurgie'],
    equipment: ['Schirmer-Teststreifen', 'Stoppuhr', 'Optional: Lokalanästhetikum'],
    tips: ['Immer zur gleichen Tageszeit messen', 'Klimatisierte Räume vermeiden'],
  ),
  const Examination(
    id: 'but_test',
    name: 'Tränenfilmaufreißzeit (BUT)',
    description: 'Messung der Stabilität des Tränenfilms nach dem Lidschlag.',
    procedure: [
      'Fluoreszein in den Bindehautsack geben',
      'Patient mehrmals blinzeln lassen',
      'Mit Kobaltblaufilter an der Spaltlampe beobachten',
      'Zeit messen bis erste schwarze Flecken erscheinen',
      'Mindestens 3 Messungen, Mittelwert bilden',
    ],
    normalValues: '>10 Sekunden normal | <10 Sekunden pathologisch | <5 Sekunden schwer pathologisch',
    interpretation: [
      '<10 Sek: Instabiler Tränenfilm',
      'Schnelles Aufreissen zentral: evaporatives trockenes Auge',
      'Schnelles Aufreissen diffus: Muzinmangel',
      'Korreliert mit Meibom-Drüsen-Dysfunktion',
    ],
    indications: ['Trockenes Auge', 'Kontaktlinsenanpassung', 'Vor Kataraktchirurgie'],
    equipment: ['Fluoreszein-Streifen', 'Spaltlampe mit Kobaltblaufilter', 'Stoppuhr'],
    tips: ['Nicht direkt nach Tropfengabe messen', 'Klimaanlage ausschalten'],
  ),
  const Examination(
    id: 'tonometry',
    name: 'Tonometrie (Augendruckmessung)',
    description: 'Messung des intraokulären Drucks (IOD).',
    procedure: [
      'Goldmann-Applanationstonometrie (Goldstandard): Lokalanästhesie und Fluoreszein, Messköpfchen auf Hornhaut aufsetzen, Kraft anpassen bis Halbkreise sich berühren',
      'Non-Contact-Tonometrie: Luftstoss-Verfahren',
    ],
    normalValues: '10-21 mmHg (Mittelwert ~16 mmHg)',
    interpretation: [
      '>21 mmHg: okuläre Hypertension',
      '>40 mmHg: akutes Winkelblockglaukom möglich',
      'Tagesschwankungen von 3-5 mmHg normal',
      'Hornhautdicke beeinflusst Messung',
    ],
    indications: ['Glaukomscreening', 'Glaukomverlauf', 'Vor/nach Augenoperationen'],
    equipment: ['Applanationstonometer', 'Spaltlampe', 'Fluoreszein'],
    tips: ['Messung zu verschiedenen Tageszeiten bei Verdacht auf Tensionschwankungen'],
  ),
  const Examination(
    id: 'fundoscopy',
    name: 'Funduskopie',
    description: 'Untersuchung des Augenhintergrundes (Netzhaut, Papille, Gefässe).',
    procedure: [
      'Direkte Ophthalmoskopie: aufrechtes Bild, 15x Vergrösserung',
      'Indirekte Ophthalmoskopie: umgekehrtes Bild, grösseres Gesichtsfeld',
      'Spaltlampen-Biomikroskopie mit Volk-Linse (78D, 90D)',
      'Pupillendilatation für optimale Sicht',
    ],
    interpretation: [
      'Papille: Form, Farbe, Exkavation, Randsaum',
      'Gefässe: Kaliber, AV-Kreuzungen, Blutungen',
      'Makula: Reflexe, Drusen, Blutungen, Ödem',
      'Peripherie: Degenerationen, Risse, Ablösung',
    ],
    indications: ['Routineuntersuchung', 'Diabetische Retinopathie', 'Glaukom', 'Makuladegeneration'],
    equipment: ['Ophthalmoskop', 'Volk-Linsen', 'Mydriatikum'],
  ),
  const Examination(
    id: 'slit_lamp',
    name: 'Spaltlampenuntersuchung',
    description: 'Biomikroskopische Untersuchung des vorderen Augenabschnitts.',
    procedure: [
      'Patient positioniert Kinn und Stirn',
      'Verschiedene Beleuchtungsarten: Diffuses Licht (Übersicht), Fokales Licht (optischer Schnitt), Rückstreuung (Endothel), Retroillumination (Transparenzstörungen)',
    ],
    interpretation: [
      'Lider: Stellung, Entzündung, Tumore',
      'Bindehaut: Injektion, Follikel, Papillen',
      'Hornhaut: Epitheldefekte, Trübungen, Vaskularisation',
      'Vorderkammer: Tiefe, Zellen, Tyndall',
    ],
    indications: ['Basisuntersuchung', 'Entzündungen', 'Verletzungen', 'Kontaktlinsenkontrollen'],
    equipment: ['Spaltlampe'],
  ),
  const Examination(
    id: 'gonioscopy',
    name: 'Gonioskopie',
    description: 'Beurteilung des Kammerwinkels mit Kontaktglas oder -linse.',
    procedure: [
      'Patient sitzt an der Spaltlampe',
      'Oberflächenanästhesie und Kontaktgel',
      'Gonioskopie-Linse aufsetzen (z.B. Goldmann 3-Spiegel oder Posner)',
      'Kammerwinkel in allen Quadranten beurteilen',
    ],
    interpretation: [
      'Offen: Trabekelwerk und Skleralsporn sichtbar',
      'Eng/verschlossen: Winkelblock-Risiko',
      'Pigmentierung, Neovaskularisation, Synechien dokumentieren',
    ],
    indications: ['Glaukomabklärung', 'Winkelblock-Verdacht', 'Nach Trauma', 'Vor Laser-Iridotomie'],
    equipment: ['Gonioskopie-Linse', 'Spaltlampe', 'Anästhesietropfen', 'Kontaktgel'],
  ),
  const Examination(
    id: 'fluorescein_angiography',
    name: 'Fluoreszenzangiografie',
    description: 'Darstellung der retinalen und choroidalen Gefäße nach i.v. Fluoreszein-Gabe.',
    procedure: [
      'Pupillenerweiterung',
      'Venöser Zugang',
      'Bildserie vor und nach Injektion von Fluoreszein',
      'Früh- und Spätphasen dokumentieren',
    ],
    interpretation: [
      'Hyperfluoreszenz: Leckage, Pooling, Fensterdefekt',
      'Hypofluoreszenz: Verschluss, Blockade',
      'Bewertung von Makula, Gefäßen, Papille',
    ],
    indications: ['Diabetische Retinopathie', 'AMD', 'Venenverschluss', 'Makulaödem', 'ischämische Prozesse'],
    equipment: ['Funduskamera oder Weitwinkel-System', 'Fluoreszein', 'Venöser Zugang'],
  ),
  const Examination(
    id: 'icg_angiography',
    name: 'Indocyaningrün-Angiographie (ICG)',
    description: 'Angiographie der Aderhaut mit Indocyaningrün; besser für choroidale Gefäße als Fluoreszein.',
    procedure: [
      'Pupillenerweiterung',
      'Venöser Zugang',
      'Injektion von Indocyaningrün',
      'Infrarot-Bildserie',
    ],
    interpretation: [
      'Choroidale Neovaskularisationen (z.B. bei AMD)',
      'Polypoidale choroidale Vaskulopathie',
      'Aderhauttumoren',
    ],
    indications: ['Feuchte AMD', 'PCV', 'Aderhauttumoren', 'zentrale seröse Chorioretinopathie'],
    equipment: ['ICG-kompatibles Kamerasystem', 'Indocyaningrün', 'Venöser Zugang'],
  ),
  const Examination(
    id: 'erg_eog',
    name: 'Elektroretinografie (ERG) und Elektrookulografie (EOG)',
    description: 'Objektive Messung der Netzhaut- bzw. retinalen Pigmentepithel-Funktion durch Ableitung von Potenzialen.',
    procedure: [
      'ERG: Dunkeladaptation, Elektroden (Hornhaut/Kontaktlinse, Haut), Lichtreize (Ganzfeld), Ableitung der Antworten',
      'EOG: Ableitung des Standpotenzials bei Hell-Dunkel-Wechsel über Hautelektroden',
    ],
    interpretation: [
      'ERG: Reduzierte Amplituden bei Netzhautdystrophien, Verschlüssen',
      'EOG: Arden-Ratio bei Vitelliformer Dystrophie, Best-Krankheit',
    ],
    indications: ['Netzhautdystrophien', 'Retinitis pigmentosa', 'Best-Krankheit', 'Medikamententoxizität', 'Unklare Visusminderung'],
    equipment: ['ERG/EOG-Gerät', 'Elektroden', 'Mydriatikum'],
  ),
];

List<Condition> findConditions(List<String> selectedSymptoms) {
  if (selectedSymptoms.isEmpty) return [];
  final allConditions = categories.expand((c) => c.conditions).toList();
  final withCount = allConditions.map((condition) {
    final matchCount = condition.symptoms.where((s) => selectedSymptoms.contains(s)).length;
    final matchPercentage = matchCount / condition.symptoms.length;
    return (condition: condition, matchCount: matchCount, matchPercentage: matchPercentage);
  }).where((m) => m.matchCount >= 1 && (m.matchCount >= 2 || m.matchPercentage >= 0.4)).toList();
  withCount.sort((a, b) {
    const order = {Urgency.high: 3, Urgency.medium: 2, Urgency.low: 1};
    final u = order[b.condition.urgency]! - order[a.condition.urgency]!;
    if (u != 0) return u;
    final p = b.matchPercentage.compareTo(a.matchPercentage);
    if (p != 0) return p;
    return b.matchCount - a.matchCount;
  });
  return withCount.take(8).map((m) => m.condition).toList();
}

List<Condition> getConditionsByCategory(String categoryId) {
  try {
    final cat = categories.firstWhere((c) => c.id == categoryId);
    return cat.conditions;
  } catch (_) {
    return [];
  }
}

Examination? findExaminationByKeyword(String text) {
  final lower = text.toLowerCase();
  const keywordMap = {
    'schirmer': 'schirmer_test',
    'but': 'but_test',
    'tonometrie': 'tonometry',
    'funduskopie': 'fundoscopy',
    'spaltlampe': 'slit_lamp',
    'gonioskopie': 'gonioscopy',
    'fluoreszenz': 'fluorescein_angiography',
    'icg': 'icg_angiography',
    'indocyanin': 'icg_angiography',
    'erg': 'erg_eog',
    'eog': 'erg_eog',
    'elektroretinografie': 'erg_eog',
  };
  for (final entry in keywordMap.entries) {
    if (lower.contains(entry.key)) {
      try {
        return examinations.firstWhere((ex) => ex.id == entry.value);
      } catch (_) {
        return null;
      }
    }
  }
  return null;
}

// Categories and conditions – full list from reference
final List<Category> categories = [
  Category(
    id: 'lid',
    name: 'Lid',
    icon: '👁️',
    description: 'Erkrankungen der Augenlider',
    conditions: [
      const Condition(
        id: 'blepharitis',
        name: 'Blepharitis',
        description: 'Entzündung der Lidränder mit Schuppenbildung und Rötung.',
        symptoms: ['itching', 'burning', 'redness', 'discharge'],
        urgency: Urgency.low,
        treatment: ['Warme Kompressen 2x täglich 10 Min.', 'Lidrandreinigung mit Babyshampoo', 'Bei Bedarf: antibiotische Salbe (z.B. Fucithalmic)'],
        followUp: 'Kontrolle nach 2-4 Wochen bei Persistenz',
        source: null,
      ),
      const Condition(
        id: 'chalazion',
        name: 'Chalazion',
        description: 'Chronische lipogranulomatöse Entzündung des Augenlids durch Obstruktion der Meibom- oder Zeis-Drüsen.',
        symptoms: ['swelling'],
        urgency: Urgency.low,
        treatment: ['Warme Kompressen', 'Lidmassage', 'Bei Persistenz: Inzision und Kürettage'],
        followUp: 'Kontrolle nach 4-6 Wochen',
        source: null,
        wikiContent: '''
## Definition

Ein Chalazion ist eine **chronische lipogranulomatöse Entzündung** des Augenlids, die durch Obstruktion der Talgdrüsen der Lidplatte entsteht – entweder der **Meibom-Drüsen** (tiefes Chalazion) oder der **Zeis-Drüsen** (oberflächliches Chalazion).¹ Es handelt sich um eine der häufigsten Liderkrankungen in allen Altersgruppen.² Die American Academy of Ophthalmology beschreibt Chalazion, [Hordeolum](#hordeolum) und Blepharitis als ein **Kontinuum von Erkrankungen**.

---

## Pathogenese

Die Pathogenese basiert auf einer **Retention von Drüsensekret** nach Obstruktion der Meibom- oder Zeis-Drüsen, die zu einer lokalisierten zystischen Schwellung mit chronischer lipogranulomatöser Entzündungsreaktion führt.¹ ²

Mehrere ätiologische Faktoren tragen zur Chalazion-Entstehung bei:

**Blepharitis**: Blepharitis ist der **stärkste Risikofaktor** für Chalazion-Entwicklung (OR=4,84, p<0,001).³ Demodex folliculorum ist mit **Haarfollikel-Dilatation und Hyperkeratinisierung** assoziiert, was indirekt zur Chalazion-Entstehung beitragen kann.⁴ Diese Veränderungen können die Drüsenausführungsgänge blockieren.

**Tränenfilm- und Augenoberflächenstörungen:**
- **Trockenes Auge** (OR=3,0, p<0,001)⁵

**Weitere Risikofaktoren:**
- **Rauchen** (OR=1,12, p<0,05)

---

## Klinik

### Symptome
- Schmerzlose, langsam wachsende Schwellung im Augenlid¹ ⁶
- Fremdkörpergefühl
- Leichte Druckempfindlichkeit
- Kosmetische Beeinträchtigung
- Bei großen Läsionen: Astigmatismus durch Druck auf die Hornhaut

![Chalazion – Typische schmerzlose Schwellung am Oberlid](asset:assets/images/chalazion_symptom.png)

### Klinische Befunde
- **Palpable Masse** im mittleren Lidbereich (nicht am Lidrand wie beim [Hordeolum](#hordeolum))⁶
- **Gut abgegrenzte, feste Schwellung** in der Tarsalplatte
- Bei Ektropionierung des Lids: sichtbare **lipogranulomatöse Veränderungen** der Tarsalkonjunktiva⁷
- Mögliche **Rötung und Schwellung** der umgebenden Haut
- Bei chronischen Fällen: **Chalazion-Zyste** mit charakteristischer Konsistenz
- **Tiefes Chalazion** (Meibom-Drüsen): Größer, tiefer in der Tarsalplatte lokalisiert
- **Oberflächliches Chalazion** (Zeis-Drüsen): Kleiner, näher am Lidrand

---

## Diagnostik

Die Diagnose erfolgt primär **klinisch** durch Inspektion und Palpation. Die Spaltlampenuntersuchung sollte evaluieren:⁷
- Lidränder (Rötung, Teleangiektasien, Verdickung)
- Meibom-Drüsen-Öffnungen (Obstruktion, Metaplasie)
- Tarsalkonjunktiva (lipogranulomatöse Veränderungen)
- Wimpernbasis (Collarettes bei Demodex, Schuppung bei seborrhoischer Blepharitis)
- Tränenfilm (Qualität, Stabilität)

### Differenzialdiagnose
- **[Hordeolum (Gerstenkorn)](#hordeolum):** Akute, schmerzhafte, purulente Entzündung am Lidrand
- **Talgdrüsenkarzinom:** Bei rezidivierenden oder atypischen Chalazien sollte eine histologische Untersuchung erfolgen
- **Basalzellkarzinom:** Kann als chronische Lidläsion imponieren
- **Pyogenes Granulom:** Nach Trauma oder Chirurgie

---

## Therapie

Die Behandlung erfolgt stufenweise, wobei es **keinen einheitlichen Therapiestandard** gibt:²

### Konservative Therapie (Erstlinienbehandlung, 4–6 Wochen)

- **Warme Kompressen:** Effektiv als Monotherapie oder in Kombination. Komplette Resolution bei **21%** der Fälle. Anwendung mehrmals täglich für 5–10 Minuten zur Verflüssigung der Meibom-Sekrete
- **Lidhygiene:** Sanftes Reinigen der Wimpernbasis mit verdünntem Baby-Shampoo oder kommerziellen Lidreinigern. **Hypochlorous Acid 0,01%** hat starke antimikrobielle Wirkung
- **Lidrandmassage:** Vertikale Massage zur Expression der Meibom-Drüsen-Sekrete nach Wärmeanwendung
- **Topische Antibiotika ± Steroide:** Tobramycin oder Tobramycin/Dexamethason zeigen ähnliche Erfolgsraten wie warme Kompressen allein (16–18% komplette Resolution). **Wichtig:** Topische oder systemische Antibiotika verbessern die Auflösungsrate nicht signifikant (adjustierte RR 0,97–0,99)
- **Mikroblepharoexfoliation (BlephEx):** Als adjuvante Therapie mit **87% Erfolgsrate** versus 44% bei Lidhygiene allein

> **Wichtig:** Chalazien, die länger als **2 Monate** bestehen, sprechen schlechter auf konservative Therapie an und sollten früher invasiv behandelt werden.

### Systemische Antibiotika (bei rezidivierenden/therapierefraktären Chalazien)

- **Orale Doxycyclin:** Wirkt durch **anti-inflammatorische und lipid-regulierende Effekte** (nicht primär antibakteriell). Bei intraktablen rezidivierenden Chalazien in Kombination mit IPL-Therapie: Erfolgsrate von **83,3%**
- **Orale Azithromycin:** Längere Gewebehalbwertszeit als Doxycyclin, weniger gastrointestinale Nebenwirkungen. Eine Einzeldosis kann das okuläre Mikrobiom für mindestens **6 Monate** verändern
- **Indikation:** Primär bei zugrundeliegender Meibom-Drüsen-Dysfunktion und rezidivierenden Chalazien sinnvoll

### Invasive Therapie

- **Intralesionale Triamcinolonacetonid-Injektion** (40 mg/ml, 0,1–0,2 ml):
  - Erfolgsrate von **81%** kompletter Resolution, vergleichbar mit chirurgischer Exzision (79%)
  - Durchschnittliche Auflösungszeit **5 Tage**
  - **92%** der Patienten benötigen nur eine Injektion
  - Mögliche Komplikationen: Hautatrophie, Depigmentierung (selten)⁸
- **Extralesionale Triamcinolonacetonid-Injektion:** Bei kleinen Chalazien (≤5 mm) mit **87% Erfolgsrate**
- **Inzision und Kürettage:**
  - Chirurgische Entfernung bei therapierefraktären Fällen
  - Erfolgsrate **79%**
  - Transkonjunktivaler Zugang bevorzugt (keine sichtbare Narbe)
  - Histologische Untersuchung bei rezidivierenden oder atypischen Läsionen empfohlen⁸

![Chalazion – Inzision und Kürettage: Transkonjunktivaler Zugang mit Desmarres-Lidhalter](asset:assets/images/chalazion_incision.png)

### Lichtbasierte Therapien

- **Intense Pulsed Light (IPL) mit Meibom-Drüsen-Expression (MGX):**
  - Primäre/rezidivierende Chalazien: **70,5% Auflösungsrate**, vergleichbar mit chirurgischer Exzision, aber mit **signifikant geringerer Rezidivrate** (11,4% vs. 45,6%)
  - Granulomatöser Typ spricht besser an (60,71%) als zystischer Typ (26,32%)
  - **Kombination IPL + Doxycyclin:** Bei intraktablen rezidivierenden Chalazien **83,3% Erfolgsrate**
- **Low-Level Light Therapy (LLLT):** **46% Resolution** nach einer Sitzung, **92% Resolution** nach zwei Sitzungen

### Experimentelle Verfahren (begrenzte Evidenz)²
- Botulinum-Toxin-A-Injektion
- Tarsale Trephination
- CO₂-Laser-Ablation
- Kryotherapie

### Therapieempfehlung – Stufenschema

1. **Konservativ (4–6 Wochen):** Warme Kompressen + Lidhygiene + Lidrandmassage ± Mikroblepharoexfoliation
2. **Bei Persistenz oder >2 Monate Dauer:** Intralesionale Steroidinjektion oder IPL-MGX-Therapie
3. **Bei Rezidiven:** IPL-MGX ± systemische Antibiotika (Doxycyclin/Azithromycin)
4. **Therapierefraktär:** Chirurgische Exzision mit Kürettage (histologische Untersuchung empfohlen)

> **Wichtig:** Bei rezidivierenden oder multiplen Chalazien sollte die zugrundeliegende Meibom-Drüsen-Dysfunktion und Blepharitis behandelt werden.

---

## Prophylaxe

Die **Prävention rezidivierender Chalazien** basiert primär auf der **Behandlung der zugrundeliegenden Meibom-Drüsen-Dysfunktion und Blepharitis**.

### Tägliche Lidhygiene – Basismaßnahmen

- **Warme Kompressen:** Tägliche Anwendung für mehrere Minuten zur Verflüssigung der Meibom-Sekrete
- **Lidrandmassage:** Vertikale Massage zur Expression der Meibom-Drüsen-Sekrete
- **Lidreinigung:** Sanftes Reinigen der Wimpernbasis mit verdünntem Baby-Shampoo oder kommerziellen Lidreinigern. **Hypochlorous Acid 0,01%** hat starke antimikrobielle Wirkung
- **Regelmäßigkeit:** Täglich oder mehrmals wöchentlich. Die Behandlung muss **langfristig** erfolgen, da Symptome bei Absetzen häufig rezidivieren

> **Wichtig:** Patienten müssen verstehen, dass eine **Heilung meist nicht möglich ist**, aber kontinuierliche tägliche Behandlung die Symptome signifikant verbessern kann.

### Behandlung der Meibom-Drüsen-Dysfunktion

- **Doxycyclin:** Anti-inflammatorische und lipid-regulierende Effekte
- **Azithromycin:** Längere Gewebehalbwertszeit, weniger gastrointestinale Nebenwirkungen. Eine Einzeldosis kann das okuläre Mikrobiom für mindestens 6 Monate verändern
- **Omega-3-Fettsäuren:** Einige Studien zeigen Benefit bei MGD, Evidenz nicht eindeutig

### In-Office-Verfahren zur Langzeitprävention

- **Intense Pulsed Light (IPL) mit Meibom-Drüsen-Expression:** Signifikant reduzierte Rezidivrate: **11,4%** versus **45,6%** ohne IPL-MGX⁵

### Prophylaxe-Empfehlung – Stufenschema

1. **Alle Patienten:** Tägliche Lidhygiene (warme Kompressen + Lidrandmassage + Reinigung)
2. **Bei Blepharitis/MGD:** Zusätzlich systemische Antibiotika bei unzureichender Kontrolle
3. **Bei Demodex-Befall:** Spezifische antiparasitäre Therapie (Tea Tree Oil, Lotilaner, Ivermectin)
4. **Bei rezidivierenden Chalazien:** In-Office-Verfahren (IPL-MGX, Mikroblepharoexfoliation, LipiFlow)
5. **Nach chirurgischer Exzision:** IPL-MGX-Therapie zur Rezidivprophylaxe

Die Prophylaxe muss **langfristig und kontinuierlich** erfolgen, da die zugrundeliegenden Erkrankungen chronisch sind.

---

## Prognose

Die Prognose des Chalazions ist insgesamt **günstig**. Viele Chalazien resolvieren spontan oder unter konservativer Therapie. Bei adäquater Behandlung der zugrundeliegenden Meibom-Drüsen-Dysfunktion und Blepharitis kann die Rezidivrate signifikant reduziert werden. Bei rezidivierenden oder atypischen Läsionen sollte jedoch immer eine histologische Untersuchung zum Ausschluss eines Talgdrüsenkarzinoms erfolgen.

---

## Referenzen

1. Stopfer M, et al. Glands of Moll. [*Prog Retin Eye Res.* 2025](https://doi.org/10.1016/j.preteyeres.2025.101362)
2. Sacks E, et al. Apocrine Cystadenomas of the Lower Eyelids. [*Ophthalmology.* 1987](https://doi.org/10.1016/s0161-6420(87)33501-8)
3. Jakobiec FA, et al. Eyelid Eccrine Cyst. [*Ophthalmic Plast Reconstr Surg.* 2017](https://doi.org/10.1097/IOP.0000000000000855)
4. Kim ES, et al. The Lowly Chalazion. [*Surv Ophthalmol.* 2023](https://doi.org/10.1016/j.survophthal.2022.11.002)
5. Jakobiec FA, et al. Eyelid Dermal Keratinous Cysts. [*Ophthalmic Plast Reconstr Surg.* 2016](https://doi.org/10.1097/IOP.0000000000000423)
6. Palioura S, et al. Pleomorphic Adenoma of the Eyelid. [*Surv Ophthalmol.* 2013](https://doi.org/10.1016/j.survophthal.2012.10.003)
7. Takahashi Y, et al. Secretory Glands in the Eyelid. [*Ophthalmic Plast Reconstr Surg.* 2013](https://doi.org/10.1097/IOP.0b013e3182833dee)
8. Malkova K, et al. Ciliary Gland Adenocarcinoma. [*Am J Dermatopathol.* 2022](https://doi.org/10.1097/DAD.0000000000002218)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Chalazion** = chronische lipogranulomatöse Entzündung durch Obstruktion der **Meibom-** oder **Zeis-Drüsen**.

---

### Klinik
- Schmerzlose, feste Schwellung im Lid (nicht am Lidrand)
- DD: [Hordeolum](#hordeolum) (akut, schmerzhaft), Talgdrüsenkarzinom (bei Rezidiven)

---

### Therapie-Stufenschema

1. **Konservativ (4–6 Wo):** Warme Kompressen + Lidhygiene + Lidmassage
2. **Bei Persistenz >2 Mo:** Intralesionale Steroidinjektion oder IPL-MGX
3. **Rezidive:** IPL-MGX ± Doxycyclin/Azithromycin
4. **Therapierefraktär:** Inzision & Kürettage (+ Histologie)

---

### Wichtige Zahlen
| Therapie | Erfolgsrate |
|---|---|
| Warme Kompressen | 21% |
| BlephEx | 87% |
| Steroidinjektion | 81% |
| Inzision & Kürettage | 79% |
| IPL-MGX | 70,5% |
| LLLT (2 Sitzungen) | 92% |

---

### Prophylaxe
Tägliche Lidhygiene + Behandlung der zugrundeliegenden **MGD/Blepharitis**. Bei Rezidiven: IPL-MGX (Rezidivrate nur **11,4%** vs. 45,6%).

> **Cave:** Bei rezidivierenden/atypischen Läsionen immer **Histologie** zum Ausschluss eines Talgdrüsenkarzinoms!
''',
      ),
      const Condition(
        id: 'moll_cyst',
        name: 'Moll-Zyste (Apokrines Hidrozystom)',
        description: 'Benigne zystische Läsion der apokrinen Moll-Drüsen am Lidrand mit charakteristisch durchscheinend-bläulichem Erscheinungsbild.',
        symptoms: ['swelling'],
        urgency: Urgency.low,
        treatment: ['Lokale chirurgische Exzision mit intakter Kapsel'],
        followUp: 'Kontrolle auf Rezidiv, selten bei kompletter Exzision',
        wikiContent: '''
## Definition und Anatomie

Moll-Zysten sind **benigne zystische Tumoren**, die von den **apokrinen Schweißdrüsen (Moll-Drüsen)** des Augenlids abstammen.¹ Die Moll-Drüsen sind modifizierte apokrine Drüsen, die ausschließlich am **Lidrand und in den Kanthi** lokalisiert sind, wo sie mit den Wimpernfollikeln assoziiert sind.² Sie sind anatomisch auf diese Bereiche beschränkt und kommen nicht in anderen Teilen der Lidhaut vor.²

---

## Pathogenese

Die Entstehung der Moll-Zysten basiert auf einer **Obstruktion der Drüsenausführungsgänge** mit nachfolgender Retention des apokrinen Sekrets. Studien zeigen, dass die Zysten aus dem **sekretorischen Anteil** der Moll-Drüsen entstehen (nicht aus dem Ganganteil), was durch elektronenmikroskopische Befunde wie Dekapitationssekretion und sekretorische Granula belegt wird.³ Es handelt sich um einen **proliferativen Prozess** und nicht um eine passive Gangdilatation.³

---

## Klinik

- **Lokalisation:** Ausschließlich am **Lidrand und in den Kanthi**, wo die Moll-Drüsen lokalisiert sind²
- **Erscheinungsbild:** **Durchscheinend-bläuliche**, glatt begrenzte, kuppelförmige Zysten¹ ³
- **Charakteristisches Merkmal:** Oft **zweischichtiger Inhalt** – obere Schicht aus cremig-gelblichem Material (lipidreiche Dekapitationssekretion) über einer unteren Schicht klarer Flüssigkeit³
- **Pigmentierte Variante:** 13% der Hidrozystome sind pigmentiert (dunkelblau bis schwarz) durch Lipofuscin-Pigmente⁴
- **Größe:** Typischerweise 1–5 mm Durchmesser⁴
- **Verlauf:** Langsam wachsend, oft über Jahre bestehend
- **Multiplizität:** Können einzeln oder multipel auftreten; multiple bilaterale Zysten wurden beschrieben³

---

## Histopathologie

- **Zystenwand:** **Doppelschichtiges kuboidales Epithel** mit innerer sekretorischer Schicht und äußerer myoepithelialer Schicht¹ ³
- **Dekapitationssekretion:** Die innere Zellschicht zeigt charakteristische **apikale Dekapitationssekretion** (PAS-positiv)¹
- **Papilläre Falten:** Fokale papilläre Einfaltungen des Epithels möglich³
- **Zysteninhalt:** Zelldebris, unterbrochene Plasmamembranen, flockiges muzinöses Material³

### Immunhistochemie

- **GCDFP-15:** **Positiv** in den adluminalen Zellen – wichtiger Marker für apokrine Differenzierung⁵ ²
- **α-SMA:** **Positiv** in der äußeren myoepithelialen Schicht⁵ ¹
- **CK7:** **Positiv** – charakteristisch für sekretorische Spiralen¹ ²
- **D2-40:** Positiv in der myoepithelialen Schicht¹

> Diese Marker unterscheiden apokrine Hidrozystome von ekkrinen Zysten (die GCDFP-15-negativ und α-SMA-negativ sind).⁵

---

## Differenzialdiagnose

- **Ekkrine Hidrozystome:** Selten am Augenlid, GCDFP-15-negativ, keine Myoepithelschicht⁵ ²
- **Chalazion:** Tiefere Lokalisation in der Tarsalplatte, lipogranulomatöse Entzündung⁶
- **Hordeolum:** Akute purulente Entzündung, schmerzhaft⁶
- **Epidermoidzyste:** Keratinöser Inhalt, Plattenepithel⁷
- **Hybridzysten:** Kombinierte apokrine, trichilemmale und infundibuläre Differenzierung⁸
- **Basalzellkarzinom:** Maligne Läsion, erfordert histologische Abklärung

---

## Therapie

- **Standardtherapie:** **Lokale chirurgische Exzision** – kurativ² ⁷
- **Technik:** Vollständige Entfernung der Zyste mit intakter Kapsel
- **Prognose:** Exzellent nach vollständiger Entfernung
- **Rezidive:** Selten bei kompletter Exzision

---

## Sonderformen

- **Proliferatives apokrines Hidrozystom:** Extensive Proliferation von Epithelzellen aus der inneren Zystenschicht⁹
- **Multiple apokrine Zysten mit Prolaktinom:** Seltene Assoziation mit Hypophysentumoren beschrieben¹⁰

---

## Referenzen

1. Charles NC, et al. Epibulbar Subconjunctival Apocrine Hidrocystoma. [*Ophthalmic Plast Reconstr Surg.* 2021](https://doi.org/10.1097/IOP.0000000000002019)
2. Jakobiec FA, et al. A Reappraisal of Eyelid Eccrine and Apocrine Hidrocystomas. [*Am J Ophthalmol.* 2011](https://doi.org/10.1016/j.ajo.2010.08.028)
3. Sacks E, et al. Multiple Bilateral Apocrine Cystadenomas of the Lower Eyelids. [*Ophthalmology.* 1987](https://doi.org/10.1016/s0161-6420(87)33501-8)
4. Al-Rohil RN, et al. Pigmented Eyelid Cysts Revisited. [*Am J Dermatopathol.* 2014](https://doi.org/10.1097/DAD.0b013e3182a23a87)
5. Jakobiec FA, et al. Eyelid Eccrine Cyst. [*Ophthalmic Plast Reconstr Surg.* 2017](https://doi.org/10.1097/IOP.0000000000000855)
6. Kim ES, et al. The Lowly Chalazion. [*Surv Ophthalmol.* 2023](https://doi.org/10.1016/j.survophthal.2022.11.002)
7. Jakobiec FA, et al. Unusual Eyelid Dermal Keratinous Cysts. [*Ophthalmic Plast Reconstr Surg.* 2016](https://doi.org/10.1097/IOP.0000000000000423)
8. Milman T, et al. Hybrid Cysts of the Eyelid. [*Ophthalmic Plast Reconstr Surg.* 2008](https://doi.org/10.1097/IOP.0b013e3181647ce9)
9. Charles NC, et al. Solid Variant of a Proliferative Apocrine Hidrocystoma. [*Ophthalmic Plast Reconstr Surg.* 2019](https://doi.org/10.1097/IOP.0000000000001354)
10. Ma L, et al. Multiple Eyelid Cysts in a Patient With a Prolactinoma. [*Ophthalmic Plast Reconstr Surg.* 2018](https://doi.org/10.1097/IOP.0000000000001069)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Moll-Zyste** = benigner zystischer Tumor der **apokrinen Moll-Drüsen** am Lidrand.

---

### Klinik
- **Durchscheinend-bläuliche**, kuppelförmige Zyste am Lidrand/Kanthus
- 1–5 mm, langsam wachsend, oft zweischichtiger Inhalt
- Pigmentierte Variante möglich (13%)

---

### Diagnostik
| Marker | Moll-Zyste | Ekkrine Zyste |
|---|---|---|
| GCDFP-15 | Positiv | Negativ |
| α-SMA | Positiv | Negativ |
| CK7 | Positiv | Positiv |

---

### Therapie
**Lokale chirurgische Exzision** mit intakter Kapsel – kurativ, selten Rezidive.

> **DD:** Ekkrine Hidrozystome (GCDFP-15-negativ), Chalazion (tiefer, entzündlich), Basalzellkarzinom (maligne).
''',
      ),
      const Condition(
        id: 'zeiss_cyst',
        name: 'Zeiss-Zyste (Sebazöse Gangzyste)',
        description: 'Dermale keratinöse Zyste der Zeiss-Drüsen-Ausführungsgänge am Lidrand, assoziiert mit dem pilosebazösen Apparat.',
        symptoms: ['swelling'],
        urgency: Urgency.low,
        treatment: ['Einfache lokale Exzision der anterioren Lamelle des Augenlids'],
        followUp: 'Kontrolle auf Rezidiv',
        wikiContent: '''
## Definition und Anatomie

Zeiss-Zysten sind **dermale keratinöse Zysten**, die aus den **Ausführungsgängen der Zeiss-Drüsen** entstehen.⁷ Die Zeiss-Drüsen sind **Talgdrüsen des pilosebazösen Apparats**, die am Lidrand lokalisiert sind und mit den Wimpernfollikeln assoziiert sind.⁷ Sie unterscheiden sich von den Meibom-Drüsen, die tiefer in der Tarsalplatte liegen.

---

## Pathogenese

Die Zysten entstehen durch **Obstruktion der sebazösen Ausführungsgänge** mit nachfolgender Retention von Keratin und Talg. Die Assoziation mit dem pilosebazösen Apparat (Haarfollikel oder Talgdrüse in unmittelbarer Nähe) ist charakteristisch.⁷

---

## Klinik

- **Lokalisation:** Am **Lidrand**, wo die Zeiss-Drüsen lokalisiert sind⁷
- **Erscheinungsbild:** **Langsam wachsende, solitäre, feste Läsion**⁷
- **Größe:** Variabel, typischerweise einige Millimeter
- **Verlauf:** Chronisch, langsam progredient
- **Assoziation:** Oft in Nähe eines Haarfollikels oder einer Talgdrüse nachweisbar⁷

---

## Histopathologie

- **Zystenwand:** **Plattenepithel** mit charakteristischer Struktur⁷
- **Korrigierte Membran:** Gewellte Plattenepithelmembran mit **eosinophiler, refraktiler Oberflächenkutikula** – pathognomonisches Merkmal⁷
- **Zysteninhalt:** Keratin und Talg
- **Assoziation:** Talgdrüse oder Haar in unmittelbarer Nähe der Zyste nachweisbar⁷

### Immunhistochemie

- **CK7:** **Positiv**⁷
- **CK14:** **Positiv**⁷
- **CK17:** **Positiv**⁷

> Diese Marker unterscheiden Zeiss-Gangzysten von gewöhnlichen Epidermoidzysten der Oberflächenepidermis (die CK7-negativ, CK14-positiv und CK17-positiv sind).⁷

---

## Abgrenzung zu anderen Zysten

| Merkmal | Zeiss-Zyste | Meibom-Zyste | Epidermoidzyste |
|---|---|---|---|
| **Lokalisation** | Lidrand (Dermis) | Tarsalplatte (tief) | Oberflächliche Dermis |
| **Ursprung** | Zeiss-Drüsen-Gang | Meibom-Drüsen-Gang | Oberflächenepidermis |
| **Haarassoziation** | Ja | Nein | Variabel |
| **Kutikula** | Eosinophile Kutikula | Keine | Keine |
| **CK7** | Positiv | Negativ | Negativ |

---

## Differenzialdiagnose

- **Oberflächliches Chalazion:** Entsteht ebenfalls aus Zeiss-Drüsen, aber durch lipogranulomatöse Entzündung nach Obstruktion⁶
- **Hordeolum externum:** Akute purulente Infektion der Zeiss-Drüsen⁶
- **Meibom-Drüsen-Gangzyste:** Tiefer in der Tarsalplatte lokalisiert, keine Haarassoziation¹¹
- **Epidermoidzyste:** Oberflächlicher, keine Kutikula, CK7-negativ⁷

---

## Therapie

- **Standardtherapie:** **Einfache lokale Exzision der anterioren Lamelle des Augenlids**⁷
- **Technik:** Vollständige Entfernung der Zyste
- **Prognose:** Exzellent nach vollständiger Exzision

> **Wichtig:** Unterscheidung von Chalazion wichtig, da Inzision und Kürettage bei Zeiss-Zysten zu Rezidiven führen kann.¹¹

---

## Klinische Relevanz

Die Zeiss-Drüsen können auch an der Entstehung eines **oberflächlichen Chalazions** beteiligt sein (im Gegensatz zum tiefen Chalazion der Meibom-Drüsen).⁶ Zusätzlich kann eine akute Infektion der Zeiss-Drüsen zu einem **Hordeolum externum** führen.⁶

---

## Referenzen

1. Charles NC, et al. Epibulbar Subconjunctival Apocrine Hidrocystoma. [*Ophthalmic Plast Reconstr Surg.* 2021](https://doi.org/10.1097/IOP.0000000000002019)
2. Jakobiec FA, et al. A Reappraisal of Eyelid Eccrine and Apocrine Hidrocystomas. [*Am J Ophthalmol.* 2011](https://doi.org/10.1016/j.ajo.2010.08.028)
3. Sacks E, et al. Multiple Bilateral Apocrine Cystadenomas of the Lower Eyelids. [*Ophthalmology.* 1987](https://doi.org/10.1016/s0161-6420(87)33501-8)
4. Al-Rohil RN, et al. Pigmented Eyelid Cysts Revisited. [*Am J Dermatopathol.* 2014](https://doi.org/10.1097/DAD.0b013e3182a23a87)
5. Jakobiec FA, et al. Eyelid Eccrine Cyst. [*Ophthalmic Plast Reconstr Surg.* 2017](https://doi.org/10.1097/IOP.0000000000000855)
6. Kim ES, et al. The Lowly Chalazion. [*Surv Ophthalmol.* 2023](https://doi.org/10.1016/j.survophthal.2022.11.002)
7. Jakobiec FA, et al. Unusual Eyelid Dermal Keratinous Cysts. [*Ophthalmic Plast Reconstr Surg.* 2016](https://doi.org/10.1097/IOP.0000000000000423)
8. Milman T, et al. Hybrid Cysts of the Eyelid. [*Ophthalmic Plast Reconstr Surg.* 2008](https://doi.org/10.1097/IOP.0b013e3181647ce9)
9. Charles NC, et al. Solid Variant of a Proliferative Apocrine Hidrocystoma. [*Ophthalmic Plast Reconstr Surg.* 2019](https://doi.org/10.1097/IOP.0000000000001354)
10. Ma L, et al. Multiple Eyelid Cysts in a Patient With a Prolactinoma. [*Ophthalmic Plast Reconstr Surg.* 2018](https://doi.org/10.1097/IOP.0000000000001069)
11. Rajak SN, et al. Meibomian Gland Ductal Cysts and Eyelid Steatocystomas. [*Eye.* 2017](https://doi.org/10.1038/eye.2016.313)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Zeiss-Zyste** = dermale keratinöse Zyste der **sebazösen Zeiss-Drüsen-Ausführungsgänge** am Lidrand.

---

### Klinik
- Langsam wachsende, **solitäre, feste Läsion** am Lidrand
- Assoziiert mit Haarfollikel/Talgdrüse
- Pathognomonisch: **eosinophile, refraktile Oberflächenkutikula** in der Histologie

---

### Abgrenzung

| Merkmal | Zeiss-Zyste | Chalazion | Epidermoidzyste |
|---|---|---|---|
| Lokalisation | Lidrand | Tarsalplatte | Oberfl. Dermis |
| CK7 | Positiv | – | Negativ |
| Kutikula | Ja | Nein | Nein |

---

### Therapie
**Einfache lokale Exzision** der anterioren Lamelle – kurativ.

> **Cave:** Keine Inzision & Kürettage (wie bei Chalazion) – führt bei Zeiss-Zysten zu Rezidiven!
''',
      ),
      const Condition(
        id: 'basal_cell_carcinoma',
        name: 'Basalzellkarzinom (Basaliom)',
        description: 'Häufigster maligner Tumor der Augenlider (80–96% aller periokulären Malignome). Lokal invasiv, langsam wachsend, sehr geringes Metastasierungspotenzial.',
        symptoms: ['swelling'],
        urgency: Urgency.high,
        treatment: ['Mohs-Chirurgie (Goldstandard)', 'Standardexzision mit 4mm Sicherheitsabstand', 'Vismodegib/Sonidegib bei lokal fortgeschrittenem BCC', 'Cemiplimab (Anti-PD-1) nach HHI-Versagen'],
        followUp: 'Hautuntersuchung alle 6-12 Monate für 5 Jahre, dann jährlich lebenslang (NCCN)',
        wikiContent: '''
## Definition

Das Basalzellkarzinom (BCC) ist der **häufigste maligne Tumor der Augenlider** (80–96% aller periokulären Malignome).¹ Lokal invasiv, langsam wachsend, mit sehr geringem Metastasierungspotenzial (<0,1%). Lokalisation: **Unterlid** (50–60%) > **medialer Kanthus** (25–30%) > Oberlid > lateraler Kanthus. Mediale Kanthusbeteiligung ist mit höherem Rezidivrisiko assoziiert (>50%).² ³

---

## Epidemiologie

- Häufigstes Hautkarzinom weltweit mit steigender Inzidenz⁴
- Inzidenz steigt mit dem Alter (86,5/100.000 bei 30–44 Jahren vs. 1221,2/100.000 bei ≥75 Jahren)⁵
- Männer häufiger betroffen; weiße Rasse stärkster Risikofaktor⁶
- Mittleres Diagnosealter: 65–67 Jahre⁴

---

## Pathogenese

**UV-Strahlung:** Wichtigster Risikofaktor mit Latenzzeit von 15–20 Jahren. Intermittierende intensive Exposition (v.a. Kindheit) relevanter als kumulative Dosis.⁷ ⁸

**Hedgehog-Signalweg:** Zentral für BCC-Pathogenese. PTCH1-Mutationen in 70–90% der sporadischen BCCs. Beim **Gorlin-Syndrom** liegt eine vererbte PTCH1-Mutation vor.⁷ ⁹

**p53-Mutationen:** In >50% der BCCs, meist UV-induziert.⁷

**Weitere Risikofaktoren:**
- Phänotyp: Helle Haut, rotes Haar, helle Augen⁵
- Immunsuppression: 10–21-fach erhöht bei Organtransplantierten⁸ ⁴
- Vorheriges BCC: 10-fach erhöhtes Risiko⁸
- Genetische Syndrome: Gorlin-Syndrom, Xeroderma pigmentosum⁴

---

## Diagnose

### Klinische Präsentation nach Subtyp

- **Nodulär (40–70%):** Perlmuttartig glänzender Knoten, Randwall, Teleangiektasien, Ulzeration möglich⁵ ⁸
- **Superfiziell (20–30%):** Rot, flach, schuppend; kann als Ekzem fehldiagnostiziert werden⁵
- **Infiltrativ/Morpheaform (5–30%):** Narbenähnlich, aggressivstes Wachstum⁵ ¹⁰
- **Pigmentiert:** Braun-blau-schwarz durch Melanin; DD Melanom⁵

### Dermoskopie

Arborisierende Gefäße (59%), glänzende weiße Strukturen (49%), blau-graue ovoide Nester (34%).¹¹ ¹²

> **Wichtig:** Alle periokulären BCCs gelten nach NCCN als **High-Risk**.¹³

### Differenzialdiagnose

- **Chalazion** (häufigste Fehldiagnose!)
- Plattenepithelkarzinom, Talgdrüsenkarzinom, Melanom, Merkelzellkarzinom

---

## Therapie

### Chirurgisch (Standard)

- **Mohs-Chirurgie:** Goldstandard. 5-Jahres-Rezidivrate: **1%**. 100% Randkontrolle⁸ ⁷
- **Standardexzision:** 5-Jahres-Rezidivrate 10%; 4 mm Sicherheitsabstand⁷ ¹³
- **Exenteration:** Bei extensiver Orbita-Invasion¹⁴ ⁹

### Systemische Therapie

- **Vismodegib/Sonidegib** (Hedgehog-Inhibitoren): Ansprechrate 75%, komplette Regression 38–56%¹⁴ ¹⁶
- **Cemiplimab** (Anti-PD-1): Nach HHI-Versagen; Ansprechrate 31%¹³

> **Cave:** Topische Therapien, Kryotherapie, PDT und Kürettage sind **nicht geeignet** für periokuläres BCC.¹³

---

## Prognose und Nachsorge

- **NCCN-Empfehlung:** Hautuntersuchung alle 6–12 Monate für 5 Jahre, dann jährlich lebenslang¹³
- High-Risk-BCCs: 5 Jahre Nachsorge¹⁷

---

## Prophylaxe

- Konsequenter UV-Schutz (Sonnencreme, Hut, Sonnenbrille)
- Nicotinamid-Supplementation (NCCN-Empfehlung)¹³
- Regelmäßige Hautuntersuchungen bei Risikopatienten

> **Cave:** Rezidivierende oder atypische "Chalazien" immer biopsieren → DD Talgdrüsenkarzinom/BCC.¹⁴ ¹⁶

---

## Referenzen

1. Hooper J, et al. Periocular Nonmelanoma Skin Cancer. [*Clin Dermatol.* 2024](https://doi.org/10.1016/j.clindermatol.2023.10.011)
2. Shi Y, et al. Ocular Basal Cell Carcinoma. [*OncoTargets Ther.* 2017](https://doi.org/10.2147/OTT.S130371)
3. Furdova A, et al. Periocular BCC. [*Oncol Rev.* 2020](https://doi.org/10.4081/oncol.2020.420)
4. Nehal KS, et al. Update on Keratinocyte Carcinomas. [*N Engl J Med.* 2018](https://doi.org/10.1056/NEJMra1708701)
5. Wehner MR. Keratinocyte Carcinoma. [*JAMA.* 2025](https://doi.org/10.1001/jama.2025.18749)
6. Cheng S, et al. Patterns of BCC Presentation. [*Ophthalmic Plast Reconstr Surg.* 2025](https://doi.org/10.1097/IOP.0000000000002979)
7. Kauvar AN, et al. Consensus for Nonmelanoma Skin Cancer Treatment. [*Dermatol Surg.* 2015](https://doi.org/10.1097/DSS.0000000000000296)
8. Rubin AI, et al. Basal-Cell Carcinoma. [*N Engl J Med.* 2005](https://doi.org/10.1056/NEJMra044151)
9. Wladis EJ, et al. Oral Hedgehog Inhibitor for Periorbital BCC. [*Ophthalmology.* 2024](https://doi.org/10.1016/j.ophtha.2024.06.007)
10. Firnhaber JM. Basal Cell and Cutaneous SCC. [*Am Fam Physician.* 2020](https://pubmed.ncbi.nlm.nih.gov/32931212/)
11. Reiter O, et al. Dermoscopic Features of BCC. [*J Am Acad Dermatol.* 2021](https://doi.org/10.1016/j.jaad.2019.11.008)
12. Jaworska K, et al. Dermoscopic Features of Eyelid Margin Tumors. [*J Dermatol.* 2022](https://doi.org/10.1111/1346-8138.16419)
13. NCCN. Basal Cell Skin Cancer. Updated 2026-03-11.
14. Singalavanija T, et al. Vismodegib for Periocular BCC. [*Ophthalmic Plast Reconstr Surg.* 2024](https://doi.org/10.1097/IOP.0000000000002464)
15. Peris K, et al. European Consensus for BCC. [*Eur J Cancer.* 2019](https://doi.org/10.1016/j.ejca.2019.06.003)
16. Kahana A, et al. VISORB Trial. [*Oncologist.* 2021](https://doi.org/10.1002/onco.13820)
17. Juniat V, et al. Periocular BCC Recurrence Surveillance. [*Eye.* 2023](https://doi.org/10.1038/s41433-022-02133-z)
18. Banlin M, et al. Management of Malignant Eyelid Tumours. [*Clin Exp Ophthalmol.* 2026](https://doi.org/10.1111/ceo.70062)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Basalzellkarzinom** = häufigster maligner Lidtumor (80–96%). Lokal invasiv, **sehr selten metastasierend** (<0,1%).

---

### Lokalisation
Unterlid (50–60%) > medialer Kanthus (25–30%) > Oberlid > lateraler Kanthus

---

### Subtypen
| Subtyp | Häufigkeit | Merkmal |
|---|---|---|
| Nodulär | 40–70% | Perlmuttglanz, Randwall, Teleangiektasien |
| Superfiziell | 20–30% | Rot, flach, schuppend |
| Infiltrativ | 5–30% | Narbenähnlich, aggressiv |

---

### Therapie
| Methode | 5J-Rezidivrate |
|---|---|
| **Mohs-Chirurgie** | **1%** |
| Standardexzision | 10% |
| Vismodegib | Ansprechrate 75% |

---

### Nachsorge
Alle 6–12 Monate für 5 Jahre, dann jährlich lebenslang (NCCN).

> **Cave:** Rezidivierende "Chalazien" immer biopsieren → DD BCC/Talgdrüsenkarzinom! Alle periokulären BCCs sind **High-Risk**.
''',
      ),
      const Condition(
        id: 'hordeolum',
        name: 'Hordeolum (Gerstenkorn)',
        description: 'Akute eitrige Entzündung des Augenlids, meist durch Staphylokokken-Infektion verursacht.',
        symptoms: ['swelling', 'pain', 'redness'],
        urgency: Urgency.low,
        treatment: ['Warme Kompressen mehrmals täglich 10-15 Min.', 'Lidhygiene', 'Bei Persistenz: Inzision und Drainage'],
        followUp: 'Bei Zunahme oder Fieber sofort Arzt; Kontrolle nach 1-2 Wochen bei Persistenz',
        source: null,
        wikiContent: '''
## Definition

Ein Hordeolum ist eine **akute, eitrige Entzündung** des Augenlids, meist durch bakterielle Infektion (v.a. **Staphylococcus aureus**) verursacht.¹ Im Gegensatz zum [Chalazion](#chalazion), das eine chronische lipogranulomatöse Entzündung darstellt, ist das Hordeolum eine akute Infektion.

---

## Klassifikation

| Typ | Betroffene Drüsen | Lokalisation |
|---|---|---|
| **Hordeolum externum** | Zeis-Drüsen (Talg), Moll-Drüsen (Schweiß), Wimpernfollikel | Lidrand, äußerlich sichtbar |
| **Hordeolum internum** | Meibom-Drüsen (Tarsalplatte) | Tiefer im Lid, konjunktival sichtbar |

---

## Pathogenese

Die Pathogenese basiert auf einer **Obstruktion der Drüsenausführungsgänge** mit nachfolgender eitriger Entzündung durch **Staphylococcus aureus**.⁴ ⁵

### Risikofaktoren

- **Blepharitis:** Chronische Lidentzündung als Hauptrisikofaktor (staphylokokkale, seborrhoische oder MGD-assoziiert)⁵
- **Demodex-Milben:** 59,5% Prävalenz bei rezidivierenden Hordeola vs. 17,5% bei Kontrollen; besonders bei Erwachsenen in den 20ern⁶
- **Immundefizienz:** z.B. selektiver IgM-Mangel bei rezidivierenden Fällen⁴
- **Meibom-Drüsen-Dysfunktion:** Prädisponiert für posteriore Blepharitis und Hordeola⁵
- **Seborrhoische Dermatitis:** Häufig assoziiert

---

## Klinik

### Symptome
- **Akuter Beginn** (im Gegensatz zum subakuten [Chalazion](#chalazion))
- **Schmerz**, Rötung, Schwellung
- Fremdkörpergefühl, Tränen

### Klinische Befunde
- **Hordeolum externum:** Gut abgegrenzte, **schmerzhafte Schwellung am Lidrand**, oft mit zentralem Eiterpunkt⁷
- **Hordeolum internum:** Schwellung im mittleren Lidbereich, bei Ektropionierung **konjunktivale Rötung und Eiterung** sichtbar
- Lokale Wärme und Druckschmerz
- Mögliche Lymphknotenschwellung präaurikulär

---

## Diagnostik

Die Diagnose erfolgt primär **klinisch** durch Inspektion und Palpation. Bei rezidivierenden Hordeola: **Wimpernepilation zur Demodex-Untersuchung** empfohlen.⁶

### Differenzialdiagnose: Hordeolum vs. Chalazion

| Merkmal | Hordeolum | [Chalazion](#chalazion) |
|---|---|---|
| Verlauf | **Akut** | Subakut/chronisch |
| Schmerz | **Schmerzhaft** | Schmerzlos/minimal |
| Entzündung | **Eitrig** (purulent) | Lipogranulomatös |
| Lokalisation | Lidrand | Mittleres Lid |
| Ätiologie | Bakterielle Infektion | Drüsenobstruktion |

---

## Therapie

> **Wichtig:** In vielen Fällen **spontane Drainage und Abheilung** innerhalb einer Woche ohne Behandlung.¹

### Konservative Therapie (Erstlinie)

- **Warme Kompressen:** Mehrmals täglich für 10–15 Minuten zur Förderung der Drainage¹ ⁵
- **Lidhygiene:** Reinigung mit verdünntem Baby-Shampoo oder Hypochlorous Acid 0,01%⁸ ⁵
- **Lidmassage:** Zur Expression der Drüsensekrete

### Topische Antibiotika

- Antibiotikasalben (z.B. Erythromycin, Bacitracin) werden häufig verschrieben
- **Jedoch:** Studien zeigen, dass Antibiotika die Heilungsrate bei Hordeola **nicht signifikant verbessern** (RR 0,99; 95% CI 0,96–1,02)⁹

### Intense Pulsed Light (IPL)

- Neuere Studie zeigt **signifikant kürzere Erholungszeit** und niedrigere OP-Rate im Vergleich zur medikamentösen Therapie¹⁰
- Signifikante Reduktion des OSDI-Scores nach IPL-Behandlung

### Chirurgische Therapie

- **Inzision und Drainage:** Bei persistierenden, fluktuierenden Läsionen
- Indiziert wenn konservative Maßnahmen nach 1–2 Wochen versagen

### Komplikationen bei Nichtbehandlung

- Ausbreitung auf benachbarte Drüsen und Gewebe
- Entwicklung zu einem **[Chalazion](#chalazion)** (chronisch)
- Selten: **Präseptale Zellulitis**¹ ³

---

## Prophylaxe

### Tägliche Lidhygiene
- Warme Kompressen und Lidrandmassage
- Regelmäßige Lidreinigung

### Behandlung der Grunderkrankung
- Blepharitis-Therapie (staphylokokkal, seborrhoisch, MGD)
- Demodex-Behandlung bei Nachweis (Tea Tree Oil, Lotilaner 0,25%, Ivermectin)⁶

### Bei rezidivierenden Hordeola
Wimpernepilation zur Demodex-Diagnostik empfohlen, besonders bei:⁶
- Kurzer Zeitraum zwischen Rezidiven
- Externer Lokalisation
- Multiplen Läsionen
- Anteriorer Blepharitis

---

## Referenzen

1. Lindsley K, et al. Non-Surgical Interventions for Acute Internal Hordeolum. [*Cochrane Database Syst Rev.* 2017](https://doi.org/10.1002/14651858.CD007742.pub4)
2. Kim ES, et al. The Lowly Chalazion. [*Surv Ophthalmol.* 2023](https://doi.org/10.1016/j.survophthal.2022.11.002)
3. Cheng K, et al. Acupuncture for Acute Hordeolum. [*Cochrane Database Syst Rev.* 2017](https://doi.org/10.1002/14651858.CD011075.pub2)
4. Kiratli HK, et al. Multiple Recurrent Hordeola Associated With Selective IgM Deficiency. [*J AAPOS.* 2001](https://doi.org/10.1067/mpa.2001.111018)
5. Lin A, et al. Blepharitis Preferred Practice Pattern. [*Ophthalmology.* 2024](https://doi.org/10.1016/j.ophtha.2023.12.036)
6. Jun SY, et al. Clinical Characteristics of Demodex-Associated Recurrent Hordeola. [*Sci Rep.* 2021](https://doi.org/10.1038/s41598-021-00599-7)
7. Carlisle RT, et al. Differential Diagnosis of the Swollen Red Eyelid. [*Am Fam Physician.* 2015](https://pubmed.ncbi.nlm.nih.gov/26176369/)
8. Yang S, et al. The Microbiome of Meibomian Gland Secretions From Patients With Internal Hordeolum. [*Dis Markers.* 2022](https://doi.org/10.1155/2022/7550090)
9. Alsoudi AF, et al. Efficacy of Care and Antibiotic Use for Chalazia and Hordeola. [*Eye Contact Lens.* 2022](https://doi.org/10.1097/ICL.0000000000000859)
10. Lu Y, et al. Short-Term Efficacy of Intense Pulsed Light in the Treatment of Hordeolum. [*Medicine.* 2026](https://doi.org/10.1097/MD.0000000000047845)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Hordeolum (Gerstenkorn)** = akute eitrige Entzündung durch **Staphylococcus aureus**-Infektion der Liddrüsen.

---

### Klassifikation
- **Externum:** Zeis-/Moll-Drüsen am Lidrand
- **Internum:** Meibom-Drüsen in der Tarsalplatte

---

### Klinik
- Akuter Beginn, schmerzhaft, Rötung, Schwellung
- DD: [Chalazion](#chalazion) (chronisch, schmerzlos)

---

### Therapie-Stufenschema

1. **Konservativ:** Warme Kompressen + Lidhygiene + Lidmassage
2. **Bei Persistenz (1–2 Wo):** Inzision und Drainage
3. **Antibiotika:** Verbessern Heilungsrate **nicht** signifikant (RR 0,99)

---

### Wichtige Zahlen
| Merkmal | Detail |
|---|---|
| Häufigster Erreger | Staphylococcus aureus |
| Demodex bei Rezidiven | 59,5% vs. 17,5% |
| Antibiotika-Effekt | RR 0,99 (nicht signifikant) |

---

### Prophylaxe
Tägliche Lidhygiene + Behandlung der zugrundeliegenden **Blepharitis/MGD**. Bei Rezidiven: Demodex-Diagnostik (Wimpernepilation).

> **Cave:** Bei Nichtbehandlung Entwicklung zum **[Chalazion](#chalazion)** oder selten **präseptale Zellulitis**!
''',
      ),
      const Condition(
        id: 'dacryocystitis',
        name: 'Dakryozystitis',
        description: 'Entzündung des Tränensacks, oft mit Eiteraustritt.',
        symptoms: ['swelling', 'pain', 'discharge', 'tearing'],
        urgency: Urgency.medium,
        treatment: ['Systemische Antibiotika (Augmentin)', 'Warme Kompressen', 'Bei Abszess: Inzision', 'Später: DCR-OP'],
        followUp: 'Tägliche Kontrolle bis Besserung',
        source: null,
      ),
      const Condition(
        id: 'ptosis',
        name: 'Ptose',
        description: 'Herabhängen des Oberlids durch Muskelschwäche.',
        symptoms: ['lid_drooping'],
        urgency: Urgency.medium,
        treatment: ['Ursachenabklärung (Myasthenie, Horner, etc.)', 'Je nach Ursache: Chirurgie oder Grunderkrankung behandeln'],
        followUp: 'Neurologische Abklärung bei neuem Auftreten',
        source: null,
      ),
      const Condition(
        id: 'orbital_cellulitis',
        name: 'Lidphlegmone / Orbitalphlegmone',
        description: 'Schwere bakterielle Infektion des Lids oder der Orbita. NOTFALL!',
        symptoms: ['swelling', 'pain', 'redness', 'double_vision'],
        urgency: Urgency.high,
        treatment: ['SOFORTIGE Hospitalisation!', 'IV-Antibiotika', 'CT Orbita/Sinus', 'HNO-Konsil'],
        followUp: 'Stationäre Überwachung',
        source: null,
      ),
      const Condition(
        id: 'demodex',
        name: 'Demodex Blepharitis',
        description: 'Milbenbefall der Wimpernfollikel.',
        symptoms: ['itching', 'burning', 'dry_eyes'],
        urgency: Urgency.low,
        treatment: ['Teebaumöl-haltige Lidpflege', 'Intensive Lidhygiene', 'Ivermectin bei schwerem Befall'],
        followUp: 'Kontrolle nach 4-6 Wochen',
        source: null,
      ),
      const Condition(
        id: 'rosacea',
        name: 'Rosazea',
        description: 'Chronische Hauterkrankung mit Rötung und Gefäßerweiterung im Gesicht; oft Beteiligung der Lidränder und Meibom-Drüsen.',
        symptoms: ['redness', 'burning', 'dry_eyes'],
        urgency: Urgency.low,
        treatment: ['Lidhygiene und warme Kompressen', 'Metronidazol-Gel oder systemisch bei Bedarf', 'Vermeidung von Triggern (Alkohol, scharf, Sonne)', 'IPL bei okulärer Rosazea'],
        followUp: 'Kontrolle bei Schüben',
        source: null,
      ),
      const Condition(
        id: 'pyogenic_granuloma',
        name: 'Pyogenes Granulom',
        description: 'Gutartige, stark durchblutete Schwellung der Haut oder Bindehaut, oft nach Trauma oder Operation.',
        symptoms: ['swelling', 'redness'],
        urgency: Urgency.low,
        treatment: ['Exzision oder Abtragung mit Kauterisation', 'Histologie zur Sicherung'],
        followUp: 'Wundkontrolle, Rezidiv möglich',
        source: null,
      ),
      const Condition(
        id: 'orbital_emphysema',
        name: 'Orbitales Emphysem',
        description: 'Luftansammlung im Orbitagewebe, typischerweise nach Trauma oder bei Defekt der Nasennebenhöhlen.',
        symptoms: ['swelling', 'double_vision'],
        urgency: Urgency.medium,
        treatment: ['Trauma ausschließen', 'Kein Schnäuzen', 'Prophylaxe Antibiotika bei Sinusbeteiligung', 'Meist spontane Resorption'],
        followUp: 'Kontrolle bis Rückbildung',
        source: null,
      ),
      const Condition(
        id: 'ocular_amyloidosis',
        name: 'Okuläre Amyloidose',
        description: 'Ablagerung von Amyloid im Gewebe; am Auge oft Lider, Bindehaut oder Orbita. Systemische Abklärung nötig.',
        symptoms: ['swelling', 'redness', 'lid_drooping'],
        urgency: Urgency.medium,
        treatment: ['Systemische Abklärung (Internist)', 'Lokale Exzision bei störenden Läsionen', 'Therapie richtet sich nach Grunderkrankung'],
        followUp: 'Interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'lid_twitching',
        name: 'Lidzucken (Faszikulation)',
        description: 'Unwillkürliche, feine Zuckungen des Lids, meist benigner Verlauf.',
        symptoms: ['lid_drooping'],
        urgency: Urgency.low,
        treatment: ['Stress und Schlafmangel reduzieren', 'Koffein reduzieren', 'Bei Persistenz: neurologische Abklärung', 'Botulinumtoxin nur in Ausnahmefällen'],
        followUp: 'Bei Zunahme oder Ausbreitung Neurologe',
        source: null,
      ),
      const Condition(
        id: 'nldo',
        name: 'Kongenitale Tränenwegsstenose (NLDO)',
        description: 'Angeborene Enge oder Verschluss des Ductus nasolacrimalis; typisch Tränenträufeln und Sekret im Säuglingsalter.',
        symptoms: ['tearing', 'discharge', 'swelling'],
        urgency: Urgency.low,
        treatment: ['Massage des Tränensacks (Crigler)', 'Lidhygiene', 'Antibiotika nur bei Sekundärinfektion', 'Sondierung/Spülung ab ca. 12 Monaten bei Persistenz'],
        followUp: 'Kontrolle bis Spontaneröffnung oder geplanter Sondierung',
        source: null,
      ),
      const Condition(
        id: 'canaliculitis',
        name: 'Kanalikulitis',
        description: 'Entzündung der Tränenkanälchen, oft durch Aktinomyzeten; typisch punktförmige Öffnung, Sekret.',
        symptoms: ['discharge', 'swelling', 'redness'],
        urgency: Urgency.low,
        treatment: ['Expression und Spülung', 'Kanalikulus-Kürettage', 'Antibiotika lokal/systemisch je nach Erreger'],
        followUp: 'Kontrolle bis Abheilung',
        source: null,
      ),
      const Condition(
        id: 'lacrimal_stenosis_acquired',
        name: 'Erworbene Tränenwegsstenose',
        description: 'Verschluss oder Verengung der ableitenden Tränenwege im Erwachsenenalter; Epiphora und rezidivierende Dakryozystitis.',
        symptoms: ['tearing', 'discharge', 'swelling'],
        urgency: Urgency.low,
        treatment: ['Sondierung und Spülung', 'DCR (Dakryozystorhinostomie) bei anhaltendem Verschluss', 'Bei Infekt zuerst Sanierung'],
        followUp: 'Nach DCR Kontrolle der Durchgängigkeit',
        source: null,
      ),
      const Condition(
        id: 'dermatochalasis',
        name: 'Dermatochalasis',
        description: 'Überschüssige, schlaffe Haut der Oberlider; oft kosmetisch oder funktionell störend (Sichtbehinderung).',
        symptoms: ['lid_drooping', 'swelling'],
        urgency: Urgency.low,
        treatment: ['Blepharoplastik bei funktioneller oder kosmetischer Indikation', 'Keine medikamentöse Therapie'],
        followUp: 'Nach OP Wundkontrolle',
        source: null,
      ),
      const Condition(
        id: 'blepharospasm',
        name: 'Blepharospasmus',
        description: 'Bilateraler, unwillkürlicher Lidschluss durch Überaktivität des M. orbicularis; idiopathisch oder sekundär.',
        symptoms: ['lid_drooping', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Botulinumtoxin-Injektion in den M. orbicularis (Goldstandard)', 'Bei Kontraindikation: medikamentös oder Operation'],
        followUp: 'Wiederholung Botox alle 2–4 Monate',
        source: null,
      ),
      const Condition(
        id: 'capillary_hemangioma',
        name: 'Kapilläres Hämangiom (Infantiles Hämangiom)',
        description: 'Häufigster gutartiger Tumor des Säuglingsalters (5% aller Säuglinge). Periokuläre IH sind Hochrisiko-Läsionen wegen Amblyopiegefahr.',
        symptoms: ['swelling', 'lid_drooping'],
        urgency: Urgency.medium,
        treatment: ['Propranolol 2-3 mg/kg/Tag (First-Line)', 'Topisches Timolol 0,5% bei kleinen IH', 'Intralesionale Steroide', 'Chirurgische Resektion bei Amblyopierisiko'],
        followUp: 'Ophthalmologische Evaluation bei allen periokulären IH; regelmäßige Kontrollen; Propranolol mind. 6 Monate',
        source: null,
        wikiContent: '''
## Definition

Das infantile Hämangiom (IH), auch kapilläres Hämangiom oder "Erdbeer-Hämangiom" genannt, ist der **häufigste gutartige Tumor des Säuglingsalters** mit einer Prävalenz von bis zu **5% aller Säuglinge**.¹ Es handelt sich um einen vaskulären Tumor, der typischerweise in den ersten Lebenswochen erscheint, eine Wachstumsphase durchläuft und anschließend spontan involviert.²

---

## Epidemiologie

- **Prävalenz:** Bis zu 5% aller Säuglinge¹
- **Geschlecht:** Häufiger bei **Mädchen**³
- **Risikofaktoren:** Frühgeburtlichkeit, niedriges Geburtsgewicht, kaukasische Abstammung³

---

## Pathogenese

Die Pathogenese ist nicht vollständig geklärt:³
- **Aberrante Reaktion pluripotenter Stammzellen** auf Stimuli wie Hypoxie
- Beteiligung des **Renin-Angiotensin-Systems**
- Vaskuläre Proliferation mit charakteristischem Wachstums- und Involutionsmuster

---

## Natürlicher Verlauf

Das IH zeigt einen **charakteristischen triphasischen Verlauf:**¹ ⁴

| Phase | Zeitraum | Charakteristika |
|---|---|---|
| **Proliferation** | 1–3 Monate (Max.), bis 5 Mo. | Schnelles Wachstum, rote Farbe |
| **Plateau** | 5–12 Monate | Wachstumsstopp |
| **Involution** | 1–4 Jahre (90% bis 4 J.) | Farbänderung rot → grau-weiß |

> **Wichtig:** Ca. **85–90%** der IH sind **selbstlimitierend** und benötigen keine Therapie.⁴

---

## Klassifikation

### Nach Tiefe³
- **Superfizielle IH:** Hellrot, erdbeerartig, oberflächlich
- **Tiefe IH:** Bläulich, subkutan, späterer Beginn
- **Gemischte IH:** Kombination aus oberflächlichen und tiefen Anteilen

---

## Periokuläre Hämangiome – Besondere Bedeutung

Periokuläre IH sind **Hochrisiko-Läsionen** aufgrund des Potenzials für **permanente Sehstörungen**.¹ ⁴

### Okuläre Komplikationen

| Komplikation | Häufigkeit | Mechanismus |
|---|---|---|
| **Astigmatismus** | 33–44% | Hornhautdeformation durch Tumordruck |
| **Amblyopie** | 3–10% | Deprivation, Refraktionsfehler, Strabismus |
| **Visuelle Obstruktion** | 29% | Mechanische Ptosis durch Tumorgewicht |
| **Ptosis** | 4% | Lidbelastung durch Tumormasse |
| **Strabismus** | 1% | Augenmuskelbeeinträchtigung |
| **Proptosis** | selten | Orbitale Ausdehnung |

### Risikofaktoren für okuläre Komplikationen⁹ ¹⁰
- **Durchmesser >1 cm** (stärkster Prädiktor, OR 14,13)⁹
- **Tiefe oder gemischte Komponente** (OR 3,4–3,8)⁶
- **Oberlidbeteiligung**⁹
- **Mediale Lokalisation**¹⁰

### PHACE-Syndrom – Okuläre Manifestationen¹ ⁴
- Mikrophthalmie, Optikusatrophie/-hypoplasie
- Kolobome, Katarakt, Strabismus, Exophthalmus

---

## Diagnostik

### Klinische Diagnose³
- Typisches Erscheinungsbild und Verlauf
- Anamnese (Auftreten in ersten Lebenswochen)

### Bildgebung
- **Hochfrequenz-Ultraschall:** Bei subkutanen Läsionen
- **MRT:** Bei Verdacht auf tiefe orbitale Beteiligung

### Ophthalmologische Untersuchung⁹ ¹⁰
- **Obligat bei allen periokulären IH**
- Refraktionsbestimmung (Skiaskopie)
- Amblyopie-Screening
- Motilitätsprüfung, Funduskopie

---

## Therapie

### Therapieoptionen

| Therapie | Indikation | Dosierung | Besonderheiten |
|---|---|---|---|
| **Orales Propranolol** | Therapie der Wahl | 2–3 mg/kg/Tag | Mind. 6–12 Monate |
| **Topisches Timolol** | Kleine, superfizielle IH | 0,5% Gel, 2x/Tag | 92% Besserung nach 6–9 Mo. |
| **Intralesionale Steroide** | Fokale, bulky IH | Triamcinolon ± Betamethason | Cave: Netzhautarterienembolie |
| **Chirurgische Resektion** | Amblyogene IH | Frühzeitig (3 Mo. optimal) | Astigmatismus: 2,76→0,80 D |
| **Laser (PDL)** | Superfizielle IH, Residuen | Nach Involution | Für Teleangiektasien |

### Propranolol – Therapie der Wahl¹
- **Dosis:** 2–3 mg/kg/Tag (aufgeteilt auf 2–3 Gaben)
- **Beginn:** Idealerweise vor 5 Wochen, spätestens mit 1 Monat bei Hochrisiko-IH
- **Dauer:** Mindestens 6 Monate, oft bis 12 Monate
- **Monitoring:** Herzfrequenz, Blutdruck, Blutzucker (initial)
- **Effektivität periokular:** 70,5% deutliche Besserung, 29,5% leichte Besserung¹³

> **Früher Therapiebeginn ist entscheidend:** Patienten ≤3 Monate zeigen in **96,3%** eine deutliche Besserung nach 4 Wochen, vs. nur 29,4% bei >3 Monate.¹³

### Intralesionale Kortikosteroide¹
- Triamcinolon ± Betamethason für fokale, bulky Läsionen
- **Cave bei Oberlid-IH:** Risiko der **zentralen Netzhautarterienembolie** bei hohem Injektionsdruck

---

## Empfehlungen für periokuläre IH

1. **Frühzeitige Überweisung** (idealerweise bis 1 Monat) an Spezialisten¹
2. **Ophthalmologische Evaluation** bei allen periokulären IH⁹ ¹⁰
3. **Prompte Therapieeinleitung** bei Risikofaktoren (>1 cm, tiefe Komponente, Oberlid)⁹
4. **Propranolol als First-Line-Therapie**¹³
5. **Regelmäßige ophthalmologische Kontrollen** während und nach Therapie
6. **Screening auf PHACE-Syndrom** bei großem segmentalem Gesichts-IH¹

---

## Prognose

- **85–90% selbstlimitierend** ohne Therapie⁴
- **Amblyopie-Rate** deutlich reduziert seit Propranolol-Ära⁶
- **Astigmatismus** signifikante Reduktion unter systemischer Therapie (40% → 18%)⁶
- **Residuen nach Involution:** Fibrös-fettige Gewebereste, Teleangiektasien, Hautatrophie möglich

---

## Referenzen

1. Krowchuk DP, et al. Clinical Practice Guideline for Management of Infantile Hemangiomas. [*Pediatrics.* 2019](https://doi.org/10.1542/peds.2018-3475)
2. Satterfield KR, et al. Current Treatment of Infantile Hemangiomas. [*Surv Ophthalmol.* 2019](https://doi.org/10.1016/j.survophthal.2019.02.005)
3. Rodríguez Bandera AI, et al. Infantile Hemangioma Part 1: Epidemiology, Pathogenesis, Clinical Presentation. [*J Am Acad Dermatol.* 2021](https://doi.org/10.1016/j.jaad.2021.08.019)
4. Léauté-Labrèze C, et al. Infantile Haemangioma. [*Lancet.* 2017](https://doi.org/10.1016/S0140-6736(16)00645-0)
5. Zhao J, et al. Periocular Infantile Hemangiomas: Characteristics, Ocular Sequelae, Outcomes. [*Pediatr Dermatol.* 2019](https://doi.org/10.1111/pde.13925)
6. Suh KY, et al. Infantile Hemangiomas With Minimal or Arrested Growth. [*Arch Dermatol.* 2010](https://doi.org/10.1001/archdermatol.2010.197)
7. Samuelov L, et al. Risk Factors for Ocular Complications in Periocular IH. [*Pediatr Dermatol.* 2018](https://doi.org/10.1111/pde.13525)
8. O TM, et al. Distribution and Clinical Characteristics of Periorbital IH. [*Facial Plast Surg Aesthet Med.* 2023](https://doi.org/10.1089/fpsam.2022.0099)
9. Sebaratnam DF, et al. Infantile Hemangioma Part 2: Management. [*J Am Acad Dermatol.* 2021](https://doi.org/10.1016/j.jaad.2021.08.020)
10. Arneja JS, et al. Resection of Amblyogenic Periocular Hemangiomas. [*Plast Reconstr Surg.* 2010](https://doi.org/10.1097/PRS.0b013e3181c49708)
11. Chen WL, et al. Comprehensive Management of IH Involving the Periorbital Region. [*Ann Plast Surg.* 2022](https://doi.org/10.1097/SAP.0000000000003272)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Infantiles Hämangiom** = häufigster gutartiger Tumor des Säuglingsalters (**5%** aller Säuglinge). Triphasisch: Proliferation → Plateau → Involution.

---

### Okuläre Komplikationen
| Komplikation | Häufigkeit |
|---|---|
| Astigmatismus | 33–44% |
| Visuelle Obstruktion | 29% |
| Amblyopie | 3–10% |

### Risikofaktoren
**>1 cm** (OR 14,13), tiefe Komponente, Oberlid, medial

---

### Therapie
- **First-Line:** Propranolol 2–3 mg/kg/Tag (≤3 Mo: 96,3% Besserung!)
- **Kleine IH:** Timolol 0,5% (92% Besserung)
- **85–90% selbstlimitierend** – keine Therapie nötig

> **Cave:** Periokuläre IH = Hochrisiko! **Frühzeitige Überweisung** (bis 1 Monat). Alle brauchen **ophthalmologische Evaluation**.
''',
      ),
      const Condition(
        id: 'benign_adnexal_tumors',
        name: 'Benigne Tumoren der Adnexe',
        description: 'Tumoren der Schweißdrüsen, Haarfollikel und Talgdrüsen – 67,8% aller okulären Adnextumoren sind benigne.',
        symptoms: ['swelling'],
        urgency: Urgency.low,
        treatment: ['Chirurgische Exzision (je nach Typ)', 'CO₂-Laser bei Syringomen', 'Mohs-Chirurgie bei Trichoepitheliomen'],
        followUp: 'Histologische Sicherung; bei Talgdrüsenadenom Muir-Torre-Syndrom ausschließen',
        source: null,
        wikiContent: '''
## Übersicht

Adnexale Tumoren des Augenlides umfassen eine Vielzahl von benignen Neoplasien, die von **Schweißdrüsen (ekkrin und apokrin), Haarfollikeln und Talgdrüsen** ausgehen.¹ Die meisten okulären Adnextumoren sind benigne Lidläsionen (67,8%), wobei Epidermoidzysten (36%), Hidrozystome (9,2%) und Talgdrüsenzysten (6,1%) am häufigsten sind.²

### Klassifikation

| Ursprung | Tumoren |
|---|---|
| **Schweißdrüsen (apokrin)** | Hidrozystom (Moll-Drüse), Hidradenoma papilliferum, Syringocystadenoma |
| **Schweißdrüsen (ekkrin)** | Ekkrines Hidrozystom (sehr selten am Lid), Syringom, Porom |
| **Haarfollikel** | Pilomatrixom, Trichoepitheliom, Trichoblastom |
| **Talgdrüsen** | Talgdrüsenadenom, Talgdrüsenhyperplasie |

---

## 1. Schweißdrüsentumoren

### Hidrozystom (Schweißdrüsenzyste)
- **Definition:** Benigne zystische Tumoren der Schweißdrüsen; am Lid fast ausschließlich **apokrinen Ursprungs** (Moll-Drüsen)³
- **Epidemiologie:** Zweithäufigster benigner Adnextumor des Lides (9,2%)²
- **Klinisches Bild:** Transluzente, bläulich-klare oder pigmentierte zystische Papeln; Lidrand und Kanthi; 1–5 mm
- Pigmentierte Varianten (13%) enthalten Lipofuszin-Pigmente (Chromhidrose)
- **Histologie:** Zyste mit doppelschichtigem kuboidalem Epithel; innere Schicht mit **apikaler Dekapitationssekretion** (apokrin); CK7+, GCDFP-15+³
- **Therapie:** Chirurgische Exzision; Punktion/Drainage hat hohe Rezidivrate¹

### Syringom
- **Definition:** Benigner Adnextumor mit Differenzierung zum ekkrinen Schweißdrüsengang
- **Epidemiologie:** Häufig bei adoleszenten Frauen; Prädilektion: Periorbitalregion (besonders Unterlider)
- **Klinisches Bild:** Multiple, kleine (1–3 mm), hautfarbene bis gelbliche Papeln; symmetrisch infraorbital
- **Histologie:** Charakteristische **"Kaulquappen"-förmige** (tadpole/comma-shaped) Strukturen; dilatierte ekkrine Gänge
- **Assoziationen:** Down-Syndrom (häufigste Assoziation)
- **Therapie:**
  - **CO₂-Laser (Multiple-Drilling-Methode):** Gute kosmetische Ergebnisse ohne Narben
  - **Intralesionale Elektrodesikkation:** Sicher, narbenfreie Methode
  - Herausforderung: Häufige Rezidive bei allen Modalitäten

### Pleomorphes Adenom (Chondroides Syringom)
- **Definition:** Seltener benigner gemischter Tumor der Schweißdrüsen
- **Klinisches Bild:** Langsam wachsende, gut umschriebene dermale Masse; am Lidrand aus Moll-Drüsen
- **Histologie:** Verzweigte duktale Strukturen; myxoides und sklerotisches Stroma; kann Knorpel enthalten
- **Therapie:** Vollständige chirurgische Exzision¹

---

## 2. Haarfollikeltumoren

### Pilomatrixom (Epithelioma calcificans Malherbe)
- **Definition:** Benigner Tumor mit Differenzierung zur Haarmatrixzelle⁷ ⁸
- **Epidemiologie:** Häufiger bei Kindern/Jugendlichen (69% in ersten 2 Dekaden); weibliche Prädominanz (62,5%); am Lid meist Oberlid (62,5%)⁷
- **Klinisches Bild:** Fester, subkutaner Knoten; oft bläulich-rötlich; kann steinhart sein (Verkalkung); **klinisch häufig fehldiagnostiziert** (nur 18,75–50% korrekt erkannt)⁷
- **Histologie:**
  - **Basophile Zellen:** Peripher, proliferativ
  - **Transitionalzellen:** Übergangszellen mit Apoptose
  - **Schattenzellen (Ghost Cells):** **Pathognomonisch**; eosinophile Zellen ohne Kern
  - Fremdkörper-Riesenzellen, Verkalkung, Ossifikation möglich
- **Pathogenese:** Mutation im β-Catenin-Gen (CTNNB1); Apoptose als Hauptmechanismus der Schattenzellbildung
- **Assoziationen:** Turner-Syndrom (Prävalenz 2,6% vs. 0,003%), Myotone Dystrophie, Gardner-Syndrom
- **Therapie:** Einfache chirurgische Exzision; keine Rezidive bei vollständiger Entfernung⁷ ⁸

### Trichoepitheliom
- **Definition:** Benigner Tumor mit Differenzierung zum Haarfollikel
- **Klinisches Bild:** Hautfarbene, runde Papel oder Plaque; Gesicht (Nasolabialfalte, periorbital); **klinisch oft mit Basalzellkarzinom verwechselt**
- **Histologie:** Basaloide Zellnester mit peripherer Palisadenstellung; Hornzysten; **kein Clefting** (im Gegensatz zum BCC); CK20-positive Merkel-Zellen
- **Desmoplastisches Trichoepitheliom (DTE):** Solitäre, ringförmige, zentral eingedrückte Papel; DD morpheiformes BCC
- **Therapie:**
  - **Mohs-Chirurgie:** Keine Rezidive (0%) bei 42 Monaten Nachbeobachtung
  - Standardexzision: 13,1% Rezidivrate
  - **Argon-Laser:** Erfolgreiche Behandlung multipler Trichoepitheliome

---

## 3. Talgdrüsentumoren

### Talgdrüsenadenom
- **Definition:** Benigner Tumor der Talgdrüsen
- **Klinisches Bild:** Gelbliche, lobulierte Papel oder Knoten; meist am Kopf
- **Histologie:** Gut umschriebene Lobuli aus reifen Sebozyten; zentrale lipidhaltige Zellen
- **Assoziationen:** **Muir-Torre-Syndrom** (mit viszeralen Malignomen assoziiert)
- **Therapie:** Chirurgische Exzision; bei Muir-Torre-Syndrom **Screening auf viszerale Malignome**¹

---

## Differenzialdiagnostik

| Läsion | Unterscheidungsmerkmale |
|---|---|
| **Hidrozystom vs. Epidermoidzyste** | Hidrozystom: transluzent, bläulich, am Lidrand |
| **Trichoepitheliom vs. BCC** | Trichoepitheliom: kein Clefting, CK20+ Merkel-Zellen |
| **DTE vs. morpheiformes BCC** | DTE: CD34+ Stroma, CK20+ Merkel-Zellen |
| **Pilomatrixom vs. Dermoidzyste** | Pilomatrixom: steinhart, Schattenzellen |

---

## Therapieübersicht

| Tumor | Therapie der Wahl | Alternativen |
|---|---|---|
| **Hidrozystom** | Chirurgische Exzision | Punktion (hohe Rezidivrate) |
| **Syringom** | CO₂-Laser (Multiple-Drilling) | Elektrodesikkation |
| **Pilomatrixom** | Einfache Exzision | – |
| **Trichoepitheliom** | Mohs-Chirurgie (0% Rezidiv) | Exzision, Argon-Laser |
| **Pleomorphes Adenom** | Vollständige Exzision | – |
| **Talgdrüsenadenom** | Exzision + Muir-Torre-Screening | – |

---

## Referenzen

1. Drozdowski R, et al. Adnexal Neoplasms of the Eye. [*Clin Dermatol.* 2024](https://doi.org/10.1016/j.clindermatol.2024.01.004)
2. Wang KY, et al. Population-Based Incidence of Ocular Adnexal Tumors. [*Ophthalmic Epidemiol.* 2025](https://doi.org/10.1080/09286586.2024.2379971)
3. Jakobiec FA, et al. Eyelid Eccrine and Apocrine Hidrocystomas (40 Lesions). [*Am J Ophthalmol.* 2011](https://doi.org/10.1016/j.ajo.2010.08.028)
4. Williams K, et al. Management of Multiple Syringomas: Systematic Review. [*J Am Acad Dermatol.* 2016](https://doi.org/10.1016/j.jaad.2015.12.006)
5. Park HJ, et al. Treatment of Syringomas by CO₂ Laser (Multiple-Drilling). [*Dermatol Surg.* 2007](https://doi.org/10.1111/j.1524-4725.2007.33065.x)
6. Palioura S, et al. Pleomorphic Adenoma of the Eyelid Margin. [*Surv Ophthalmol.* 2013](https://doi.org/10.1016/j.survophthal.2012.10.003)
7. Zloto O, et al. Periocular Pilomatrixoma: 16 Cases. [*Ophthal Plast Reconstr Surg.* 2015](https://doi.org/10.1097/IOP.0000000000000164)
8. Levy J, et al. Eyelid Pilomatrixoma: 16 Cases and Literature Review. [*Surv Ophthalmol.* 2008](https://doi.org/10.1016/j.survophthal.2008.06.007)
9. Votruba M, et al. Solitary Trichoepithelioma Versus BCC. [*Eye.* 1998](https://doi.org/10.1038/eye.1998.7)
10. Nanda R, et al. Desmoplastic Trichoepitheliom: Systematic Review. [*Dermatol Surg.* 2024](https://doi.org/10.1097/DSS.0000000000004194)
11. Handler MZ, et al. Pilomatricoma Prevalence in Turner Syndrome. [*JAMA Dermatol.* 2013](https://doi.org/10.1001/2013.jamadermatol.115)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Benigne Adnextumoren des Lides** – 67,8% aller okulären Adnextumoren. Ursprung: Schweißdrüsen, Haarfollikel, Talgdrüsen.

---

### Die wichtigsten Tumoren

| Tumor | Häufigkeit/Merkmal | Therapie |
|---|---|---|
| **Hidrozystom** | 9,2%, transluzent, bläulich | Exzision |
| **Syringom** | Adoleszente Frauen, "Kaulquappen"-Histologie | CO₂-Laser |
| **Pilomatrixom** | Kinder, steinhart, Schattenzellen | Exzision |
| **Trichoepitheliom** | DD Basalzellkarzinom! | Mohs (0% Rezidiv) |
| **Talgdrüsenadenom** | Muir-Torre-Syndrom? | Exzision + Screening |

> **Cave:** Trichoepitheliom wird klinisch oft mit **BCC verwechselt** – CK20+ Merkel-Zellen und fehlendes Clefting unterscheiden. Bei Talgdrüsenadenom immer an **Muir-Torre-Syndrom** denken!
''',
      ),
      const Condition(
        id: 'benign_pigmented_lesions',
        name: 'Benigne Pigmentierte Läsionen',
        description: 'Melanozytäre Nävi, Epheliden und Lentigines – ca. 20% aller benignen Lidtumoren.',
        symptoms: ['swelling'],
        urgency: Urgency.low,
        treatment: ['Exzision bei Malignitätsverdacht', 'Lasertherapie bei kosmetischer Indikation', 'UV-Schutz'],
        followUp: 'Regelmäßige Kontrolle; Abgrenzung zum Melanom beachten',
        source: null,
        wikiContent: '''
## Übersicht

Benigne pigmentierte Läsionen machen etwa **20% aller benignen Lidtumoren** aus und umfassen hauptsächlich melanozytäre Nävi, Epheliden und Lentigines.¹

---

## 1. Melanozytäre Nävi

### Allgemeine Übersicht
- **Häufigkeit:** Dritthäufigster benigner Lidtumor; intradermale Nävi am häufigsten (21,1%), gefolgt von Compound-Nävi (10,7%)¹ ² ³
- **Natürliche Entwicklung:** Junktionale Nävi → Compound-Nävi → Intradermale Nävi ("Abtropfen" der Nävuszellen in die Dermis)⁴
- **Therapie:** Chirurgische Exzision bei kosmetischer Indikation, funktioneller Beeinträchtigung oder Malignitätsverdacht; bei kleinen Läsionen auch Shave-Exzision⁶

---

### Junktionaler Nävus
- **Definition:** Melanozytäre Proliferation **ausschließlich an der dermoepidermalen Junktionszone**
- **Klinisches Bild:** Flache, scharf begrenzte, gleichmäßig pigmentierte Makulae; hellbraun bis dunkelbraun⁷ ⁸
- **Dermoskopie:** Regelmäßiges Pigmentnetzwerk, "Ringed pattern" in konfokaler Mikroskopie⁸
- **Lokalisation:** Häufiger an Handflächen, Fußsohlen; am Lid seltener als andere Nävustypen⁵
- Können im Laufe des Lebens zu Compound-Nävi "reifen"

> **Wichtig:** Flache, stark pigmentierte Läsionen erfordern sorgfältige Abgrenzung zum Melanom

---

### Compound-Nävus
- **Definition:** Melanozytäre Proliferation **sowohl an der Junktion als auch in der Dermis** – Übergangsstadium
- **Klinisches Bild:** Leicht erhabene, pigmentierte Papeln; flach bis kuppelförmig; 2–6 mm
- **Histologie:** Nester an Junktion und papillärer Dermis mit typischer **"Maturation"** (Reifung) in der Tiefe – wichtiges Benignitätskriterium⁹
- **Dermoskopie:** "Meshwork pattern", nestförmige Proliferation⁷ ⁸
- **Varianten:** Polypoide Compound-Nävi können atypische Merkmale zeigen (Asymmetrie 30%, Shouldering 47,5%)⁹

> **DD:** Kann die radiale Wachstumsphase eines Melanoms imitieren – Maturation und fehlende Atypie beachten

---

### Intradermaler Nävus
- **Definition:** Melanozytäre Proliferation **ausschließlich in der Dermis** – "Endstadium" der Nävusentwicklung
- **Klinisches Bild:** Erhabene, kuppelförmige oder papillomatöse Papeln; oft hautfarben; können behaart sein (Benignitätshinweis); 3–10 mm
- **Histologie:** Nester und Stränge in der Dermis mit deutlicher Maturation; keine Junktionsaktivität; kann neurale Differenzierung zeigen¹⁰ ¹¹

### Subtypen (Unna und Miescher)¹⁰

| Subtyp | Lokalisation | Merkmale |
|---|---|---|
| **Unna-Nävus** | Hals, Rumpf, Extremitäten (87%) | Papilläre Dermis, radiales Muster, papillomatös |
| **Miescher-Nävus** | **Gesicht (91%)** – häufigster am Lid | Keilförmig, kuppelförmig, hautfarben |

> **Besonderheit:** Bei 6,2% der intradermalen Nävi findet sich eine benigne atypische junktionale melanozytäre Hyperplasie – kann mit Melanoma in situ verwechselt werden¹¹

---

## 2. Epheliden (Sommersprossen)

### Klinische Merkmale
- **Definition:** Kleine (1–2 mm), hellbraune Makulae in sonnenexponierten Bereichen
- **Charakteristisch:** Dunkeln bei UV-Exposition nach und **verblassen im Winter** (pathognomonisch)¹²
- **Erstmanifestation:** Kindheit (ab 2–3 Jahren), besonders bei hellhäutigen Personen

### Pathophysiologie
- **Genetik:** MC1R-Genvarianten (60% populationsattributables Risiko)¹³
- **Histologie:** Normale/verminderte Melanozytenzahl, aber erhöhte Melaninproduktion pro Melanozyt; **keine Verlängerung der Reteleisten** (DD zu Lentigines)¹² ¹⁴

### Therapie (nur bei kosmetischem Wunsch)

| Therapie | Ergebnis |
|---|---|
| **Q-switched Nd:YAG (532 nm)** | 66,5–69,4% Reduktion (Goldstandard) |
| **Picosekunden-Laser (730/755 nm)** | ~69% Clearance pro Sitzung |
| **577-nm Gelblaser** | 88% signifikante Verbesserung |
| **IPL + RF + Epidermabrasion** | 67% exzellente Ergebnisse |
| **Kryotherapie** | Nur ~15% Clearance |

> **Sonnenschutz SPF 50+** essentiell zur Rezidivprävention. Bei dunkleren Hauttypen Picosekunden-Laser (730 nm) bevorzugen.

---

## 3. Lentigines (Altersflecken)

### Klinische Merkmale
- **Definition:** Flache, isolierte braun-schwarze Pigmentierungen (2–4 mm)
- Durch chronische Sonnenexposition induziert
- **Persistieren ganzjährig** (im Gegensatz zu Epheliden)¹² ¹³
- Auftreten typischerweise ab dem 40. Lebensjahr

### Histologie
- **Erhöhte Melanozytenzahl** an der dermoepidermalen Junktion
- **Verlängerung der Reteleisten** (DD-Merkmal zu Epheliden)¹⁴

### Genetische Syndrome mit multiplen Lentigines
- **LEOPARD-Syndrom:** Lentigines, EKG-Anomalien, okulärer Hypertelorismus, Pulmonalstenose (PTPN11-Mutation)
- **Peutz-Jeghers-Syndrom:** Periorale Lentigines, GI-Polypen, erhöhtes Karzinomrisiko (STK11-Mutation)
- **Carney-Komplex:** Lentigines, kardiale Myxome, endokrine Tumoren (PRKAR1A-Mutation)

### Therapie (nur bei kosmetischem Wunsch)

**Kombinationstherapien** zeigen die höchste Ansprechrate (65%), gefolgt von **Lasertherapien** (43%), topischen Retinoiden (21%), Kryotherapie (15%) und chemischen Peelings (6%).

| Therapie | Ergebnis |
|---|---|
| **Q-switched Nd:YAG (532 nm)** | 80% exzellente Ergebnisse |
| **Q-switched Ruby (694 nm)** | Signifikant besser als topische Therapie |
| **Picosekunden-Laser (730 nm)** | 74% Clearance-Score ≥3/4 |
| **577-nm Gelblaser** | 68% signifikante Verbesserung |
| **Mequinol 2% + Tretinoin 0,01%** | Signifikant besser als Vehikel |
| **Kryopeeling** | Überlegen gegenüber TCA-Peeling |

> **Vor Therapie:** Abgrenzung zur **Lentigo maligna** (Melanoma in situ) erforderlich – bei Verdacht histologische Sicherung!

---

## Referenzen

1. Deprez M, et al. Clinicopathological Features of Eyelid Skin Tumors (5504 Cases). [*Am J Dermatopathol.* 2009](https://doi.org/10.1097/DAD.0b013e3181961861)
2. Chi MJ, et al. Clinical Analysis of Benign Eyelid and Conjunctival Tumors. [*Ophthalmologica.* 2006](https://doi.org/10.1159/000089274)
3. Huang YY, et al. Benign and Malignant Eyelid Tumors (4521 Cases). [*Biomed Res Int.* 2015](https://doi.org/10.1155/2015/453091)
4. Brodell R, et al. Natural History of Melanocytic Nevi. [*Am Fam Physician.* 1988](https://pubmed.ncbi.nlm.nih.gov/3189396/)
5. Wang DG, et al. Clinicopathological Analysis of Acquired Melanocytic Nevi. [*Am J Dermatopathol.* 2020](https://doi.org/10.1097/DAD.0000000000001599)
6. Brown R, et al. Evaluation and Management of Benign Tumors of the Eye and Eyelid. [*Clin Dermatol.* 2024](https://doi.org/10.1016/j.clindermatol.2024.01.005)
7. Mikoshiba Y, et al. Melanocytic Lesions on Volar Skin Without Typical Dermoscopic Patterns. [*JAMA Dermatol.* 2019](https://doi.org/10.1001/jamadermatol.2018.5926)
8. Pellacani G, et al. In Vivo Morphologic Classification of Melanocytic Nevi. [*JEADV.* 2014](https://doi.org/10.1111/jdv.12181)
9. Mesbah Ardakani N, et al. Polypoid Compound Melanocytic Proliferations. [*Am J Dermatopathol.* 2019](https://doi.org/10.1097/DAD.0000000000001375)
10. Yus ES, et al. Unna's and Miescher's Nevi: Two Different Types. [*Am J Dermatopathol.* 2007](https://doi.org/10.1097/DAD.0b013e31803325b2)
11. Okamura JM, et al. Benign Atypical Junctional Melanocytic Hyperplasia in Intradermal Nevi. [*Mod Pathol.* 2000](https://doi.org/10.1038/modpathol.3880152)
12. Praetorius C, et al. Ephelides and Solar Lentigines. [*Pigment Cell Melanoma Res.* 2014](https://doi.org/10.1111/pcmr.12232)
13. Bastiaens M, et al. MC1R Gene Is the Major Freckle Gene. [*Hum Mol Genet.* 2001](https://doi.org/10.1093/hmg/10.16.1701)
14. Schievink WI, et al. Arterial Dissections with Lentiginosis. [*N Engl J Med.* 1995](https://doi.org/10.1056/NEJM199503023320905)
15. Mukovozov I, et al. Treatment of Lentigines: A Systematic Review. [*Dermatol Surg.* 2023](https://doi.org/10.1097/DSS.0000000000003630)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Benigne pigmentierte Lidläsionen** – ca. **20%** aller benignen Lidtumoren.

---

### Die drei Hauptentitäten

| Läsion | Merkmale | DD-Hinweis |
|---|---|---|
| **Melanozytäre Nävi** | Junktional → Compound → Intradermal | Maturation = Benignität |
| **Epheliden** | Verblassen im Winter | Keine Reteleisten-Verlängerung |
| **Lentigines** | Persistieren ganzjährig | Reteleisten verlängert |

---

### Therapie (kosmetisch)
- **Laser:** Q-switched Nd:YAG (532 nm) Goldstandard für Epheliden + Lentigines
- **Kombinationstherapie:** Höchste Ansprechrate (65%) bei Lentigines
- **Nävi:** Exzision bei DD Melanom oder Funktionsbeeinträchtigung

> **Cave:** Vor Therapie immer **Abgrenzung zum Melanom** (ABCDE-Kriterien, Dermoskopie). Lentigines von **Lentigo maligna** unterscheiden!
''',
      ),
      const Condition(
        id: 'benign_epidermal_tumors',
        name: 'Benigne Epidermale Veränderungen',
        description: 'Plattenepithelpapillom, seborrhoische Keratose und aktinische Keratose – benigne Tumoren machen ca. 84% aller Lidtumoren aus.',
        symptoms: ['swelling'],
        urgency: Urgency.low,
        treatment: ['Chirurgische Exzision', 'Kryotherapie', 'Kürettage', 'Bei aktinischer Keratose: 5-FU, Imiquimod, Tirbanibulin'],
        followUp: 'Aktinische Keratosen regelmäßig kontrollieren (Malignisierungsrisiko); UV-Schutz',
        source: null,
        wikiContent: '''
## Definition

**Benigne epidermale Tumoren des Lides** umfassen hauptsächlich Plattenepithelpapillome, seborrhoische Keratosen und aktinische Keratosen. Benigne Tumoren machen etwa **84% aller Lidtumoren** aus.¹

---

## 1. Plattenepithelpapillom (Squamous Cell Papilloma)

- **Häufigkeit:** Häufigster benigner Lidtumor mit **26%** aller Lidhauttumoren¹
- **Klinisches Bild:** Papilläre, oft gestielte Wucherungen mit warzenartiger Oberfläche; können einzeln oder multipel auftreten² ³
- **Lokalisation:** Typischerweise am Lidrand
- **Ätiologie:** Teilweise assoziiert mit HPV (insbesondere HPV-6, HPV-11), aber auch Hochrisiko-Genotypen wie HPV-16⁴ ⁵
- **Histologie:** Proliferation von Plattenepithel mit Hyperkeratose und Papillomatose
- **Rezidivrisiko:** Bei multiplen Läsionen **16,3%** nach durchschnittlich 4,5 Jahren⁶
- **Therapie:** Chirurgische Exzision oder Kryotherapie; Kryotherapie kann das Rezidivrisiko senken² ⁶

![Plattenepithelpapillom – Papilläre, gestielte Wucherung am Lidrand](asset:assets/images/papilloma.png)

---

## 2. Seborrhoische Keratose

- **Häufigkeit:** Zweithäufigster benigner Lidtumor mit **21%** aller Fälle¹
- **Alter:** Typisches Auftreten ab dem 30. Lebensjahr, Prävalenz steigt mit zunehmendem Alter
- **Klinisches Bild:** Scharf begrenzte, erhabene Läsionen mit **"aufgesetztem" Erscheinungsbild**; Makulae, Papeln oder Plaques⁷ ⁸
- **Farbe:** Variiert von hautfarben über hellbraun bis dunkelbraun oder schwarz
- **Dermoskopie:** Typische Merkmale sind Fissuren, komedonenähnliche Öffnungen und Milia-ähnliche Zysten (DD-Hilfe zum Melanom)⁹
- **Histologie:** Proliferation epidermaler Keratinozyten mit verschiedenen Subtypen

![Seborrhoische Keratose – Scharf begrenzte, erhabene Läsion mit typischem Erscheinungsbild](asset:assets/images/seborrheic_keratosis.png)

### Therapie
- Medizinisch nicht notwendig; bei kosmetischer Indikation:
- **Kürettage:** Höchste Clearance-Rate (**87,5%**)
- **Kryochirurgie**
- **Laserablation:** 532-nm-Laser (55% Clearance)
- **Topisches Wasserstoffperoxid**¹⁰

---

## 3. Aktinische Keratose

- **Dignität:** **Prämaligne Läsion** mit Potenzial zur malignen Transformation
- **Ätiologie:** Chronische UV-Exposition an sonnenexponierten Hautarealen¹¹ ¹²
- **Klinisches Bild:** Raue, schuppige, erythematöse oder rosafarbene Läsionen; tastbar rau¹³
- **Pathogenese:** UV-induzierte Mechanismen: oxidativer Stress, Immunsuppression, gestörte Apoptose, Mutagenese¹¹
- **Malignisierungsrisiko:** Progression zu invasivem Plattenepithelkarzinom ca. **0,6% pro Jahr**

### Therapie periokular
- **Exzision mit Histologie:** Von ophthalmoplastischen Chirurgen bevorzugt (62,6%)¹⁶
- **Kryotherapie**
- **Topisches 5-Fluorouracil**
- **Imiquimod**
- **Photodynamische Therapie**
- **Tirbanibulin-Salbe 1%:** Neuere Option, 5 Tage Anwendung¹⁷
- **Vorbehandlung:** Hyperkeratotische Läsionen mit Tazarotene, Kürettage oder Keratolytika

> **Prävention:** UV-Schutz wird von der American Academy of Dermatology stark empfohlen.

---

## Referenzen

1. Deprez M, et al. Clinicopathological Features of Eyelid Skin Tumors (5504 Cases). [*Am J Dermatopathol.* 2009](https://doi.org/10.1097/DAD.0b013e3181961861)
2. Brown R, et al. Evaluation and Management of Benign Tumors of the Eye and Eyelid. [*Clin Dermatol.* 2024](https://doi.org/10.1016/j.clindermatol.2024.01.005)
3. Pe'er J. Pathology of Eyelid Tumors. [*Indian J Ophthalmol.* 2016](https://doi.org/10.4103/0301-4738.181752)
4. Ramberg I, et al. HPV Related Neoplasia of the Ocular Adnexa. [*Viruses.* 2021](https://doi.org/10.3390/v13081522)
5. Moyer AB, et al. HPV-Driven Squamous Lesions: High-Risk Genotypes. [*Am J Dermatopathol.* 2018](https://doi.org/10.1097/DAD.0000000000001139)
6. Jian H, et al. Clinical Features and Prognosis of Ocular Papilloma (298 Cases). [*Graefes Arch Clin Exp Ophthalmol.* 2023](https://doi.org/10.1007/s00417-023-06035-y)
7. Shen-Wagner J, et al. Diagnosing Common Benign Skin Tumors. [*Am Fam Physician.* 2024](https://pubmed.ncbi.nlm.nih.gov/)
8. Barthelmann S, et al. Seborrheic Keratosis. [*JDDG.* 2023](https://doi.org/10.1111/ddg.14984)
9. Minagawa A. Dermoscopy-Pathology Relationship in Seborrheic Keratosis. [*J Dermatol.* 2017](https://doi.org/10.1111/1346-8138.13657)
10. Timmermann V, et al. Practical Approaches for Seborrheic Keratosis Treatment. [*Lasers Surg Med.* 2025](https://doi.org/10.1002/lsm.70042)
11. Wang Z, et al. Pathogenesis of Actinic Keratosis. [*Front Med.* 2024](https://doi.org/10.3389/fmed.2024.1330491)
12. de Oliveira ECV, et al. Actinic Keratosis – Review for Clinical Practice. [*Int J Dermatol.* 2019](https://doi.org/10.1111/ijd.14147)
13. Wehner MR. Keratinocyte Carcinoma. [*JAMA.* 2025](https://doi.org/10.1001/jama.2025.18749)
14. Siegel JA, et al. Current Perspective on Actinic Keratosis. [*Br J Dermatol.* 2017](https://doi.org/10.1111/bjd.14852)
15. Lagler CN, et al. Management of Periocular Actinic Keratosis. [*Ophthal Plast Reconstr Surg.* 2012](https://doi.org/10.1097/IOP.0b013e318257f5f2)
16. Blauvelt A, et al. Tirbanibulin Ointment for Actinic Keratosis (Phase 3). [*N Engl J Med.* 2021](https://doi.org/10.1056/NEJMoa2024040)
17. Eisen DB, et al. Guidelines for Management of Actinic Keratosis. [*J Am Acad Dermatol.* 2021](https://doi.org/10.1016/j.jaad.2021.05.056)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Benigne epidermale Lidtumoren** – machen **84%** aller Lidtumoren aus.

---

### Die drei Hauptentitäten

| Tumor | Häufigkeit | Therapie |
|---|---|---|
| **Papillom** | 26% (häufigster) | Exzision, Kryotherapie |
| **Seborrhoische Keratose** | 21% | Kürettage (87,5%), Kryo, Laser |
| **Aktinische Keratose** | prämaligne | Exzision + Histologie, 5-FU, Tirbanibulin |

---

### Wichtig
- Papillom: HPV-assoziiert, Rezidivrate **16,3%** bei multiplen Läsionen
- Seborrhoische Keratose: Typisch "aufgesetzt", DD Melanom per Dermoskopie
- **Aktinische Keratose: Malignisierungsrisiko 0,6%/Jahr** → behandeln!

> **UV-Schutz** ist die wichtigste Präventionsmaßnahme.
''',
      ),
      const Condition(
        id: 'xanthelasma',
        name: 'Xanthelasma Palpebrarum',
        description: 'Gelbliche, weiche Plaques am medialen Augenlidbereich – häufigste Form kutaner Xanthome. Unabhängiger kardiovaskulärer Risikofaktor.',
        symptoms: ['swelling'],
        urgency: Urgency.low,
        treatment: ['Chirurgische Exzision (Goldstandard)', 'Laser-Therapie (Er:YAG, Q-switched Nd:YAG)', 'TCA 70%', 'Lipidsenkende Therapie bei Dyslipidämie'],
        followUp: 'Lipidprofil bei allen Patienten; kardiovaskuläre Risikostratifizierung; Rezidivkontrolle',
        source: null,
        wikiContent: '''
## Definition

Xanthelasma palpebrarum (XP) sind **gelbliche, weiche Plaques**, die typischerweise am medialen Augenlidbereich auftreten und die **häufigste Form kutaner Xanthome** darstellen.¹ Die Prävalenz in der Allgemeinbevölkerung liegt bei **1,1–4,4%**.²

---

## Epidemiologie

- **Alter:** Typischerweise 40–60 Jahre, Durchschnittsalter ca. 45–50 Jahre³ ⁴
- **Geschlecht:** Häufiger bei **Frauen** (ca. 68–72%)³
- **Prävalenz:** 1,1–4,4% in der Allgemeinbevölkerung²

---

## Ätiologie und Pathogenese

Die Pathogenese ist multifaktoriell und umfasst Lipidstörungen sowie genetische Faktoren:² ¹

### Assoziierte Faktoren

| Faktor | Assoziation |
|---|---|
| **Erhöhtes Gesamtcholesterin** | Signifikant erhöht bei XP-Patienten |
| **Erhöhtes LDL-Cholesterin** | Kausal assoziiert (Mendelsche Randomisierung) |
| **Erniedrigtes HDL-Cholesterin** | Besonders HDL2-C erniedrigt |
| **Erhöhtes Apolipoprotein B** | Signifikant erhöht |
| **Apolipoprotein E4/E3-Phänotyp** | Höhere Prävalenz bei XP |
| **Entzündungsmediatoren** | CCL2, CCL11, CCL13, CXCL1 kausal assoziiert |

> **Wichtig:** Etwa **50% der Patienten mit Xanthelasma sind normolipidämisch**.¹

---

## Klinik

### Typische Befunde⁴
- **Gelbliche, weiche Plaques oder Papeln**
- Lokalisation: **Medialer Augenlidbereich** (innerer Kanthus)
- Meist **bilateral** und symmetrisch
- Oberlid häufiger als Unterlid
- Schmerzlos
- Langsam progredient

![Xanthelasma palpebrarum – Gelbliche Plaques am medialen Augenlidbereich](asset:assets/images/xanthelasma.png)

### Differenzialdiagnosen
- Langerhans-Zell-Histiozytose
- Diffuses normolipämisches Xanthom
- Juveniles Xanthogranulom
- Nekrobiotisches Xanthogranulom
- Erdheim-Chester-Erkrankung

---

## Kardiovaskuläres Risiko

Xanthelasma ist ein **unabhängiger Prädiktor für kardiovaskuläre Erkrankungen**:

### Copenhagen City Heart Study (n=12.745, 33 Jahre Follow-up)

| Outcome | Hazard Ratio (95% KI) |
|---|---|
| **Myokardinfarkt** | 1,48 (1,23–1,79) |
| **Ischämische Herzerkrankung** | 1,39 (1,20–1,60) |
| **Schwere Atherosklerose** | 1,69 (1,03–2,79) |
| **Tod** | 1,14 (1,04–1,26) |
| Ischämischer Schlaganfall | 0,94 (nicht signifikant) |

### Aktuelle Daten (2026, n=40.096)
- **Hyperlipidämie:** HR 1,38 (95% KI: 1,35–1,41)
- **Major Adverse Cardiovascular Events (MACE):** HR 1,26 (95% KI: 1,22–1,31)

> **Wichtig:** Arcus corneae allein ist **kein unabhängiger Prädiktor** für kardiovaskuläres Risiko.

---

## Diagnostik

### Klinische Diagnose
- Typisches Erscheinungsbild (gelbe Plaques am medialen Lid)
- Keine Biopsie erforderlich bei typischer Präsentation

### Empfohlene Laboruntersuchungen
- **Vollständiges Lipidprofil** (Gesamtcholesterin, LDL-C, HDL-C, Triglyzeride)
- Apolipoprotein A1 und B
- Nüchternglukose
- Kardiovaskuläre Risikostratifizierung

> **Empfehlung:** Alle Patienten mit Xanthelasma sollten ein **Lipidprofil** erhalten und auf kardiovaskuläre Risikofaktoren untersucht werden.

---

## Therapie

Die Behandlung ist primär **kosmetisch indiziert**:

### Therapieoptionen

| Therapie | Clearance-Rate | Rezidivrate |
|---|---|---|
| **Chirurgische Exzision** | 100% | 17,5% |
| **CO₂-Laser** | 93–100% | variabel |
| **Er:YAG-Laser** | 100% | 10,5% |
| **Q-switched Nd:YAG** | 93,2–100% | niedrig |
| **TCA 70%** | 22,2% (komplett) | höher |
| **Kryotherapie** | moderat | variabel |
| **Intradermales Heparin** | gut (Grad I–II) | niedrig |

### Therapieempfehlungen
1. **Chirurgische Exzision:** Goldstandard für lokalisierte Läsionen
2. **Laser-Therapie:** Er:YAG oder Q-switched Nd:YAG für gute kosmetische Ergebnisse
3. **TCA 70%:** Option für kleine, frühe Läsionen
4. **Intradermales Heparin:** Für frühe Grad I–II Läsionen

### Zusätzliche Maßnahmen
- **Lipidsenkende Therapie** bei Dyslipidämie
- Lebensstilmodifikation (Ernährung, Bewegung)
- Behandlung kardiovaskulärer Risikofaktoren

---

## Prognose

- **Rezidivrate:** 10,5–17,5% je nach Therapiemodalität
- **Kardiovaskuläres Risiko:** Erhöht, unabhängig von klassischen Risikofaktoren
- Multiple Läsionen haben höhere Rezidivrate als singuläre

---

## Referenzen

1. Bergman R. The Pathogenesis and Clinical Significance of Xanthelasma Palpebrarum. [*J Am Acad Dermatol.* 1994](https://doi.org/10.1016/s0190-9622(94)70023-0)
2. Hu W, et al. Genetic Insight Into Causes of Xanthelasma: A Mendelian Randomization Study. [*Front Immunol.* 2024](https://doi.org/10.3389/fimmu.2024.1347112)
3. Liu ZX, et al. Factors Influencing Xanthelasma in Chinese Patients. [*Medicine.* 2025](https://doi.org/10.1097/MD.0000000000043325)
4. Dey A, et al. Cardiovascular Profile of Xanthelasma Palpebrarum. [*Biomed Res Int.* 2013](https://doi.org/10.1155/2013/932863)
5. Chang HC, et al. Serum Lipids and Risk of Atherosclerosis in Xanthelasma. [*J Am Acad Dermatol.* 2020](https://doi.org/10.1016/j.jaad.2019.08.082)
6. Christoffersen M, et al. Xanthelasmata, Arcus Corneae, and Ischaemic Vascular Disease. [*BMJ.* 2011](https://doi.org/10.1136/bmj.d5497)
7. Bineshfar N, et al. Eyelid Xanthelasma and Cardiovascular Outcomes. [*Ophthal Plast Reconstr Surg.* 2026](https://doi.org/10.1097/IOP.0000000000003187)
8. Wang KY, et al. Relationship Between Xanthelasma and Hyperlipidemia. [*Ann Plast Surg.* 2018](https://doi.org/10.1097/SAP.0000000000001310)
9. Neinaa YME, et al. CO₂ Laser Versus Intradermal Heparin in Xanthelasma. [*Photodermatol Photoimmunol Photomed.* 2023](https://doi.org/10.1111/phpp.12915)
10. Kumar S, et al. Surgical Excision Versus TCA 70% in Xanthelasma. [*Clin Exp Dermatol.* 2026](https://doi.org/10.1093/ced/llag080)
11. Heng JK, et al. Q-Switched Nd:YAG Laser for Xanthelasma. [*J Am Acad Dermatol.* 2017](https://doi.org/10.1016/j.jaad.2017.03.041)
12. Park H, et al. Er:YAG Laser for Xanthelasma. [*Lasers Med Sci.* 2025](https://doi.org/10.1007/s10103-024-04273-y)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Xanthelasma palpebrarum** = gelbliche Plaques am medialen Lid. Häufigste kutane Xanthome (Prävalenz 1,1–4,4%). **50% sind normolipidämisch.**

---

### Kardiovaskuläres Risiko
- **Unabhängiger Prädiktor** für MI (HR 1,48), IHD (HR 1,39)
- MACE HR 1,26 – Lipidprofil bei **allen** Patienten!

---

### Therapie
| Therapie | Clearance | Rezidiv |
|---|---|---|
| Chirurgische Exzision | 100% | 17,5% |
| Er:YAG-Laser | 100% | 10,5% |
| Q-switched Nd:YAG | 93–100% | niedrig |

> **Cave:** Immer **Lipidprofil + kardiovaskuläre Risikostratifizierung** durchführen!
''',
      ),
      const Condition(
        id: 'basal_cell_carcinoma',
        name: 'Basaliom',
        description: 'Häufigster maligner Lidtumor; langsam wachsend, selten metastasierend, aber lokale Destruktion möglich.',
        symptoms: ['swelling', 'redness'],
        urgency: Urgency.medium,
        treatment: ['Chirurgische Exzision mit histologischer Kontrolle (R0)', 'Mohs-Chirurgie oder 3D-Histologie bei großen/rezidivierenden Läsionen', 'Rekonstruktion des Lids'],
        followUp: 'Langzeitnachsorge, Sonnenschutz',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'orbita',
    name: 'Orbita',
    icon: '🫀',
    description: 'Erkrankungen der Augenhöhle und orbitalen Strukturen',
    conditions: [
      const Condition(
        id: 'retrobulbar_hematoma',
        name: 'Retrobulbärhämatom',
        description: 'Blutung hinter dem Auge; kann den Sehnerv komprimieren und zu akutem Visusverlust führen. Notfall.',
        symptoms: ['vision_loss_sudden', 'pain', 'double_vision'],
        urgency: Urgency.high,
        treatment: ['Sofortige Bildgebung (CT)', 'Bei Drucksteigerung: Entlastung (Lateral Kantholyse, evtl. Drainage)', 'Monitoring von Visus und Druck'],
        followUp: 'Stationär bis stabile Situation',
        source: null,
      ),
      const Condition(
        id: 'orbitaphlegmone',
        name: 'Orbitaphlegmone',
        description: 'Schwere bakterielle Infektion des Orbitainhalts; oft Ausbreitung aus Nasennebenhöhlen. Lebens- und sehbedrohlich.',
        symptoms: ['swelling', 'pain', 'redness', 'double_vision', 'vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['Sofortige Hospitalisation', 'IV-Antibiotika breit', 'CT Orbita/Sinus', 'HNO-Konsil', 'Evtl. operative Entlastung'],
        followUp: 'Stationäre Überwachung',
        source: null,
      ),
      const Condition(
        id: 'blowout_fracture',
        name: 'Orbitaboden-Fraktur',
        description: 'Fraktur des Orbitabodens nach stumpfem Trauma; kann Einklemmung von Muskeln mit Doppelbildern und Enophthalmus verursachen.',
        symptoms: ['double_vision', 'swelling', 'pain'],
        urgency: Urgency.medium,
        treatment: ['Kühlung, keine Nase putzen', 'CT Orbita', 'Antibiotika bei Sinusbeteiligung', 'OP bei Einklemmung oder großem Defekt'],
        followUp: 'Kontrolle Motilität und Bulbusstellung',
        source: null,
      ),
      const Condition(
        id: 'cavernous_hemangioma',
        name: 'Kavernöses Hämangiom',
        description: 'Häufiger benigner Orbita-Tumor im Erwachsenenalter; langsam wachsend, gut abgrenzbar.',
        symptoms: ['vision_loss_gradual', 'double_vision', 'lid_drooping'],
        urgency: Urgency.medium,
        treatment: ['Bildgebung (MRT) zur Sicherung', 'Exstirpation bei Progression, Visusgefährdung oder Beschwerden', 'Beobachtung bei kleinen, asymptomatischen Befunden'],
        followUp: 'Verlaufskontrollen bildgebend',
        source: null,
      ),
      const Condition(
        id: 'capillary_hemangioma',
        name: 'Kapilläres Hämangiom',
        description: 'Benigner Gefäßtumor, typisch im Säuglingsalter; oft spontane Rückbildung in den ersten Lebensjahren.',
        symptoms: ['swelling', 'redness'],
        urgency: Urgency.low,
        treatment: ['Beobachtung bei kleinen Läsionen', 'Bei Amblyopiegefahr: Propranolol oder Steroide', 'Laser/OP in Ausnahmefällen'],
        followUp: 'Regelmäßige Kontrolle bis Rückbildung',
        source: null,
      ),
      const Condition(
        id: 'idiopathic_orbital_inflammation',
        name: 'Idiopathische entzündliche Orbitaerkrankung',
        description: 'Nicht-infektiöse Orbitaentzündung ohne systemische Grunderkrankung; Ausschlussdiagnose.',
        symptoms: ['pain', 'swelling', 'double_vision', 'redness'],
        urgency: Urgency.medium,
        treatment: ['Systemische Steroide', 'Biopsie bei atypischem Verlauf', 'Immunsuppressiva bei Steroidrefraktarität'],
        followUp: 'Engmaschig unter Therapie',
        source: null,
      ),
      const Condition(
        id: 'thyroid_eye_disease',
        name: 'Endokrine Orbitopathie (EO)',
        description: 'Autoimmun bedingte Beteiligung der Orbita bei Schilddrüsenerkrankung; Proptosis, Lidretraktion, Motilitätsstörungen.',
        symptoms: ['double_vision', 'swelling', 'redness', 'lid_drooping'],
        urgency: Urgency.medium,
        treatment: ['Einstellung der Schilddrüsenfunktion', 'Selen', 'Bei aktiver moderater/schwerer EO: Steroide, ggf. Immunsuppression', 'Orbitadekompression bei Optikuskompression oder starkem Exophthalmus'],
        followUp: 'Interdisziplinär mit Endokrinologie',
        source: null,
      ),
      const Condition(
        id: 'dacryoadenitis',
        name: 'Dakryoadenitis',
        description: 'Entzündung der Tränendrüse; akut bakteriell oder viral, chronisch z.B. bei Sarkoidose oder IOI.',
        symptoms: ['swelling', 'pain', 'redness'],
        urgency: Urgency.medium,
        treatment: ['Akut bakteriell: Antibiotika systemisch', 'Chronisch: Abklärung (Sarkoidose etc.), Steroide je nach Ursache'],
        followUp: 'Bis Abheilung bzw. stabile Einstellung',
        source: null,
      ),
      const Condition(
        id: 'carotid_cavernous_fistula',
        name: 'Carotis-Sinus-cavernosus-Fistel',
        description: 'Abnorme Verbindung zwischen Karotis und Sinus cavernosus; pulsierender Exophthalmus, Gefäßinjektion, oft Doppelbilder.',
        symptoms: ['double_vision', 'redness', 'swelling'],
        urgency: Urgency.high,
        treatment: ['Sofortige neuroradiologische Abklärung', 'Endovaskuläre Embolisation', 'Augendruck und Visus überwachen'],
        followUp: 'Nach Embolisation Kontrolle',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'conjunctiva',
    name: 'Bindehaut / External',
    icon: '🔴',
    description: 'Erkrankungen der Bindehaut und äusseren Augenstrukturen',
    conditions: [
      const Condition(
        id: 'bacterial_conjunctivitis',
        name: 'Bakterielle Konjunktivitis',
        description: 'Bakterielle Infektion der Bindehaut mit eitrigem Sekret.',
        symptoms: ['redness', 'discharge', 'foreign_body'],
        urgency: Urgency.medium,
        treatment: ['Antibiotische Augentropfen (z.B. Floxal 4x/d)', 'Augen nicht reiben', 'Händehygiene'],
        followUp: 'Kontrolle nach 3-5 Tagen wenn keine Besserung',
        source: null,
      ),
      const Condition(
        id: 'viral_conjunctivitis',
        name: 'Virale Konjunktivitis',
        description: 'Hochansteckende Virusinfektion (meist Adenoviren).',
        symptoms: ['redness', 'tearing', 'light_sensitivity'],
        urgency: Urgency.medium,
        treatment: ['Symptomatisch: Tränenersatz', 'Strikte Hygiene!', 'Keine Antibiotika nötig', 'Bei Pseudomembranen: abheben'],
        followUp: 'Kontrolle bei Visusminderung (Nummulli)',
        source: null,
      ),
      const Condition(
        id: 'allergic_conjunctivitis',
        name: 'Allergische Konjunktivitis',
        description: 'Allergische Reaktion der Bindehaut auf Pollen, Staub etc.',
        symptoms: ['itching', 'redness', 'tearing', 'swelling'],
        urgency: Urgency.low,
        treatment: ['Antihistaminika-Tropfen (z.B. Opatanol)', 'Mastzellstabilisatoren', 'Kühle Kompressen', 'Allergenkarenz'],
        followUp: 'Allergologische Abklärung bei rezidivierend',
        source: null,
      ),
      const Condition(
        id: 'episcleritis',
        name: 'Episkleritis',
        description: 'Oberflächliche Entzündung der Episklera, meist selbstlimitierend.',
        symptoms: ['redness', 'pain'],
        urgency: Urgency.low,
        treatment: ['Tränenersatz', 'NSAR-Tropfen (z.B. Voltaren Ophtha)', 'Selten systemische NSAR nötig'],
        followUp: 'Kontrolle nach 1-2 Wochen',
        source: null,
      ),
      const Condition(
        id: 'scleritis',
        name: 'Skleritis',
        description: 'Tiefe, schmerzhafte Entzündung der Sklera. Oft systemische Ursache!',
        symptoms: ['pain', 'redness', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Systemische NSAR oder Steroide', 'Rheumatologisches Workup!', 'Bei nekrotisierend: Immunsuppression'],
        followUp: 'Engmaschige Kontrollen, interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'pterygium',
        name: 'Pterygium',
        description: 'Bindegewebswucherung von Bindehaut auf Hornhaut.',
        symptoms: ['redness', 'foreign_body', 'blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Sonnenschutz', 'Tränenersatz', 'Bei Visusbeeinträchtigung: OP'],
        followUp: 'Jährliche Kontrolle',
        source: null,
      ),
      const Condition(
        id: 'hyposphagma',
        name: 'Hyposphagma',
        description: 'Subkonjunktivale Blutung, meist harmlos.',
        symptoms: ['redness'],
        urgency: Urgency.low,
        treatment: ['Keine Therapie nötig', 'Blutdruck kontrollieren', 'Resorbiert spontan in 2-3 Wochen'],
        followUp: 'Nur bei Rezidiv BD-Abklärung',
        source: null,
      ),
      const Condition(
        id: 'vernal_keratoconjunctivitis',
        name: 'Vernale Keratokonjunktivitis',
        description: 'Saisonal betonte allergische Entzündung von Bindehaut und Hornhaut, vor allem bei Kindern; oft große Papillen.',
        symptoms: ['itching', 'redness', 'tearing', 'light_sensitivity'],
        urgency: Urgency.medium,
        treatment: ['Mastzellstabilisatoren und Antihistaminika', 'Steroid-Tropfen kurzfristig bei Schub', 'Ciclosporin bei chronischem Verlauf', 'Allergenkarenz'],
        followUp: 'Regelmäßige Kontrolle wegen Hornhautbeteiligung',
        source: null,
      ),
      const Condition(
        id: 'stevens_johnson',
        name: 'Stevens-Johnson-Syndrom / Toxische epidermale Nekrolyse',
        description: 'Schwere Haut- und Schleimhautreaktion, oft medikamenteninduziert; Augenbeteiligung mit Vernarbung und trockenem Auge.',
        symptoms: ['redness', 'pain', 'dry_eyes', 'light_sensitivity'],
        urgency: Urgency.high,
        treatment: ['Sofort Absetzen des auslösenden Medikaments', 'Intensivmedizinische Betreuung', 'Augen: Tränenersatz, Steroide, Kontaktlinsen; Langfristig Symblepharon-Prophylaxe'],
        followUp: 'Langfristige augenärztliche Nachsorge',
        source: null,
      ),
      const Condition(
        id: 'conjunctival_pigmentation',
        name: 'Pigmentierte Bindehautveränderungen',
        description: 'Braune oder schwarze Verfärbungen der Bindehaut; Differenzierung zwischen Naevus, Melanose und Melanom nötig.',
        symptoms: ['redness'],
        urgency: Urgency.low,
        treatment: ['Dokumentation und Verlaufskontrolle', 'Bei Wachstum oder atypischem Befund: Exzision mit Histologie'],
        followUp: 'Regelmäßige Kontrolle bei Verdacht auf Melanom',
        source: null,
      ),
      const Condition(
        id: 'phlyctenulosis',
        name: 'Phlyktänulose',
        description: 'Immunologische Reaktion der Bindehaut/Hornhaut auf bakterielle Antigene (z.B. Tuberkulose); typische knötchenförmige Läsionen.',
        symptoms: ['redness', 'light_sensitivity', 'foreign_body'],
        urgency: Urgency.medium,
        treatment: ['Steroid-Tropfen kurzfristig', 'Abklärung Tuberkulose (Mantoux, Röntgen)', 'Behandlung der Grunderkrankung'],
        followUp: 'Bis Abheilung und Ausschluss TBC',
        source: null,
      ),
      const Condition(
        id: 'parinaud_oculoglandular',
        name: 'Okuloglanduläres Parinaud-Syndrom',
        description: 'Einseitige follikuläre Konjunktivitis mit regionaler Lymphknotenschwellung; oft Bartonella oder andere Erreger.',
        symptoms: ['redness', 'swelling', 'discharge'],
        urgency: Urgency.medium,
        treatment: ['Antibiotika (z.B. Doxycyclin, Azithromycin) je nach Erreger', 'Lokale Therapie unterstützend'],
        followUp: 'Bis Abheilung',
        source: null,
      ),
      const Condition(
        id: 'ocular_mucous_membrane_pemphigoid',
        name: 'Okulär vernarbendes Schleimhautpemphigoid',
        description: 'Chronische Autoimmunerkrankung mit Vernarbung von Bindehaut und Schleimhäuten; kann zu Symblepharon und trockenem Auge führen.',
        symptoms: ['redness', 'dry_eyes', 'foreign_body'],
        urgency: Urgency.high,
        treatment: ['Systemische Immunsuppression (Dapson, Mycophenolat, etc.)', 'Lokale Steroide und Tränenersatz', 'Chirurgie nur bei Komplikationen mit Vorsicht'],
        followUp: 'Engmaschig, interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'herpes_simplex_conjunctivitis',
        name: 'Herpes-simplex-Konjunktivitis',
        description: 'Virusbedingte Bindehautentzündung durch HSV; oft mit typischen Bläschen am Lidrand oder Hornhautbeteiligung.',
        symptoms: ['redness', 'tearing', 'light_sensitivity'],
        urgency: Urgency.medium,
        treatment: ['Aciclovir lokal und/oder systemisch', 'Keine Steroide ohne gesicherte Diagnose', 'Abklärung Hornhautbeteiligung'],
        followUp: 'Kontrolle bis Abheilung',
        source: null,
      ),
      const Condition(
        id: 'conjunctival_laceration',
        name: 'Bindehaut-Lazeration',
        description: 'Riss der Bindehaut durch Trauma; Ausschluss von Perforation und Fremdkörper nötig.',
        symptoms: ['redness', 'pain'],
        urgency: Urgency.medium,
        treatment: ['Spaltlampe: Perforation und Sklerabeteiligung ausschließen', 'Kleine Läsionen: konservativ oder Naht', 'Antibiotische Salbe', 'Tetanus prüfen'],
        followUp: 'Wundkontrolle',
        source: null,
      ),
      const Condition(
        id: 'atopic_keratoconjunctivitis',
        name: 'Atopische Keratokonjunktivitis',
        description: 'Chronische allergische Entzündung bei Atopie; Bindehaut und Hornhaut, oft mit Lidekzem.',
        symptoms: ['itching', 'redness', 'dry_eyes', 'burning'],
        urgency: Urgency.medium,
        treatment: ['Antihistaminika und Mastzellstabilisatoren', 'Steroid-Tropfen kurzfristig', 'Ciclosporin langfristig', 'Lidhygiene und Basispflege'],
        followUp: 'Regelmäßige Kontrolle wegen Hornhautkomplikationen',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'cornea',
    name: 'Hornhaut',
    icon: '💎',
    description: 'Erkrankungen der Hornhaut',
    conditions: [
      const Condition(
        id: 'corneal_erosion',
        name: 'Erosio corneae',
        description: 'Oberflächlicher Hornhautdefekt, sehr schmerzhaft.',
        symptoms: ['pain', 'tearing', 'light_sensitivity', 'foreign_body'],
        urgency: Urgency.medium,
        treatment: ['Antibiotische Salbe (z.B. Floxal)', 'Zykloplegikum bei starken Schmerzen', 'Verband nicht nötig', 'Kontrolle nach 24h'],
        followUp: 'Nach 24-48h sollte Epithel geschlossen sein',
        source: null,
      ),
      const Condition(
        id: 'dry_eye',
        name: 'Keratokonjunktivitis sicca (KCS)',
        description: 'Das trockene Auge: multifaktorielle Erkrankung der Augenoberfläche mit Störung des Tränenfilms (wässriger Mangel z.B. Sjögren, evaporativ z.B. MGD).',
        symptoms: ['dry_eyes', 'burning', 'foreign_body', 'tearing', 'blurred_vision', 'sand_sensation', 'sticky_secretion'],
        urgency: Urgency.low,
        treatment: [
          'Patientenberatung: Vermeidung von Umweltfaktoren, Blinzeltraining bei Bildschirmarbeit',
          'Tränenersatzmittel: Hypromellose (leicht), Carbomere/Hyaluronsäure (mittel-schwer)',
          'Konservierungsmittelfreie Präparate bevorzugen',
          'Lidhygiene und warme Kompressen',
          'Bei Entzündung: Ciclosporin-Tropfen 0.05-0.1%',
          'Bei schwerem Verlauf: Tränenpünktchenverschluss (Punctum Plugs)',
          'Omega-3-Fettsäuren zur Unterstützung',
        ],
        followUp: 'Kontrolle nach 4-8 Wochen, bei Komplikationen früher',
        diagnostics: ['Tränenfilmaufreißzeit (BUT) < 10 Sek. pathologisch', 'Schirmer-Test: < 10mm ohne Anästhesie pathologisch', 'Anfärbung mit Fluoreszein und Bengalrosa', 'Beurteilung des Tränenmeniskus'],
        complications: ['Hornhautfilamente und muköse Plaques', 'Punktförmige Epithelerosionen', 'Periphere Hornhautvaskularisation', 'In schweren Fällen: Hornhauteinschmelzung, Perforation'],
      ),
      const Condition(
        id: 'keratoconus',
        name: 'Keratokonus',
        description: 'Progressive Hornhautverdünnung und -vorwölbung.',
        symptoms: ['blurred_vision', 'light_sensitivity'],
        urgency: Urgency.medium,
        treatment: ['Harte Kontaktlinsen', 'Crosslinking bei Progression', 'Später evtl. Keratoplastik'],
        followUp: 'Alle 6-12 Monate Topographie',
        source: null,
      ),
      const Condition(
        id: 'chemical_burn',
        name: 'Verätzung',
        description: 'Chemische Verletzung der Augenoberfläche. NOTFALL!',
        symptoms: ['pain', 'redness', 'blurred_vision', 'tearing'],
        urgency: Urgency.high,
        treatment: ['SOFORT spülen 30+ Min.!', 'pH kontrollieren (Ziel: 7)', 'Zykloplegie', 'Antibiotika + Steroide', 'Vitamin C'],
        followUp: 'Tägliche Kontrollen initial',
        source: null,
      ),
      const Condition(
        id: 'fungal_keratitis',
        name: 'Pilz-Keratitis',
        description: 'Pilzinfektion der Hornhaut; typisch nach Trauma mit pflanzlichem Material oder bei Kontaktlinsen.',
        symptoms: ['pain', 'redness', 'blurred_vision', 'light_sensitivity'],
        urgency: Urgency.high,
        treatment: ['Abstrich und Antimykotika (lokal und ggf. systemisch)', 'Natamycin oder Amphotericin B', 'Evtl. therapeutische Keratoplastik'],
        followUp: 'Engmaschig bis Abheilung',
        source: null,
      ),
      const Condition(
        id: 'peripheral_ulcerative_keratitis',
        name: 'Periphere Hornhautulzerationen',
        description: 'Ulzerationen am Hornhautrand; oft bei rheumatologischen Erkrankungen (z.B. rheumatoide Arthritis).',
        symptoms: ['pain', 'redness', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Systemische Immunsuppression', 'Rheumatologische Abklärung', 'Lokale Steroide und Zykloplegie', 'Bei Perforation: Notfall-Keratoplastik'],
        followUp: 'Interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'neurotrophic_keratopathy',
        name: 'Neurotrophe Keratopathie',
        description: 'Hornhautschäden durch verminderte Sensibilität (z.B. nach Herpes, Diabetes, OP); Epitheldefekte bis Ulkus.',
        symptoms: ['blurred_vision', 'redness'],
        urgency: Urgency.high,
        treatment: ['Tränenersatz und Salben', 'Verbandskontaktlinse', 'Cenegermin-Tropfen', 'Tarsorraphie bei Persistenz', 'Ursache behandeln'],
        followUp: 'Sehr engmaschig wegen Perforationsrisiko',
        source: null,
      ),
      const Condition(
        id: 'marginal_keratitis',
        name: 'Marginale Keratitis',
        description: 'Sterile Infiltrate am Hornhautrand; oft assoziiert mit Blepharitis oder Staphylokokken-Überempfindlichkeit.',
        symptoms: ['redness', 'foreign_body', 'light_sensitivity'],
        urgency: Urgency.low,
        treatment: ['Lidhygiene', 'Steroid-Tropfen kurzfristig', 'Keine Antibiotika nötig (steril)'],
        followUp: 'Bis Abheilung',
        source: null,
      ),
      const Condition(
        id: 'corneal_foreign_body',
        name: 'Kornealer Fremdkörper',
        description: 'Fremdkörper auf oder in der Hornhaut; Entfernung und Beurteilung von Erosio nötig.',
        symptoms: ['pain', 'foreign_body', 'tearing', 'light_sensitivity'],
        urgency: Urgency.medium,
        treatment: ['Entfernung unter Spaltlampe (Nadel oder Spatel)', 'Antibiotische Salbe', 'Zykloplegie bei tieferem Defekt', 'Erosio wie Erosio corneae behandeln'],
        followUp: 'Nach 24 h Kontrolle',
        source: null,
      ),
      const Condition(
        id: 'contact_lens_keratitis',
        name: 'Kontaktlinsen-assoziierte Keratitis',
        description: 'Infektiöse oder hypoxische Hornhautschäden durch Kontaktlinsentragen; bakterielle Keratitis ist Notfall.',
        symptoms: ['pain', 'redness', 'blurred_vision', 'light_sensitivity'],
        urgency: Urgency.high,
        treatment: ['Linsen sofort entfernen', 'Abstrich', 'Breitband-Antibiotika lokal (ggf. Forte)', 'Bei Verdacht Akanthamöben: spezifische Therapie'],
        followUp: 'Täglich bis Besserung',
        source: null,
      ),
      const Condition(
        id: 'photoelectric_keratitis',
        name: 'Keratitis photoelectrica',
        description: 'Oberflächliche Hornhautschädigung durch UV-Licht (z.B. Schweißen, Höhensonne); schmerzhaft nach Latenz.',
        symptoms: ['pain', 'light_sensitivity', 'tearing', 'foreign_body'],
        urgency: Urgency.medium,
        treatment: ['Zykloplegie', 'Antibiotische Salbe', 'Schmerzmittel', 'Spontanheilung in 24–48 h'],
        followUp: 'Kontrolle nach 24 h',
        source: null,
      ),
      const Condition(
        id: 'herpes_simplex_keratitis',
        name: 'Herpes-simplex-Keratitis',
        description: 'Virusbedingte Hornhautentzündung durch HSV; dendritische oder geographische Ulzera, Stromabeteiligung möglich.',
        symptoms: ['pain', 'redness', 'blurred_vision', 'light_sensitivity'],
        urgency: Urgency.high,
        treatment: ['Aciclovir lokal und systemisch', 'Zykloplegie', 'Keine Steroide bei Epitheldefekt', 'Bei Stroma: Steroide erst nach Epithelschluss plus Virustatikum'],
        followUp: 'Engmaschig bis Abheilung',
        source: null,
      ),
      const Condition(
        id: 'herpes_zoster_ophthalmicus',
        name: 'Herpes zoster ophthalmicus',
        description: 'Reaktivierung von VZV im Bereich des N. ophthalmicus; Hautbläschen und mögliche Beteiligung von Hornhaut, Uvea und Sehnerv.',
        symptoms: ['pain', 'redness', 'blurred_vision', 'light_sensitivity'],
        urgency: Urgency.high,
        treatment: ['Systemisches Aciclovir/Valaciclovir früh', 'Lokale Virustatika und Steroide je nach Befund', 'Schmerztherapie', 'Augenkontrolle'],
        followUp: 'Bis Abheilung und Ausschluss Uveitis/Keratitis',
        source: null,
      ),
      const Condition(
        id: 'bacterial_keratitis',
        name: 'Bakterielle Keratitis',
        description: 'Bakterielle Infektion der Hornhaut mit Infiltrat und Ulkus; rasche Therapie nötig wegen Narben und Perforation.',
        symptoms: ['pain', 'redness', 'blurred_vision', 'light_sensitivity'],
        urgency: Urgency.high,
        treatment: ['Abstrich', 'Breitband-Antibiotika Tropfen dicht (z.B. Forte-Stündlich)', 'Zykloplegie', 'Bei schwerem Verlauf: Intensivtherapie oder stationär'],
        followUp: 'Täglich bis Besserung',
        source: null,
      ),
      const Condition(
        id: 'acanthamoeba_keratitis',
        name: 'Akanthamöben-Keratitis',
        description: 'Parasitäre Hornhautinfektion; typisch bei weichen Kontaktlinsen und Wasser Exposition. Sehr schmerzhaft, ringförmiges Infiltrat.',
        symptoms: ['pain', 'redness', 'blurred_vision', 'light_sensitivity'],
        urgency: Urgency.high,
        treatment: ['Kontaktlinsen absetzen', 'PHMB oder Hexamidin plus Diamidin', 'Lange Therapiedauer', 'Evtl. Keratoplastik'],
        followUp: 'Sehr engmaschig',
        source: null,
      ),
      const Condition(
        id: 'filamentary_keratitis',
        name: 'Filamentöse Keratitis',
        description: 'Chronisch-rezidivierende Hornhauterkrankung mit adhärenten fadenförmigen Strukturen aus Epithel, Mukus und Zelldetritus.',
        symptoms: ['foreign_body', 'dry_eyes', 'pain', 'tearing', 'light_sensitivity'],
        urgency: Urgency.low,
        treatment: ['Mechanische Filamententfernung', 'Konservierungsmittelfreie künstliche Tränen', 'N-Acetylcystein 2-10%', 'Hypertone NaCl 5%'],
        followUp: 'Regelmäßig; chronisch-rezidivierender Verlauf; Grunderkrankung behandeln',
        source: null,
        wikiContent: '''
## Definition

Die filamentöse Keratitis (FK) ist eine **chronisch-rezidivierende Hornhauterkrankung**, die durch das Vorhandensein von fadenförmigen Strukturen (Filamenten) auf der Hornhautoberfläche charakterisiert ist.¹ Diese Filamente bestehen aus **Epithel, Mukus und Zelldetritus** und sind an der Hornhaut adhärent.¹

---

## Epidemiologie

- Durchschnittsalter: **56,9 Jahre**²
- **Häufiger bei Frauen** und älteren Personen³
- Kann uni- oder bilateral auftreten (abhängig von der Grunderkrankung)³

---

## Ätiologie und assoziierte Erkrankungen

Die FK ist mit einer Vielzahl von okulären und systemischen Erkrankungen assoziiert:¹ ² ³

### Häufigste Ursachen²

| Ursache | Häufigkeit | Remissionsrate |
|---|---|---|
| **Hirnläsionen** (Schlaganfall, Tumor) | 36,2% | 33,3% (niedrigste) |
| **Trockenes Auge** (KCS) | 30,2% | >60% |
| **Autoimmunerkrankungen** (Sjögren) | 24,1% | >60% |
| Augenoperationen/-verletzungen | variabel | >60% |

### Weitere assoziierte Erkrankungen³
- Superior limbic keratoconjunctivitis (SLK)
- Virale Keratokonjunktivitis
- Prolongiertes Augenpatching nach Operationen
- Penetrierende Keratoplastik
- Ptosis
- Rezidivierende Hornhauterosion
- Neurotrophe Keratitis
- Bullöse Keratopathie
- Blepharospasmus

---

## Pathogenese

Die genaue Pathogenese ist noch nicht vollständig geklärt, jedoch spielen folgende Faktoren eine Rolle:¹ ³

### Austrocknung (Desiccation)
- Tränenfilminstabilität
- Epithelschädigung durch Hyperosmolarität

### Mechanische Lidkräfte (Blink-Mikrotrauma)³
- Lidschlag traumatisiert die Augenoberfläche
- Bei Ptosis: Konstanter Kontakt zwischen Lidrand und superiorer Hornhaut
- Bei SLK: Redundante Bindehaut verursacht Reibung
- Bei KCS: Horizontale Bindehautfalten entlang der Lidränder

### Entzündungsmediatoren
- Chronische Entzündung der Augenoberfläche
- Konjunktivale Plattenepithelmetaplasie
- Becherzellverlust

> **Teufelskreis:** Reibung → Epithelschädigung → Filamentbildung → weitere Irritation → verstärkte Reibung

---

## Klinik

### Symptome¹ ³
- **Fremdkörpergefühl** (Leitsymptom)
- Chronische Augenschmerzen
- Irritation/Brennen
- Tränenfluss
- Muköser Ausfluss
- Photophobie
- Blepharospasmus

### Klinische Befunde¹ ⁵
- **Filamente auf der Hornhautoberfläche:** Fadenförmige, an der Hornhaut adhärente Strukturen
- Filamente bestehen aus Epithel, Mukus und Zelldetritus
- Positive Fluorescein-Anfärbung der Filamente
- Punktförmige Epitheldefekte
- Konjunktivale Injektion

![Filamentöse Keratitis – Hornhautfilamente in der Spaltlampenuntersuchung](asset:assets/images/filamentary_keratitis.png)

---

## Diagnostik

Die Diagnose ist **klinisch** und basiert auf:

- **Spaltlampenuntersuchung:** Nachweis der charakteristischen Filamente
- **Fluorescein-Färbung:** Anfärbung der Filamente und Epitheldefekte
- **Anamnese:** Identifikation der Grunderkrankung

> **Wichtig:** Suche nach der zugrunde liegenden Ursache (Trockenes Auge, Autoimmunerkrankung, neurologische Erkrankung)

---

## Therapie

Die Behandlung erfordert einen **stufenweisen Ansatz** mit Behandlung der Grunderkrankung und spezifischer Filamenttherapie:¹ ⁴ ³

### Stufe 1 – Basistherapie
- **Mechanische Filamententfernung:** Mit Juwelier-Pinzette oder Zelluloseacetat-Filter³
- **Konservierungsmittelfreie künstliche Tränen:** Intensive Lubrikation¹
- **Behandlung der Grunderkrankung** (z.B. Trockenes Auge)

### Stufe 2 – Medikamentöse Therapie

| Therapie | Wirkmechanismus | Anwendung |
|---|---|---|
| **Hypertone NaCl (5%)** | Entzieht Flüssigkeit, fördert Epitheladhäsion | Mehrmals täglich |
| **N-Acetylcystein (2–10%)** | Mukolytikum, löst Filamente auf | 4x täglich |
| **Topische Kortikosteroide** | Antiinflammatorisch | Kurzzeitig |
| **Topische NSAIDs** (Diclofenac 0,1%) | Antiinflammatorisch | Schnellere Besserung |
| **Ciclosporin A** | Immunmodulation | Bei chronischen Fällen |

### Stufe 3 – Erweiterte Therapie
- **Punctum Plugs:** Verbesserung der Tränenretention¹ ⁴
- **Bandage-Kontaktlinsen:** Schutz vor mechanischem Trauma¹ ³
- **Autologe Serumaugentropfen (20%):** Bei refraktären Fällen effektiv⁶

### Stufe 4 – Refraktäre Fälle
- **Botulinumtoxin A (Onabotulinumtoxin A):**³
  - Injektion in den M. orbicularis oculi
  - Reduziert Lidschlagfrequenz und -kraft
  - Vermindert mechanisches Trauma
  - Effektiv bei Blepharospasmus, SLK, schwerer KCS
  - Wiederholung oft erforderlich (>50% benötigen Serieninjektionen)
- **Ptosis-Chirurgie:** Bei Ptosis-assoziierter FK³
- **Boston Ocular Surface Prosthesis:** Sklerallinse mit Flüssigkeitsreservoir³

---

## Therapie nach Grunderkrankung

| Grunderkrankung | Empfohlene Therapie | Prognose |
|---|---|---|
| **Trockenes Auge** | Lubrikation, Punctum Plugs, Antiinflammatorisch | Gut (>60% Remission) |
| **Autoimmunerkrankung** | Systemische Therapie + lokale Behandlung | Gut (>60% Remission) |
| **Hirnläsion** | Intensive lokale Therapie, Botulinumtoxin | Schlecht (33% Remission) |
| **Postoperativ** | Lubrikation, Bandage-KL | Gut |

---

## Prognose

- **Chronisch-rezidivierender Verlauf** häufig¹ ⁵
- Remissionsraten abhängig von der Grunderkrankung²
- **Hirnläsionen:** 6,6-fach höheres Therapieversagen im Vergleich zu anderen Ursachen²
- Prolongierte Therapie oft notwendig zur Rezidivprophylaxe¹

---

## Prophylaxe

- **Präoperative Optimierung** der Augenoberfläche bei Risikopatienten⁴
- Vermeidung von konservierten Augentropfen
- Regelmäßige Lubrikation bei Trockenem Auge
- Behandlung von Lidfehlstellungen

---

## Referenzen

1. Weiss M, et al. A Review of Filamentary Keratitis. [*Surv Ophthalmol.* 2022](https://doi.org/10.1016/j.survophthal.2021.04.002)
2. Lee SM, et al. Clinical Manifestation and Risk Factors in Filamentary Keratitis. [*Am J Ophthalmol.* 2020](https://doi.org/10.1016/j.ajo.2020.05.037)
3. Gumus K, et al. Botulinum Toxin for Refractory Filamentary Keratitis. [*Arch Ophthalmol.* 2012](https://doi.org/10.1001/archophthalmol.2011.2713)
4. Albietz J, et al. Management of FK Associated With Aqueous-Deficient Dry Eye. [*Optom Vis Sci.* 2003](https://doi.org/10.1097/00006324-200306000-00007)
5. Crist AJ. Management of Refractory FK With N-Acetylcysteine. [*Optom Vis Sci.* 2021](https://doi.org/10.1097/OPX.0000000000001701)
6. Read SP, et al. Treatment of Refractory FK With Autologous Serum Tears. [*Eye Contact Lens.* 2017](https://doi.org/10.1097/ICL.0000000000000217)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Filamentöse Keratitis** = adhärente Filamente (Epithel + Mukus + Zelldetritus) auf der Hornhaut. Chronisch-rezidivierend.

---

### Häufigste Ursachen
| Ursache | Häufigkeit | Remission |
|---|---|---|
| Hirnläsionen | 36,2% | 33,3% |
| Trockenes Auge | 30,2% | >60% |
| Autoimmun (Sjögren) | 24,1% | >60% |

---

### Therapie-Stufenschema

1. **Basis:** Filamententfernung + Lubrikation
2. **Medikamentös:** N-Acetylcystein + hypertone NaCl 5%
3. **Erweitert:** Punctum Plugs, Bandage-KL, Serum-AT
4. **Refraktär:** Botulinumtoxin A

> **Cave:** Hirnläsionen haben **6,6-fach höheres Therapieversagen**! Grunderkrankung immer behandeln.
''',
      ),
      const Condition(
        id: 'xerophthalmia',
        name: 'Xerophthalmie',
        description: 'Okuläre Manifestationen des Vitamin-A-Mangels – von Nachtblindheit bis Keratomalazie. Häufigste Ursache vermeidbarer Blindheit bei Kindern weltweit.',
        symptoms: ['dry_eyes', 'blurred_vision', 'light_sensitivity'],
        urgency: Urgency.high,
        treatment: ['Hochdosis-Vitamin-A oral (200.000 IU)', 'Bei Malabsorption: parenterale Gabe', 'Lubrikation', 'Behandlung von Begleitinfektionen'],
        followUp: 'Keratomalazie ist ein Notfall! Frühe Stadien vollständig reversibel',
        source: null,
        wikiContent: '''
## Definition

Xerophthalmie bezeichnet die **okulären Manifestationen eines Vitamin-A-Mangels** und umfasst ein Spektrum von Veränderungen von Nachtblindheit bis zur Keratomalazie.¹ Sie ist weltweit eine der **häufigsten Ursachen für vermeidbare Blindheit** bei Kindern.²

---

## Epidemiologie

- **Weltweit:** Wichtiges Public-Health-Problem, besonders in Entwicklungsländern²
- **Entwickelte Länder:** Selten, aber zunehmend (v.a. durch alkoholische Lebererkrankung)¹
- **Risikogruppen:** Kinder 6 Monate – 5 Jahre, schwangere/stillende Frauen²
- **Mortalität:** Kinder mit milder Xerophthalmie haben eine **4-fach erhöhte Mortalität**³

---

## Ätiologie und Risikofaktoren

### Entwicklungsländer² ⁴
- Unzureichende Vitamin-A-Zufuhr (Armut)
- Infektionskrankheiten (Masern, Durchfallerkrankungen)
- Protein-Energie-Mangelernährung

### Entwickelte Länder¹ ⁵ ⁶ ⁷

| Risikofaktor | Mechanismus |
|---|---|
| **Fettmalabsorption** | Gestörte Vitamin-A-Resorption |
| **Chronische Lebererkrankung/Alkoholismus** | Gestörte Speicherung und Metabolismus |
| **Autismus-Spektrum-Störung** | Restriktive Ernährung |
| **Zystische Fibrose** | Malabsorption |
| **Kurzdarmsyndrom** | Malabsorption |
| **Zöliakie** | Malabsorption |
| **Dialysepflichtige Niereninsuffizienz** | Erhöhter Verlust |

---

## Pathophysiologie

Vitamin A ist essentiell für:⁸

1. **Sehfunktion:** Bildung von Rhodopsin (Sehpurpur) für die Dunkeladaptation
2. **Epithelzelldifferenzierung:** Erhalt des nicht-verhornenden Epithels
3. **Immunfunktion:** Aufrechterhaltung der Infektionsabwehr

### Pathologische Veränderungen bei Mangel⁸
- Keratinisierung der Bindehaut und Hornhaut
- Verlust der Becherzellen (Muzinproduktion ↓)
- Reduzierte wässrige Tränenproduktion
- Stromale Einschmelzung (auch ohne bakterielle Invasion möglich)

---

## WHO-Klassifikation der Xerophthalmie

| Stadium | Bezeichnung | Beschreibung |
|---|---|---|
| **XN** | Nachtblindheit | Gestörte Dunkeladaptation |
| **X1A** | Konjunktivale Xerosis | Trockene, matte Bindehaut |
| **X1B** | Bitot-Flecken | Schaumige, weiße Flecken auf der Bindehaut |
| **X2** | Korneale Xerosis | Trockene, matte Hornhaut |
| **X3A** | Keratomalazie (<1/3) | Ulzeration/Nekrose |
| **X3B** | Keratomalazie (≥1/3) | Schwere Nekrose |
| **XS** | Hornhautnarben | Residuen nach Xerophthalmie |
| **XF** | Xerophthalmischer Fundus | Retinale Veränderungen |

---

## Klinik

### Symptome¹ ⁵ ⁸
- **Nachtblindheit** (frühestes Symptom)
- Augenreizung/Fremdkörpergefühl
- Photophobie
- Verschwommenes Sehen
- Augentrockenheit

### Frühe Stadien (XN, X1A, X1B)
- Gestörte Dunkeladaptation
- Matte, trockene Bindehaut
- **Bitot-Flecken:** Schaumige, weiße, dreieckige Läsionen temporal der Hornhaut
- **Punktförmige Epithelkeratopathie:** Früheste Hornhautmanifestation (bei 60% der Patienten mit Nachtblindheit)

![Bitot-Flecken – Schaumige, weiße Läsionen auf der Bindehaut als Zeichen des Vitamin-A-Mangels](asset:assets/images/xerophthalmia_bitot.png)

### Späte Stadien (X2, X3)
- Hornhautxerosis: Matte, trockene Hornhautoberfläche
- Hornhautulzeration
- **Keratomalazie:** Nekrotische Einschmelzung der Hornhaut (Notfall!)
- Hornhautperforation möglich

---

## Diagnostik

### Klinische Diagnose¹ ⁶
- Anamnese (Ernährung, Grunderkrankungen)
- Spaltlampenuntersuchung
- Fluorescein-Färbung

### Labordiagnostik
- **Serum-Vitamin-A-Spiegel:** Normal 80–300 Units/100 mL (30–70 µg/dL)

> **Wichtig:** Bei Kindern mit Autismus und Augenreizung immer an Vitamin-A-Mangel denken!⁵

---

## Therapie

**Akute korneale Xerophthalmie ist ein medizinischer Notfall!**

### WHO-Therapieschema (oral)

| Patientengruppe | Tag 1 | Tag 2 | Nach 2 Wochen |
|---|---|---|---|
| **Kinder >1 Jahr** | 200.000 IU | 200.000 IU | 200.000 IU |
| **Kinder 6–12 Monate** | 100.000 IU | 100.000 IU | 100.000 IU |
| **Kinder <6 Monate** | 50.000 IU | 50.000 IU | 50.000 IU |

### Parenterale Therapie (bei Malabsorption)
- **Erwachsene:** 100.000 IU/Tag i.m. für 3 Tage, dann 50.000 IU/Tag für 2 Wochen
- **Kinder 1–8 Jahre:** 17.500–35.000 IU/Tag für 10 Tage
- **Säuglinge:** 7.500–15.000 IU/Tag für 10 Tage

> **Orale vs. parenterale Therapie:** Orale Gabe ist **genauso effektiv** wie parenterale Gabe, auch bei Durchfall oder Protein-Energie-Mangelernährung.

### Zusätzliche Maßnahmen
- Behandlung von Begleitinfektionen
- Ernährungsberatung
- Lubrikation der Augenoberfläche
- Bei Hornhautperforation: Chirurgische Intervention

---

## Prognose

- **Frühe Stadien (XN, X1A, X1B):** Vollständige Reversibilität unter Vitamin-A-Therapie¹
- **Korneale Xerosis:** Schnelle Besserung innerhalb einer Woche
- **Keratomalazie:** Kann zu **irreversibler Blindheit** führen⁵ ⁶
- **Mortalität:** 16% aller Todesfälle bei Kindern 1–6 Jahre in endemischen Gebieten³

---

## Prophylaxe

### Individuelle Prophylaxe
- Vitamin-A-reiche Ernährung (Leber, Eier, Milchprodukte, dunkelgrünes Blattgemüse, gelbe Früchte)
- Vitamin-A-Supplementierung bei Risikogruppen

### Public-Health-Maßnahmen²
- Vitamin-A-Supplementierung bei Kindern 6 Monate – 5 Jahre
- Kombination mit Masernimpfung
- Anreicherung von Lebensmitteln (Biofortifikation)
- Postpartale Supplementierung der Mutter

---

## Referenzen

1. McLaughlin S, et al. Xerophthalmia – A Potential Epidemic on Our Doorstep? [*Eye.* 2014](https://doi.org/10.1038/eye.2014.17)
2. Sherwin JC, et al. Epidemiology of Vitamin A Deficiency and Xerophthalmia. [*Trans R Soc Trop Med Hyg.* 2012](https://doi.org/10.1016/j.trstmh.2012.01.004)
3. Sommer A. Mortality Associated With Mild, Untreated Xerophthalmia. [*Trans Am Ophthalmol Soc.* 1983](https://pubmed.ncbi.nlm.nih.gov/6676983/)
4. Mele L, et al. Nutritional and Household Risk Factors for Xerophthalmia in Aceh. [*Am J Clin Nutr.* 1991](https://doi.org/10.1093/ajcn/53.6.1460)
5. Marek S, et al. Potential Blindness From Nutritional Xerophthalmia in Autistic Patients. [*J AAPOS.* 2023](https://doi.org/10.1016/j.jaapos.2023.05.009)
6. Van Swol J, et al. Four Cases of Keratopathy From Vitamin A Deficiency. [*Cornea.* 2025](https://doi.org/10.1097/ICO.0000000000003992)
7. Chiu M, et al. Vitamin A Deficiency and Xerophthalmia in Children. [*J Paediatr Child Health.* 2016](https://doi.org/10.1111/jpc.13243)
8. Sommer A. Effects of Vitamin A Deficiency on the Ocular Surface. [*Ophthalmology.* 1983](https://doi.org/10.1016/s0161-6420(83)34512-7)
9. Sommer A. Xerophthalmia and Vitamin A Status. [*Prog Retin Eye Res.* 1998](https://doi.org/10.1016/s1350-9462(97)00001-3)
10. Sommer A, et al. Vitamin A-Responsive Punctate Keratopathy in Xerophthalmia. [*Am J Ophthalmol.* 1979](https://doi.org/10.1016/0002-9394(79)90072-2)
11. Sommer A, et al. Oral Versus Intramuscular Vitamin A in Xerophthalmia. [*Lancet.* 1980](https://doi.org/10.1016/s0140-6736(80)91053-3)
12. Ross DA. Recommendations for Vitamin A Supplementation. [*J Nutr.* 2002](https://doi.org/10.1093/jn/132.9.2902S)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Xerophthalmie** = okuläre Manifestation des **Vitamin-A-Mangels**. Von Nachtblindheit bis Keratomalazie. Häufigste Ursache **vermeidbarer Blindheit** bei Kindern.

---

### WHO-Klassifikation
| Stadium | Beschreibung |
|---|---|
| XN | Nachtblindheit |
| X1B | **Bitot-Flecken** (pathognomonisch) |
| X2 | Korneale Xerosis |
| X3A/B | **Keratomalazie** (Notfall!) |

---

### Therapie (WHO-Schema)
- **Kinder >1 Jahr:** 200.000 IU oral an Tag 1, 2, und nach 2 Wochen
- Bei Malabsorption: parenterale Gabe
- Orale Gabe genauso effektiv wie parenteral

---

### Prognose
- Frühe Stadien: **vollständig reversibel**
- Keratomalazie: **irreversible Blindheit** möglich
- **4-fach erhöhte Mortalität** bei Kindern

> **Cave:** In entwickelten Ländern an **Alkoholismus, Malabsorption, Autismus** denken!
''',
      ),
      const Condition(
        id: 'exposure_keratopathy',
        name: 'Expositionskeratopathie',
        description: 'Hornhautschäden durch ungenügenden Lidschluss (Lagophthalmus, Proptosis); Trockenheit und Epithelerosion.',
        symptoms: ['dry_eyes', 'redness', 'foreign_body', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Salben und Nachtsalbe', 'Feuchte Kammer oder Tarsorraphie', 'Ursache angehen (Lidstellung, Proptosis)'],
        followUp: 'Regelmäßig bis stabile Situation',
        source: null,
      ),
      const Condition(
        id: 'band_keratopathy',
        name: 'Bandkeratopathie',
        description: 'Kalziumablagerung in der Bowman-Schicht; bei chronischer Uveitis, Hyperkalzämie oder altersbedingt.',
        symptoms: ['blurred_vision', 'foreign_body'],
        urgency: Urgency.low,
        treatment: ['EDTA-Chelation oder Abrasio bei Visusbeeinträchtigung', 'Grunderkrankung behandeln'],
        followUp: 'Bei Progression',
        source: null,
      ),
      const Condition(
        id: 'fuchs_endothelial_dystrophy',
        name: 'Fuchs-Endotheldystrophie',
        description: 'Primäre Endotheldystrophie mit Hornhautödem und Visusminderung; oft beidseits, familiär.',
        symptoms: ['blurred_vision', 'halos'],
        urgency: Urgency.medium,
        treatment: ['Salben und hypertones NaCl bei Ödem', 'Endotheliale Keratoplastik (DMEK/DSAEK) bei fortgeschrittener Einstellung'],
        followUp: 'Verlaufskontrolle',
        source: null,
      ),
      const Condition(
        id: 'map_dot_fingerprint_dystrophy',
        name: 'Map-Dot-Fingerprint-Dystrophie',
        description: 'Epitheliale Basalmembran-Dystrophie; rezidivierende Erosionen und subepitheliale Trübungen.',
        symptoms: ['foreign_body', 'pain', 'blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Tränenersatz und Salben', 'Bei Erosionen: wie Erosio corneae', 'Laser oder Debridement bei rezidivierenden Erosionen'],
        followUp: 'Bei Erosionen',
        source: null,
      ),
      const Condition(
        id: 'corneal_dystrophies',
        name: 'Hornhautdystrophien',
        description: 'Gruppe erblicher Hornhautveränderungen mit unterschiedlicher Schicht und Symptomatik.',
        symptoms: ['blurred_vision', 'pain', 'light_sensitivity'],
        urgency: Urgency.low,
        treatment: ['Je nach Typ: Tränenersatz, Salben', 'Bei Erosionen: entsprechende Therapie', 'Transplantat bei fortgeschrittener Einstellung'],
        followUp: 'Regelmäßige Kontrolle',
        source: null,
      ),
      const Condition(
        id: 'wilson_disease',
        name: 'Morbus Wilson',
        description: 'Kupferstoffwechselstörung; am Auge typisch Kayser-Fleischer-Ring an der Hornhaut und gelegentlich Sonnenblumen-Katarakt.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Systemische Therapie (Chelatoren, Zink) durch Internisten', 'Augen: Kontrolle, keine lokale Therapie des Rings'],
        followUp: 'Interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'corneal_transplantation',
        name: 'Hornhauttransplantationen',
        description: 'Operative Ersetzung von Hornhautgewebe (Vollwand oder lamellär); Indikation z.B. Keratokonus, Narben, Endothelerkrankungen.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Präoperativ: Grunderkrankung stabilisieren', 'Postoperativ: lokale Steroide und Immunsuppression', 'Abstoßungszeichen erkennen'],
        followUp: 'Langfristige Nachsorge',
        source: null,
      ),
      const Condition(
        id: 'ocular_rosacea',
        name: 'Rosazea & Okuläre Rosazea',
        description: 'Chronisch-entzündliche Erkrankung mit okulärer Beteiligung bei bis zu 75% der Rosazea-Patienten.',
        symptoms: ['redness', 'burning', 'dry_eyes', 'light_sensitivity', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Lidhygiene 2x täglich', 'Künstliche Tränen', 'Ciclosporin-AT 0,05%', 'Doxycyclin 40-100mg bei schweren Fällen'],
        followUp: 'Regelmäßige Kontrolle alle 3-6 Monate; bei Keratitis sofort',
        source: null,
        wikiContent: '''
## Definition

**Rosazea** ist eine **chronisch-entzündliche Hauterkrankung**, die primär das Gesicht betrifft und durch persistierendes Erythem, Papeln, Pusteln, Teleangiektasien und rezidivierendes Flushing gekennzeichnet ist.¹ Die **okuläre Beteiligung** tritt bei **bis zu 75% der Rosazea-Patienten** auf und kann den kutanen Manifestationen vorausgehen, gleichzeitig auftreten oder folgen.¹ ²

---

## Klassifikation der Rosazea

| Subtyp | Klinische Merkmale |
|---|---|
| **Erythematotelangiektaktisch** | Persistierendes Erythem, Flushing, Teleangiektasien |
| **Papulopustulös** | Erythem mit Papeln und Pusteln |
| **Phymatös** | Hautverdickung, Rhinophym (Knollennase) |
| **Okulär** | Augenbeteiligung (Blepharitis, Konjunktivitis, Keratitis) |

---

## Pathophysiologie

Die Pathogenese der okulären Rosazea umfasst mehrere Mechanismen:⁴ ⁵ ⁶

- **Immunsystem-Dysregulation:** Aktivierung von Toll-like-Rezeptoren (insbesondere TLR-4) und Komplementsystem führt zu chronischer Entzündung der Augenoberfläche
- **Neurovaskuläre Dysregulation:** Beteiligung von VEGF, TRP-Ionenkanälen und Neuropeptiden
- **Oxidativer Stress:** Erhöhter Gesamtoxidationsstatus (TOS) und erniedrigter Antioxidantienstatus (TAS) in Tränen und Serum
- **Meibom-Drüsen-Dysfunktion:** Zentrale Rolle bei der okulären Manifestation
- **Mikrobiom-Veränderungen:** Alterationen des okulären Mikrobioms
- **Typ-IV-Hypersensitivitätsreaktion:** Histologisch zeigt sich eine T-Helfer-Zell-dominierte Entzündung (CD4/CD8-Ratio erhöht)⁷

---

## Klinik

### Symptome⁸
- Fremdkörpergefühl (21,8%)
- Trockenheit (32,3%)
- Brennen/Stechen
- Juckreiz
- Tränen (29,4%)
- Photophobie (20,5%)
- Verschwommenes Sehen

### Befunde² ³ ⁹
- **Blepharitis:** Lidrandentzündung mit Teleangiektasien, Erythem, Schuppung
- **Meibom-Drüsen-Dysfunktion:** Mit rezidivierenden [Hordeola](#hordeolum) und [Chalazien](#chalazion)
- **Konjunktivitis:** Diffuse konjunktivale Hyperämie
- **Keratitis:** Korneavaskularisation, Ulzeration, Narbenbildung
- **Selten:** Episkleritis, Skleritis, Iritis, Korneaperforation (sehbedrohend)

![Okuläre Rosazea – Typische Befunde mit Blepharitis und Lidrandentzündung](asset:assets/images/ocular_rosacea.png)

---

## Diagnostik

Die Diagnose ist **primär klinisch** und basiert auf:³ ⁸

- Anamnese (Augensymptome bei allen Rosazea-Patienten erfragen)
- Inspektion von Lidern und Augenoberfläche
- Spaltlampenuntersuchung

> **Wichtig:** Die Diagnose wird häufig verzögert, insbesondere bei Kindern und bei Fehlen kutaner Veränderungen.³ ⁴

---

## Therapie

Die Behandlung erfolgt **stufenweise** je nach Schweregrad:¹ ¹⁰ ¹¹

### Basistherapie (alle Patienten)
- **Lidhygiene:** Zweimal täglich mit lauwarmem Wasser oder warmen Kompressen
- **Künstliche Tränen:** Nach Bedarf

### Topische Therapie (Grad 1–2)
- **Ciclosporin-Augentropfen 0,05%:** Verbessert Lebensqualität und Tränenproduktion¹ ¹²
- **Azithromycin topisch:** Auf Lidrand
- **Metronidazol-Gel 0,75%:** Auf Lidrand
- **Fusidinsäure-Gel:** Auf Lidrand
- **Ivermectin topisch:** Auf Lidrand¹¹

### Systemische Therapie (Grad 2–3, schwere Fälle)
- **Doxycyclin:** 40 mg (modifizierte Freisetzung) oder 100 mg täglich¹ ¹⁰
- **Azithromycin oral:** Alternative
- **Isotretinoin niedrig dosiert:** Bei therapierefraktären Fällen

### Lichtbasierte Therapie
- **Intense Pulsed Light (IPL):** 89% partielle Ansprechrate¹⁰

---

## Therapieeffektivität¹⁰

| Therapie | Ansprechrate |
|---|---|
| Topische Antimikrobielle | 91% (82/90) |
| Orale Antibiotika | 89% (525/580) |
| Intense Pulsed Light | 89% (97/109) |
| Ciclosporin-Augentropfen | 87% (40/46) |
| Lidhygiene allein | 65% (67/105) |
| Kombinationstherapie | 90% (69/77) |

---

## Schweregrad-basiertes Management⁹

1. **Grad 1 (mild):** Lidhygiene, künstliche Tränen, ggf. topische Therapie
2. **Grad 2 (moderat):** Systemische Therapie (Doxycyclin)
3. **Grad 3 (schwer):** Überweisung zum Ophthalmologen obligat (Keratitis, Skleritis, Iritis)

---

## Interdisziplinäre Zusammenarbeit

Eine **enge Kooperation zwischen Dermatologen und Ophthalmologen** ist essenziell:²

- Dermatologen sollten bei allen Rosazea-Patienten nach Augensymptomen fragen
- Ophthalmologen sollten bei okulären Befunden an kutane Rosazea denken
- Frühzeitige Diagnose und Behandlung verhindert permanente Augenschäden

---

## Referenzen

1. van Zuuren EJ. Rosacea. [*N Engl J Med.* 2017](https://doi.org/10.1056/NEJMcp1506630)
2. Vassileva S, et al. Rosacea: The Eyes Have It. [*Clin Dermatol.* 2023](https://doi.org/10.1016/j.clindermatol.2023.08.009)
3. Tavassoli S, et al. Ocular Manifestations of Rosacea: A Clinical Review. [*Clin Exp Ophthalmol.* 2021](https://doi.org/10.1111/ceo.13900)
4. Mohamed-Noriega K, et al. Ocular Rosacea: An Updated Review. [*Cornea.* 2025](https://doi.org/10.1097/ICO.0000000000003785)
5. Rodrigues-Braz D, et al. Cutaneous and Ocular Rosacea: Common and Specific Physiopathogenic Mechanisms. [*Mol Vis.* 2021](https://pubmed.ncbi.nlm.nih.gov/34220178/)
6. Yesilirmak N, et al. Toll-Like Receptor-4 Expression and Oxidative Stress in Ocular Rosacea. [*Mol Vis.* 2024](https://pubmed.ncbi.nlm.nih.gov/38846480/)
7. Hoang-Xuan T, et al. Ocular Rosacea: A Histologic and Immunopathologic Study. [*Ophthalmology.* 1990](https://doi.org/10.1016/s0161-6420(90)32403-x)
8. Sinikumpu SP, et al. Ocular Symptoms and Rosacea: A Population-Based Study. [*Dermatology.* 2022](https://doi.org/10.1159/000522494)
9. Powell FC. Rosacea. [*N Engl J Med.* 2005](https://doi.org/10.1056/NEJMcp042829)
10. Avraham S, et al. Treatment of Ocular Rosacea: A Systematic Review. [*JDDG.* 2024](https://doi.org/10.1111/ddg.15290)
11. Clanner-Engelshofen BM, et al. S2k Guideline: Rosacea. [*JDDG.* 2022](https://doi.org/10.1111/ddg.14849)
12. van Zuuren EJ, et al. Interventions for Rosacea. [*Cochrane Database Syst Rev.* 2015](https://doi.org/10.1002/14651858.CD003262.pub5)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Okuläre Rosazea** = chronisch-entzündliche Augenerkrankung bei **bis zu 75%** der Rosazea-Patienten. Kann auch **ohne Hautbefunde** auftreten.

---

### Klinik
- Blepharitis, MGD, rezidivierende [Hordeola](#hordeolum)/[Chalazien](#chalazion)
- Keratitis (sehbedrohend bei Grad 3)
- Trockenheit (32,3%), Fremdkörpergefühl (21,8%)

---

### Therapie-Stufenschema

1. **Basis:** Lidhygiene 2x/Tag + künstliche Tränen
2. **Mild–Moderat:** Ciclosporin-AT 0,05% oder topische Antibiotika
3. **Schwer:** Doxycyclin 40–100 mg/Tag systemisch
4. **IPL:** 89% Ansprechrate

---

### Wichtige Zahlen
| Therapie | Ansprechrate |
|---|---|
| Topische Antimikrobielle | 91% |
| Orale Antibiotika | 89% |
| IPL | 89% |
| Ciclosporin-AT | 87% |
| Lidhygiene allein | 65% |

---

### Cave
> **Grad 3 (Keratitis, Skleritis, Iritis):** Sofortige Überweisung zum Ophthalmologen! Enge **Dermatologen-Ophthalmologen-Kooperation** essenziell.
''',
      ),
      const Condition(
        id: 'photokeratitis',
        name: 'Keratitis Photoelectrica',
        description: 'Akute UV-Schädigung des Hornhautepithels durch natürliche oder künstliche UV-Quellen (Verblitzung, Schneeblindheit).',
        symptoms: ['pain', 'light_sensitivity', 'tearing', 'foreign_body', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Künstliche Tränen', 'Topische Antibiotika (Chloramphenicol 0,5%)', 'Zykloplegika (Cyclopentolat)', 'Topische NSAIDs', 'Systemische Analgesie bei starken Schmerzen'],
        followUp: 'Selbstlimitierend in 24-48h; Kontrolle bei ausbleibender Besserung',
        source: null,
        wikiContent: '''
## Definition

Die Keratitis photoelectrica (auch Photokeratitis, UV-Keratitis oder "Verblitzung") ist eine **akute, selbstlimitierende entzündliche Schädigung des Hornhautepithels** durch UV-Strahlung aus natürlichen oder künstlichen Quellen.¹ Bekannte Beispiele sind die **Schneeblindheit** und die **Schweißerblindheit** (Verblitzung).¹

---

## Ätiologie und Ursachen

Die Erkrankung wird durch **UV-B- und UV-C-Strahlung** (Wellenlänge 100–320 nm) verursacht, wobei die maximale spektrale Empfindlichkeit bei **288 nm** liegt.²

### Häufige Expositionsquellen¹ ²

| Natürliche Quellen | Künstliche Quellen |
|---|---|
| Sonnenlicht (Schneeblindheit) | Schweißgeräte (Lichtbogen) |
| Reflexion von Schnee, Wasser, Sand | Metallhalogenidlampen |
| Höhensonne | UV-Desinfektionslampen |
| | UV-C-Insektenfallen |
| | Solarien |

**Schwellendosis:** 50–100 J/m² für die Entwicklung einer Photokeratitis.²

---

## Pathophysiologie

- UV-B und UV-C werden primär vom **Hornhautepithel** absorbiert
- Photochemische Schädigung der Epithelzellen
- Apoptose und Nekrose der oberflächlichen Epithelzellen
- Freisetzung von Entzündungsmediatoren
- Stimulation der Schmerzrezeptoren
- Bei intensiver Exposition: Beteiligung von Stroma und Endothel möglich²

---

## Klinik

### Charakteristisches Merkmal
**Latenzzeit von 6–12 Stunden** zwischen Exposition und Symptombeginn.¹ ³

### Symptome¹ ² ³
- **Starke Augenschmerzen** (100% der Patienten)
- Photophobie
- Tränenfluss
- Fremdkörpergefühl/Brennen
- Verschwommenes Sehen
- Blepharospasmus

### Klinische Befunde¹ ²
- **Konjunktivale Injektion** (nahezu alle Patienten)
- **Punktförmige Epitheldefekte** (Punctate epithelial erosions) mit interpalpebraler Verteilung
- Ziliare Vasodilatation
- Fluorescein-positive Läsionen
- **Bilateral** (typisch)
- UV-Verbrennungen der periorbitalen Haut möglich (75% der Fälle)¹
- Keine Vorderkammerreaktion (bei unkomplizierten Fällen)²

---

## Diagnostik

Die Diagnose ist **klinisch** und basiert auf:

- **Anamnese:** Typische Expositionsgeschichte (Schweißen, Schnee, UV-Lampen)
- **Latenzzeit:** 6–12 Stunden zwischen Exposition und Symptomen
- **Spaltlampenuntersuchung:** Punktförmige Epitheldefekte, konjunktivale Injektion
- **Fluorescein-Färbung:** Positive Anfärbung der Epitheldefekte

---

## Therapie

Die Behandlung ist **symptomatisch**, da die Erkrankung selbstlimitierend ist:¹ ³ ²

### Empfohlene Therapie (Wilderness Medical Society Guidelines)³

| Therapie | Empfehlungsgrad |
|---|---|
| **Künstliche Tränen** | Starke Empfehlung |
| **Topische Antibiotika** (z.B. Chloramphenicol 0,5%) | Starke Empfehlung |
| **Zykloplegika** (z.B. Cyclopentolat) | Starke Empfehlung |
| **Topische NSAIDs** | Starke Empfehlung |
| **Systemische Analgesie** (bei starken Schmerzen) | Starke Empfehlung |

### Zusätzliche Maßnahmen
- Topische Kortikosteroide (in einigen Fällen)²
- Dexpanthenol-Augentropfen²
- Kühle Kompressen
- Dunkle Umgebung (bei Photophobie)

> **Nicht empfohlen:** Augenverband (Patching) wird **nicht empfohlen**.³ ⁴

---

## Prognose

- **Exzellent:** Spontane Heilung innerhalb von **24–48 Stunden**¹
- **Vollständige Erholung** bei allen Patienten in dokumentierten Fallserien²
- Keine Langzeitfolgen bei typischen Fällen²
- Visus meist nur minimal beeinträchtigt (ca. 20/25)²
- Bei schwerer Exposition: Stromale Trübung, Endothelschäden möglich (selten)²

---

## Prophylaxe

**Prävention ist die wichtigste Maßnahme:**³ ¹

- **Sonnenbrillen mit UV-A/B-Schutz und Seitenschutz** (wichtigste Maßnahme)
- Schweißerschutzbrille bei Schweißarbeiten
- Schutzbrille bei Arbeiten mit UV-Lampen
- Vermeidung direkter Exposition gegenüber UV-Quellen
- Bei Schnee/Wasser/Sand: Besondere Vorsicht wegen Reflexion

> **Wichtig:** Personen mit UV-Schutzbrille haben ein **85% geringeres Risiko** für Photokeratitis (RR 0,15).¹

---

## Referenzen

1. Kirschke DL, et al. Photokeratitis and UV-Radiation Burns Associated With Damaged Metal Halide Lamps. [*Arch Pediatr Adolesc Med.* 2004](https://doi.org/10.1001/archpedi.158.4.372)
2. Chan JYY, et al. Photokeratitis in Outdoor Event Participants Exposed to UV Radiation Display. [*JAMA Ophthalmol.* 2024](https://doi.org/10.1001/jamaophthalmol.2024.1092)
3. Paterson R, et al. WMS Guidelines for Treatment of Eye Injuries in the Wilderness: 2024 Update. [*Wilderness Environ Med.* 2024](https://doi.org/10.1177/10806032231223008)
4. Drake B, et al. WMS Practice Guidelines for Treatment of Eye Injuries. [*Wilderness Environ Med.* 2012](https://doi.org/10.1016/j.wem.2012.08.015)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Keratitis photoelectrica** = akute UV-Schädigung des Hornhautepithels. Bekannt als **Verblitzung** (Schweißen) oder **Schneeblindheit**.

---

### Klinik
- **Latenzzeit 6–12h** nach UV-Exposition
- Starke Schmerzen, Photophobie, Tränenfluss, bilateral
- Punktförmige Epitheldefekte (Fluorescein-positiv)

---

### Therapie (alle starke Empfehlung)
- Künstliche Tränen + topische Antibiotika
- Zykloplegika + topische NSAIDs
- Systemische Analgesie bei Bedarf
- **Kein Augenverband!**

---

### Prognose
**Exzellent** – spontane Heilung in **24–48 Stunden**, vollständige Erholung.

> **Prophylaxe:** UV-Schutzbrille reduziert Risiko um **85%** (RR 0,15).
''',
      ),
      const Condition(
        id: 'tspk',
        name: 'Thygeson Keratitis (TSPK)',
        description: 'Chronisch-rezidivierende Hornhauterkrankung mit grau-weißen intraepithelialen Läsionen, meist bilateral.',
        symptoms: ['light_sensitivity', 'blurred_vision', 'tearing', 'foreign_body'],
        urgency: Urgency.low,
        treatment: ['Künstliche Tränen', 'Topische Steroide (Fluorometholon 0,1%)', 'Ciclosporin A 0,05% (steroid-sparend)', 'Tacrolimus 0,02% bei Steroidresistenz'],
        followUp: 'Regelmäßig alle 4-6 Wochen; chronischer Verlauf über Jahre',
        source: null,
        wikiContent: '''
## Definition

Die Thygeson superfizielle punktförmige Keratitis (TSPK) ist eine **chronisch-rezidivierende Hornhauterkrankung**, die durch grau-weiße, intraepitheliale Läsionen charakterisiert ist, meist bilateral auftritt und durch Exazerbationen und Remissionen über Jahre bis Jahrzehnte verläuft.¹ ²

---

## Epidemiologie

- Durchschnittliches Erkrankungsalter: **28,7 Jahre**³
- **80% der Patienten** entwickeln Symptome vor dem 30. Lebensjahr⁴
- Keine eindeutige Geschlechtspräferenz
- Seltene Erkrankung (Orphan Disease)
- Durchschnittliche Krankheitsdauer: **11,1 Jahre** (kann 1 Monat bis 24 Jahre betragen)³ ⁵

---

## Pathogenese

Die **exakte Ätiologie ist unbekannt**, jedoch werden mehrere Mechanismen diskutiert:¹ ⁶ ²

### Virale Hypothese
- Klinische Ähnlichkeit zu viralen Keratopathien
- **Jedoch:** PCR-Studien zeigen kein Vorhandensein von HSV-1, HSV-2, VZV oder Adenoviren im Hornhautepithel bei aktiver TSPK⁷
- Kein Ansprechen auf antivirale oder antibakterielle Therapie¹

### Immunvermittelte Hypothese
- **Langerhans-Zellen:** Stark erhöht im basalen Hornhautepithel und in der Bowman-Membran bei TSPK⁸
- Assoziation mit dem subepithelialem Nervenplexus
- Verschwinden der Langerhans-Zellen unter Steroidtherapie⁸

### Genetische Assoziation
- Assoziation mit **HLA-DR3** (Antigen assoziiert mit immunogenen Reaktionen)²

### Virus-induzierte Immunreaktion
- Möglicherweise Immunantwort auf eine frühere virale Infektion⁶

---

## Klinik

### Symptome¹ ³ ⁴
- **Photophobie** (häufigstes Symptom)
- Verschwommenes Sehen
- Tränen
- Augenreizung/Fremdkörpergefühl
- Brennen

### Klinische Befunde¹ ² ³
- **Multiple, grau-weiße, intraepitheliale Hornhautläsionen**
- Meist **bilateral** (84%), kann asymmetrisch sein
- **Minimale oder keine Konjunktivabeteiligung** (wichtiges Unterscheidungsmerkmal!)
- Läsionen können mit Fluorescein anfärben
- Subepitheliale Trübungen möglich (besonders nach IDU-Behandlung)⁵

![TSPK – Grau-weiße intraepitheliale Hornhautläsionen in der Spaltlampenuntersuchung](asset:assets/images/tspk_1.png)

![TSPK – Punktförmige Läsionen mit Fluorescein-Anfärbung](asset:assets/images/tspk_2.png)

### Charakteristischer Verlauf
- Episoden von **Exazerbationen und Remissionen**
- Spontane Remissionen möglich
- Visus meist gut erhalten (78,9% mit Visus ≥20/30)³

---

## Diagnostik

Die Diagnose ist eine **Ausschlussdiagnose** und basiert auf:² ³

### Klinische Kriterien
- Typische intraepitheliale Läsionen
- Bilaterale Beteiligung (meist)
- Fehlende Konjunktivitis
- Chronisch-rezidivierender Verlauf
- Ansprechen auf Steroide

### Diagnostik
- Spaltlampenuntersuchung
- **Konfokale Mikroskopie:** Zeigt erhöhte Langerhans-Zellen⁸
- Bei Kindern/atypischen Fällen: Hornhautabstrich zum Ausschluss infektiöser Ursachen⁹

> **Wichtig:** Bei Kindern mit fehlendem Ansprechen auf Steroide sollte die Diagnose überdacht werden (DD: TGFBI-assoziierte stromale Dystrophie).⁹

### Differenzialdiagnosen
- Virale Keratitis (HSV, Adenovirus)
- Trockenes Auge
- Kontaktlinsen-assoziierte Keratopathie
- Medikamenten-induzierte Keratopathie
- Stromale Hornhautdystrophien

---

## Therapie

### Stufe 1 – Milde Symptome
- **Künstliche Tränen/Lubrikantien:** Basistherapie für alle Patienten

### Stufe 2 – Moderate bis schwere Symptome (Erstlinie)
- **Topische Kortikosteroide:** Therapie der Wahl³ ⁶
  - Fluorometholon 0,1% (bei Kindern bevorzugt)⁹
  - Prednisolon, Dexamethason
  - **97,5% der Patienten** benötigen Steroide im Krankheitsverlauf³
  - Langsames Ausschleichen (alle 4–6 Wochen) wichtig

### Stufe 3 – Steroid-sparende Therapie
- **Ciclosporin A 0,05% Augentropfen:**⁹ ⁴
  - Bei Unfähigkeit, Steroide auszuschleichen
  - **72% der Patienten** empfinden es als effektiv⁴
  - Signifikante Reduktion der Steroidexposition bei Kindern⁹
- **Tacrolimus 0,02% Augentropfen:**¹⁰
  - Effektiv bei steroidrefraktären Fällen
  - Ansprechen innerhalb von **72 Stunden**
  - Gut verträglich

### Stufe 4 – Zusätzliche Optionen
- **Therapeutische Kontaktlinsen:** Bandage-Kontaktlinsen zur Symptomlinderung³ ²

### Stufe 5 – Refraktäre Fälle
- **PRK/PTK (Photorefraktive/Phototherapeutische Keratektomie):** In ausgewählten therapieresistenten Fällen⁶

---

## Therapieübersicht

| Therapie | Indikation | Wirksamkeit |
|---|---|---|
| **Künstliche Tränen** | Alle, milde Symptome | Symptomlinderung |
| **Topische Steroide** | Erstlinie moderat/schwer | 97,5% benötigen Steroide |
| **Ciclosporin 0,05%** | Steroid-sparend | 72% effektiv |
| **Tacrolimus 0,02%** | Steroidrefraktär | 100% Ansprechen in 72h |
| **Kontaktlinsen** | Symptomlinderung | Adjuvant |
| **PRK/PTK** | Refraktäre Fälle | Einzelfallberichte |

---

## Wichtige Hinweise

- **Antivirale Therapie ist nicht wirksam** und sollte vermieden werden¹ ⁷
- **Idoxuridin (IDU)** kann subepitheliale Trübungen verursachen und sollte nicht verwendet werden⁵

---

## Prognose

- **Generell günstig** mit Erhalt des Visus
- Chronischer Verlauf über Jahre bis Jahrzehnte
- Spontane Remissionen möglich
- **60% der Patienten** berichten über >5 Rezidive pro Jahr⁴
- **18% der Rezidive** dauern länger als 3 Monate⁴

### Lebensqualität⁴
- 22% schwere Beeinträchtigung der täglichen Aktivitäten
- 38% reduzierte berufliche Aktivität
- 80% stark belastet durch Augenerkrankung

---

## Referenzen

1. Moshirfar M, et al. Thygeson Superficial Punctate Keratitis: Review. [*Eye Contact Lens.* 2022](https://doi.org/10.1097/ICL.0000000000000891)
2. Priyadarshini SR, et al. Thygeson's SPK: Review and Case Series. [*Indian J Ophthalmol.* 2021](https://doi.org/10.4103/ijo.IJO_1624_20)
3. Nagra PK, et al. Thygeson's SPK: Ten Years' Experience. [*Ophthalmology.* 2004](https://doi.org/10.1016/j.ophtha.2003.05.002)
4. Saad R, et al. Burden of Disease in TSPK. [*Orphanet J Rare Dis.* 2021](https://doi.org/10.1186/s13023-021-01707-6)
5. Tabbara KF, et al. Thygeson's SPK. [*Ophthalmology.* 1981](https://doi.org/10.1016/s0161-6420(81)35089-1)
6. Mandal N, et al. Thygeson's SPK. [*Graefes Arch Clin Exp Ophthalmol.* 2022](https://doi.org/10.1007/s00417-022-05617-6)
7. Connell PP, et al. Common Viral Pathogens in TSPK. [*Br J Ophthalmol.* 2007](https://doi.org/10.1136/bjo.2006.104802)
8. Kawamoto K, et al. Langerhans Cells in TSPK. [*Mol Vis.* 2009](https://pubmed.ncbi.nlm.nih.gov/19649151/)
9. Gagrani M, et al. TSPK in Children. [*Eye.* 2023](https://doi.org/10.1038/s41433-023-02533-9)
10. Shoughy SS, et al. Topical Tacrolimus in TSPK. [*Cornea.* 2020](https://doi.org/10.1097/ICO.0000000000002224)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**TSPK** = chronisch-rezidivierende Hornhauterkrankung mit **grau-weißen intraepithelialen Läsionen**, bilateral, ohne Konjunktivitis. Orphan Disease.

---

### Klinik
- Photophobie, verschwommenes Sehen, Tränen
- **Keine Konjunktivabeteiligung** (wichtiges DD-Merkmal!)
- Visus meist erhalten (78,9% ≥20/30)

---

### Therapie-Stufenschema

1. **Mild:** Künstliche Tränen
2. **Erstlinie:** Topische Steroide (97,5% benötigen diese)
3. **Steroid-sparend:** Ciclosporin A 0,05% (72% effektiv)
4. **Steroidrefraktär:** Tacrolimus 0,02% (Ansprechen in 72h)

---

### Wichtig
- **Antivirale Therapie unwirksam!**
- Krankheitsdauer Ø **11,1 Jahre**, 60% >5 Rezidive/Jahr

> **Cave:** Ätiologie unbekannt – wahrscheinlich immunvermittelt (erhöhte Langerhans-Zellen, HLA-DR3-Assoziation).
''',
      ),
      const Condition(
        id: 'pterygium',
        name: 'Pterygium',
        description: 'Benigne keilförmige fibrovaskuläre Wucherung der Bindehaut, die über den Limbus auf die Hornhaut wächst.',
        symptoms: ['redness', 'foreign_body', 'blurred_vision', 'dry_eyes'],
        urgency: Urgency.low,
        treatment: ['Künstliche Tränen', 'UV-Schutzbrille', 'Bei Progression: chirurgische Exzision + Autograft ± MMC'],
        followUp: 'Regelmäßige Kontrolle; postoperativ engmaschig wegen Rezidivrisiko',
        source: null,
        wikiContent: '''
## Definition

Ein Pterygium ist eine **benigne, keilförmige fibrovaskuläre Wucherung** der Bindehaut, die über den Limbus auf die Hornhaut wächst.¹ ² Es wird auch als "Surfer's Eye" bezeichnet und gehört zu den weltweit häufigsten Augenerkrankungen mit einer globalen Prävalenz von etwa **12%**.³

---

## Epidemiologie

- Besonders häufig im sogenannten **"Pterygium-Gürtel"** (tropische Regionen zwischen 37° nördlicher und südlicher Breite)⁴
- Risikopopulationen: Personen mit hoher UV-Exposition (Fischer, Landwirte, Surfer)²
- Prävalenz variiert je nach Region und UV-Exposition

---

## Pathogenese

Die Pathogenese ist **multifaktoriell** und umfasst folgende Mechanismen:¹ ⁵ ³

### Hauptfaktor: UV-B-Strahlung
- Induziert DNA-Schäden in limbalen Epithelzellen
- Aktiviert Toll-like-Rezeptor 3 (TLR3) → NF-κB-Aktivierung → chronische Entzündung⁶
- Stimuliert Expression von Wachstumsfaktoren (HB-EGF, VEGF, bFGF)⁷ ⁸

### Molekulare Mechanismen
- **Tumorsuppressorgen p53:** Mutationen und MDM2-vermittelte Inaktivierung⁴
- **Matrix-Metalloproteinasen (MMPs):** MMP-2, MMP-9 überexprimiert → Abbau der Bowman-Membran und Invasion³
- **VEGF:** Erhöht in Pterygiumgewebe → Angiogenese³ ⁸
- **Oxidativer Stress:** Erhöhte reaktive Sauerstoffspezies¹ ⁵
- **Extrazelluläre Matrix-Dysregulation:** Vermehrte Kollagen-III-Synthese, gestörte Elastinfaser-Assemblierung⁵

### Weitere Risikofaktoren
- HPV-Infektion (in einigen Populationen)⁸
- Genetische Faktoren (DNA-Reparaturgene: hOGG1, XRCC1)³
- Trockenes Auge (Assoziation mit Pterygium)¹

---

## Klinik

### Symptome²
- Oft **asymptomatisch** über Jahre
- Fremdkörpergefühl
- Rötung und Irritation (bei Entzündung)
- Trockenheit
- Verschwommenes Sehen (bei Hornhautbeteiligung)

### Klinische Befunde² ⁸
- **Keilförmige, fleischige, gelbliche Läsion** auf der Bulbuskonjunktiva
- Meist **nasal** lokalisiert (höhere UV-Exposition durch nasale Lichtreflexion)
- Wächst zentripetal vom Limbus auf die Hornhaut
- Kann Astigmatismus induzieren
- Bei fortgeschrittenen Fällen: Überdeckung der Sehachse

![Pterygium – Keilförmige fibrovaskuläre Wucherung mit nasaler Lokalisation](asset:assets/images/pterygium.png)

### Klassifikation nach Morphologie
- **Atrophisch:** Flach, wenig vaskularisiert
- **Fleischig:** Dick, stark vaskularisiert (höhere Rezidivrate)

---

## Diagnostik

Die Diagnose ist **primär klinisch** durch:²

- Inspektion: Typische keilförmige Läsion
- Spaltlampenuntersuchung: Beurteilung der Hornhautinvasion
- Messung des induzierten Astigmatismus (Topographie)

### Differenzialdiagnose
- **Pinguecula** (keine Hornhautinvasion)
- **Konjunktivale intraepitheliale Neoplasie (CIN)**
- **Plattenepithelkarzinom der Konjunktiva**

---

## Therapie

### Konservative Therapie (symptomatisch)²
- **Künstliche Tränen:** Lubrikation bei Irritation
- **Topische Vasokonstriktoren:** Kurzzeitig bei Rötung
- **Sonnenschutz** (UV-Schutzbrille)

### Indikationen zur chirurgischen Therapie
- Visusbeeinträchtigung
- Signifikanter induzierter Astigmatismus
- Progression auf die zentrale Hornhaut
- Kosmetische Gründe
- Rezidivierende Entzündungen

---

## Chirurgische Techniken und Rezidivraten

| Technik | Rezidivrate | Bemerkungen |
|---|---|---|
| **Bare Sclera** (alleinige Exzision) | Bis zu 80% | Nicht mehr empfohlen |
| **Konjunktivales Autograft (CAG)** | 5–15% | Goldstandard |
| **Limbales Autograft** | 5–15% | Enthält Stammzellen |
| **Amnionmembran-Transplantation** | Höher als CAG | Alternative bei begrenztem Gewebe |
| **CAG + Mitomycin C** | **1,4%** | Niedrigste Rezidivrate |

### Adjuvante Therapien
- **Mitomycin C (MMC):** 0,02% intraoperativ für 1–3 Minuten. Reduziert Rezidivrate signifikant. Cave: Skleranekrose bei höheren Dosen
- **5-Fluorouracil (5-FU):** Alternative zu MMC
- **Topisches Ciclosporin 0,05%:** Postoperativ, signifikante Reduktion der Rezidivrate (OR 0,32)
- **Anti-VEGF (Bevacizumab):** Subkonjunktival oder topisch
- **Beta-Bestrahlung:** Historisch, heute selten wegen Komplikationen

> **Empfohlene Technik:** Pterygium-Exzision + konjunktivales/limbales Autograft ± intraoperatives MMC ist die bevorzugte Methode mit den niedrigsten Rezidivraten.

---

## Fixierungstechniken für Autografts

| Technik | Vorteile | Nachteile |
|---|---|---|
| **Naht** | Sicher, etabliert | Längere OP-Zeit, Fremdkörpergefühl |
| **Fibrinkleber** | Schneller, weniger Beschwerden | Kosten, theoretisches Infektionsrisiko |
| **Autologes Blut** | Kostengünstig | Weniger Daten |

---

## Komplikationen der Chirurgie

- Rezidiv (häufigstes Problem)
- Granulom/pyogenes Granulom
- Transplantatverlust
- Hornhautnarben
- Diplopie (bei Muskelschädigung)
- Skleranekrose (bei MMC)
- Erhöhter Augeninnendruck

---

## Prophylaxe

- **UV-Schutz:** Sonnenbrille mit UV-A/B-Filter (wichtigste Maßnahme)
- Hut mit breiter Krempe
- Vermeidung von Staub und Wind
- Behandlung von Trockenem Auge
- Regelmäßige augenärztliche Kontrollen bei Risikopersonen

---

## Prognose

- Primäre Pterygien haben bessere Prognose als rezidivierende
- Rezidive sind aggressiver und schwieriger zu behandeln
- Mit modernen Techniken (CAG + MMC) Rezidivrate unter 5%

---

## Referenzen

1. Ding P, et al. Risk Factors for Pterygium: Latest Research Progress. [*Exp Eye Res.* 2024](https://doi.org/10.1016/j.exer.2024.109900)
2. Leibowitz HM. The Red Eye. [*N Engl J Med.* 2000](https://doi.org/10.1056/NEJM200008033430507)
3. Gupta M, et al. Unravelling the Molecular Tapestry of Pterygium. [*Eye.* 2024](https://doi.org/10.1038/s41433-024-03186-y)
4. Young AL, et al. The Evolving Story of Pterygium. [*Cornea.* 2018](https://doi.org/10.1097/ICO.0000000000001744)
5. Martín-López J, et al. The Role of the Stromal Extracellular Matrix in Pterygium. [*J Clin Med.* 2021](https://doi.org/10.3390/jcm10245930)
6. Lai CC, et al. Conjunctival Expression of TLR3 in UV-Induced Pterygium. [*Invest Ophthalmol Vis Sci.* 2021](https://doi.org/10.1167/iovs.62.10.6)
7. Nolan TM, et al. The Role of UV and HB-EGF in Pterygium Pathogenesis. [*Am J Pathol.* 2003](https://doi.org/10.1016/S0002-9440(10)63850-3)
8. Detorakis ET, et al. Pathogenetic Mechanisms and Treatment Options for Pterygium. [*Int J Mol Med.* 2009](https://doi.org/10.3892/ijmm_00000149)
9. Liu T, et al. Progress in the Pathogenesis of Pterygium. [*Curr Eye Res.* 2013](https://doi.org/10.3109/02713683.2013.823212)
10. Shibata N, et al. Relative Gene Expression Analysis of Human Pterygium Tissues. [*Exp Eye Res.* 2020](https://doi.org/10.1016/j.exer.2020.108194)
11. Kaufman SC, et al. Options and Adjuvants in Surgery for Pterygium. [*Ophthalmology.* 2013](https://doi.org/10.1016/j.ophtha.2012.06.066)
12. Chu WK, et al. Pterygium: New Insights. [*Eye.* 2020](https://doi.org/10.1038/s41433-020-0786-3)
13. Clearfield E, et al. Conjunctival Autograft for Pterygium. [*Cochrane Database Syst Rev.* 2016](https://doi.org/10.1002/14651858.CD011349.pub2)
14. Taher NO, et al. AMT and CAG Combined With MMC for Pterygium. [*Front Med.* 2022](https://doi.org/10.3389/fmed.2022.981663)
15. Palewski M, et al. Evaluating Efficacy and Safety of Pterygium Surgeries. [*Int J Environ Res Public Health.* 2022](https://doi.org/10.3390/ijerph191811357)
16. Aleksander-Ivanov Y, et al. Adjuvant Use of Topical Cyclosporine A in Pterygium. [*Am J Ophthalmol.* 2025](https://doi.org/10.1016/j.ajo.2025.06.020)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Pterygium** = benigne keilförmige fibrovaskuläre Wucherung der Bindehaut auf die Hornhaut. Globale Prävalenz **~12%**. Hauptursache: **UV-B-Strahlung**.

---

### Klinik
- Meist nasal, keilförmig, oft asymptomatisch
- Kann Astigmatismus und Visusminderung verursachen

---

### Therapie

| Technik | Rezidivrate |
|---|---|
| Bare Sclera | bis 80% |
| CAG (Goldstandard) | 5–15% |
| CAG + MMC | **1,4%** |

> **Empfohlen:** Exzision + konjunktivales Autograft ± MMC

---

### Prophylaxe
**UV-Schutzbrille** ist die wichtigste Maßnahme. Primäre Pterygien haben bessere Prognose als Rezidive.
''',
      ),
    ],
  ),
  Category(
    id: 'dry_eye_category',
    name: 'Trockenes Auge',
    icon: '🏜️',
    description: 'Sicca-Syndrom, Meibom-Drüsen-Dysfunktion und verwandte Erkrankungen',
    conditions: [
      const Condition(
        id: 'dry_eye_overview',
        name: 'Keratokonjunktivitis sicca (KCS)',
        description: 'Multifaktorielle Erkrankung der Augenoberfläche mit Störung des Tränenfilms – wässriger Mangel oder evaporativ.',
        symptoms: ['dry_eyes', 'burning', 'foreign_body', 'tearing', 'blurred_vision', 'sand_sensation', 'sticky_secretion'],
        urgency: Urgency.low,
        treatment: [
          'Patientenberatung: Vermeidung von Umweltfaktoren, Blinzeltraining bei Bildschirmarbeit',
          'Tränenersatzmittel: Hypromellose (leicht), Carbomere/Hyaluronsäure (mittel-schwer)',
          'Konservierungsmittelfreie Präparate bevorzugen',
          'Lidhygiene und warme Kompressen',
          'Bei Entzündung: Ciclosporin-Tropfen 0.05-0.1%',
          'Bei schwerem Verlauf: Tränenpünktchenverschluss (Punctum Plugs)',
          'Omega-3-Fettsäuren zur Unterstützung',
        ],
        followUp: 'Kontrolle nach 4-8 Wochen, bei Komplikationen früher',
        diagnostics: ['Tränenfilmaufreißzeit (BUT) < 10 Sek. pathologisch', 'Schirmer-Test: < 10mm ohne Anästhesie pathologisch', 'Anfärbung mit Fluoreszein und Bengalrosa', 'Beurteilung des Tränenmeniskus'],
        complications: ['Hornhautfilamente und muköse Plaques', 'Punktförmige Epithelerosionen', 'Periphere Hornhautvaskularisation', 'In schweren Fällen: Hornhauteinschmelzung, Perforation'],
      ),
      const Condition(
        id: 'meibom_dysfunction',
        name: 'Meibom-Drüsen-Dysfunktion (MGD)',
        description: 'Chronische Störung der Meibom-Drüsen mit verändertem Lipidsekret – häufigste Ursache des evaporativen trockenen Auges.',
        symptoms: ['dry_eyes', 'burning', 'foreign_body', 'sticky_secretion'],
        urgency: Urgency.low,
        treatment: ['Warme Kompressen + Lidmassage', 'Lidhygiene', 'Omega-3-Fettsäuren', 'IPL-Therapie bei chronischen Fällen', 'Doxycyclin bei schwerer MGD'],
        followUp: 'Langfristige Kontrolle; Symptome rezidivieren bei Absetzen der Therapie',
      ),
      const Condition(
        id: 'sjogren',
        name: 'Sjögren-Syndrom',
        description: 'Autoimmunerkrankung mit Trockenheit von Augen und Mund; Frauen:Männer 9-20:1. 10% aller Patienten mit trockenem Auge haben Sjögren.',
        symptoms: ['dry_eyes', 'dry_mouth', 'sand_sensation', 'burning'],
        urgency: Urgency.medium,
        treatment: ['Intensive Lubrikation (konservierungsmittelfrei)', 'Ciclosporin-AT 0,05-0,1%', 'Autologe Serum-AT 20%', 'Punctum Plugs', 'Pilocarpin 5mg 4x/Tag', 'Rheumatologische Mitbetreuung'],
        followUp: 'Regelmäßig; interdisziplinär mit Rheumatologie; Lymphom-Screening',
        source: null,
        wikiContent: '''
## Definition und Epidemiologie

Das Sjögren-Syndrom ist definiert als **trockenes Auge und trockener Mund** in Verbindung mit **systemischer Immundysfunktion**.¹ Etwa **10% der Patienten mit klinisch signifikantem trockenem Auge** haben ein zugrunde liegendes Sjögren-Syndrom.¹

- **Prävalenz:** Ca. 0,4%
- **Frauen-zu-Männer-Verhältnis:** 9–20:1¹ ²
- **Erkrankungsgipfel:** Um das 50. Lebensjahr²
- **Hauptsymptome:** Augentrockenheit, Mundtrockenheit und Fatigue (>80%)²

### Klassifikation
- **Primäres Sjögren-Syndrom:** Kann mit Schilddrüsendysfunktion oder Autoimmunthyreoiditis assoziiert sein¹
- **Sekundäres Sjögren-Syndrom:** Bei Vorliegen einer anderen Autoimmunerkrankung (RA, Sklerodermie, SLE)¹

---

## Pathogenese

Bei Sjögren-Syndrom führt eine **autoimmun-vermittelte Exokrinopathie** zur **T-Zell-Infiltration der Tränendrüsen** mit reduzierter Tränenproduktion.³

### Immunpathologie⁴ ⁵
- **T-Zell-Aktivierung:** CD4+ T-Zellen dominieren die lymphozytäre Infiltration
- **Th1/Th2, Th17 und Treg-Differenzierung:** Verschiedene Subgruppen tragen zur Pathologie bei
- **B-Zell-Überaktivierung:** Führt zu Autoantikörperproduktion (Anti-SSA/Ro, Anti-SSB/La)
- **Neurosekretorischer Block:** Proinflammatorische Zytokine blockieren die Drüsenfunktion³

> **Paradoxes Phänomen:** Patienten mit Sjögren und hohem Corneal Staining berichten paradoxerweise **weniger Symptome** als Patienten ohne Sjögren – aufgrund reduzierter kornealer Sensitivität.³

---

## Diagnostische Kriterien (ACR-EULAR 2016)

Die Diagnose basiert auf der gewichteten Summe von fünf Items:¹

| Item | Score |
|---|---|
| **Anti-SSA/Ro-Antikörper-Positivität** | 3 |
| **Fokale lymphozytäre Sialadenitis** (Focus Score ≥1/4 mm²) | 3 |
| Ocular Staining Score ≥5 | 1 |
| Schirmer-Test ≤5 mm/5 min | 1 |
| Unstimulierte Speichelflussrate ≤0,1 ml/min | 1 |

**Diagnose:** Gesamtscore **≥4** bei Patienten mit suggestiven Symptomen¹

### Wann an Sjögren denken?
Bei **intrinsischer Tränenproduktionsdefizienz bei nicht-älteren Frauen**, insbesondere bei **raschem Beginn und/oder ausgeprägter Schwere**.¹

### Labordiagnostik²
- **Anti-SSA-Antikörper:** Bei zwei Dritteln vorhanden
- **Rheumafaktor:** Bei ca. 50%
- **Anti-dsDNA:** Typischerweise negativ (DD SLE)
- **Speicheldrüsenbiopsie:** Empfohlen bei Fehlen von Anti-SSA

---

## Okuläre Manifestationen

### Klinische Zeichen⁶
- Sandiges, brennendes, gereiztes Gefühl
- Verschlechterung im Tagesverlauf
- Exazerbation durch Wind, Klimaanlagen, trockene Umgebungen
- Reduzierter Tränenfilm mit erhöhter Mukusproduktion
- Reduzierter Schirmer-Test
- Positive Vitalfärbung (Bengalrosa, Lissamingrün, Fluorescein)

### Weitere okuläre Komplikationen¹
- Skleritis
- Sterile Keratitis
- Uveitis

---

## Therapie

### Stufentherapie des Sjögren-assoziierten trockenen Auges¹

| Schweregrad | Therapie | Details |
|---|---|---|
| **Mild–Moderat** | Topische Lubrikantien | Tränenersatzmittel (konservierungsmittelfrei) |
| **Moderat** | Topische Cyclosporin A | 0,05% oder 0,1% bei moderater/schwerer Entzündung |
| **Schwer** | Autologes Serum (20%) | Verbessert Symptome und Vitalfärbung |
| **Schwer** | Punctum-Okklusion | Silikon-Plugs oder permanente Kauterisation |
| **Schwer** | Orale Cholinergika | Cevimelin, Pilocarpin (5 mg 4x/Tag) |
| **Schwer** | Sklerallinsen | Bei therapierefraktären Fällen |
| **Schwerst** | Tarsorrhaphie | Bei schwersten Fällen |

### Orale Sekretogoga¹
- **Pilocarpin** (5 mg 4x/Tag): Signifikante Verbesserung der Fokussierungsfähigkeit
- **Cevimelin:** FDA-zugelassen für Mundtrockenheit, verbessert auch okuläre Symptome
- Wirksamkeit bei Mundtrockenheit **größer** als bei Augentrockenheit
- **Häufigste Nebenwirkung:** Übermäßiges Schwitzen (>40%)¹

### EULAR-Empfehlungen⁷

| Therapie | Indikation | Evidenz |
|---|---|---|
| **Topische Lubrikantien** | Augentrockenheit | Wirksam |
| **Topische Cyclosporin A** | Moderat/schwer | Wirksam |
| **Autologes Serum** | Schwere Fälle | Wirksam |
| **Pilocarpin/Cevimelin** | Sicca (v.a. oral) | Wirksam |
| **Hydroxychloroquin** | Fatigue, Arthralgien | Schwache Evidenz für Auge |
| **Rituximab** | Systemische Manifestationen | Inkonsistente Evidenz |
| **Anti-TNF** | – | **Nicht wirksam** |

> **Hydroxychloroquin:** Obwohl häufig verschrieben, zeigt die Literatur **keine starke Evidenz** für die Wirksamkeit bei trockenem Auge.¹

---

## Systemische Komplikationen und Therapie²

- **Glucocorticoide:** Bei interstitieller Nephritis
- **Rituximab:** Bei B-Zell-Aktivierung und systemischen Komplikationen
- **Analgesie:** Paracetamol als First-Line, NSAIDs bei Gelenkschmerzen
- **Neuropathische Schmerzen:** Gabapentin, Pregabalin oder Duloxetin

---

## Prognose und Lymphom-Risiko

Patienten mit Sjögren-Syndrom haben ein erhöhtes Risiko für **lymphoproliferative Erkrankungen**.¹ ²

### Risikofaktoren für Lymphom²
- Hohe Krankheitsaktivität
- Rheumafaktor-Positivität
- **Erniedrigtes C4** bei Diagnosestellung¹
- Rezidivierende Parotisschwellung
- Purpura

> **Interdisziplinäre Betreuung mit Rheumatologie ist obligat!**¹

---

## Referenzen

1. Amescua G, et al. Dry Eye Syndrome Preferred Practice Pattern®. [*Ophthalmology.* 2024](https://doi.org/10.1016/j.ophtha.2023.12.041)
2. Mariette X, et al. Primary Sjögren's Syndrome. [*N Engl J Med.* 2018](https://doi.org/10.1056/NEJMcp1702514)
3. Clayton JA. Dry Eye. [*N Engl J Med.* 2018](https://doi.org/10.1056/NEJMra1407936)
4. Roszkowska AM, et al. Ophthalmologic Manifestations of Primary Sjögren's Syndrome. [*Genes.* 2021](https://doi.org/10.3390/genes12030365)
5. Meng Q, et al. T and B Lymphocyte Subpopulations in Sjögren's Syndrome. [*Front Immunol.* 2024](https://doi.org/10.3389/fimmu.2024.1468469)
6. McCluskey P, et al. The Eye in Systemic Inflammatory Diseases. [*Lancet.* 2004](https://doi.org/10.1016/S0140-6736(04)17554-5)
7. Ramos-Casals M, et al. EULAR Recommendations for Sjögren's Syndrome. [*Ann Rheum Dis.* 2020](https://doi.org/10.1136/annrheumdis-2019-216114)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Sjögren-Syndrom** = Autoimmun-Exokrinopathie mit trockenem Auge + Mund. **10%** aller Sicca-Patienten haben Sjögren. Frauen:Männer **9–20:1**.

---

### ACR-EULAR-Kriterien (Score ≥4)
| Item | Score |
|---|---|
| Anti-SSA/Ro+ | 3 |
| Fokale Sialadenitis | 3 |
| Ocular Staining ≥5 | 1 |
| Schirmer ≤5 mm | 1 |
| Speichelfluss ≤0,1 ml/min | 1 |

---

### Stufentherapie
1. **Lubrikantien** (konservierungsmittelfrei)
2. **Ciclosporin-AT** 0,05% bei Entzündung
3. **Autologes Serum 20%** bei schweren Fällen
4. **Pilocarpin** 5 mg 4x/Tag (v.a. für Mundtrockenheit)
5. **Punctum-Okklusion / Sklerallinsen**

> **Cave:** Erhöhtes **Lymphom-Risiko** (v.a. bei niedrigem C4)! **Rheumatologische Mitbetreuung obligat!**
''',
      ),
      const Condition(
        id: 'evaporative_dry_eye',
        name: 'Evaporatives Trockenes Auge',
        description: 'Trockenes Auge durch erhöhte Verdunstung des Tränenfilms, meist durch MGD, seltener durch Lidfehlstellungen oder Umweltfaktoren.',
        symptoms: ['dry_eyes', 'burning', 'blurred_vision', 'sticky_secretion'],
        urgency: Urgency.low,
        treatment: ['Warme Kompressen + Lidmassage (Erstlinie)', 'Lipidhaltige Tränenersatzmittel', 'Lidhygiene', 'IPL + Meibom-Drüsen-Expression', 'LipiFlow bei MGD'],
        followUp: 'Alle 3-6 Monate; Lidhygiene langfristig',
      ),
    ],
  ),
  Category(
    id: 'lens',
    name: 'Linse',
    icon: '🔍',
    description: 'Erkrankungen der Augenlinse',
    conditions: [
      const Condition(
        id: 'ectopia_lentis',
        name: 'Ectopia Lentis (Linsenluxation)',
        description: 'Verlagerung der Augenlinse aus ihrer normalen Position durch Zonulaschwäche. Häufigste Ursache: FBN1-Mutationen (97,4%).',
        symptoms: ['blurred_vision', 'double_vision'],
        urgency: Urgency.medium,
        treatment: ['Brillenkorrektur bei milder Subluxation', 'Amblyopietherapie bei Kindern', 'Lensektomie ± IOL bei schwerer Subluxation', 'Genetische Abklärung obligat'],
        followUp: 'Jährliche Kontrollen; Glaukom-Screening; kardiologische Überwachung bei Marfan',
        source: null,
        wikiContent: '''
## Definition

Die Ectopia lentis bezeichnet eine **Verlagerung oder Verschiebung der Augenlinse** aus ihrer normalen zentralen Position. Die Linse kann subluxiert (teilweise verlagert) oder vollständig luxiert (in die Vorderkammer oder den Glaskörper) sein.¹ Die Erkrankung wird typischerweise **im Kindesalter manifest**.¹

---

## Ätiologie und assoziierte Syndrome

### Genetische Ursachen²  ³
- **FBN1-Mutationen:** 97,4% aller Fälle (Marfan-Syndrom, familiäre Ectopia lentis)
- **ADAMTSL4-Mutationen:** 1,3% (nicht-syndromale Ectopia lentis, Ectopia lentis et pupillae)
- **LTBP2-Mutationen:** 1,3%

### Wichtige assoziierte Syndrome⁴ ⁵ ⁶

| Syndrom | Gen | Erbgang | Charakteristika |
|---|---|---|---|
| **Marfan-Syndrom** | FBN1 | AD | Aortendilatation, Skelettanomalien |
| **Homocystinurie** | CBS | AR | Thromboembolien, mentale Retardierung |
| **Weill-Marchesani** | ADAMTS10, FBN1 | AD/AR | Kleinwuchs, Brachydaktylie, Sphärophakie |
| **Ectopia lentis et pupillae** | ADAMTSL4 | AR | Ektope Pupille, flache Iris |

> **Wichtig:** Jede Ectopia lentis erfordert eine **genetische Abklärung** auf Marfan-Syndrom oder verwandte Erkrankungen.⁴

---

## Richtung der Linsenverlagerung – DD-Hinweis

| Syndrom | Verlagerungsrichtung |
|---|---|
| **Marfan-Syndrom** | **Superotemporal** (oben-außen) |
| **Homocystinurie** | **Inferonasal** (unten-innen) |
| **Weill-Marchesani** | Variabel, oft inferior |

---

## Differenzierung Marfan vs. Homocystinurie

| Merkmal | Marfan-Syndrom | Homocystinurie |
|---|---|---|
| **Erbgang** | Autosomal dominant | Autosomal rezessiv |
| **Linsenverlagerung** | Superotemporal | Inferonasal |
| **Aortendilatation** | Häufig | Selten |
| **Thromboembolien** | Selten | Häufig |
| **Mentale Retardierung** | Nein | Häufig |
| **Gelenkhypermobilität** | Ja | Nein |
| **Labor** | Normal | Homocystein >100 µmol/L |

---

## Pathogenese

Die Ectopia lentis entsteht durch **Schwäche oder Ruptur der Zonulafasern:**⁸

- **Marfan:** Defektes Fibrillin-1 → defekte Mikrofibrillen der Zonula
- **Homocystinurie:** Homocysteinylierung von Fibrillin-1 und Fibronektin⁹ ¹⁰
- **Trauma:** Zonularuptur durch stumpfes Trauma
- **Pseudoexfoliation:** Fortgeschrittene Zonulaschwäche bei älteren Patienten⁸

---

## Klinik

### Symptome¹
- **Sehstörungen:** Verschwommenes Sehen, monokulare Diplopie
- **Myopie:** Oft hochgradig (-5 D bis >-15 D)
- **Hyperopie:** Bei Luxation aus der Sehachse (funktionelle Aphakie)
- **Astigmatismus:** Häufig ausgeprägt und irregulär
- **Blendung:** Durch Linsenrandeffekte

### Befunde⁴ ⁸
- **Phakodonesis:** Zittern der Linse bei Augenbewegungen
- **Iridodonesis:** Zittern der Iris
- **Sichtbarer Linsenrand** in der Pupille bei Mydriasis
- **Frühzeitige Kataraktentwicklung**

### Manifestationsalter⁴ ⁷
- **Marfan:** Oft vor dem 10. Lebensjahr, kann bei Geburt vorhanden sein
- **Homocystinurie:** Typischerweise nach dem 1. Lebensjahr, bei Unbehandelten bis zum 8. Lebensjahr

---

## Komplikationen

| Komplikation | Mechanismus | Häufigkeit |
|---|---|---|
| **Amblyopie** | Refraktionsfehler, Anisometropie | Häufig |
| **Glaukom** | Pupillarblock, Winkelverlegung | ~30% bei Marfan |
| **Netzhautablösung** | Glaskörpertraktion, Bulbuselongation | Erhöht |
| **Katarakt** | Frühzeitige Linsentrübung | Häufig |

---

## Diagnostik

### Ophthalmologische Untersuchung⁴
- **Spaltlampenuntersuchung** nach maximaler Mydriasis
- **Refraktionsbestimmung:** Oft hochgradige Myopie oder Hyperopie
- **Tonometrie:** Glaukom-Screening
- **Funduskopie:** Netzhautablösung ausschließen
- **Ultraschall-Biomikroskopie (UBM):** Beurteilung der Zonula

### Systemische Abklärung⁴ ⁷
- **Genetische Testung:** FBN1, ADAMTSL4, CBS, LTBP2 (>90% mol. Diagnose möglich)³
- **Echokardiographie:** Aortenwurzel, Mitralklappenprolaps
- **Labor:** Plasma-Homocystein und Methionin
- **Skelettbeurteilung:** Marfanoide Merkmale

---

## Therapie

### Konservativ⁴
- **Brillenkorrektur:** Bei milder Subluxation mit Linse in der Sehachse
- **Kontaktlinsen:** Alternative zur Brille
- **Amblyopietherapie:** Okklusion bei Kindern

### Chirurgisch⁴

| Verfahren | Indikation | Besonderheiten |
|---|---|---|
| **Lensektomie ohne IOL** | Schwere Subluxation, Kinder | Aphakiekorrektur mit Brille/KL |
| **Lensektomie + IOL** | Moderate Subluxation | Besserer Visus, höhere Komplikationsrate |
| **Sklerafixierte IOL** | Fehlende Kapselunterstützung | Langzeitstabilität unklar |
| **Intralentikuläre Aspiration** | Weiche Linse (Kinder) | Häufigstes Verfahren (79,5%) |
| **Pars-plana-Lensektomie** | Luxation in Glaskörper | Mit Vitrektomie |

### Chirurgische Ergebnisse bei Marfan
- Visusverbesserung von 1,1 logMAR (20/250) auf **0,3 logMAR (20/40)**
- IOL-Position stabil in 47,1% der Augen

> **Wichtig:** Refraktive Hornhautchirurgie (LASIK) ist bei Marfan-Syndrom **kontraindiziert**.⁴

---

## Nachsorge

Bei Marfan-Syndrom und verwandten Erkrankungen:⁴
- **Jährliche ophthalmologische Kontrollen**
- Spaltlampe auf Linsensubluxation und Katarakt
- Glaukom-Screening
- Funduskopie in Mydriasis
- **Kardiologische Überwachung** (Aortenwurzel)

---

## Prognose

- **Visusprognose:** Gut bei frühzeitiger Diagnose und adäquater Therapie
- Alter und Subluxationsgrad beeinflussen finalen Visus nicht signifikant
- **Nicht-FBN1-Varianten:** Früherer Beginn und schwererer Phänotyp²
- **Axiale Myopie:** Progression schneller bei Vorschulkindern, langsamer nach OP²

---

## Referenzen

1. Isolated Ectopia Lentis. [*MedlinePlus.*](https://medlineplus.gov/)
2. Guo D, et al. Clinical and Genetic Landscape of Ectopia Lentis (156 Familien). [*Invest Ophthalmol Vis Sci.* 2024](https://doi.org/10.1167/iovs.65.1.20)
3. Musleh M, et al. Genetic Testing in Children With Ectopia Lentis. [*Genes.* 2023](https://doi.org/10.3390/genes14040791)
4. Tinkle BT, et al. Health Supervision for Children With Marfan Syndrome. [*Pediatrics.* 2023](https://doi.org/10.1542/peds.2023-061450)
5. Judge DP, et al. Marfan's Syndrome. [*Lancet.* 2005](https://doi.org/10.1016/S0140-6736(05)67789-6)
6. Marzin P, et al. Weill-Marchesani Syndrome. [*GeneReviews.* 2020](https://www.ncbi.nlm.nih.gov/books/NBK1114/)
7. Sacharow SJ, et al. Homocystinuria due to CBS Deficiency. [*GeneReviews.* 2025](https://www.ncbi.nlm.nih.gov/books/NBK1524/)
8. Lomi N, et al. Technique for Extreme Subluxated Crystalline Lens. [*Indian J Ophthalmol.* 2026](https://doi.org/10.4103/IJO.IJO_1919_25)
9. Hubmacher D, et al. Homocysteine Modifies Fibronectin. [*Biochemistry.* 2011](https://doi.org/10.1021/bi200183z)
10. Hubmacher D, et al. Homocysteinylation of Elastic Fiber Proteins. [*J Biol Chem.* 2010](https://doi.org/10.1074/jbc.M109.021246)
11. Bin Helayel H, et al. Surgical Outcomes in Marfan Syndrome. [*Clin Ophthalmol.* 2025](https://doi.org/10.2147/OPTH.S557116)
12. Maharana PK, et al. Outcomes of Surgical Intervention in Ectopia Lentis. [*Indian J Ophthalmol.* 2022](https://doi.org/10.4103/ijo.IJO_255_22)
''',
        wikiSummary: '''
## Kurzzusammenfassung

**Ectopia lentis** = Verlagerung der Augenlinse. **FBN1-Mutationen** in 97,4% der Fälle.

---

### Verlagerungsrichtung als DD-Hinweis
| Syndrom | Richtung |
|---|---|
| **Marfan** | Superotemporal |
| **Homocystinurie** | Inferonasal |

---

### Komplikationen
Amblyopie, Glaukom (~30% bei Marfan), Netzhautablösung, Katarakt

---

### Therapie
- **Konservativ:** Brille/KL bei milder Subluxation
- **Chirurgisch:** Lensektomie ± IOL (Visus 20/250 → 20/40)
- **LASIK kontraindiziert** bei Marfan!

> **Jede Ectopia lentis erfordert genetische Abklärung + Echokardiographie!**
''',
      ),
    ],
  ),
  Category(
    id: 'glaucoma',
    name: 'Glaukom',
    icon: '🎯',
    description: 'Grüner Star und verwandte Erkrankungen',
    conditions: [
      const Condition(
        id: 'poag',
        name: 'Primäres Offenwinkelglaukom (POWG)',
        description: 'Chronische Optikusneuropathie mit erhöhtem Augeninnendruck.',
        symptoms: ['vision_loss_gradual'],
        urgency: Urgency.medium,
        treatment: ['Drucksenkende Tropfen (z.B. Latanoprost)', 'Lasertherapie (SLT)', 'Bei Progression: Glaukom-OP'],
        followUp: 'Alle 3-6 Monate Kontrolle',
        source: null,
      ),
      const Condition(
        id: 'acute_glaucoma',
        name: 'Akuter Winkelblock',
        description: 'Plötzlicher Augeninnendruckanstieg mit Schmerzen. NOTFALL!',
        symptoms: ['pain', 'redness', 'blurred_vision', 'halos'],
        urgency: Urgency.high,
        treatment: ['SOFORT Druck senken!', 'Systemisch: Diamox 500mg', 'Topisch: Kombitherapie', 'Laser-Iridotomie beidseitig'],
        followUp: 'Engmaschig bis Druck kontrolliert',
        source: null,
      ),
      const Condition(
        id: 'normal_tension_glaucoma',
        name: 'Normaldruckglaukom',
        description: 'Glaukomtypische Papillen- und Gesichtsfeldveränderung bei normalem Augeninnendruck.',
        symptoms: ['vision_loss_gradual'],
        urgency: Urgency.medium,
        treatment: ['Drucksenkung trotzdem anstreben', 'Vaskuläre Risikofaktoren optimieren', 'Regelmäßige Kontrolle'],
        followUp: 'Wie POWG',
        source: null,
      ),
      const Condition(
        id: 'secondary_open_angle',
        name: 'Sekundäre Offenwinkelglaukome',
        description: 'Augeninnendruckerhöhung bei offenem Winkel durch andere Ursachen (Medikamente, Entzündung, Trauma, etc.).',
        symptoms: ['vision_loss_gradual', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Ursache beseitigen wo möglich', 'Drucksenkende Therapie', 'Laser/OP bei Bedarf'],
        followUp: 'Regelmäßige Kontrolle',
        source: null,
      ),
      const Condition(
        id: 'posner_schlossmann',
        name: 'Posner-Schlossmann-Syndrom',
        description: 'Wiederkehrende einseitige Druckanstiege mit leichter Vorderkammerentzündung; gut auf Therapie ansprechend.',
        symptoms: ['blurred_vision', 'halos'],
        urgency: Urgency.medium,
        treatment: ['Drucksenkende Tropfen', 'Leichte Steroid-Therapie im Schub', 'Differenzialdiagnose Uveitis und Glaukom'],
        followUp: 'Während Schüben',
        source: null,
      ),
      const Condition(
        id: 'lens_induced_glaucoma',
        name: 'Linsen-induziertes Glaukom',
        description: 'Druckerhöhung durch Linsenmaterial (phakolytisch, phakomorph, etc.) oder Linsenluxation.',
        symptoms: ['pain', 'redness', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Katarakt-Operation bzw. Linsenentfernung', 'Drucksenkung bis OP', 'Laser-Kapsulotomie bei Nachstar-bedingt'],
        followUp: 'Postoperativ',
        source: null,
      ),
      const Condition(
        id: 'juvenile_glaucoma',
        name: 'Kongenitales / juveniles Glaukom',
        description: 'Druckerhöhung im Kindesalter; oft Buphthalmus, Tränen und Lichtscheu.',
        symptoms: ['tearing', 'light_sensitivity', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Goniotomie oder Trabekulotomie', 'Drucksenkende Tropfen', 'Regelmäßige Narkoseuntersuchungen'],
        followUp: 'Lebenslang',
        source: null,
      ),
      const Condition(
        id: 'topical_glaucoma_therapy',
        name: 'Topische Glaukomtherapie',
        description: 'Überblick über Augentropfen und Wirkstoffe zur Drucksenkung (Prostaglandine, Betablocker, Carboanhydrasehemmer, etc.).',
        symptoms: ['vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Monotherapie oder Kombination je nach Zielwert', 'Konservierungsmittelfreie Präparate bei Benetzungsstörungen', 'Compliance und Lokalverträglichkeit beachten'],
        followUp: 'Regelmäßige Druck- und Gesichtsfeldkontrolle',
        source: null,
      ),
      const Condition(
        id: 'gonioscopy',
        name: 'Gonioskopie',
        description: 'Beurteilung des Kammerwinkels; wichtig für Glaukomklassifikation und Winkelblock-Risiko.',
        symptoms: ['vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Keine Therapie; Untersuchungsmethode', 'Bei Winkelblock: Laser-Iridotomie oder Katarakt-OP'],
        followUp: 'Bei Glaukom Teil der Verlaufskontrolle',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'retina',
    name: 'Netzhaut',
    icon: '📷',
    description: 'Erkrankungen der Netzhaut und Makula',
    conditions: [
      const Condition(
        id: 'amd',
        name: 'Altersbedingte Makuladegeneration (AMD)',
        description: 'Degenerative Erkrankung der Makula im Alter.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.medium,
        treatment: ['Trockene AMD: AREDS-Vitamine, Rauchstopp', 'Feuchte AMD: Anti-VEGF-Injektionen (z.B. Eylea)'],
        followUp: 'OCT-Kontrollen alle 4-8 Wochen bei feuchter AMD',
        source: null,
      ),
      const Condition(
        id: 'diabetic_retinopathy',
        name: 'Diabetische Retinopathie',
        description: 'Netzhautschädigung durch Diabetes mellitus.',
        symptoms: ['blurred_vision', 'floaters', 'vision_loss_gradual'],
        urgency: Urgency.medium,
        treatment: ['BZ-Einstellung optimieren!', 'Panretinale Laserkoagulation bei proliferativ', 'Anti-VEGF bei Makulaödem'],
        followUp: 'Mindestens jährliche Kontrolle',
        source: null,
      ),
      const Condition(
        id: 'retinal_detachment',
        name: 'Netzhautablösung (Amotio retinae)',
        description: 'Ablösung der Netzhaut vom Pigmentepithel. NOTFALL!',
        symptoms: ['floaters', 'flashes', 'vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['SOFORTIGE OP-Indikation!', 'Lagerung je nach Lokalisation', 'Vitrektomie oder Plombe'],
        followUp: 'Regelmässige Kontrollen über Monate',
        source: null,
      ),
      const Condition(
        id: 'retinal_artery_occlusion',
        name: 'Zentralarterienverschluss',
        description: 'Akuter Verschluss der Netzhautarterie. NOTFALL!',
        symptoms: ['vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['SOFORT! Zeit = Netzhaut', 'Bulbusmassage', 'Carbogen-Inhalation', 'Internistische Abklärung (Emboliequelle)'],
        followUp: 'Kardiologisches/Angiologisches Workup',
        source: null,
      ),
      const Condition(
        id: 'pvd',
        name: 'Hintere Glaskörperabhebung',
        description: 'Physiologische Ablösung des Glaskörpers von der Netzhaut.',
        symptoms: ['floaters', 'flashes'],
        urgency: Urgency.medium,
        treatment: ['Netzhautperfusionskontrolle!', 'Bei Riss: Laserkoagulation'],
        followUp: 'Kontrolle nach 6-8 Wochen',
        source: null,
      ),
      const Condition(
        id: 'retinal_vein_occlusion',
        name: 'Zentralvenenverschluss / Venenastverschluss',
        description: 'Verschluss der Zentralvene oder eines Astes; Netzhautblutungen und Ödem, Visusminderung.',
        symptoms: ['vision_loss_sudden', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Anti-VEGF-Injektionen bei Makulaödem', 'Laser bei ischämischer Form oder Neovaskularisation', 'Systemische Risikofaktoren einstellen'],
        followUp: 'Regelmäßige OCT und Kontrolle auf Neovaskularisation',
        source: null,
      ),
      const Condition(
        id: 'retinal_tear',
        name: 'Netzhautriss / -foramen',
        description: 'Einriss oder Loch in der Netzhaut; Risiko für Amotio. Bei Symptomen (Lichtblitze, Mouches) rasch abklären.',
        symptoms: ['floaters', 'flashes', 'vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['Laserkoagulation oder Kryokoagulation um den Riss', 'Lagerung je nach Lokalisation', 'Bei Amotio: OP'],
        followUp: 'Kontrolle nach 1–2 Wochen',
        source: null,
      ),
      const Condition(
        id: 'macular_hole',
        name: 'Makulaforamen',
        description: 'Loch in der Makula; zentrale Visusminderung. Idiopathisch oder nach Trauma/PVD.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.medium,
        treatment: ['Vitrektomie mit Membranentfernung und Gas-Tamponade', 'Kopfposition postoperativ'],
        followUp: 'Postoperativ engmaschig',
        source: null,
      ),
      const Condition(
        id: 'epiretinal_membrane',
        name: 'Epiretinale Membran',
        description: 'Zellmembran auf der Makula; Verzerrtsehen und zentrale Visusminderung.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Beobachtung bei leichten Fällen', 'Vitrektomie mit Membranentfernung bei deutlicher Visusbeeinträchtigung'],
        followUp: 'Verlaufskontrolle',
        source: null,
      ),
      const Condition(
        id: 'crcs',
        name: 'Chorioretinopathia centralis serosa (CRCS)',
        description: 'Seröse Abhebung der neurosensorischen Netzhaut in der Makula; oft bei Stress, Typ-A-Persönlichkeit.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Spontanheilung häufig', 'Laser oder Photodynamik bei chronischem Verlauf', 'Reduktion von Steroiden falls möglich'],
        followUp: 'Kontrolle bis Rückbildung',
        source: null,
      ),
      const Condition(
        id: 'hypertensive_retinopathy',
        name: 'Hypertensive Retinopathie',
        description: 'Netzhautveränderungen bei Bluthochdruck; Gefäßveränderungen, Cotton-Wool-Herde, Exsudate.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.medium,
        treatment: ['Blutdruckeinstellung', 'Augen: Kontrolle, bei Makulaödem evtl. Laser'],
        followUp: 'Internistisch und augenärztlich',
        source: null,
      ),
      const Condition(
        id: 'retinoblastoma',
        name: 'Retinoblastom',
        description: 'Maligner Augentumor im Kindesalter; Leukokorie und Strabismus sind Warnzeichen.',
        symptoms: ['vision_loss_gradual', 'double_vision'],
        urgency: Urgency.high,
        treatment: ['Sofortige Vorstellung in spezialisiertem Zentrum', 'Laser, Kryo, Chemotherapie, Enukleation je nach Stadium'],
        followUp: 'Lebenslang',
        source: null,
      ),
      const Condition(
        id: 'rop',
        name: 'Frühgeborenen-Retinopathie (ROP)',
        description: 'Gefäßwachstumsstörung der Netzhaut bei Frühgeborenen; Screening und ggf. Laser oder Anti-VEGF nötig.',
        symptoms: ['vision_loss_gradual'],
        urgency: Urgency.high,
        treatment: ['Screening nach Leitlinie', 'Laserkoagulation oder intravitreales Anti-VEGF bei Plus-Erkrankung', 'Verlaufskontrollen'],
        followUp: 'Bis Gefäßreifung abgeschlossen',
        source: null,
      ),
      const Condition(
        id: 'solar_retinopathy',
        name: 'Solarretinopathie',
        description: 'Netzhautschaden durch direkte Sonnenbetrachtung (z.B. bei Sonnenfinsternis).',
        symptoms: ['blurred_vision', 'vision_loss_sudden'],
        urgency: Urgency.medium,
        treatment: ['Keine spezifische Therapie', 'Kortikosteroide in Einzelfällen diskutiert', 'Prognose variabel'],
        followUp: 'Verlaufskontrolle',
        source: null,
      ),
      const Condition(
        id: 'ocular_ischemic_syndrome',
        name: 'Okuläres Ischämiesyndrom',
        description: 'Chronische Minderperfusion des Auges bei Karotisstenose; Schmerzen, Rubeosis, Sekundärglaukom.',
        symptoms: ['vision_loss_gradual', 'pain'],
        urgency: Urgency.high,
        treatment: ['Gefäßchirurgische/angiologische Abklärung', 'Panretinale Laser bei Neovaskularisation', 'Druckbehandlung'],
        followUp: 'Interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'macroaneurysm',
        name: 'Makroaneurysma',
        description: 'Aussackung einer Netzhautarterie; kann zu Exsudaten und Blutungen führen.',
        symptoms: ['blurred_vision', 'vision_loss_sudden'],
        urgency: Urgency.medium,
        treatment: ['Beobachtung oder Laser bei Exsudaten in der Makula', 'Blutdruck einstellen'],
        followUp: 'Bis Rückbildung',
        source: null,
      ),
      const Condition(
        id: 'irvine_gass',
        name: 'Irvine-Gass-Syndrom',
        description: 'Makulaödem nach Katarakt-Operation; zystoide Veränderungen, Visusminderung.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Topische und/oder systemische NSAR/Steroide', 'Anti-VEGF bei persistierendem Ödem', 'Diamox in Einzelfällen'],
        followUp: 'Bis Ödem rückläufig',
        source: null,
      ),
      const Condition(
        id: 'acute_retinal_necrosis',
        name: 'Akute retinale Nekrose (ARN)',
        description: 'Virusbedingte nekrotisierende Retinitis (VZV, HSV); rasche Ausbreitung, Netzhautablösungsrisiko.',
        symptoms: ['vision_loss_sudden', 'floaters', 'pain'],
        urgency: Urgency.high,
        treatment: ['Sofort systemisches Virustatikum (Aciclovir i.v.)', 'Intravitreale Gabe', 'Vitrektomie bei Ablatio'],
        followUp: 'Stationär, dann engmaschig',
        source: null,
      ),
      const Condition(
        id: 'choroidal_folds',
        name: 'Aderhautfalten',
        description: 'Falten der Aderhaut; oft bei Hypotonie, Tumoren oder Entzündung. Bildgebende Abklärung.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Ursache abklären', 'Keine direkte Therapie der Falten'],
        followUp: 'Je nach Ursache',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'uveitis',
    name: 'Uveitis',
    icon: '🔬',
    description: 'Entzündungen der Uvea (Regenbogenhaut, Ziliarkörper, Aderhaut)',
    conditions: [
      const Condition(
        id: 'uveitis_anterior',
        name: 'Uveitis anterior (Iritis)',
        description: 'Entzündung der Regenbogenhaut und des Ziliarkörpers.',
        symptoms: ['pain', 'redness', 'light_sensitivity', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Steroid-Tropfen (z.B. Dexamethason stündlich)', 'Zykloplegikum (Atropin)', 'Synechien verhindern!'],
        followUp: 'Kontrolle nach 2-3 Tagen',
        source: null,
      ),
      const Condition(
        id: 'endophthalmitis',
        name: 'Endophthalmitis',
        description: 'Schwere intraokulare Infektion. NOTFALL!',
        symptoms: ['pain', 'vision_loss_sudden', 'redness'],
        urgency: Urgency.high,
        treatment: ['SOFORT! Intravitreale Antibiotika', 'Evtl. Vitrektomie', 'Systemische Antibiotika'],
        followUp: 'Tägliche Kontrollen',
        source: null,
      ),
      const Condition(
        id: 'uveitis_posterior',
        name: 'Uveitis posterior',
        description: 'Entzündung der Aderhaut und/oder des Glaskörpers; oft infektiös oder autoimmun.',
        symptoms: ['floaters', 'blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.high,
        treatment: ['Ursachenabklärung (Toxoplasmose, Sarkoidose, etc.)', 'Systemische und/oder lokale Steroide', 'Immunsuppression bei chronischem Verlauf'],
        followUp: 'Engmaschig',
        source: null,
      ),
      const Condition(
        id: 'uveitis_intermedia',
        name: 'Uveitis intermedia',
        description: 'Entzündung des Glaskörpers und des pars plana; typisch Schneeball-Opazitäten, oft idiopathisch oder bei MS.',
        symptoms: ['floaters', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Periokulare oder systemische Steroide', 'Bei Rezidiven: Immunsuppression', 'MS ausschließen'],
        followUp: 'Regelmäßige Kontrolle',
        source: null,
      ),
      const Condition(
        id: 'panuveitis',
        name: 'Panuveitis',
        description: 'Entzündung aller Uvea-Abschnitte; Differenzialdiagnosen u.a. Behçet, Sarkoidose, Infektionen.',
        symptoms: ['pain', 'redness', 'floaters', 'blurred_vision', 'vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['Systemische Steroide und Immunsuppression', 'Ursachenabklärung', 'Lokale Therapie ergänzend'],
        followUp: 'Engmaschig, interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'behcet',
        name: 'Morbus Behçet',
        description: 'Systemische Vaskulitis mit oralen und genitalen Ulzera, Haut und Augen; Uveitis oft schwer und rezidivierend.',
        symptoms: ['pain', 'redness', 'floaters', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Immunsuppression (Azathioprin, Cyclosporin, Biologika)', 'Steroid-Burst bei Schub', 'Interdisziplinäre Betreuung'],
        followUp: 'Regelmäßig',
        source: null,
      ),
      const Condition(
        id: 'fuchs_heterochromic',
        name: 'Fuchs-Heterochromie-Iridozyklitis',
        description: 'Chronische leichte Uveitis anterior mit Irisheterochromie und Katarakt; gut auf Steroide ansprechend, aber rezidivierend.',
        symptoms: ['blurred_vision', 'floaters'],
        urgency: Urgency.low,
        treatment: ['Leichte Steroid-Tropfen bei Schub', 'Katarakt-OP bei Einstellung', 'Glaukom beachten'],
        followUp: 'Langfristig',
        source: null,
      ),
      const Condition(
        id: 'toxoplasmosis_retinitis',
        name: 'Toxoplasmose-Retinitis',
        description: 'Parasitäre Retinitis; typisch herdförmige Narben und aktive Satellitenläsionen.',
        symptoms: ['floaters', 'blurred_vision', 'vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['Pyrimethamin plus Sulfadiazin plus Folinsäure oder Alternativen', 'Steroide erst unter Antiparasitikum', 'Bei Immunsuppression Dauerprophylaxe erwägen'],
        followUp: 'Bis Abheilung',
        source: null,
      ),
      const Condition(
        id: 'sarcoidosis_uveitis',
        name: 'Sarkoidose (Uveitis)',
        description: 'Granulomatöse Systemerkrankung; am Auge Uveitis, Konjunktiva-Knötchen, Orbitabeteiligung.',
        symptoms: ['redness', 'floaters', 'blurred_vision', 'pain'],
        urgency: Urgency.medium,
        treatment: ['Systemische und/oder lokale Steroide', 'Immunsuppression bei chronischem Verlauf', 'Internistische Mitbetreuung'],
        followUp: 'Interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'tuberculosis_uveitis',
        name: 'Tuberkulose (Uveitis)',
        description: 'Uveitis als Manifestation einer TB; Abklärung und antituberkulöse Therapie in Zusammenarbeit mit Infektiologie.',
        symptoms: ['pain', 'redness', 'blurred_vision', 'floaters'],
        urgency: Urgency.high,
        treatment: ['Standard-TB-Therapie', 'Steroide zusätzlich nach Rücksprache', 'Keine alleinige Steroid-Therapie ohne TB-Behandlung'],
        followUp: 'Während und nach TB-Therapie',
        source: null,
      ),
      const Condition(
        id: 'cmv_retinitis',
        name: 'Cytomegalovirus (CMV)-Retinitis',
        description: 'Virusretinitis bei Immunsuppression (z.B. HIV); typisch „pizza-artige“ Nekrose.',
        symptoms: ['floaters', 'blurred_vision', 'vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['Systemisches Ganciclovir/Valganciclovir oder Foscarnet', 'Intravitreale Gabe als Bridge', 'HIV-Therapie optimieren'],
        followUp: 'Engmaschig',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'tear_apparatus',
    name: 'Tränenapparat / Trockenes Auge',
    icon: '💧',
    description: 'Erkrankungen des Tränenapparats und des Tränenfilms',
    conditions: [
      const Condition(
        id: 'sjogren',
        name: 'Sjögren-Syndrom',
        description: 'Autoimmunerkrankung mit Entzündung der Tränen- und Speicheldrüsen. Primär oder sekundär (z.B. bei rheumatoider Arthritis).',
        symptoms: ['dry_eyes', 'dry_mouth', 'burning', 'sand_sensation', 'swelling'],
        urgency: Urgency.medium,
        treatment: [
          'Symptomatische Therapie mit Tränenersatzmitteln',
          'Speichelstimulanzien (Pilocarpin 5mg 4x/d)',
          'Immunsuppression bei schweren Fällen',
          'Tränenpünktchenverschluss',
          'Ciclosporin-Tropfen',
        ],
        followUp: 'Interdisziplinäre Betreuung mit Rheumatologie',
        diagnostics: ['Serum-Autoantikörper (SSA/SSB)', 'Schirmer-Test', 'Biopsie der kleineren Speicheldrüsen'],
      ),
      const Condition(
        id: 'meibom_dysfunction',
        name: 'Meibom-Drüsen-Dysfunktion (MGD)',
        description: 'Fehlfunktion der Meibom-Drüsen führt zu instabilem Tränenfilm. Häufigste Ursache des evaporativen trockenen Auges.',
        symptoms: ['dry_eyes', 'burning', 'sticky_secretion', 'crusty_lids', 'blurred_vision'],
        urgency: Urgency.low,
        treatment: [
          'Warme Kompressen 10 Min. 2x täglich',
          'Lidmassage zur Expression der Drüsen',
          'Intensive Lidhygiene',
          'Omega-3-Fettsäuren',
          'Bei schwerem Befall: Tetrazykline systemisch',
          'IPL-Therapie bei chronischen Fällen',
        ],
        followUp: 'Kontrolle nach 4-6 Wochen',
        diagnostics: ['Spaltlampenuntersuchung der Lidränder', 'Tarsusdurchleuchtung', 'Tränenfilmaufreißzeit verkürzt'],
      ),
    ],
  ),
  Category(
    id: 'neuroophthalmology',
    name: 'Neuroophthalmologie',
    icon: '🧠',
    description: 'Erkrankungen des Sehnervs und neurovaskuläre Störungen',
    conditions: [
      const Condition(
        id: 'a_aion',
        name: 'Arteriitische anteriore ischämische Optikusneuropathie (A-AION)',
        description: 'Durch Riesenzellarteriitis verursachte Durchblutungsstörung des Sehnervenkopfs. NOTFALL! Gefahr der Erblindung des zweiten Auges ohne sofortige Therapie.',
        symptoms: ['vision_loss_sudden', 'headache', 'jaw_claudication', 'scalp_tenderness', 'double_vision', 'polymyalgia', 'amaurosis_fugax'],
        urgency: Urgency.high,
        treatment: [
          'SOFORT Hochdosis-Steroidtherapie beginnen (vor Abschluss der Diagnostik)!',
          'Initial Solumedrol 4x250mg/d i.v. für 3 Tage',
          'Ab 4. Tag: Prednison p.o. 1mg/kgKG für 1 Monat, dann langsam reduzieren',
          'Pantozol 40mg 1x/d + Calcium/Vitamin D',
          'ASS Cardio 100mg 1x/d',
          'Stationäre Aufnahme!',
        ],
        followUp: 'Nach Entlassung: Kontrolle nach 1-2 Wochen, dann individuell.',
        diagnostics: ['Klinische Untersuchung: A. temporalis', 'Fundus: Papille', 'Labor: BSR, CRP', 'Temporalis-Biopsie'],
        complications: ['Erblindung des zweiten Auges (ohne Therapie 25-50%)', 'Zentralarterienverschluss', 'Hirninfarkt'],
        source: null,
      ),
      const Condition(
        id: 'n_aion',
        name: 'Nicht-arteriitische AION (N-AION)',
        description: 'Mikrovaskulär bedingte Durchblutungsstörung des Sehnervenkopfs. Typisch bei kleiner Papille und kardiovaskulären Risikofaktoren.',
        symptoms: ['vision_loss_sudden', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: [
          'Aktiver Ausschluss A-AION (Klinik, Labor)!',
          'Einstellung der kardiovaskulären Risikofaktoren',
          'Bei akutem N-AION: 2 Nächte ohne Kissen schlafen',
          'ASS 100mg/d prophylaktisch erwägen',
        ],
        followUp: 'Nach 2 und 4 Wochen, dann nach 3 und 6 Monaten.',
        diagnostics: ['Anamnese', 'Fundus: Hyperämische Papillenschwellung', 'Labor: BSR, CRP zum Ausschluss A-AION', 'Gesichtsfeld'],
        complications: ['Risiko Beteiligung anderes Auge: 15-25%', 'Permanente Gesichtsfelddefekte'],
        source: null,
      ),
      const Condition(
        id: 'optic_neuritis',
        name: 'Optikusneuritis',
        description: 'Entzündung des Sehnervs; oft einseitig, Schmerzen bei Augenbewegung, Visusabfall. MS-Abklärung.',
        symptoms: ['vision_loss_sudden', 'pain'],
        urgency: Urgency.high,
        treatment: ['Steroid-Puls (z.B. Methylprednisolon i.v.)', 'MRT Schädel zur MS-Abklärung', 'Bei MS: Basistherapie'],
        followUp: 'Neurologisch und augenärztlich',
        source: null,
      ),
      const Condition(
        id: 'horner_syndrome',
        name: 'Horner-Syndrom',
        description: 'Störung des sympathischen Nervenwegs; Ptose, Miosis, ggf. Enophthalmus und Anhidrose.',
        symptoms: ['lid_drooping'],
        urgency: Urgency.medium,
        treatment: ['Ursachenabklärung (Apoplex, Karotisdissektion, Tumor)', 'Apomorphin-Test zur Bestätigung', 'Therapie der Ursache'],
        followUp: 'Neurologisch/radiologisch',
        source: null,
      ),
      const Condition(
        id: 'myasthenia_gravis',
        name: 'Myasthenia gravis',
        description: 'Autoimmunerkrankung mit belastungsabhängiger Muskelschwäche; oft okuläre Beteiligung mit Ptose und Doppelbildern.',
        symptoms: ['lid_drooping', 'double_vision'],
        urgency: Urgency.medium,
        treatment: ['Pyridostigmin', 'Immunsuppression', 'Thymektomie bei Thymom', 'Augen: Prismen oder OP bei stabiler Parese'],
        followUp: 'Neurologisch',
        source: null,
      ),
      const Condition(
        id: 'third_nerve_palsy',
        name: 'Oculomotorius-Parese',
        description: 'Lähmung des N. oculomotorius; Ptose, Bulbus nach außen unten, Mydriasis. Aneurysma ausschließen!',
        symptoms: ['lid_drooping', 'double_vision'],
        urgency: Urgency.high,
        treatment: ['Sofort Bildgebung (MRT/MRA) bei kompletter Parese', 'Aneurysma-Klipping/Coiling bei Nachweis', 'Prismen oder OP nach Stabilisierung'],
        followUp: 'Neurologisch/Neurochirurgie',
        source: null,
      ),
      const Condition(
        id: 'fourth_nerve_palsy',
        name: 'Trochlearis-Parese',
        description: 'Lähmung des N. trochlearis; vertikale Doppelbilder, Kopfneigung zur Gegenseite.',
        symptoms: ['double_vision'],
        urgency: Urgency.medium,
        treatment: ['Ursachenabklärung (Trauma, vaskulär, Kongenital)', 'Prismen oder Schiel-OP bei persistierender Parese'],
        followUp: 'Bis Stabilisierung',
        source: null,
      ),
      const Condition(
        id: 'sixth_nerve_palsy',
        name: 'Abducens-Parese',
        description: 'Lähmung des N. abducens; Abduktionsdefizit, horizontale Doppelbilder.',
        symptoms: ['double_vision'],
        urgency: Urgency.high,
        treatment: ['Ursachenabklärung (Druck, vaskulär, Trauma)', 'Bildgebung bei Ausschluss Mikrovaskulär', 'Prismen oder OP nach Verlauf'],
        followUp: 'Neurologisch',
        source: null,
      ),
      const Condition(
        id: 'papilledema',
        name: 'Stauungspapille',
        description: 'Beidseitige Papillenschwellung durch erhöhten Hirndruck; Notfallabklärung nötig.',
        symptoms: ['blurred_vision', 'vision_loss_gradual', 'headache'],
        urgency: Urgency.high,
        treatment: ['Sofort Bildgebung (MRT), dann Liquordruckmessung', 'Ursache behandeln (Tumor, IIH, etc.)', 'Bei IIH: Gewichtsreduktion, Acetazolamid'],
        followUp: 'Neurologisch/Neurochirurgie',
        source: null,
      ),
      const Condition(
        id: 'iih',
        name: 'Idiopathische intrakranielle Hypertension (IIH)',
        description: 'Erhöhter Hirndruck ohne Raumforderung; typisch adipöse Frauen, Kopfschmerzen, Stauungspapille.',
        symptoms: ['headache', 'blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.high,
        treatment: ['Acetazolamid', 'Gewichtsreduktion', 'Lumbalpunktion zur Druckentlastung', 'Shunt bei Visusgefährdung'],
        followUp: 'Neurologisch und augenärztlich',
        source: null,
      ),
      const Condition(
        id: 'optic_atrophy',
        name: 'Optikusatrophie',
        description: 'Atrophie des Sehnervs als Endstadium verschiedener Schädigungen; irreversible Visus- und Gesichtsfeldausfälle.',
        symptoms: ['vision_loss_gradual', 'vision_loss_sudden'],
        urgency: Urgency.medium,
        treatment: ['Ursache abklären und behandeln', 'Keine Wiederherstellung des Nervs möglich', 'Low-Vision-Beratung'],
        followUp: 'Je nach Ursache',
        source: null,
      ),
      const Condition(
        id: 'traumatic_optic_neuropathy',
        name: 'Traumatische Optikusneuropathie',
        description: 'Sehnervenschädigung nach Trauma; rasche Diagnostik und ggf. Dekompression oder Steroide erwägen.',
        symptoms: ['vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['CT/MRT', 'Hochdosierte Steroide kontrovers', 'Chirurgische Dekompression bei Fraktur/Kompression'],
        followUp: 'Neurochirurgisch und augenärztlich',
        source: null,
      ),
      const Condition(
        id: 'toxic_optic_neuropathy',
        name: 'Toxische Optikusneuropathie',
        description: 'Sehnervenschäden durch Noxen (z.B. Methanol, Ethambutol, Tabak-Alkohol).',
        symptoms: ['vision_loss_gradual', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Noxe sofort absetzen', 'Vitamin B-Komplex bei Alkohol/Tabak', 'Bei Methanol: Antidot und Dialyse'],
        followUp: 'Verlaufskontrolle',
        source: null,
      ),
      const Condition(
        id: 'pion',
        name: 'Posteriore ischämische Optikusneuropathie (PION)',
        description: 'Durchblutungsstörung des retrobulbären Sehnervs; z.B. nach großen Operationen mit Blutverlust.',
        symptoms: ['vision_loss_sudden'],
        urgency: Urgency.high,
        treatment: ['A-AION ausschließen', 'Blutdruck und Hämatokrit optimieren', 'Keine etablierte kausale Therapie'],
        followUp: 'Neurologisch',
        source: null,
      ),
      const Condition(
        id: 'drusen_papilla',
        name: 'Drusenpapille',
        description: 'Kalzifizierte Drusen in der Papille; oft beidseits, Pseudopapillenödem, Gesichtsfeldausfälle möglich.',
        symptoms: ['vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Keine Therapie', 'Differenzialdiagnose Stauungspapille', 'Verlaufskontrolle Gesichtsfeld'],
        followUp: 'Jährlich bei Gesichtsfeldauffälligkeiten',
        source: null,
      ),
      const Condition(
        id: 'lhon',
        name: 'Lebersche hereditäre Optikusneuropathie (LHON)',
        description: 'Mitochondriale Erbkrankheit; akute beidseitige Optikusatrophie, vorwiegend junge Männer.',
        symptoms: ['vision_loss_sudden', 'vision_loss_gradual'],
        urgency: Urgency.high,
        treatment: ['Idebenon kann erwogen werden', 'Raucherentwöhnung', 'Genetische Beratung'],
        followUp: 'Langfristig',
        source: null,
      ),
      const Condition(
        id: 'adoa',
        name: 'Autosomal-dominante Optikusatrophie (ADOA)',
        description: 'Erbliche Optikusatrophie mit langsam fortschreitendem Visusverlust.',
        symptoms: ['vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Keine kausale Therapie', 'Low-Vision-Beratung', 'Genetische Beratung'],
        followUp: 'Verlaufskontrolle',
        source: null,
      ),
      const Condition(
        id: 'ino',
        name: 'Internukleäre Ophthalmoplegie (INO)',
        description: 'Störung der konjugierten Blickbewegung durch Läsion im Mittelhirn; typisch bei MS.',
        symptoms: ['double_vision'],
        urgency: Urgency.medium,
        treatment: ['Ursache abklären (MRT)', 'MS-Basistherapie bei Nachweis', 'Prismen bei persistierenden Doppelbildern'],
        followUp: 'Neurologisch',
        source: null,
      ),
      const Condition(
        id: 'functional_vision_loss',
        name: 'Funktioneller Visusverlust',
        description: 'Visusminderung ohne organischen Befund; psychogen oder funktionell. Ausschlussdiagnose.',
        symptoms: ['vision_loss_gradual', 'blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Organische Ursachen ausschließen', 'Einfühlsame Aufklärung', 'Psychologische Mitbetreuung bei Bedarf'],
        followUp: 'Bei Persistenz',
        source: null,
      ),
      const Condition(
        id: 'anisocoria',
        name: 'Anisokorie',
        description: 'Ungleiche Pupillenweite; physiologisch oder bei Horner, Adie, Okulomotoriusparese, etc.',
        symptoms: ['vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Ursache klären (Lichtreaktion, Nahreaktion, Pharmaka)', 'Horner/Adie/III-Parese abgrenzen'],
        followUp: 'Je nach Befund',
        source: null,
      ),
      const Condition(
        id: 'nystagmus',
        name: 'Nystagmus',
        description: 'Rhythmische unwillkürliche Augenbewegungen; kongenital oder erworben, viele Ursachen.',
        symptoms: ['blurred_vision', 'double_vision'],
        urgency: Urgency.medium,
        treatment: ['Ursache abklären', 'Kongenital: Brille, Prismen, ggf. OP', 'Erworben: Therapie der Ursache'],
        followUp: 'Neurologisch bei neu aufgetretenem Nystagmus',
        source: null,
      ),
      const Condition(
        id: 'cluster_headache',
        name: 'Cluster-Kopfschmerzen',
        description: 'Stark einseitige Kopfschmerzattacken mit okulären Begleitsymptomen; oft Ptose, Rötung, Tränen.',
        symptoms: ['headache', 'redness', 'tearing'],
        urgency: Urgency.medium,
        treatment: ['Sauerstoff und Triptane akut', 'Verapamil zur Prophylaxe', 'Neurologische Mitbehandlung'],
        followUp: 'Neurologisch',
        source: null,
      ),
      const Condition(
        id: 'trigeminal_neuralgia',
        name: 'Trigeminusneuralgie',
        description: 'Anfallsartige Gesichtsschmerzen im Versorgungsgebiet des N. trigeminus; Augenbereich kann betroffen sein.',
        symptoms: ['pain'],
        urgency: Urgency.medium,
        treatment: ['Carbamazepin oder Oxcarbazepin', 'Bei Refraktarität: OP (MVD) oder interventionell'],
        followUp: 'Neurologisch',
        source: null,
      ),
      const Condition(
        id: 'hypophysis_tumor',
        name: 'Hypophysentumor',
        description: 'Tumoren der Hypophyse können Chiasma und Okulomotorik beeinträchtigen; Gesichtsfeld und Motilität prüfen.',
        symptoms: ['vision_loss_gradual', 'double_vision'],
        urgency: Urgency.high,
        treatment: ['MRT', 'Neurochirurgische oder strahlentherapeutische Behandlung', 'Endokrinologische Mitbetreuung'],
        followUp: 'Interdisziplinär',
        source: null,
      ),
      const Condition(
        id: 'visual_hallucinations',
        name: 'Visuelle Halluzinationen',
        description: 'Wahrgenommene Bilder ohne äußeren Reiz; Differenzierung Charles-Bonnet, Migräne, psychiatrisch, etc.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Ursache abklären', 'Charles-Bonnet: Aufklärung, ggf. Verbesserung der Sehfähigkeit', 'Psychiatrisch: entsprechende Therapie'],
        followUp: 'Je nach Ursache',
        source: null,
      ),
      const Condition(
        id: 'photophobia',
        name: 'Photophobie',
        description: 'Lichtscheu; kann bei Migräne, Uveitis, Albinismus, trockenem Auge und vielen anderen vorkommen.',
        symptoms: ['light_sensitivity'],
        urgency: Urgency.low,
        treatment: ['Ursache behandeln', 'Sonnenbrille, getönte Gläser', 'Bei Migräne: Migränetherapie'],
        followUp: 'Bei persistierender Ursache',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'pediatrics',
    name: 'Pädiatrie',
    icon: '👶',
    description: 'Augenerkrankungen und Untersuchungen im Kindesalter',
    conditions: [
      const Condition(
        id: 'amblyopia',
        name: 'Amblyopie',
        description: 'Entwicklungsbedingte Sehschwäche eines Auges ohne organischen Befund; früh erkennen und behandeln.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.medium,
        treatment: ['Okklusion des besseren Auges', 'Brillenkorrektur', 'Bildschirm- und Naharbeit einschränken', 'Behandlung vor Schulalter optimieren'],
        followUp: 'Bis Abschluss des visuellen Reifeprozesses',
        source: null,
      ),
      const Condition(
        id: 'congenital_cataract',
        name: 'Kongenitale und frühkindliche Katarakt',
        description: 'Trübung der Linse von Geburt an oder in der Kindheit; kann Amblyopie verursachen.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.high,
        treatment: ['Frühe Operation bei visusrelevanten Trübungen', 'Aphakie-Korrektur (Brille, Kontaktlinse, IOL)', 'Amblyopiebehandlung'],
        followUp: 'Langfristig',
        source: null,
      ),
      const Condition(
        id: 'aniridia',
        name: 'Aniridie',
        description: 'Angeborenes Fehlen oder starke Unterentwicklung der Iris; oft mit Glaukom und Nystagmus.',
        symptoms: ['light_sensitivity', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Brille, getönte Gläser', 'Druckkontrolle', 'Genetische Abklärung (WAGR)'],
        followUp: 'Regelmäßig',
        source: null,
      ),
      const Condition(
        id: 'csnb',
        name: 'Kongenitale stationäre Nachtblindheit (CSNB)',
        description: 'Erbliche Störung der Netzhaut mit Nachtblindheit und oft Myopie.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Brillenkorrektur', 'Keine kausale Therapie', 'Genetische Beratung'],
        followUp: 'Verlaufskontrolle',
        source: null,
      ),
      const Condition(
        id: 'children_glasses',
        name: 'Kinderbrillen',
        description: 'Hinweise zur Verordnung und Anpassung von Brillen bei Kindern.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Korrektur nach Refraktion (evtl. unter Zykloplegie)', 'Kunststoffgläser, bruchsicher', 'Regelmäßige Kontrolle'],
        followUp: 'Je nach Alter und Befund',
        source: null,
      ),
      const Condition(
        id: 'skiaskopie',
        name: 'Skiaskopie',
        description: 'Objektive Refraktionsbestimmung mittels Lichtreflex; besonders bei Kindern und Kooperationsschwierigkeiten.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Untersuchungsmethode', 'Brille nach Ergebnis'],
        followUp: 'Teil der pädiatrischen Kontrolle',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'strabismus',
    name: 'Strabismus',
    icon: '👀',
    description: 'Schielen und Motilitätsstörungen',
    conditions: [
      const Condition(
        id: 'strabismus_general',
        name: 'Strabismus – Allgemeines',
        description: 'Abweichung der Blickrichtung eines Auges; Formen und Ursachen vielfältig, Amblyopie- und Doppelbildrisiko.',
        symptoms: ['double_vision', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Brille, Okklusion bei Amblyopie', 'Prismen oder Schiel-OP je nach Form', 'Früher Beginn bei Kindern'],
        followUp: 'Regelmäßig bis Stabilität',
        source: null,
      ),
      const Condition(
        id: 'esotropia',
        name: 'Esotropie',
        description: 'Einwärtsschielen; angeboren, akkommodativ oder erworben.',
        symptoms: ['double_vision'],
        urgency: Urgency.medium,
        treatment: ['Brille bei Akkommodation', 'Okklusion bei Amblyopie', 'OP bei Restwinkel'],
        followUp: 'Bis Stabilität',
        source: null,
      ),
      const Condition(
        id: 'exotropia',
        name: 'Exotropie',
        description: 'Auswärtsschielen; intermittierend oder konstant.',
        symptoms: ['double_vision'],
        urgency: Urgency.low,
        treatment: ['Brille, Okklusion bei Amblyopie', 'OP bei konstantem oder störendem Winkel'],
        followUp: 'Regelmäßig',
        source: null,
      ),
      const Condition(
        id: 'vertical_deviations',
        name: 'Vertikale Deviationen',
        description: 'Vertikales Schielen; oft bei Trochlearis-Parese oder Restriktion.',
        symptoms: ['double_vision'],
        urgency: Urgency.medium,
        treatment: ['Prismen', 'OP (Muskelvorlagerung/-rücklagerung)'],
        followUp: 'Bis Stabilität',
        source: null,
      ),
      const Condition(
        id: 'duane_syndrome',
        name: 'Duane-Retraktionssyndrom',
        description: 'Kongenitale Motilitätsstörung mit Einziehungsphänomen bei Adduktion; oft geringe Beschwerden.',
        symptoms: ['double_vision'],
        urgency: Urgency.low,
        treatment: ['Prismen oder OP nur bei störendem Winkel oder Kopfzwangshaltung'],
        followUp: 'Bei Beschwerden',
        source: null,
      ),
      const Condition(
        id: 'brown_syndrome',
        name: 'Brown-Syndrom',
        description: 'Einschränkung der Hebung in Adduktion; oft kongenital.',
        symptoms: ['double_vision'],
        urgency: Urgency.low,
        treatment: ['OP bei starker Kopfzwangshaltung oder Doppelbildern'],
        followUp: 'Bei Beschwerden',
        source: null,
      ),
    ],
  ),
  Category(
    id: 'examinations',
    name: 'Untersuchungstechniken',
    icon: '🔬',
    description: 'Klinische Untersuchungs- und Diagnostikverfahren',
    subCategories: [
      Category(
        id: 'psychophysical_tests',
        name: 'Psychophysische Tests',
        icon: '🧠',
        description: 'Sehschärfen- und Kontrastempfindlichkeitsmessung',
        conditions: [
          const Condition(
            id: 'visual_acuity',
            name: 'Sehschärfeprüfung (Visusprüfung)',
            description: 'Standardisierte Messung der räumlichen Auflösungsfähigkeit des visuellen Systems mittels Optotypen.',
            symptoms: [],
            urgency: Urgency.low,
            treatment: ['ETDRS-Tafel als Goldstandard', 'Snellen-Tafel weit verbreitet', 'LogMAR für Forschung und Verlauf'],
            followUp: 'Standardteil jeder ophthalmologischen Untersuchung',
            source: null,
            wikiContent: """
## Definition und Grundlagen

Die Sehschärfe (Visus) misst die räumliche Auflösungsfähigkeit des visuellen Systems – also die Fähigkeit des Auges, feine Details zu erkennen.¹ Sie ist der am häufigsten verwendete Test zur Beurteilung der Sehfunktion und wird standardmäßig **monokular mit bestmöglicher Korrektur** gemessen.² ³

---

## Grundprinzip – Minimum Angle of Resolution (MAR)

Die Sehschärfe basiert auf dem **minimalen Auflösungswinkel** (MAR) – dem kleinsten Sehwinkel, unter dem ein Optotyp noch korrekt erkannt werden kann.

- **Normaler Visus** (1,0 bzw. 20/20): MAR = **1 Bogenminute**
- Je schlechter die Sehschärfe, desto größer der MAR¹ ⁴

---

## Durchführung

Die Fernvisusprüfung erfolgt in einem leicht abgedunkelten Raum bei einer Testdistanz von typischerweise **20 Fuß (6 Meter)** oder **4 Meter (ETDRS)**.² ⁵

- **Monokular** testen mit aktueller Korrektur (Gegenauge mit Okkluder abdecken)
- **Fernvisus:** 6 m / 20 Fuß / 4 m (je nach Tafel)
- **Nahvisus:** Lesekarte bei 35–40 cm² ⁵ ⁶

> **Goldstandard:** Die ETDRS-Tafel gilt als Goldstandard der Visusprüfung in der klinischen Forschung.⁵

---

## Snellen-Visus

1862 von Hermann Snellen entwickelt, weltweit am häufigsten verwendet.³ Notation als Bruch:

**Snellen-Visus = Testdistanz / Distanz, bei der ein Normalsichtiger die Zeile lesen kann**

- **20/20** (oder 6/6): Normaler Visus¹
- **20/40**: Visus 0,5
- **20/200**: Gesetzliche Blindheit in vielen Ländern¹

### Limitationen³ ⁶ ⁷
- Ungleiche Buchstabenlesbarkeit, ungleiche Zeilenbesetzung
- Nicht-proportionale Abstände, nicht-logarithmische Größenprogression
- **Test-Retest-Variabilität ±0,33 logMAR** (vs. ±0,18 bei ETDRS)⁹
- ETDRS misst im Mittel **6,1 Buchstaben besser**; bei Visus ≤20/160 sogar **12,6 Buchstaben** Differenz¹⁰

---

## LogMAR-Visus

**logMAR = log₁₀(MAR in Bogenminuten) = -log₁₀(Dezimalvisus)**

| logMAR | Dezimalvisus | Snellen |
|---|---|---|
| 0,0 | 1,0 | 20/20 |
| 0,3 | 0,5 | 20/40 |
| 1,0 | 0,1 | 20/200 |
| -0,1 | 1,25 | 20/16 |

### Vorteile¹ ¹¹
- **Lineare, kontinuierliche Skala** → parametrische Statistik möglich
- **Gleichmäßige Abstufung:** 0,1 logMAR/Zeile, 0,02 logMAR/Buchstabe
- **Buchstabe-für-Buchstabe-Auswertung** → höhere Sensitivität

---

## LogMAR-Sehtafeln

### Bailey-Lovie-Tafel (1976)¹²
- **5 Optotypen pro Zeile** (gleiche Anzahl)
- **Logarithmische Größenprogression** (0,1 logMAR/Zeile)
- **Sloan-Buchstaben** gleicher Lesbarkeit
- Charakteristisches umgekehrtes Pyramidendesign

### ETDRS-Tafel (1982) – Goldstandard⁵ ¹¹
- 14 Zeilen mit je 5 Sloan-Buchstaben (C, D, H, K, N, O, R, S, V, Z)
- Standarddistanz: **4 Meter** (retroilluminiert)
- Messbereich: 1,4 logMAR
- **Test-Retest ±0,14 bis ±0,18 logMAR**

---

## Umrechnungstabelle

| Snellen | Dezimal | logMAR | ETDRS-Buchstaben |
|---|---|---|---|
| 20/10 | 2,0 | -0,30 | 100 |
| 20/16 | 1,25 | -0,10 | 90 |
| **20/20** | **1,0** | **0,00** | **85** |
| 20/40 | 0,5 | 0,30 | 70 |
| 20/63 | 0,32 | 0,50 | 60 |
| 20/100 | 0,2 | 0,70 | 50 |
| 20/200 | 0,1 | 1,00 | 35 |

> **Cave:** Snellen → logMAR-Umrechnung ist nicht vollständig reliabel – bis zu 0,2 logMAR Differenz bei schlechtem Visus.¹³

---

## Vergleich Snellen vs. logMAR

| Merkmal | Snellen | LogMAR (ETDRS) |
|---|---|---|
| Optotypen/Zeile | Variabel (1–8) | Konstant (5) |
| Größenprogression | Ungleichmäßig | Logarithmisch |
| Buchstabenlesbarkeit | Unterschiedlich | Standardisiert (Sloan) |
| Test-Retest | ±0,33 logMAR | ±0,14–0,18 logMAR |
| Statistische Eignung | Nicht parametrisch | Lineare Skala |

---

## Weitere Sehtafeln⁶
- **Tumbling-E-Tafel:** Für Analphabeten/Kinder
- **HOTV-Tafel:** Für Kinder (4 Buchstaben H, O, T, V)
- **LEA-Symbole:** Für Kleinkinder
- **Landolt-Ring:** Internationaler Standard-Optotyp
- **Teller Acuity Cards:** Für Säuglinge (preferential looking)

---

## Klinische Empfehlungen

Die **AAO** empfiehlt **Sloan-Buchstaben mit logMAR-Design** (ETDRS) als bevorzugte Optotypen.⁶ Trotzdem nutzen über **49% der Publikationen** weiterhin Snellen.¹⁴

---

## Referenzen

1. Toosy AT, et al. Optic Neuritis. [*Lancet Neurol.* 2014](https://doi.org/10.1016/S1474-4422(13)70259-X)
2. Jacobs DS, et al. Refractive Errors PPP. [*Ophthalmology.* 2023](https://doi.org/10.1016/j.ophtha.2022.10.031)
3. Hussain B, et al. Snellen vs LogMAR. [*Clin Exp Ophthalmol.* 2006](https://doi.org/10.1111/j.1442-9071.2006.01205.x)
4. McAnany JJ, et al. Object Frequency of Visual Acuity. [*Invest Ophthalmol Vis Sci.* 2011](https://doi.org/10.1167/iovs.10-6584)
5. Snow ZE. Visual Acuity as Measurement. [*Methods Mol Biol.* 2022](https://doi.org/10.1007/978-1-0716-2055-7_3)
6. Cruz OA, et al. Amblyopia PPP. [*Ophthalmology.* 2023](https://doi.org/10.1016/j.ophtha.2022.10.030)
7. Lovie-Kitchin JE. Confining Snellen Charts? [*Ophthalmic Physiol Opt.* 2015](https://doi.org/10.1111/opo.12241)
8. Hutchinson AK, et al. Pediatric Eye Evaluations PPP. [*Ophthalmology.* 2023](https://doi.org/10.1016/j.ophtha.2022.10.027)
9. Rosser DA, et al. Reduced logMAR Chart. [*Br J Ophthalmol.* 2001](https://doi.org/10.1136/bjo.85.4.432)
10. Yu HJ, et al. Snellen vs ETDRS. [*Ophthalmol Retina.* 2021](https://doi.org/10.1016/j.oret.2020.07.022)
11. Dong LM, et al. Visual Acuity at Different Distances. [*Arch Ophthalmol.* 2002](https://doi.org/10.1001/archopht.120.11.1523)
12. Bailey IL, Lovie-Kitchin JE. Visual Acuity Testing. [*Vision Res.* 2013](https://doi.org/10.1016/j.visres.2013.05.004)
13. Mataftsi A, et al. Decimal to logMAR Conversion. [*Graefes Arch Clin Exp Ophthalmol.* 2019](https://doi.org/10.1007/s00417-019-04344-9)
14. Tsou BC, Bressler NM. Visual Acuity Reporting. [*JAMA Ophthalmol.* 2017](https://doi.org/10.1001/jamaophthalmol.2017.3107)
""",
            wikiSummary: """
## Kurzzusammenfassung

**Visusprüfung** = Messung räumlicher Auflösung. Standard: monokular, beste Korrektur, **6 m / 4 m**.

---

### Notationssysteme
| System | Normalvisus | Beispiel |
|---|---|---|
| **Snellen** | 20/20 oder 6/6 | 20/40 = 0,5 |
| **Dezimal** | 1,0 | 0,5 |
| **logMAR** | 0,0 | 0,3 |
| **ETDRS-Buchst.** | 85 | 70 |

---

### Goldstandard
- **Klinische Forschung:** ETDRS-Tafel (4 m, 5 Sloan-Buchstaben/Zeile)
- **AAO-Empfehlung:** Sloan-Buchstaben mit logMAR-Design
- **Test-Retest:** ETDRS ±0,14 vs. Snellen ±0,33 logMAR

---

### Wichtig
- **MAR 1 Bogenminute** = normaler Visus (20/20)
- ETDRS misst im Mittel **6,1 Buchstaben besser** als Snellen
""",
          ),
          const Condition(
            id: 'contrast_sensitivity',
            name: 'Kontrastempfindlichkeit',
            description: 'Misst die Fähigkeit, feine Helligkeitsunterschiede wahrzunehmen – komplementär zur Sehschärfe.',
            symptoms: [],
            urgency: Urgency.low,
            treatment: ['Pelli-Robson-Tafel (Goldstandard klinisch)', 'Mars Letter Test (kompakter)', 'qCSF (computerbasiert, adaptiv)'],
            followUp: 'Bei spezifischen Indikationen (Glaukom, AMD, Katarakt, Optikusneuritis)',
            source: null,
            wikiContent: """
## Definition und Grundlagen

Die **Kontrastempfindlichkeit (CS)** beschreibt die Fähigkeit des visuellen Systems, feine Unterschiede in **Helligkeit (Luminanz)** zwischen einem Objekt und seiner Umgebung wahrzunehmen.¹ ²

> Während der Visus nur die räumliche Auflösung bei **maximalem Kontrast** misst, erfasst die CS die gesamte Bandbreite der visuellen Leistungsfähigkeit unter **alltagsnahen Bedingungen**.²

**Michelson-Kontrast = (L_max − L_min) / (L_max + L_min)**

**CS = 1 / Kontrastschwelle**

Angabe in **log-Einheiten (logCS):** Normalwert ca. **1,5–2,0 logCS** (Kontrastschwelle 1–3%).³ ⁴

---

## Kontrastempfindlichkeitsfunktion (CSF)

Die **CSF** beschreibt die CS als Funktion der **Ortsfrequenz** (cycles per degree, cpd):⁵ ⁶

### Charakteristische Form (umgekehrte U-Form, bandpass)
- **Niedrige Ortsfrequenzen (0,5–1 cpd):** Moderate Empfindlichkeit (grobe Strukturen)
- **Mittlere Ortsfrequenzen (2–6 cpd):** **Maximale Empfindlichkeit (Peak)** – relevant für Gesichtserkennung⁵ ⁷
- **Hohe Ortsfrequenzen (>6 cpd):** Abfallende Empfindlichkeit (Auflösungsgrenze = Visus)⁸ ⁹

> Der **Visus repräsentiert nur einen einzigen Punkt** auf der CSF-Kurve – die höchste Ortsfrequenz bei maximalem Kontrast.²

---

## Neurophysiologische Grundlagen⁵
- **Magnozelluläres System:** Niedrige Ortsfrequenzen, Bewegung; empfindlich bei niedrigen Kontrasten (1–2%)
- **Parvozelluläres System:** Hohe Ortsfrequenzen, Farbsehen
- Verschiedene Erkrankungen können selektiv unterschiedliche CSF-Bereiche beeinträchtigen⁵ ¹⁰

---

## Klinische Bedeutung

> **Visus allein reicht nicht aus:** Patienten mit normalem Visus (20/20) können erhebliche CS-Einschränkungen haben.¹¹ ¹²

Bei **Makulaerkrankungen mit gutem Visus** (≥20/30) ist die CSF signifikant reduziert (1,5–6 cpd).¹² Ausmaß: Retinitis pigmentosa > AMD > Glaukom > Katarakt.¹¹

### Alltagsrelevanz¹ ¹³
- Gesichtserkennung
- Treppenstufen erkennen → **erhöhtes Sturzrisiko**
- Lesen kontrastarmer Texte
- Autofahren bei Dämmerung/Nacht

> Reduktion um 0,3 logCS war assoziiert mit erhöhten Odds für **Glaukom (OR 1,35), Katarakt (OR 1,35), DR (OR 2,05) und AMD (OR 2,08)**.¹³

---

## Testverfahren

### Pelli-Robson-Tafel (Goldstandard klinisch)³ ¹⁴
- **8 Zeilen × 6 Buchstaben** (2 Tripletts/Zeile, alle gleich groß)
- **Kontrastabstufung 0,15 logCS pro Triplett**
- **Testdistanz 1 m** bei ~1–2 cpd (Peak der CSF)
- Auswertung: Letztes Triplett mit ≥2/3 korrekt
- **Normwerte:** ~1,65 logCS bei jungen Erwachsenen; Abnahme ~0,004 logCS/Jahr⁴ ¹⁷
- **Test-Retest:** ±0,18 logCS (normal), ±0,33 (AMD)¹⁸

### Mars Letter Contrast Sensitivity Test¹⁶ ¹⁸
- Kompaktes Format (23 × 35,5 cm), Distanz 50 cm
- Feinere Kontrastabstufung (0,04 logCS/Buchstabe)
- **Beste Repeatability:** ±0,12–0,13 logCS¹⁹

### VISTECH/CSV-1000-Tafel¹ ¹⁴
- Mehrere Ortsfrequenzen (3, 6, 12, 18 cpd)
- Sinusoidale Streifenmuster (Gratings)
- Erfasst gesamte CSF-Kurve

### SPARCS (Computer-basiert)²¹
- Zentrales + peripheres Sehen (4 Quadranten)
- Adaptiver Algorithmus
- ICC Test-Retest 0,61

### Quick CSF (qCSF)¹² ²³
- **Adaptiver Bayesianischer Algorithmus**
- Schätzt gesamte CSF-Kurve aus wenigen Trials (~2–5 min)
- Ergebnis: **AULCSF** (Area Under the Log CSF)

---

## Vergleich der wichtigsten Tests

| Test | Ortsfrequenzen | Repeatability | Besonderheit |
|---|---|---|---|
| **Pelli-Robson** | 1 (Peak) | ±0,18 logCS | Goldstandard klinisch |
| **Mars Letter** | 1 (Peak) | ±0,12–0,13 logCS | Beste Repeatability |
| **VISTECH/CSV-1000** | 5 (3–18 cpd) | Variabel | Gesamte CSF |
| **SPARCS** | Mehrere | ICC 0,61 | Zentral + peripher |
| **qCSF** | Adaptiv | Gut | Schnell, AULCSF |

---

## Klinische Indikationen

Die CS-Testung gehört laut AAO **nicht zur Routineuntersuchung**.²⁴ ²⁵

- **Katarakt:** Bei subjektiven Beschwerden trotz gutem Visus²⁶
- **Glaukom:** CS-Verlust **früher als Visusverlust**¹³ ²²
- **AMD:** CSF reduziert, **selbst bei Visus ≥20/30**¹² ¹⁷
- **Optikusneuritis/MS:** Pelli-Robson sensitiver als Hochkontrast-Visus³
- **Amblyopie:** CS-Defizite auch bei normalem Visus²
- **Refraktive Chirurgie:** Qualitätskontrolle nach LASIK/PRK
- **Low Vision:** Planung von Hilfsmitteln¹

> **MACUSTAR-Studie:** CS war bestes Diskriminationsmerkmal zwischen gesunden Augen und intermediärer AMD (AUC 0,77 vs. 0,69–0,71 für Visus-Tests).²⁷

---

## Einflussfaktoren auf die CS

- **Alter:** Physiologische Abnahme ~0,004 logCS/Jahr¹⁷
- **Beleuchtung:** Mesopische Bedingungen decken Defizite früher auf¹⁷
- **Pupillengröße:** Miosis reduziert CS bei niedrigen Frequenzen
- **Refraktionsfehler:** Unkorrigierter Astigmatismus/Myopie
- **Medientrübung:** Katarakt, Hornhautödem

---

## Referenzen

1. Jackson ML, et al. Vision Rehabilitation PPP. [*Ophthalmology.* 2023](https://doi.org/10.1016/j.ophtha.2022.10.029)
2. Jindra LF, Zemon V. Contrast Sensitivity Testing. [*J Cataract Refract Surg.* 1989](https://doi.org/10.1016/s0886-3350(89)80112-2)
3. Toosy AT, et al. Optic Neuritis. [*Lancet Neurol.* 2014](https://doi.org/10.1016/S1474-4422(13)70259-X)
4. Cryotherapy ROP Group. CS at Age 10. [*Arch Ophthalmol.* 2001](https://doi.org/10.1001/archopht.119.8.1129)
5. Zemon V, et al. CSF and Neurophysiological Bases. [*Vision Res.* 2023](https://doi.org/10.1016/j.visres.2023.108270)
6. Chen G, et al. Noise and CSF. [*PLoS One.* 2014](https://doi.org/10.1371/journal.pone.0090579)
7. Leroux CE, et al. CS and MTF. [*Optom Vis Sci.* 2021](https://doi.org/10.1097/OPX.0000000000001717)
8. Lu ZL, et al. VA-CSF Functional Relationship. [*Invest Ophthalmol Vis Sci.* 2024](https://doi.org/10.1167/iovs.65.1.1)
9. Chung ST, Legge GE. CSF Shape. [*Invest Ophthalmol Vis Sci.* 2016](https://doi.org/10.1167/iovs.15-18084)
10. Meng J, et al. Stimulus Spatial Frequency. [*Exp Brain Res.* 2013](https://doi.org/10.1007/s00221-013-3573-6)
11. Xiong YZ, et al. Acuity-CS Relationship. [*Invest Ophthalmol Vis Sci.* 2020](https://doi.org/10.1167/iovs.61.6.40)
12. Wai KM, et al. CSF in Macular Disease. [*Br J Ophthalmol.* 2022](https://doi.org/10.1136/bjophthalmol-2020-318052)
13. Flaharty K, et al. CS, Eye Disease and QoL. [*Am J Ophthalmol.* 2024](https://doi.org/10.1016/j.ajo.2023.10.016)
14. Leat SJ, Woo GC. CS Tests and Reading Speed. [*Eye.* 1997](https://doi.org/10.1038/eye.1997.211)
15. Bhorade AM, et al. Vision in Clinic vs Home. [*JAMA Ophthalmol.* 2013](https://doi.org/10.1001/jamaophthalmol.2013.4995)
16. Dougherty BE, et al. Mars Letter CS Test. [*Optom Vis Sci.* 2005](https://doi.org/10.1097/01.OPX.0000178060.45554.0c)
17. Maynard ML, et al. Mesopic Pelli-Robson and AMD. [*Acta Ophthalmol.* 2016](https://doi.org/10.1111/aos.12846)
18. Haymes SA, et al. Letter CS Test. [*Invest Ophthalmol Vis Sci.* 2006](https://doi.org/10.1167/iovs.05-1057)
19. Thayaparan K, et al. Two New CS Charts. [*Br J Ophthalmol.* 2007](https://doi.org/10.1136/bjo.2006.107995)
20. Thurman SM, et al. Predicting CSF From Acuity. [*J Vis.* 2016](https://doi.org/10.1167/16.15.15)
21. Gupta L, et al. SPARCS vs Pelli-Robson. [*Eye.* 2017](https://doi.org/10.1038/eye.2017.16)
22. Hirji SH, et al. Glaucoma Macular Damage and CS. [*JAMA Ophthalmol.* 2021](https://doi.org/10.1001/jamaophthalmol.2021.0010)
23. Stalin A, Dalton K. qCSF in Low Vision. [*Invest Ophthalmol Vis Sci.* 2020](https://doi.org/10.1167/iovs.61.6.32)
24. Chuck RS, et al. Comprehensive Adult Eye Evaluation PPP. [*Ophthalmology.* 2021](https://doi.org/10.1016/j.ophtha.2020.10.024)
25. Jacobs DS, et al. Refractive Errors PPP. [*Ophthalmology.* 2023](https://doi.org/10.1016/j.ophtha.2022.10.031)
26. Miller KM, et al. Cataract in Adult Eye PPP. [*Ophthalmology.* 2022](https://doi.org/10.1016/j.ophtha.2021.10.006)
27. Dunbar HMP, et al. MACUSTAR Chart-Based Tests. [*JAMA Ophthalmol.* 2022](https://doi.org/10.1001/jamaophthalmol.2022.2099)
""",
            wikiSummary: """
## Kurzzusammenfassung

**Kontrastempfindlichkeit (CS)** = Wahrnehmung feiner Helligkeitsunterschiede. Komplementär zum Visus.

---

### CSF-Kurve
- **Bandpass-Form** (umgekehrtes U)
- **Peak bei 2–6 cpd** (Gesichtserkennung)
- Normalwert: **1,5–2,0 logCS**

---

### Goldstandard-Tests
| Test | Repeatability | Besonderheit |
|---|---|---|
| **Pelli-Robson** | ±0,18 logCS | Klinischer Goldstandard |
| **Mars Letter** | ±0,12–0,13 logCS | Beste Repeatability |
| **qCSF** | Gut | Schnell, gesamte CSF |

---

### Klinische Bedeutung
> Patienten mit **normalem Visus (20/20)** können erhebliche **CS-Einschränkungen** zeigen.

CS-Defizite oft **früher** als Visusverlust bei:
- Glaukom, AMD, Katarakt, RP, MS

> **MACUSTAR:** CS bestes chart-basiertes Diskriminationsmerkmal für intermediäre AMD (AUC 0,77).
""",
          ),
          const Condition(
            id: 'amsler_test',
            name: 'Amsler-Test (Amsler-Gitter)',
            description: 'Einfacher Test zur Erkennung von Metamorphopsien und zentralen Skotomen im 10°-Gesichtsfeld – wichtigstes Tool für AMD-Heimüberwachung.',
            symptoms: [],
            urgency: Urgency.low,
            treatment: ['Standardtest: Tafel 1 (weißes Gitter auf schwarz)', 'Monokular bei 28-33 cm Abstand', 'Häusliche Selbstüberwachung bei AMD'],
            followUp: 'Bei neuen Verzerrungen/Skotomen sofortige ophthalmologische Kontrolle mit OCT',
            source: null,
            wikiContent: """
## Definition und Geschichte

Das **Amsler-Gitter** ist ein einfaches, kostengünstiges Testinstrument zur Erkennung von **Metamorphopsien** (Verzerrungen gerader Linien) und **Skotomen** (Gesichtsfeldausfällen) im **zentralen Gesichtsfeld (10° um die Fovea)**. Entwickelt in den 1940er-1950er Jahren vom Schweizer Ophthalmologen **Marc Amsler**.¹ ²

> Trotz moderner Bildgebung (OCT) bleibt es aufgrund seiner Einfachheit und Zugänglichkeit ein wertvolles Instrument in der Primärversorgung und im **häuslichen Monitoring**.³

---

## Aufbau des Standard-Amsler-Gitters (Tafel Nr. 1)

- **Quadratisches Gitter** aus gleichmäßig angeordneten horizontalen und vertikalen Linien
- **Gesamtgröße:** 10 × 10 cm (bei 28–30 cm Testdistanz)
- **400 kleine Quadrate** (20 × 20 Linien), jedes Quadrat 5 mm Seitenlänge
- **Zentraler Fixationspunkt** (weiß oder schwarz)
- **Abdeckung:** Zentrales Gesichtsfeld 20° (10° in jede Richtung)
- **Jedes kleine Quadrat = 1° Sehwinkel**¹ ³

> Zwei Varianten: schwarzes Gitter auf weißem Hintergrund oder **weißes Gitter auf schwarzem Hintergrund** (letzteres oft sensitiver).¹

---

## Die 7 Amsler-Tafeln

| Tafel | Beschreibung | Anwendung |
|---|---|---|
| **1 (Standard)** | Weißes Gitter auf schwarz, zentraler Fixationspunkt | Screening Metamorphopsie/Skotome |
| **2** | Wie 1, plus diagonale Linien | Patienten mit Zentralskotom (Diagonalen helfen Fixation) |
| **3** | Rotes Gitter auf schwarz | Farbskotome, papillomakuläre Defekte (Optikusneuritis) |
| **4** | Nur Punkte (keine Linien) | Reduziert Filling-in → sensitiver für Skotome |
| **5** | Horizontale Linien | Spezifisch Metamorphopsie in einer Richtung |
| **6** | Engere Linienabstände im Zentrum | Höhere foveale Auflösung |
| **7** | Feineres zentrales Gitter (8°) | Subtile foveale Veränderungen |

> In der klinischen Praxis wird fast ausschließlich **Tafel 1** verwendet.² ³

---

## Physiologisches Funktionsprinzip

### Detektion von Metamorphopsie⁵ ⁶
**Metamorphopsie** entsteht durch eine **Verschiebung oder Verlagerung der Photorezeptoren** in der Makula. Wenn retinale Pathologien (subretinale Flüssigkeit, Makulaödem, epiretinale Membran) die normale Anordnung stören, werden die Lichtreize an der ursprünglichen Position interpretiert → **gerade Linien erscheinen wellig, verbogen oder verzerrt**.

### Art der Verzerrung als DD-Hinweis
- **Kissenförmig (Pincushion):** Photorezeptoren zentripetal verlagert → typisch für **Makulaforamen**⁶
- **Tonnenförmig (Barrel):** Photorezeptoren zentrifugal verlagert
- **Zentrale Metamorphopsie:** Typisch für **neovaskuläre AMD**¹
- **Diffuse Metamorphopsie:** Eher trockene AMD oder epiretinale Membran¹

### Detektion von Skotomen¹ ⁷
Bei Zerstörung von Photorezeptoren (geographische Atrophie, Narbe) → fehlende visuelle Information → Bereiche erscheinen **fehlend, verschwommen oder grau** (relatives oder absolutes Skotom).

---

## Durchführung¹ ³

1. **Nahkorrektur aufsetzen** (Lesebrille); Testdistanz **28–33 cm**
2. **Monokular** testen: ein Auge abdecken
3. Patient fixiert den **zentralen Punkt** und hält die Fixation stabil
4. Folgende **Fragen** stellen:
   - "Können Sie den zentralen Punkt sehen?"
   - "Können Sie alle 4 Ecken des Gitters gleichzeitig sehen?"
   - "Sind alle Linien gerade und gleichmäßig?"
   - "Gibt es Bereiche, die fehlen, verschwommen, verzerrt oder wellig erscheinen?"
5. Patient markiert auffällige Bereiche auf einer **Kopie des Gitters**
6. **Zweites Auge** testen

---

## Pathologische Befunde

| Befund | Bedeutung |
|---|---|
| **Metamorphopsie** (wellige/verbogene Linien) | Makulaödem, subretinale Flüssigkeit, epiretinale Membran, Makulaforamen |
| **Skotom** (fehlende/graue Bereiche) | Geographische Atrophie, Narbe, fortgeschrittene Makulopathie |
| **Mikropsie/Makropsie** (kleinere/größere Quadrate) | Netzhautödem oder Atrophie |
| **Fehlender Fixationspunkt** | Zentralskotom → fortgeschrittene Makulaerkrankung |

---

## Klinische Indikationen

- **AMD-Monitoring:** Hauptindikation – Selbstüberwachung zur Früherkennung der Konversion trocken → neovaskulär⁸
- **Diabetisches Makulaödem**³
- **Zentrale seröse Chorioretinopathie (CSCR)**³
- **Epiretinale Membran**⁵
- **Makulaforamen**⁶
- **Glaukom:** Detektion moderater bis schwerer zentraler GF-Defekte (Sens. 68%, Spez. 92%)⁹
- **Optikusneuritis:** Tafel 3 (rotes Gitter) besonders sensitiv

> Die **AAO** empfiehlt in den AMD PPP, dass Patienten mit früher AMD und/oder Familienanamnese ihre Sehfunktion mittels **monokularer Testung** (Amsler-Gitter oder elektronisches Home-Monitoring) selbst überwachen sollten.⁸

---

## Diagnostische Genauigkeit

Systematische Metaanalyse von Bjerager et al. (2023):¹

| Vergleich | Sensitivität | Spezifität |
|---|---|---|
| Neovaskuläre AMD vs. gesunde Kontrollen | **67%** (51–79%) | **99%** (85–100%) |
| Neovaskuläre AMD vs. trockene AMD | 71% (60–80%) | 63% (49–51%) |
| Glaukomatöse zentrale Defekte (10-2 VF) | 68% | 92% |

> **Klinisch bedeutsam:** Im klinisch relevanten Szenario (neovaskuläre vs. trockene AMD) verfehlt das Amsler-Gitter **1 von 3 Augen** mit neovaskulärer AMD.¹

---

## Limitationen

### Perceptual Completion (Filling-in-Phänomen)
**Die wichtigste Limitation:** Das Gehirn ergänzt fehlende visuelle Information automatisch anhand des umgebenden Musters. Da das Gitter hochregelmäßig ist, kann das visuelle System Skotome **"auffüllen"** → Patient sieht ein vollständiges Gitter trotz vorhandenem Skotom.¹⁰ ¹¹

> Studien zeigen, dass die Sensitivität dadurch auf **unter 50%** fallen kann.

### Troxler-Effekt (Fade-from-View)
Bei stabiler Fixation auf den zentralen Punkt **verblassen periphere Teile** des Gitters physiologisch → Detektion peripherer Defekte erschwert.⁷

### Fixationsinstabilität
Patienten mit Zentralskotom **können den Fixationspunkt nicht sehen** und fixieren exzentrisch → unzuverlässige Ergebnisse.¹⁰

### Weitere Limitationen
- **Subjektiv:** Abhängig von Patientencompliance, Verständnis und Motivation
- **Keine Quantifizierung:** Nur qualitative Ergebnisse⁷
- **Nur statisch:** Keine dynamischen Veränderungen erfassbar
- **Häuslich vs. überwacht:** Sensitivität im häuslichen Setting noch niedriger¹
- **Falsch-positive:** Patienten mit trockener AMD/großen Drusen können Verzerrungen berichten, die nicht auf CNV hinweisen¹

---

## Modernere Alternativen

| Verfahren | Beschreibung |
|---|---|
| **Preferential Hyperacuity Perimetry (ForeseeHome)** | Computerbasiert, Vernier-Akuität; höhere Sensitivität, aber mehr falsch-positive¹ |
| **M-Charts** | Quantifizieren Metamorphopsie in Bogenminuten; etwas sensitiver¹ ⁵ |
| **MacuFlow** | Bewegtes Gitter (Optic-Flow), reduziert Troxler-Effekt⁷ |
| **Smartphone-Apps (Alley, myVisionTrack)** | Digitale Metamorphopsie-Tests mit adaptiven Algorithmen¹ |
| **3D-Computer-Automated Threshold Amsler Grid** | Detektiert Metamorphopsie, die Standard-Amsler nicht erfasst¹ |

---

## Zusammenfassung

> Das Amsler-Gitter bleibt trotz seiner Limitationen ein **wertvolles, kostengünstiges Screening-Instrument** für zentrale Gesichtsfelddefekte, insbesondere zur **häuslichen Selbstüberwachung bei AMD-Patienten**.³ ⁸

**Stärken:** Hohe **Spezifität (99%** vs. gesunde Kontrollen), einfache Handhabung.

**Schwächen:** Moderate **Sensitivität (67–71%)**, Filling-in-Phänomen.

> **Wichtig:** Ein normales Amsler-Gitter **schließt eine Makulaerkrankung NICHT aus**.¹ ¹¹ Neue Symptome oder Veränderungen sollten stets eine zeitnahe ophthalmologische Untersuchung mit **OCT** veranlassen.⁸

---

## Referenzen

1. Bjerager J, et al. Diagnostic Accuracy of Amsler Grid for Neovascular AMD: Meta-Analysis. [*JAMA Ophthalmol.* 2023](https://doi.org/10.1001/jamaophthalmol.2023.0468)
2. Marmor MF. A Brief History of Macular Grids. [*Surv Ophthalmol.* 2000](https://doi.org/10.1016/s0039-6257(00)00112-0)
3. Estreicher A, et al. The Amsler Grid in Everyday Practice. [*Clin Ophthalmol.* 2025](https://doi.org/10.2147/OPTH.S507934)
4. Apte RS. Age-Related Macular Degeneration. [*N Engl J Med.* 2021](https://doi.org/10.1056/NEJMcp2102061)
5. Hanumunthadu D, et al. Clinical Update on Metamorphopsia. [*Curr Eye Res.* 2021](https://doi.org/10.1080/02713683.2020.1857776)
6. Saito Y, et al. Visual Performance and Metamorphopsia in Macular Holes. [*Arch Ophthalmol.* 2000](https://doi.org/10.1001/archopht.118.1.41)
7. Frisén L. The Amsler Grid in Modern Clothes. [*Br J Ophthalmol.* 2009](https://doi.org/10.1136/bjo.2008.150565)
8. Vemulakonda GA, et al. AMD Preferred Practice Pattern. [*Ophthalmology.* 2025](https://doi.org/10.1016/j.ophtha.2024.10.020)
9. Su D, et al. Amsler Grid Test in Glaucomatous Central VF Defects. [*Ophthalmology.* 2016](https://doi.org/10.1016/j.ophtha.2015.10.046)
10. Achard OA, et al. Role of Completion Phenomenon in Amsler Grid. [*Am J Ophthalmol.* 1995](https://doi.org/10.1016/s0002-9394(14)70863-4)
11. Crossland M, Rubin G. The Amsler Chart: Absence of Evidence Is Not Evidence of Absence. [*Br J Ophthalmol.* 2007](https://doi.org/10.1136/bjo.2006.113159)
""",
            wikiSummary: """
## Kurzzusammenfassung

**Amsler-Gitter** = einfacher Test zur Detektion von **Metamorphopsien** und **zentralen Skotomen** (10° um Fovea). Wichtigstes Tool für **AMD-Heimüberwachung**.

---

### Durchführung
- Tafel 1 (Standard): 10×10 cm, 400 Quadrate
- **Monokular**, Testdistanz 28–33 cm
- Mit Lesebrille, zentraler Fixationspunkt

---

### Diagnostische Genauigkeit
| Szenario | Sensitivität | Spezifität |
|---|---|---|
| Neovask. AMD vs. gesund | **67%** | **99%** |
| Neovask. vs. trockene AMD | 71% | 63% |

---

### Hauptlimitationen
- **Filling-in-Phänomen:** Gehirn füllt Skotome auf → Sens. <50%
- **Troxler-Effekt:** Periphere Teile verblassen
- Subjektiv, nicht quantifizierbar
- Verfehlt **1 von 3** neovaskulären AMD

> **Cave:** Normales Amsler **schließt Makulaerkrankung NICHT aus**! Bei Beschwerden → OCT obligat.
""",
          ),
          const Condition(
            id: 'photostress_test',
            name: 'Photostresstest (Macular Photostress Recovery Test)',
            description: 'Misst die Erholungszeit der Makula nach Blendung. Differenziert Makulaerkrankungen von Optikusneuropathien.',
            symptoms: [],
            urgency: Urgency.low,
            treatment: ['Bedside-Test ohne Gerätebedarf', 'Penlight (10 s) oder direktes Ophthalmoskop (30 s)', 'Seitenvergleich mit gesundem Auge'],
            followUp: 'Bei verlängerter PSRT Hinweis auf Makulopathie → OCT empfohlen',
            source: null,
            wikiContent: """
## Definition und Zweck

Der **Photostresstest** (Macular Photostress Recovery Test, PSRT) ist ein einfacher klinischer Test, der die **Erholungszeit der Makula nach Blendung** misst. Er dient primär dazu, bei Patienten mit ungeklärtem zentralem Visusverlust eine **Makulaerkrankung von einer Optikusneuropathie** zu unterscheiden.¹ ²

> **Grundprinzip:** Bei Makulaerkrankungen ist die Erholungszeit verlängert, bei Optikusneuropathien bleibt sie normal.² ³

---

## Physiologisches Grundprinzip – Der visuelle Zyklus

Der Photostresstest basiert auf der **Photopigment-Bleichung und -Regeneration** in den Zapfen-Photorezeptoren der Makula:

### 1. Bleichung (Photostress)
Intensives Licht trifft auf die Makula und bewirkt eine **Photoisomerisierung** des Sehpigments: **11-cis-Retinal** wird durch Lichtenergie zu **all-trans-Retinal**. Dieser Prozess "bleicht" das Photopigment – die Zapfen verlieren vorübergehend ihre Lichtempfindlichkeit. Patient sieht ein Nachbild und kann vorübergehend keine feinen Details erkennen.⁴ ⁵

### 2. Regeneration (Recovery)
Wiederherstellung der Sehfunktion erfordert die Rückumwandlung über den **visuellen Zyklus** im **retinalen Pigmentepithel (RPE)**:⁴ ⁵ ⁶

1. All-trans-Retinal → Reduktion zu all-trans-Retinol (in Photorezeptoren)
2. Transport zum RPE via **IRBP** (Interphotoreceptor Retinoid-Binding Protein)
3. Veresterung durch **LRAT** (Lecithin-Retinol-Acyltransferase)
4. Isomerisierung durch **RPE65** → 11-cis-Retinol
5. Oxidation zu 11-cis-Retinal
6. Rücktransport zum Photorezeptor → regeneriertes Sehpigment

> Die Regenerationsrate ist **enzym-limitiert** (nicht erster Ordnung). In menschlichen Zapfen: Ratenkonstante ca. 1,8 min⁻¹ (deutlich schneller als Stäbchen 0,24–0,55 min⁻¹).⁴

### 3. Warum verlängerte PSRT bei Makulaerkrankungen?
Erkrankungen, die das RPE oder die Photorezeptoren schädigen:
- **Geschädigtes RPE** kann 11-cis-Retinal langsamer regenerieren
- **Subretinale Flüssigkeit** stört den Retinoid-Transport
- **Drusen und Lipofuszin** beeinträchtigen die RPE-Funktion
- **Makulaödem** verändert die Photorezeptor-Geometrie

→ **Verlängerte Photostress Recovery Time (PSRT)**³ ⁹

### 4. Warum normale PSRT bei Optikusneuropathien?
Bei Optikusneuropathien sind **Photorezeptoren und RPE intakt**. Schädigung betrifft die postretinale Signalweiterleitung (Ganglienzellen, N. opticus). Visueller Zyklus läuft ungestört → **PSRT normal**.² ³

### Rolle des Makulapigments
Das **Makulapigment (Lutein, Zeaxanthin)** wirkt als optischer Filter, absorbiert kurzwelliges Licht und schützt die Photorezeptoren vor übermäßiger Bleichung.¹¹ Supplementation mit Lutein/Zeaxanthin verbesserte die PSRT signifikant gegenüber Placebo.¹²

---

## Durchführung – Klassische Methode

### Schritt 1 – Baseline-Visus
- Bestkorrigierten Fernvisus monokular bestimmen
- Ergebnis notieren (z.B. 20/25 oder 0,1 logMAR)

### Schritt 2 – Photostress (Blendung)
- Gegenauge abdecken
- Patient blickt direkt in eine helle Lichtquelle:
  - **Margrain & Thomson:** Direktes Ophthalmoskop, **30 Sekunden**, 2–3 cm Abstand¹
  - **Glaser et al.:** Penlight, **10 Sekunden**, 2–3 cm Abstand²
- Lichtquelle entfernen

### Schritt 3 – Recovery-Zeit messen
- Sofort Stoppuhr starten
- Patient liest die Sehtafel
- **Endpunkt:** Zeit bis Patient die Zeile **eine Zeile über dem Baseline-Visus** wieder korrekt liest¹

### Schritt 4 – Vergleich
- Zweites Auge testen
- Bei unilateraler Erkrankung dient gesundes Auge als **Kontrolle (Seitenvergleich)**²

---

## Normwerte und Einflussfaktoren

| Bedingung | Wert |
|---|---|
| Normale PSRT (Ophthalmoskop, 30 s) | Altersabhängig, ca. 15–50 s |
| Normale PSRT (Penlight, 10 s, Glaser) | ~27 s (junge Erwachsene) |
| Normale PSRT (Kontrollen 42–70 J.) | 42,0 ± 17,3 s |
| **PSRT bei Glaukom** | **70,5 ± 35,4 s** (signifikant verlängert) |
| **PSRT bei AMD** | **>60 s, oft >120 s** |
| **PSRT bei Optikusneuropathie** | **Normal** |
| Alterseffekt (ERG-Photostress) | +27 s Zeitkonstante pro Dekade |

### Einflussfaktoren auf die PSRT
- **Alter:** Einziger signifikanter Faktor – verdoppelt sich nahezu zwischen 20. und 80. Lebensjahr¹ ⁹ ¹⁴
- **Pupillengröße:** Kein signifikanter Einfluss¹
- **Ametropie:** Kein signifikanter Einfluss¹
- **Visus (Baseline):** Kein signifikanter Einfluss¹
- **Geschlecht/Rasse/Raucherstatus:** Kein signifikanter Einfluss¹⁶
- **Bleichdauer/-intensität:** Größerer initialer Empfindlichkeitsverlust, aber Erholungsrate weitgehend konstant¹⁰
- **Medientrübung (Katarakt):** Kann Bleichung reduzieren → potenziell kürzere PSRT¹

---

## Klinische Interpretation

### Verlängerte PSRT → Makulaerkrankung

In Glaser et al. (1977): PSRT in 63 Augen mit Makulopathie verlängert, in 20 Augen mit Optikusneuropathie normal.²

**Erkrankungen mit verlängerter PSRT:**
- **AMD** (trockene und neovaskuläre Form); korreliert mit Schweregrad³ ⁹
- **Diabetisches Makulaödem**⁹
- **Zentrale seröse Chorioretinopathie (CSCR)**¹⁷
- Epiretinale Membran
- Makulaforamen
- Zystoides Makulaödem

### Normale PSRT → Optikusneuropathie
- Optikusneuritis
- Ischämische Optikusneuropathie (AION/NAION)
- Kompressive Optikusneuropathie
- Toxische/nutritive Optikusneuropathie² ³

### Sonderfall Glaukom
Auch bei Glaukom kann die PSRT verlängert sein (**70,5 vs. 42,0 s**, p < 0,001).¹³ Erklärt durch retinale Komponente der Glaukomschädigung. Bei extrafovealer SLO-Mikroperimetrie: Verlängerte Zeitkonstante, aber **normale initiale Empfindlichkeitsänderung** (im Gegensatz zur CSCR).¹⁷

---

## Varianten und Weiterentwicklungen

### Macular Automated Photostress (MAP) Test³ ¹⁶
- Standardisierte Version mit **Humphrey-Perimeter**
- Foveale Schwelle vor und nach Photostress (1, 2, 4, 6, 10 min)
- Bei AMD: Baseline-Sensitivität reduziert + Erholungszeit verlängert
- Glaukom beeinflusste foveale Antwortkurve **nicht** (p = 0,343)

### Pupillen-Photostresstest¹⁰
- Objektiv: Erholung der Pupillenkontraktion auf Lichtreize
- **Unabhängig von Patientenkooperation**
- Bei Optikusneuropathie: Geringerer initialer Empfindlichkeitsverlust

### ERG-Photostresstest¹⁴
- Erholung des fokalen 41-Hz-ERG nach Bleichung
- **Objektivere Methode**, gute Repeatability
- Zeitkonstante: +27 s pro Lebensdekade

### Flash-Recovery-Geräte⁹
- Standardisierte Messung mit Xenon-Blitz + UV/IR-Filter
- Newsome et al.: Verschlechterung der trockenen AMD und Makulaödem verlängern PSRT signifikant – **teilweise vor klinischen Symptomen**

### SLO-basierter extrafovealer Photostresstest¹⁷
- Mikroperimetrie an extrafovealen Punkten
- Nützlich bei peripheren Glaukomschäden, extrafovealer CSCR

---

## Limitationen

- **Fehlende Standardisierung:** Verschiedene Lichtquellen, Belichtungszeiten, Endpunkte → große Streubreite¹
- **Subjektiver Endpunkt:** Abhängig von Kooperation und Verständnis
- **Medientrübung:** Katarakt verfälscht Ergebnisse
- **Altersabhängigkeit:** Erfordert altersangepasste Normwerte
- **Nicht spezifisch:** Unterscheidet nicht zwischen verschiedenen Makulopathien
- **Glaukom als Confounder:** PSRT auch bei Glaukom verlängert¹³
- **Sensitivität:** Frühe ARM 29%, AMD 50% (Eger Macular Stressometer)¹⁸

---

## Klinische Bedeutung heute

> Trotz seiner Einfachheit wird der Photostresstest in der modernen Ophthalmologie selten routinemäßig eingesetzt, da **OCT und Autofluoreszenz** eine direkte strukturelle Differenzierung ermöglichen.¹⁹ ²⁰

Er bleibt jedoch ein nützliches **Bedside-Tool**, wenn keine Bildgebung verfügbar ist, und kann als **funktioneller Marker für die Integrität des RPE-Photorezeptor-Komplexes** dienen.

> **Klinisch relevant:** Maculopathien werden häufig als Optikusneuropathien fehldiagnostiziert – in einer Fallserie waren **47 Patienten mit Makulopathie fälschlich als Optikusneuropathie überwiesen**.¹⁹

---

## Referenzen

1. Margrain TH, Thomson D. Sources of Variability in the Clinical Photostress Test. [*Ophthalmic Physiol Opt.* 2002](https://doi.org/10.1046/j.1475-1313.2002.00071.x)
2. Glaser JS, et al. The Photostress Recovery Test in Clinical Assessment. [*Am J Ophthalmol.* 1977](https://doi.org/10.1016/0002-9394(77)90662-7)
3. Dhalla MS, et al. The Macular Automated Photostress Test. [*Am J Ophthalmol.* 2007](https://doi.org/10.1016/j.ajo.2006.09.034)
4. Chen C, et al. The First Steps of the Visual Cycle in Human Rods and Cones. [*Invest Ophthalmol Vis Sci.* 2024](https://doi.org/10.1167/iovs.65.1.18)
5. Choi EH, et al. Retinoids in the Visual Cycle. [*J Lipid Res.* 2020](https://doi.org/10.1194/jlr.TR120000850)
6. Jiang X, Mahroo OA. Human Retinal Dark Adaptation Tracked With ERG. [*J Physiol.* 2022](https://doi.org/10.1113/JP281717)
7. Mahroo OA, Lamb TD. Recovery of Photopic ERG After Bleaching. [*J Physiol.* 2004](https://doi.org/10.1113/jphysiol.2003.060509)
8. Lamb TD, et al. Kinetics of Rhodopsin Regeneration. [*Vision Res.* 2015](https://doi.org/10.1016/j.visres.2015.03.002)
9. Newsome DA, Negreiro M. Reproducible Macular Light Flash Recovery Time. [*Curr Eye Res.* 2009](https://doi.org/10.3109/02713680903164645)
10. Zabriskie NA, Kardon RH. The Pupil Photostress Test. [*Ophthalmology.* 1994](https://doi.org/10.1016/s0161-6420(94)31259-9)
11. Tavazzi S, et al. Macular Pigment in Photostress Attenuation. [*Curr Eye Res.* 2019](https://doi.org/10.1080/02713683.2018.1554150)
12. Hammond BR, et al. Lutein and Zeaxanthin on Photostress Recovery. [*Invest Ophthalmol Vis Sci.* 2014](https://doi.org/10.1167/iovs.14-15553)
13. Sherman MD, Henkind P. Photostress Recovery in Chronic Open Angle Glaucoma. [*Br J Ophthalmol.* 1988](https://doi.org/10.1136/bjo.72.2.144)
14. Wood A, et al. Bleach Duration and Age on ERG Photostress. [*Graefes Arch Clin Exp Ophthalmol.* 2011](https://doi.org/10.1007/s00417-011-1681-1)
15. Lovasik JV. Electrophysiological Investigation of Macular Photostress. [*Invest Ophthalmol Vis Sci.* 1983](https://pubmed.ncbi.nlm.nih.gov/6826308/)
16. Dhalla MS, Fantin A. Macular Photostress Testing With Automated Perimeter. [*Retina.* 2005](https://doi.org/10.1097/00006982-200506000-00003)
17. Horiguchi M, et al. Extrafoveal Photostress Recovery in Glaucoma and CSCR. [*Br J Ophthalmol.* 1998](https://doi.org/10.1136/bjo.82.10.1183)
18. Bartlett H, et al. Eger Macular Stressometer in ARM. [*Ophthalmic Physiol Opt.* 2004](https://doi.org/10.1111/j.1475-1313.2004.00194.x)
19. Vosoughi AR, et al. Maculopathies Misreferred as Optic Neuropathies. [*J Neuroophthalmol.* 2024](https://doi.org/10.1097/WNO.0000000000002100)
20. Biousse V, Newman NJ. Diagnosis and Clinical Features of Optic Neuropathies. [*Lancet Neurol.* 2016](https://doi.org/10.1016/S1474-4422(16)30237-X)
""",
            wikiSummary: """
## Kurzzusammenfassung

**Photostresstest** = Erholungszeit der Makula nach Blendung. **Differenziert Makulopathie vs. Optikusneuropathie**.

---

### Grundprinzip
- **Bleichung** der Photopigmente durch helles Licht
- **Regeneration** über visuellen Zyklus im RPE (RPE65, LRAT)
- **Verlängerte PSRT** = RPE/Photorezeptor-Schädigung
- **Normale PSRT** = Optikusneuropathie

---

### Durchführung
1. Baseline-Visus monokular
2. Penlight 10 s (Glaser) oder Ophthalmoskop 30 s (Margrain)
3. Stoppuhr: Zeit bis Visus eine Zeile über Baseline

---

### Normwerte
| Bedingung | PSRT |
|---|---|
| Kontrollen | 42 ± 17 s |
| **AMD** | **>60–120 s** |
| **Glaukom** | **70 ± 35 s** |
| Optikusneuritis | Normal |

---

### Klinik heute
> **Bedside-Tool** ohne Geräte. Heute ergänzt durch OCT, aber **47 Maculopathien wurden fälschlich als Optikusneuropathie überwiesen** in einer Fallserie!

> **Cave:** Auch Glaukom kann PSRT verlängern (retinale Komponente).
""",
          ),
        ],
      ),
      Category(
        id: 'color_vision_tests',
        name: 'Farbsinnesprüfung',
        icon: '🎨',
        description: 'Tests zur Erkennung und Klassifikation von Farbsinnstörungen',
        conditions: [
          const Condition(
            id: 'color_vision_overview',
            name: 'Farbsinnesprüfung – Übersicht',
            description: 'Erkennung, Klassifikation und Schweregradbestimmung von Farbsinnstörungen. ~8% der Männer, <1% der Frauen betroffen.',
            symptoms: [],
            urgency: Urgency.low,
            treatment: ['Screening: Ishihara/HRR-Tafeln', 'Klassifikation: D-15, CCT, CAD', 'Goldstandard: Anomaloskop (Nagel)'],
            followUp: 'Bei medikamentöser Toxizität (Ethambutol, HCQ) regelmäßige Kontrollen',
            source: null,
            wikiContent: """
## Definition und Grundlagen

Die **Farbsinnesprüfung** dient der Erkennung, Klassifikation und Schweregradbestimmung von Farbsinnstörungen. Das menschliche Farbsehen basiert auf drei retinalen Zapfentypen:¹ ² ³ ⁴

- **L-Zapfen** (rot, lange Wellenlängen)
- **M-Zapfen** (grün, mittlere Wellenlängen)
- **S-Zapfen** (blau, kurze Wellenlängen)

Störungen entstehen, wenn Zapfen **fehlen (Dichromasie)** oder **funktionell verändert (anomale Trichromasie)** sind.

> **Prävalenz:** ~8% der Männer, <1% der Frauen.

---

## Typen der Farbsinnstörung

### Kongenitale Rot-Grün-Defekte
**X-chromosomal rezessiv, häufigste Form**

| Typ | Defekt | Klinik |
|---|---|---|
| **Protanopie** | L-Zapfen fehlen | Rot stark abgedunkelt; Rot/Orange/Gelb ununterscheidbar²,⁵ |
| **Protanomalie** | L-Zapfen verändert | Mildere Rot-Schwäche²,⁶ |
| **Deuteranopie** | M-Zapfen fehlen | Grün-Verlust; Rot/Grün verwechselt, Rot nicht abgedunkelt³,⁵ |
| **Deuteranomalie** | M-Zapfen verändert | **Häufigste** Farbsinnstörung; mild³,⁴ |

> ~75% aller Rot-Grün-Defekte sind anomale Trichromasien (milder).⁴

### Kongenitale Blau-Gelb-Defekte
**Selten, autosomal dominant**

- **Tritanopie/Tritanomalie:** S-Zapfen betroffen → Blau/Grün verwechselt; Dunkelblau vs. Schwarz schwer¹ ⁷

### Schwere Formen
- **Blauzapfen-Monochromasie (BCM):** L+M fehlen (X-chromosomal, ~1:100.000); Visus 20/80–20/200, Nystagmus, Photophobie⁸
- **Achromatopsie:** Alle Zapfen betroffen (autosomal rezessiv); vollständiger Farbverlust, stark reduzierter Visus⁷ ⁹

---

## Testverfahren

### 1. Pseudoisochromatische Tafeln (PIP)

#### Ishihara-Test
- Zahlen/Muster aus farbigen Punkten auf Verwechslungsfarben-Hintergrund
- **Sensitivität 95–99%** für Rot-Grün-Defekte
- **Limitationen:** Kann Tritan-Defekte nicht erkennen, unterscheidet Protan/Deutan unzuverlässig (alle 18 Protanopen in einer Studie als Deutan fehlklassifiziert)
- Lerneffekt: Sensitivität sinkt auf ~80% bei geübten Probanden¹⁰ ¹¹

#### Hardy-Rand-Rittler (HRR)-Test
- Testet **alle drei Farbachsen** (Protan, Deutan, Tritan)
- Bestimmt **Schweregrad** (mild/mittel/schwer)
- **100% korrekte Protan-Identifikation** – dem Ishihara überlegen
- Auch bei reduziertem Visus einsetzbar¹¹ ¹²

### 2. Anordnungstests

#### Farnsworth D-15
- 15 Farbplättchen in richtiger Reihenfolge anordnen
- **Fehlerachse** zeigt Typ der Störung
- Standard für **erworbene Farbsinnstörungen**¹³

#### Lanthony D-15 (desaturiert)
- Gleiche Methode mit blasseren Farben
- **Sensitiver für milde Defekte**¹³ ¹⁴

#### Farnsworth-Munsell 100-Hue-Test
- 85 Farbplättchen
- Detaillierte Quantifizierung
- Nachteil: zeitaufwändig (~20–30 min)¹⁵

### 3. Anomaloskop (Nagel) – Goldstandard
- Zweigeteiltes Feld: Referenzgelb vs. Rot+Grün-Mischung (**Rayleigh-Gleichung**)
- Patient stellt Mischung über Drehknöpfe ein
- **Differenzierung Dichromasie vs. anomale Trichromasie + Schweregrad**
- Normalsichtige finden eine Einstellung; Dichromaten akzeptieren alle; anomale Trichromaten verschoben
- **Nachteile:** teuer, zeitaufwändig, nur Rot-Grün¹⁶ ¹⁷

### 4. Computergestützte Tests

#### Cone Contrast Test (CCT)
- Buchstaben mit abnehmendem Kontrast für L-, M-, S-Zapfen isoliert
- **100% Sensitivität/Spezifität** für Rot-Grün-Defekte
- Nur ~6 min Testdauer¹⁶

#### Colour Assessment and Diagnosis (CAD)
- Farbiger Stimulus auf dynamischem Helligkeitsrauschen
- **6-stufige Kategorisierung** (supernormal bis schwer defizient)
- **Standard der UK Civil Aviation Authority**¹⁸ ¹⁹

#### Cambridge Colour Test
- Landolt-C auf pseudoisochromatischem Hintergrund
- Komplementär zum CAD¹⁸

#### Konan ColourDX HD
- Zapfen-Kontrasttest
- **Erkennt HCQ-Toxizität früher** als Standardtests²⁰

---

## Stufendiagnostik

| Stufe | Tests |
|---|---|
| **Screening** | Ishihara / HRR |
| **Klassifikation** | HRR / CCT / CAD |
| **Definitive Diagnose** | Anomaloskop |

> **Genetische Tests** (Opsin-Gen-Analyse) identifizieren milde Formen – doppelt so viele Betroffene erkannt wie durch PIP allein.²¹

---

## Erkrankungen mit erworbenen Farbsehveränderungen

> Erworbene Defekte betreffen bevorzugt die **Blau-Gelb-Achse**, sind häufig **asymmetrisch, progressiv** und mit anderen Sehstörungen assoziiert.²²

| Erkrankung | Charakteristik |
|---|---|
| **Optikusneuritis/MS** | 76% der ON-Augen, 62% der MS-Augen ohne ON-Anamnese²³ ²⁴ |
| **Glaukom** | Blau-Gelb-Defekte können GF-Verlust vorausgehen¹⁴ ²⁵ |
| **Diabetische Retinopathie** | ~50% der ETDRS-Patienten betroffen²⁶ |
| **AMD** | Frühe Blau-Gelb-Sensitivitätsverluste; retikuläre Pseudodrusen²⁷ ²⁸ |
| **Ethambutol** | 2,25% Optikusneuropathie; bilateral, Zökozentralskotome; bis 50% bleibend²³ ²⁹ |
| **Hydroxychloroquin** | Bull's-Eye-Makulopathie; Frühzeichen vor OCT²⁰ ³¹ |
| **Linezolid/Methanol** | Mitochondriale Optikusneuropathie²³ |
| **PDE-5-Inhibitoren** | Transiente Cyanopsie, reversibel³² |
| **Lösungsmittel** (Styrol, n-Hexan) | Blau-Gelb-Defekte (70%)³³ ³⁴ |

---

## Klinische Anwendung und Empfehlungen

### Pädiatrisches Screening
**AAO:** Farbsehtests **nicht routinemäßig**, sondern bei symptomatischen Kindern oder positiver Familienanamnese. PIP-Tafeln als Standard.³⁵

### Erwachsenen-Screening
Spezialisierte Untersuchung – **nicht routinemäßig** Teil der umfassenden Augenuntersuchung.³⁶ ³⁷

### Medikamenten-Monitoring

#### Ethambutol²⁹ ³⁰
- Baseline-Visus + Farbdiskriminationstest
- **Monatliche Farbsehtests** während der gesamten Therapie
- **Sofortiges Absetzen bei Auffälligkeiten** (ATS/CDC/IDSA)
- Optikusneuropathie häufiger bei >15 mg/kg/Tag
- Bei frühzeitigem Absetzen oft reversibel; bis 50% bleibende Verluste

#### Hydroxychloroquin (AAO 2025)³⁸ ³⁹ ⁴⁰
- Baseline-Fundusuntersuchung
- **Jährliches Screening ab 5 Jahren Einnahme**
- **Primäre Tests:** OCT + Weitfeld-FAF
- Automatisierte Gesichtsfelder nur noch als bestätigender Zusatztest
- Farbsehtests (z.B. ColourDX) als ergänzende Frühindikatoren
- Retinopathie-Risiko **<2% über 10 Jahre** bei ≤5 mg/kg/Tag
- Risikofaktoren: hohe Dosis, Niereninsuffizienz, Tamoxifen, Therapie >5 Jahre

#### Linezolid⁴¹
- Monitoring auf Visusverlust und Farbsehstörungen
- Bei Optikusneuritis unter Ethambutol+Linezolid: **beide absetzen**

### Neuroophthalmologische Diagnostik
- Farbsehtests **zentrales Element** bei Optikusneuropathien
- Dyschromatopsie: sensitiver Frühindikator bei Optikusneuritis
- Persistiert auch bei erhaltenem Visus ≥20/40
- Bei MS auch ohne ON-Anamnese in 62% nachweisbar¹⁴ ²³ ²⁴ ²⁵

### Retinale Erkrankungen
- DR: Korrelation mit Makulaödem-Schwere (~50% betroffen)
- AMD: Frühe Stadien messbar betroffen (CAD korreliert mit Progression)
- **Aktuelle Evidenz reicht NICHT** für Farbsehtests als alleiniges Screening für DR²⁶ ²⁷ ²⁸ ⁴²

### Arbeitsmedizin und Berufseignung
Normales Farbsehen ist Voraussetzung für sicherheitskritische Berufe (Militär, Luftfahrt, Transport). CCT/CAD ermöglichen differenziertere Beurteilung als PIP. Selbst milde Defekte zeigen signifikant **langsamere Reaktionszeiten** in farbkritischen Umgebungen.¹⁷ ¹⁹

### Hereditäre Netzhautdystrophien⁴³
- Optionaler Bestandteil der Erstuntersuchung
- Verlaufskontrollen alle 1–2 Jahre neben Visus, OCT, FAF, Elektrophysiologie

---

## Referenzen

1. Color Vision Deficiency. [*MedlinePlus.* 2015](https://medlineplus.gov/genetics/condition/color-vision-deficiency/)
2. OPN1LW Gene. [*MedlinePlus.* 2015](https://medlineplus.gov/genetics/gene/opn1lw/)
3. OPN1MW Gene. [*MedlinePlus.* 2015](https://medlineplus.gov/genetics/gene/opn1mw/)
4. Rezeanu D, et al. Color Vision Aids for Color Vision Deficiency. [*Opt Express.* 2022](https://doi.org/10.1364/OE.451999)
5. Graham CH, Hsia Y. Color Defect and Color Theory. [*Science.* 1958](https://doi.org/10.1126/science.127.3300.675)
6. Deeb SS, et al. Genotype-Phenotype in Red/Green Color-Vision Defects. [*Am J Hum Genet.* 1992](https://pubmed.ncbi.nlm.nih.gov/1415255/)
7. Kohl S, et al. Achromatopsia. [*GeneReviews.* 2018](https://www.ncbi.nlm.nih.gov/books/NBK1418/)
8. Hartung KJ, et al. Blue Cone Monochromatism. [*Adv Exp Med Biol.* 2025](https://doi.org/10.1007/978-3-031-74304-0)
9. Aboshiha J, et al. The Cone Dysfunction Syndromes. [*Br J Ophthalmol.* 2016](https://doi.org/10.1136/bjophthalmol-2014-306505)
10. Birch J. Efficiency of Ishihara Test for Red-Green CVD. [*Ophthalmic Physiol Opt.* 1997](https://doi.org/10.1046/j.1475-1313.1997.97000341.x)
11. Davison PA, Scanlon G. Diagnosing Protanopia With Screening Tests. [*Optom Vis Sci.* 2020](https://doi.org/10.1097/OPX.0000000000001535)
12. Thiadens AA, et al. Accuracy of Color Vision Tests in Cone Disorders. [*Ophthalmic Epidemiol.* 2013](https://doi.org/10.3109/09286586.2013.788229)
13. Zhao J, et al. Clinical Color Vision Testing and Visual Function. [*Am J Ophthalmol.* 2015](https://doi.org/10.1016/j.ajo.2015.06.029)
14. Adams AJ, et al. Color Discrimination in Glaucoma. [*Invest Ophthalmol Vis Sci.* 1982](https://pubmed.ncbi.nlm.nih.gov/7076415/)
15. Bento-Torres NV, et al. Mollon-Reffin's Ellipses and FM 100-Hue. [*PLoS One.* 2016](https://doi.org/10.1371/journal.pone.0152214)
16. Rabin J, et al. Cone Contrast Test for Rapid Quantification. [*Invest Ophthalmol Vis Sci.* 2011](https://doi.org/10.1167/iovs.10-7008)
17. Gao H, et al. Color Vision Testing in U.S. Military. [*Mil Med.* 2023](https://doi.org/10.1093/milmed/usac233)
18. Parente JR, et al. CAD vs Cambridge Colour Test. [*Vision Res.* 2025](https://doi.org/10.1016/j.visres.2024.108490)
19. Barbur JL, Rodriguez-Carmona M. Colour Vision Requirements in Demanding Occupations. [*Br Med Bull.* 2017](https://doi.org/10.1093/bmb/ldx007)
20. Aldarwesh A, et al. CS and Color Vision for HCQ Toxicity Detection. [*J Clin Med.* 2026](https://doi.org/10.3390/jcm)
21. Arnegard S, et al. Standard PIP vs Genetic Testing in CVD. [*Acta Ophthalmol.* 2022](https://doi.org/10.1111/aos.15091)
22. Simunovic MP. Acquired Color Vision Deficiency. [*Surv Ophthalmol.* 2015](https://doi.org/10.1016/j.survophthal.2015.06.001)
23. Biousse V, Newman NJ. Diagnosis of Optic Neuropathies. [*Lancet Neurol.* 2016](https://doi.org/10.1016/S1474-4422(16)30237-X)
24. Warszawer Y, et al. Digital Color Vision in MS Without ON. [*Eur Neurol.* 2025](https://doi.org/10.1159/000541234)
25. Niwa Y, et al. Acquired CVD in Glaucoma With Rabin CCT. [*Invest Ophthalmol Vis Sci.* 2014](https://doi.org/10.1167/iovs.13-13495)
26. Fong DS, et al. Impaired Color Vision in DR (ETDRS Report 15). [*Am J Ophthalmol.* 1999](https://doi.org/10.1016/s0002-9394(99)00050-1)
27. O'Neill-Biba M, et al. Chromatic Sensitivity in AMD vs Diabetes. [*Ophthalmic Physiol Opt.* 2010](https://doi.org/10.1111/j.1475-1313.2010.00767.x)
28. Vemala R, et al. Early Color Vision Loss in AMD With Drusen. [*Invest Ophthalmol Vis Sci.* 2017](https://doi.org/10.1167/iovs.16-21029)
29. Nahid P, et al. ATS/CDC/IDSA Guidelines on TB Treatment. [*Clin Infect Dis.* 2016](https://doi.org/10.1093/cid/ciw376)
30. Ethambutol Hydrochloride. [*FDA Label.* 2024](https://www.accessdata.fda.gov/drugsatfda_docs/label/)
31. Stelton CR, et al. Hydroxychloroquine Retinopathy. [*Clin Rheumatol.* 2013](https://doi.org/10.1007/s10067-013-2225-3)
32. Li J, et al. Drug-Induced Ocular Disorders. [*Drug Saf.* 2008](https://doi.org/10.2165/00002018-200831020-00002)
33. Beckman S, et al. Acquired CVD in Hexane-Exposed Mechanics. [*Am J Epidemiol.* 2016](https://doi.org/10.1093/aje/kww049)
34. Iregren A, et al. Color Vision and Occupational Chemical Exposures. [*Neurotoxicology.* 2002](https://doi.org/10.1016/s0161-813x(02)00048-0)
35. Hutchinson AK, et al. Pediatric Eye Evaluations PPP. [*Ophthalmology.* 2023](https://doi.org/10.1016/j.ophtha.2022.10.027)
36. Chuck RS, et al. Comprehensive Adult Medical Eye Evaluation PPP. [*Ophthalmology.* 2021](https://doi.org/10.1016/j.ophtha.2020.10.024)
37. Jacobs DS, et al. Refractive Errors PPP. [*Ophthalmology.* 2023](https://doi.org/10.1016/j.ophtha.2022.10.031)
38. Rosenbaum JT, et al. ACR/AAD/RDS/AAO Joint Statement on HCQ. [*Arthritis Rheumatol.* 2021](https://doi.org/10.1002/art.41683)
39. Marmor MF, et al. AAO HCQ Retinopathy Screening (2025 Revision). [*Ophthalmology.* 2026](https://doi.org/10.1016/j.ophtha.2025.10.001)
40. Kim KE, Ahn SJ. HCQ-Induced Retinopathy in Autoimmune Diseases. [*Expert Opin Drug Saf.* 2025](https://doi.org/10.1080/14740338.2024.2436218)
41. Nahid P, et al. ATS/CDC/ERS/IDSA Drug-Resistant TB Guidelines. [*Am J Respir Crit Care Med.* 2019](https://doi.org/10.1164/rccm.201909-1874ST)
42. Rodgers M, et al. Color Vision Testing for DR (Systematic Review). [*Health Technol Assess.* 2009](https://doi.org/10.3310/hta13600)
43. AAO. Inherited Retinal Degenerations Guidelines. [*AAO.* 2022](https://www.aao.org/clinical-statement/guidelines-on-clinical-assessment-patients-inherit)
""",
            wikiSummary: """
## Kurzzusammenfassung

**Farbsinnesprüfung** = Erkennung/Klassifikation/Schweregrad von Farbsinnstörungen.

---

### Häufigste Defekte
- **Rot-Grün** (X-chrom. rezessiv): 8% Männer
  - Deuteranomalie (häufigste)
  - Protanopie (rot fehlt)
- **Blau-Gelb** (selten, autosomal dominant)
- **Achromatopsie** (alle Zapfen)

---

### Stufendiagnostik
| Stufe | Tests |
|---|---|
| **Screening** | Ishihara, HRR |
| **Klassifikation** | D-15, CCT, CAD |
| **Goldstandard** | **Anomaloskop (Nagel)** |

---

### Wichtigste Tests
- **Ishihara:** Sens. 95–99% RG; **Tritan nicht erkennbar**
- **HRR:** Alle Achsen + Schweregrad; 100% Protan
- **D-15 / Lanthony:** Erworbene Defekte
- **CCT/CAD:** Computergestützt, schnell, quantitativ

---

### Klinisch wichtig
- **Ethambutol:** Monatliche Kontrollen!
- **HCQ (AAO 2025):** Jährlich ab 5 J., OCT + FAF primär
- **Optikusneuritis/MS:** 62–76% Dyschromatopsie
- **Glaukom:** Blau-Gelb-Defekte vor GF-Verlust

> **Erworbene Defekte:** vorzugsweise **Blau-Gelb**, asymmetrisch, progressiv.
""",
          ),
        ],
      ),
      Category(
        id: 'tonometry',
        name: 'Augendruckmessung (Tonometrie)',
        icon: '💧',
        description: 'Methoden zur Messung des Augeninnendrucks',
        conditions: [
          const Condition(
            id: 'applanation_tonometry',
            name: 'Applanationstonometrie nach Goldmann (GAT)',
            description: 'Goldstandard zur Messung des Augeninnendrucks (IOD); seit über 60 Jahren Referenzmethode in Forschung und Praxis.',
            symptoms: [],
            urgency: Urgency.low,
            treatment: ['Spaltlampen-basiert mit Fluorescein + Anästhesie', 'Applanationsfläche 3,06 mm', 'Skalenwert × 10 = IOD in mmHg'],
            followUp: 'Bei abnormalen Werten Wiederholung; CCT-Messung als Risikofaktor einbeziehen',
            source: null,
            wikiContent: """
## Definition

Die **Goldmann-Applanationstonometrie (GAT)** ist der international anerkannte **Goldstandard** zur Messung des Augeninnendrucks (IOD) und seit **über 60 Jahren** die Referenzmethode in Forschung und klinischer Praxis.⁵

---

## Physikalisches Prinzip

Die GAT basiert auf dem **Imbert-Fick-Gesetz**: Wird eine dünne, perfekt elastische, kugelförmige Membran abgeflacht (applaniert), entspricht der Druck im Inneren der Kugel dem Verhältnis von aufgebrachter Kraft zur abgeflachten Fläche:⁶

**P = F / A**

Das Auge ist jedoch **keine perfekt elastische Kugel**:
- Hornhaut-**Rigidität** überschätzt den IOD
- Tränenfilm-**Meniskus-Kapillarkraft** unterschätzt den IOD

> **Goldmanns Erkenntnis:** Bei einer Applanationsfläche von exakt **3,06 mm Durchmesser** (~7,35 mm²) heben sich diese beiden gegenläufigen Kräfte auf – vorausgesetzt die zentrale Hornhautdicke (CCT) beträgt ca. **520–550 µm**.⁶

---

## Aufbau des Tonometers

Wird an der Spaltlampe befestigt und besteht aus:
- **Messkörper** mit Federwaage und Einstellrad
- **Transparentes Kunststoff-Prisma (Biprismus)** an der Spitze – spaltet den Tränenfilm-Meniskus in zwei Halbkreise (Miren)
- **Einstellrad** reguliert die Kraft stufenlos (**Skalenwert × 10 = IOD in mmHg**)

---

## Durchführung – Schritt für Schritt

1. **Vorbereitung:** Patient an Spaltlampe, Kinn/Stirn fixiert, geradeaus blicken, nicht blinzeln
2. **Topische Anästhesie:** Oxybuprocain oder Proparacain⁵
3. **Fluorescein-Applikation:** Streifen in unteren Fornix tupfen
4. **Kobaltblaues Licht:** Blaufilter aktivieren → Fluorescein fluoresziert grün-gelb
5. **Annäherung:** Prisma per Joystick zur zentralen Hornhaut führen
6. **Miren-Beurteilung:** Zwei grün-gelb leuchtende Halbkreise
7. **Druckeinstellung:** Innenkanten der Halbkreise sollen sich gerade berühren → Applanation = exakt 3,06 mm
8. **Ablesen:** Skalenwert × 10 = IOD in mmHg (z.B. 1,8 → 18 mmHg)

> **Reihenfolge:** IOD **vor** Gonioskopie oder Pupillenerweiterung messen.⁴

### Fluorescein-Tipp
- **Ohne Fluorescein:** IOD wird um durchschnittlich ~5,6 mmHg unterschätzt
- **Zu viel:** Breite Miren → Überschätzung
- **Zu wenig:** Schmale Miren → Unterschätzung

---

## Normalwerte und Interpretation

- **Mittlerer normaler IOD:** ca. **15 mmHg** (SD ~3 mmHg)
- **Kein zufriedenstellender Grenzwert** für Glaukom-Screening (18 mmHg: nur ~65% Sensitivität/Spezifität)
- **Diurnale Schwankungen** → Tageszeit dokumentieren
- Erfahrene Untersucher weichen in **~10%** der Fälle um ≥3 mmHg voneinander ab → Mehrfachmessungen!⁵

---

## Einflussfaktoren und Fehlerquellen

### Zentrale Hornhautdicke (CCT) – wichtigster Faktor
- **Dicke Hornhaut (>550 µm)** → IOD **überschätzt**
- **Dünne Hornhaut (<550 µm)** → IOD **unterschätzt**
- Faustregel: **~1 mmHg pro 25 µm Abweichung** von 550 µm

> Die **AAO empfiehlt KEINE standardisierte CCT-Korrekturtabelle** – CCT als Risikofaktor in die Gesamtbeurteilung einbeziehen.⁴

### Weitere Fehlerquellen⁷ ⁸
- **Hornhautödem:** Unterschätzung trotz dicker Hornhaut
- **Nach LASIK/PRK:** Signifikante Unterschätzung
- **Hornhautnarben:** Unregelmäßige Miren
- **Konsekutive Messungen:** Mechanische IOD-Reduktion

---

## Vorteile und Limitationen

| Vorteile | Limitationen |
|---|---|
| Goldstandard seit >60 Jahren | Abhängig von CCT und Hornhautbiomechanik |
| Hohe Genauigkeit/Reproduzierbarkeit | Kein validiertes CCT-Korrektur-Nomogramm |
| Relativ kostengünstig | Erfordert Spaltlampe, Fluorescein, Anästhesie |
| Schnell (~1–2 min/Auge) | Erfordert Patientenkooperation (aufrechte Position) |
| Breite Evidenzbasis | Bei Kindern oft nicht durchführbar |
| Alle Glaukomstudien basieren auf GAT | Sehr ungenau bei erkrankten/operierten Hornhäuten |

---

## Alternative Tonometer für spezielle Patientengruppen

### 1. Kinder und nicht-kooperative Patienten

GAT erfordert aufrechte Position und Kooperation. Bei Kindern <10 Jahren gelingt GAT nur in **64%**, NCT in **89%**, Rebound in **75%**.¹¹

| Gerät | Vorteile |
|---|---|
| **iCare-Rebound** | Keine Anästhesie, handgehalten; IOD ~2–3 mmHg höher als GAT |
| **Tono-Pen** | Handgehalten; überschätzt um ~3,2 mmHg vs. GAT |
| **Perkins** | Tragbare GAT, auch liegend/in Narkose; am wenigsten CCT-abhängig bei <6 J. |

> **Untersuchung in Narkose:** Sevofluran senkt IOD, Ketamin erhöht ihn → Werte unter Narkose nie so genau wie wach.¹⁰

### 2. Nach refraktiver Chirurgie (LASIK/PRK/SMILE)

GAT unterschätzt nach myoper LASIK um ~1,5 mmHg (mehr bei hoher Korrektur).⁷ ⁸

| Gerät | Eignung |
|---|---|
| **Corvis ST (bIOP)** | **Beste prä/post-Übereinstimmung** nach FS-LASIK |
| **DCT (Pascal)** | Zweitbeste, weniger CCT-abhängig |
| **ORA (IOPcc)** | Unabhängig von CCT/Hornhautkrümmung |
| **CATS-Prisma** | Konvexes Goldmann-Prisma, ~1,5 mmHg höher (genauer) post-LASIK |

### 3. Keratokonus und Hornhautektasie

GAT zeigt **artifiziell erniedrigte Werte** (verdünnte/biomechanisch geschwächte Hornhaut).¹⁵
- Studienbeispiel: **GAT 10,96 mmHg vs. DCT 15,42 mmHg vs. ORA 14,65 mmHg**

> **AAO-Empfehlung bei Ektasie:** Geräte verwenden, die weniger von glatter Hornhautoberfläche abhängen (DCT, ORA).²

### 4. Hornhautödem
Trotz dicker Hornhaut wird IOD durch GAT **unterschätzt** (veränderte Hydratation/Elastizität). **Pneumotonometer und DCT** bevorzugt.¹

### 5. Heim-Monitoring

**iCare HOME/HOME2:** FDA-zugelassenes Rebound-Tonometer für Selbstmessung.
- Mittlere Abweichung **-0,28 ± 1,57 mmHg** vs. GAT
- Erfasst **diurnale Schwankungen**, die Praxismessungen verpassen
- **74–83%** der Patienten erfolgreich nach Training (auch per Video möglich)¹⁷ ¹⁸ ¹⁹ ²⁰

> Häufigere Heim-Messungen könnten **Progressionsrisiko besser vorhersagen** als gelegentliche Praxismessungen.⁵

### 6. Glaukom-Screening (Entwicklungsländer)
**iCare und NCT** zeigten beste Übereinstimmung mit GAT (ICC 0,69 bzw. 0,65). Eignen sich für Screening-Programme.¹³

---

## Vergleichstabelle: Alternative Tonometer

| Tonometer | Prinzip | Anästhesie | CCT-Abhängigkeit | Eignung |
|---|---|---|---|---|
| **GAT (Goldmann)** | Applanation (Imbert-Fick) | Ja | Hoch | Standard-Referenz |
| **DCT (Pascal)** | Konturanpassung + Piezosensor | Ja | Sehr gering | Post-LASIK, Keratokonus |
| **ORA** | Bidirektionaler Luftstoß | Nein | Gering (IOPcc) | Keratokonus, Biomechanik |
| **Corvis ST** | Scheimpflug + Luftstoß | Nein | Gering (bIOP) | Post-LASIK |
| **Pneumotonometer** | Pneumatischer Sensor | Ja | Mittel | Hornhautödem |
| **iCare (Rebound)** | Magnetisierte Sonde | Nein | Mittel-hoch | Kinder, Heim, Screening |
| **Tono-Pen** | Mikrostrain-Gauge | Ja | Mittel | Notfall, OP |
| **Perkins** | Tragbare GAT | Ja | Hoch (wie GAT) | Liegend, Narkose |
| **Mackay-Marg** | Applanation + Indentation | Ja | Mittel | Irreguläre Hornhaut |

> **Grundsatz:** Es gibt **kein perfektes Tonometer**. Wahl nach klinischer Situation, Patientenkooperation, Hornhautzustand. Entscheidend: bei jedem Patienten **konsistent dieselbe Methode** verwenden.¹ ² ⁹

---

## Referenzen

1. Mian SI, et al. Corneal Edema and Opacification PPP. [*Ophthalmology.* 2024](https://doi.org/10.1016/j.ophtha.2023.12.038)
2. Jhanji V, et al. Corneal Ectasia PPP. [*Ophthalmology.* 2024](https://doi.org/10.1016/j.ophtha.2023.12.039)
3. Hutchinson AK, et al. Pediatric Eye Evaluations PPP. [*Ophthalmology.* 2023](https://doi.org/10.1016/j.ophtha.2022.10.027)
4. Gedde SJ, et al. Primary Open-Angle Glaucoma PPP. [*Ophthalmology.* 2021](https://doi.org/10.1016/j.ophtha.2020.10.022)
5. Jayaram H, et al. Glaucoma: Now and Beyond. [*Lancet.* 2023](https://doi.org/10.1016/S0140-6736(23)01289-8)
6. Kniestedt C, et al. Contour vs Applanation Tonometry. [*Arch Ophthalmol.* 2005](https://doi.org/10.1001/archopht.123.11.1532)
7. Bao F, et al. GAT, DCT, ORA, Corvis ST Post-FS-LASIK. [*Curr Eye Res.* 2020](https://doi.org/10.1080/02713683.2020.1745851)
8. Kilgore KP, et al. CATS Tonometer Post-Myopic LASIK. [*Clin Ophthalmol.* 2025](https://doi.org/10.2147/OPTH)
9. Okafor KC, Brandt JD. Measuring IOP. [*Curr Opin Ophthalmol.* 2015](https://doi.org/10.1097/ICU.0000000000000132)
10. Fayed MA, Chen TC. Pediatric IOP Measurements. [*Surv Ophthalmol.* 2019](https://doi.org/10.1016/j.survophthal.2019.05.003)
11. Feng CS, et al. Rebound, NCT, GAT in Children. [*Am J Ophthalmol.* 2015](https://doi.org/10.1016/j.ajo.2015.06.017)
12. Lambert SR, et al. Rebound Tonometry in Children: AAO. [*Ophthalmology.* 2013](https://doi.org/10.1016/j.ophtha.2013.04.024)
13. Kutzscher AE, et al. Reproducibility of 5 Tonometry Methods. [*Ophthalmol Glaucoma.* 2019](https://doi.org/10.1016/j.ogla.2019.09.009)
14. Studer MK, et al. GAT, iCare, Tono-Pen in Children Under GA. [*J Clin Med.* 2025](https://doi.org/10.3390/jcm14010001)
15. Bayer A, et al. ORA, DCT, GAT in Keratoconus. [*J Glaucoma.* 2010](https://doi.org/10.1097/IJG.0b013e3181af321b)
16. Mollan SP, et al. Goldmann, ORA, Pascal, TonoPen in Keratoconus. [*Br J Ophthalmol.* 2008](https://doi.org/10.1136/bjo.2007.135335)
17. Pons-Talaya C, et al. iCare HOME in Glaucoma: Systematic Review. [*Am J Ophthalmol.* 2025](https://doi.org/10.1016/j.ajo.2024.12.016)
18. Romano D, et al. Self-Monitoring With iCare HOME2. [*J Glaucoma.* 2025](https://doi.org/10.1097/IJG.0000000000002491)
19. Dabasia PL, et al. New Rebound Tonometer for Self-Measurement. [*Br J Ophthalmol.* 2016](https://doi.org/10.1136/bjophthalmol-2015-307674)
20. Barbour-Hastie CC, Tatham AJ. Teaching Home Tonometry via Video. [*Eye.* 2023](https://doi.org/10.1038/s41433-022-02261-6)
""",
            wikiSummary: """
## Kurzzusammenfassung

**Goldmann-Applanationstonometrie (GAT)** = **Goldstandard** der IOD-Messung. Imbert-Fick-Gesetz: P = F/A.

---

### Durchführung
1. Topische Anästhesie + Fluorescein
2. Kobaltblau, Spaltlampe
3. Applanationsfläche **3,06 mm**
4. Skalenwert × 10 = IOD in mmHg

### Normwerte
- Mittlerer IOD: **~15 mmHg** (SD ~3)
- Kein guter Grenzwert für Screening (18 mmHg: 65% Sens/Spez)

---

### CCT-Einfluss
- **>550 µm:** IOD überschätzt
- **<550 µm:** IOD unterschätzt
- ~1 mmHg pro 25 µm Abweichung
- **AAO: keine Standardkorrektur**

---

### Wann andere Tonometer?
| Situation | Empfehlung |
|---|---|
| Kinder | iCare, Perkins (in Narkose) |
| Post-LASIK | Corvis ST (bIOP), DCT |
| Keratokonus | ORA (IOPcc), DCT |
| Hornhautödem | Pneumotonometer, DCT |
| Heim-Monitoring | iCare HOME/HOME2 |

> **Cave:** Bei jedem Patienten **konsistent dieselbe Methode** verwenden!
""",
          ),
        ],
      ),
    ],
  ),
  Category(
    id: 'diverses',
    name: 'Diverses',
    icon: '📋',
    description: 'Allgemeine Themen, Notfälle, Medikamente, Refraktion',
    conditions: [
      const Condition(
        id: 'cataract',
        name: 'Katarakt',
        description: 'Eintrübung der Linse; Alterskatarakt häufig, auch traumatisch oder metabolisch.',
        symptoms: ['blurred_vision', 'vision_loss_gradual', 'halos'],
        urgency: Urgency.low,
        treatment: ['Operation bei visusrelevanter Eintrübung', 'Keine medikamentöse Auflösung'],
        followUp: 'Nach OP Kontrolle',
        source: null,
      ),
      const Condition(
        id: 'vitamin_a_deficiency',
        name: 'Vitamin-A-Mangel',
        description: 'Mangel kann zu Nachtblindheit und Xerophthalmie führen; in Entwicklungsländern relevant.',
        symptoms: ['blurred_vision', 'vision_loss_gradual', 'dry_eyes'],
        urgency: Urgency.medium,
        treatment: ['Vitamin-A-Substitution', 'Grunderkrankung behandeln'],
        followUp: 'Bis Besserung',
        source: null,
      ),
      const Condition(
        id: 'contusio_bulbi',
        name: 'Contusio bulbi',
        description: 'Stumpfes Augentrauma; Hyphema, Iris, Linse, Netzhaut und Glaukom prüfen.',
        symptoms: ['pain', 'redness', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Ruhigstellung', 'Druckkontrolle', 'Kein ASS', 'OP bei Sekundärglaukom oder Linsenluxation'],
        followUp: 'Engmaschig',
        source: null,
      ),
      const Condition(
        id: 'bulbus_perforation',
        name: 'Bulbusperforation',
        description: 'Durchdringende Verletzung des Augapfels; Notfall, sofortige Versorgung.',
        symptoms: ['pain', 'vision_loss_sudden', 'redness'],
        urgency: Urgency.high,
        treatment: ['Kein Druck aufs Auge', 'Steriler Verband', 'Sofort chirurgische Versorgung', 'Tetanus'],
        followUp: 'Stationär',
        source: null,
      ),
      const Condition(
        id: 'tass',
        name: 'Toxic Anterior Segment Syndrome (TASS)',
        description: 'Sterile Entzündung des vorderen Segments nach Operation; oft durch Reinigungsmittel oder Kontamination.',
        symptoms: ['pain', 'redness', 'blurred_vision'],
        urgency: Urgency.high,
        treatment: ['Steroid-Tropfen hoch dosiert', 'Ursache suchen und beseitigen', 'Endophthalmitis ausschließen'],
        followUp: 'Engmaschig',
        source: null,
      ),
      const Condition(
        id: 'top_10_emergencies',
        name: 'Top 10 Notfälle',
        description: 'Kurzüberblick über die wichtigsten augenärztlichen Notfälle und Erstmaßnahmen.',
        symptoms: ['vision_loss_sudden', 'pain', 'redness'],
        urgency: Urgency.high,
        treatment: ['Je nach Diagnose: siehe jeweilige Einträge', 'Zentralarterienverschluss, Winkelblock, Endophthalmitis, Verätzung, etc.'],
        followUp: 'Sofortige Vorstellung',
        source: null,
      ),
      const Condition(
        id: 'driving_fitness',
        name: 'Fahreignung',
        description: 'Relevanz von Sehschärfe und Gesichtsfeld für die Fahreignung; Gutachtenkriterien.',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.low,
        treatment: ['Korrektur und Therapie der Ursache', 'Gutachten nach nationalen Vorgaben'],
        followUp: 'Bei Fragestellung',
        source: null,
      ),
      const Condition(
        id: 'medication_side_effects',
        name: 'Medikamentennebenwirkungen',
        description: 'Augenrelevante Nebenwirkungen von Systemtherapeutika (z.B. Steroide, Amiodaron, Hydroxychloroquin).',
        symptoms: ['blurred_vision', 'vision_loss_gradual'],
        urgency: Urgency.medium,
        treatment: ['Medikament anpassen oder absetzen nach Rücksprache', 'Augenverlaufskontrolle'],
        followUp: 'Je nach Medikament',
        source: null,
      ),
      const Condition(
        id: 'medication_pregnancy',
        name: 'Medikamente in der Schwangerschaft',
        description: 'Augentropfen und systemische Augentherapie in Schwangerschaft und Stillzeit; Risikobewertung.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Indikation prüfen', 'Sicherere Alternativen wählen', 'Geburtshilfe einbeziehen'],
        followUp: 'Bei Bedarf',
        source: null,
      ),
      const Condition(
        id: 'varicella',
        name: 'Varizellen',
        description: 'Chickenpox; Augenbeteiligung möglich (Keratitis, Uveitis, Retinitis).',
        symptoms: ['redness', 'pain', 'blurred_vision'],
        urgency: Urgency.medium,
        treatment: ['Systemisches Aciclovir bei Augenbeteiligung', 'Lokale Therapie je nach Befund'],
        followUp: 'Bis Abheilung',
        source: null,
      ),
      const Condition(
        id: 'visus_conversion',
        name: 'Visus-Umrechnung (ETDRS, Snellen, LogMAR)',
        description: 'Vergleich verschiedener Sehschärfenangaben und Umrechnungstabellen.',
        symptoms: ['blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Keine Therapie; Referenz für Dokumentation'],
        followUp: '-',
        source: null,
      ),
    ],
  ),
];
