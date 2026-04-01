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

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.description,
    required this.conditions,
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

Ein Chalazion ist eine **chronische lipogranulomatöse Entzündung** des Augenlids, die durch Obstruktion der Talgdrüsen der Lidplatte entsteht – entweder der **Meibom-Drüsen** (tiefes Chalazion) oder der **Zeis-Drüsen** (oberflächliches Chalazion).¹ Es handelt sich um eine der häufigsten Liderkrankungen in allen Altersgruppen.² Die American Academy of Ophthalmology beschreibt Chalazion, Hordeolum und Blepharitis als ein **Kontinuum von Erkrankungen**.

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

### Klinische Befunde
- **Palpable Masse** im mittleren Lidbereich (nicht am Lidrand wie beim Hordeolum)⁶
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
- **Hordeolum (Gerstenkorn):** Akute, schmerzhafte, purulente Entzündung am Lidrand
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
- DD: Hordeolum (akut, schmerzhaft), Talgdrüsenkarzinom (bei Rezidiven)

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
        description: 'Akute bakterielle Infektion einer Liddrüse.',
        symptoms: ['swelling', 'pain', 'redness'],
        urgency: Urgency.low,
        treatment: ['Warme Kompressen', 'Antibiotische Salbe (z.B. Floxal)', 'Spontane Entleerung abwarten'],
        followUp: 'Bei Zunahme oder Fieber sofort Arzt',
        source: null,
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
        id: 'thygeson_keratitis',
        name: 'Thygeson-Keratitis',
        description: 'Rezidivierende oberflächliche Keratitis mit typischen subepithelialen Trübungen; oft bilateral, wenig Rötung.',
        symptoms: ['light_sensitivity', 'foreign_body', 'blurred_vision'],
        urgency: Urgency.low,
        treatment: ['Steroid-Tropfen niedrig dosiert bei Schub', 'Tränenersatz', 'Weiche Kontaktlinsen als Option'],
        followUp: 'Bei Rezidiven',
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
        description: 'Hornhautfilamente bei trockenem Auge oder nach Epithelerkrankung; Entfernung und Tränenersatz.',
        symptoms: ['foreign_body', 'dry_eyes', 'pain'],
        urgency: Urgency.low,
        treatment: ['Tränenersatz intensiv', 'Filament-Entfernung', 'Lidhygiene', 'Punctum Plugs bei Bedarf'],
        followUp: 'Bei Rezidiven',
        source: null,
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
