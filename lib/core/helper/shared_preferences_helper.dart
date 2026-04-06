import 'package:flutter/foundation.dart'; // Untuk kDebugMode dan debugPrint
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefsInstance;

  // Singleton pattern: Hanya panggil getInstance() SATU KALI selama aplikasi berjalan
  static Future<SharedPreferences> _getPrefs() async {
    if (_prefsInstance == null) {
      _prefsInstance = await SharedPreferences.getInstance();
    }
    return _prefsInstance!;
  }

  static Future<bool> setInt(String key, int value) async {
    final pref = await _getPrefs();
    return await pref.setInt(key, value);
  }

  static Future<bool> setString(String key, String? value) async {
    if (value == null) {
      if (kDebugMode) {
        debugPrint("STORAGE_HELPER: Gagal menulis [$key] karena value NULL");
      }
      return false;
    }

    final pref = await _getPrefs();
    final result = await pref.setString(key, value);

    if (kDebugMode) {
      // Jangan print value jika itu adalah token/password demi keamanan
      if (key == 'auth_token' || key == 'password') {
        debugPrint("STORAGE_HELPER_SYNC: Berhasil menulis [$key] -> ***HIDDEN*** | Sukses: $result");
      } else {
        debugPrint("STORAGE_HELPER_SYNC: Berhasil menulis [$key] -> $value | Sukses: $result");
      }
    }
    
    return result;
  }

  static Future<int?> getInt(String key) async {
    final pref = await _getPrefs();
    return pref.getInt(key);
  }

  static Future<String?> getString(String key) async {
    final pref = await _getPrefs();
    final value = pref.getString(key);
    
    if (kDebugMode) {
      if (key == 'auth_token' || key == 'password') {
         debugPrint("STORAGE_HELPER: Membaca [$key] -> ***HIDDEN***");
      } else {
         debugPrint("STORAGE_HELPER: Membaca [$key] -> $value");
      }
    }
    
    return value;
  }

  static Future<bool> remove(String key) async {
    final pref = await _getPrefs();
    return await pref.remove(key);
  }

  static Future<bool> logout() async {
    final pref = await _getPrefs();
    return await pref.clear();
  }
}