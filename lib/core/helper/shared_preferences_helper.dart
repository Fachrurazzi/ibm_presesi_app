import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  /// WAJIB: Panggil ini di main.dart sebelum runApp()
  /// Contoh: await SharedPreferencesHelper.init();
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    if (kDebugMode) debugPrint("STORAGE_HELPER: Engine Ready ✅");
  }

  // --- PRIVATE GETTER (Internal) ---
  static SharedPreferences get _p {
    if (_prefs == null) {
      throw Exception(
          "SharedPreferencesHelper belum diinisialisasi! Panggil init() di main.dart");
    }
    return _prefs!;
  }

  // --- SETTERS (Dibuat saderhana & konsisten) ---

  static Future<bool> setInt(String key, int value) async {
    final result = await _p.setInt(key, value);
    _log("Write Int", key, value.toString(), result);
    return result;
  }

  static Future<bool> setBool(String key, bool value) async {
    final result = await _p.setBool(key, value);
    _log("Write Bool", key, value.toString(), result);
    return result;
  }

  static Future<bool> setString(String key, String? value) async {
    if (value == null) return false;
    final result = await _p.setString(key, value);
    _log("Write String", key, value, result);
    return result;
  }

  // --- GETTERS (Sekarang bersifat sinkron/Instant!) ---

  static int? getInt(String key) => _p.getInt(key);

  static bool? getBool(String key) => _p.getBool(key);

  static String? getString(String key) => _p.getString(key);

  // --- ACTIONS ---

  static Future<bool> remove(String key) async => await _p.remove(key);

  static Future<bool> logout() async => await _p.clear();

  /// Helper untuk logging yang lebih bersih
  static void _log(String action, String key, String value, bool success) {
    if (kDebugMode) {
      String displayValue =
          (key.contains('token') || key.contains('password')) ? "***" : value;
      debugPrint("STORAGE: $action [$key] -> $displayValue | Status: $success");
    }
  }
}
