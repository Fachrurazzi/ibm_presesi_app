import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Simpan instance agar tidak perlu panggil getInstance berkali-kali (Singleton Pattern)
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> get _instance async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<void> setInt(String key, int value) async {
    final pref = await _instance;
    await pref.setInt(key, value);
  }

  static Future<void> setString(String key, String value) async {
    final pref = await _instance;
    await pref.setString(key, value);
  }

  static Future<int?> getInt(String key) async {
    final pref = await _instance;
    return pref.getInt(key);
  }

  static Future<String?> getString(String key) async {
    final pref = await _instance;
    return pref.getString(key);
  }

  // Tambahkan fungsi remove jika ingin menghapus key spesifik tanpa logout total
  static Future<bool> remove(String key) async {
    final pref = await _instance;
    return await pref.remove(key);
  }

  static Future<bool> logout() async {
    final pref = await _instance;
    return await pref.clear();
  }
}
