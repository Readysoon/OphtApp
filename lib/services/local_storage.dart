import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const String _kPatientInfo = 'myData_patientInfo';
const String _kGlassesPrescription = 'glasses_prescription';
const String _kEyePressurePachymetry = 'eyePressure_pachymetry';
const String _kEyePressureEntries = 'eyePressure_entries';
const String _kMedications = 'medication_plan_list';

Future<SharedPreferences> _prefs() async => SharedPreferences.getInstance();

Future<Map<String, String>> loadPatientInfo() async {
  final prefs = await _prefs();
  final s = prefs.getString(_kPatientInfo);
  if (s == null) return {'name': '', 'birthDate': ''};
  try {
    final map = jsonDecode(s) as Map<String, dynamic>;
    return {
      'name': (map['name'] as String?) ?? '',
      'birthDate': (map['birthDate'] as String?) ?? '',
    };
  } catch (_) {
    return {'name': '', 'birthDate': ''};
  }
}

Future<void> savePatientInfo(String name, String birthDate) async {
  final prefs = await _prefs();
  await prefs.setString(_kPatientInfo, jsonEncode({'name': name, 'birthDate': birthDate}));
}

Future<Map<String, dynamic>?> loadGlassesPrescription() async {
  final prefs = await _prefs();
  final s = prefs.getString(_kGlassesPrescription);
  if (s == null) return null;
  try {
    return jsonDecode(s) as Map<String, dynamic>;
  } catch (_) {
    return null;
  }
}

Future<void> saveGlassesPrescription(Map<String, dynamic> data) async {
  final prefs = await _prefs();
  await prefs.setString(_kGlassesPrescription, jsonEncode(data));
}

Future<Map<String, String>> loadPachymetry() async {
  final prefs = await _prefs();
  final s = prefs.getString(_kEyePressurePachymetry);
  if (s == null) return {'leftEye': '', 'rightEye': ''};
  try {
    final map = jsonDecode(s) as Map<String, dynamic>;
    return {
      'leftEye': (map['leftEye'] as String?) ?? '',
      'rightEye': (map['rightEye'] as String?) ?? '',
    };
  } catch (_) {
    return {'leftEye': '', 'rightEye': ''};
  }
}

Future<void> savePachymetry(String leftEye, String rightEye) async {
  final prefs = await _prefs();
  await prefs.setString(_kEyePressurePachymetry, jsonEncode({'leftEye': leftEye, 'rightEye': rightEye}));
}

Future<List<Map<String, dynamic>>> loadPressureEntries() async {
  final prefs = await _prefs();
  final s = prefs.getString(_kEyePressureEntries);
  if (s == null) return [];
  try {
    final list = jsonDecode(s) as List<dynamic>;
    return list.map((e) => Map<String, dynamic>.from(e as Map)).toList();
  } catch (_) {
    return [];
  }
}

Future<void> savePressureEntries(List<Map<String, dynamic>> entries) async {
  final prefs = await _prefs();
  await prefs.setString(_kEyePressureEntries, jsonEncode(entries));
}

Future<List<Map<String, dynamic>>> loadMedications() async {
  final prefs = await _prefs();
  final s = prefs.getString(_kMedications);
  if (s == null) return [];
  try {
    final list = jsonDecode(s) as List<dynamic>;
    return list.map((e) => Map<String, dynamic>.from(e as Map)).toList();
  } catch (_) {
    return [];
  }
}

Future<void> saveMedications(List<Map<String, dynamic>> list) async {
  final prefs = await _prefs();
  await prefs.setString(_kMedications, jsonEncode(list));
}
