import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    if (kDebugMode) debugPrint("STORAGE_HELPER: Engine Ready ✅");
  }

  static Future<void> refresh() async {
    await _p.reload();
    if (kDebugMode) debugPrint("STORAGE_HELPER: Data Re-synced from Disk 🔄");
  }

  static SharedPreferences get _p {
    if (_prefs == null) {
      throw Exception("SharedPreferencesHelper belum diinisialisasi!");
    }
    return _prefs!;
  }

  // ========== SETTERS ==========
  static Future<bool> setInt(String key, int value) async =>
      await _p.setInt(key, value);

  static Future<bool> setBool(String key, bool value) async =>
      await _p.setBool(key, value);

  static Future<bool> setString(String key, String? value) async {
    if (value == null) return false;
    return await _p.setString(key, value);
  }

  static Future<bool> setDouble(String key, double value) async =>
      await _p.setDouble(key, value);

  static Future<bool> setStringList(String key, List<String> value) async =>
      await _p.setStringList(key, value);

  // ========== GETTERS ==========
  static int? getInt(String key) => _p.getInt(key);
  static bool? getBool(String key) => _p.getBool(key);
  static String? getString(String key) => _p.getString(key);
  static double? getDouble(String key) => _p.getDouble(key);
  static List<String>? getStringList(String key) => _p.getStringList(key);

  // ========== DEFAULTS ==========
  static int getIntOrDefault(String key, {int defaultValue = 0}) =>
      _p.getInt(key) ?? defaultValue;

  static bool getBoolOrDefault(String key, {bool defaultValue = false}) =>
      _p.getBool(key) ?? defaultValue;

  static String getStringOrDefault(String key, {String defaultValue = ''}) =>
      _p.getString(key) ?? defaultValue;

  static double getDoubleOrDefault(String key, {double defaultValue = 0.0}) =>
      _p.getDouble(key) ?? defaultValue;

  // ========== UTILITIES ==========
  static bool containsKey(String key) => _p.containsKey(key);
  static Set<String> getKeys() => _p.getKeys();

  static Future<bool> remove(String key) async => await _p.remove(key);

  static Future<bool> removeMultiple(List<String> keys) async {
    bool allSuccess = true;
    for (final key in keys) {
      final success = await _p.remove(key);
      if (!success) allSuccess = false;
    }
    return allSuccess;
  }

  // ========== TOKEN MANAGEMENT ==========
  static Future<void> saveToken(String token,
      {String tokenType = 'Bearer'}) async {
    await setString(AppPreferences.AUTH_TOKEN, token);
    await setString(AppPreferences.TOKEN_TYPE, tokenType);
  }

  static String? getToken() => getString(AppPreferences.AUTH_TOKEN);

  static String getTokenType() =>
      getStringOrDefault(AppPreferences.TOKEN_TYPE, defaultValue: 'Bearer');

  static String getAuthorizationHeader() {
    final token = getToken();
    if (token == null || token.isEmpty) return '';
    return '${getTokenType()} $token';
  }

  static Future<void> clearToken() async {
    await remove(AppPreferences.AUTH_TOKEN);
    await remove(AppPreferences.TOKEN_TYPE);
  }

  // ========== USER SESSION ==========
  static Future<void> saveUserSession(UserSession session) async {
    await setInt(AppPreferences.USER_ID, session.id);
    await setString(AppPreferences.USER_NAME, session.name);
    await setString(AppPreferences.USER_EMAIL, session.email);
    await setString(AppPreferences.USER_AVATAR, session.avatar ?? '');
    await setInt(AppPreferences.POSITION_ID, session.positionId ?? 0);
    await setString(AppPreferences.POSITION_NAME, session.positionName ?? '');
    await setString(AppPreferences.JOIN_DATE, session.joinDate ?? '');
    await setInt(AppPreferences.LEAVE_QUOTA, session.leaveQuota);
    await setInt(AppPreferences.REMAINING_LEAVE, session.remainingLeave);
    await setInt(AppPreferences.CASHABLE_LEAVE, session.cashableLeave);
    await setBool(
        AppPreferences.IS_DEFAULT_PASSWORD, session.isDefaultPassword);
    await setBool(AppPreferences.IS_FACE_REGISTERED, session.isFaceRegistered);
    await setBool(AppPreferences.IS_BANNED, session.isBanned);
    if (session.bannedReason != null) {
      await setString(AppPreferences.BANNED_REASON, session.bannedReason!);
    }
  }

  static UserSession? getUserSession() {
    final id = getInt(AppPreferences.USER_ID);
    if (id == null) return null;

    return UserSession(
      id: id,
      name: getStringOrDefault(AppPreferences.USER_NAME),
      email: getStringOrDefault(AppPreferences.USER_EMAIL),
      avatar: getString(AppPreferences.USER_AVATAR),
      positionId: getInt(AppPreferences.POSITION_ID),
      positionName: getString(AppPreferences.POSITION_NAME),
      joinDate: getString(AppPreferences.JOIN_DATE),
      leaveQuota: getIntOrDefault(AppPreferences.LEAVE_QUOTA, defaultValue: 12),
      remainingLeave:
          getIntOrDefault(AppPreferences.REMAINING_LEAVE, defaultValue: 12),
      cashableLeave: getIntOrDefault(AppPreferences.CASHABLE_LEAVE),
      isDefaultPassword: getBoolOrDefault(AppPreferences.IS_DEFAULT_PASSWORD),
      isFaceRegistered: getBoolOrDefault(AppPreferences.IS_FACE_REGISTERED),
      isBanned: getBoolOrDefault(AppPreferences.IS_BANNED),
      bannedReason: getString(AppPreferences.BANNED_REASON),
    );
  }

  static Future<void> updateUserFields(Map<String, dynamic> fields) async {
    for (final entry in fields.entries) {
      final value = entry.value;
      if (value is int) {
        await setInt(entry.key, value);
      } else if (value is bool) {
        await setBool(entry.key, value);
      } else if (value is String) {
        await setString(entry.key, value);
      } else if (value is double) {
        await setDouble(entry.key, value);
      }
    }
  }

  // ========== WORK SCHEDULE SESSION ==========
  static Future<void> saveWorkSchedule(WorkScheduleSession schedule) async {
    await setInt(AppPreferences.SCHEDULE_ID, schedule.scheduleId);
    await setInt(AppPreferences.OFFICE_ID, schedule.officeId);
    await setString(AppPreferences.OFFICE_NAME, schedule.officeName);
    await setDouble(AppPreferences.OFFICE_LAT, schedule.officeLat);
    await setDouble(AppPreferences.OFFICE_LNG, schedule.officeLng);
    await setInt(AppPreferences.OFFICE_RADIUS, schedule.officeRadius);
    await setInt(AppPreferences.SHIFT_ID, schedule.shiftId);
    await setString(AppPreferences.SHIFT_NAME, schedule.shiftName);
    await setString(AppPreferences.SHIFT_START, schedule.shiftStart);
    await setString(AppPreferences.SHIFT_END, schedule.shiftEnd);
    await setBool(AppPreferences.IS_WFA, schedule.isWfa);
    await setBool(AppPreferences.IS_BANNED, schedule.isBanned);
    if (schedule.bannedReason != null) {
      await setString(AppPreferences.BANNED_REASON, schedule.bannedReason!);
    }
  }

  static WorkScheduleSession? getWorkSchedule() {
    final scheduleId = getInt(AppPreferences.SCHEDULE_ID);
    if (scheduleId == null) return null;

    return WorkScheduleSession(
      scheduleId: scheduleId,
      officeId: getIntOrDefault(AppPreferences.OFFICE_ID),
      officeName: getStringOrDefault(AppPreferences.OFFICE_NAME),
      officeLat: getDoubleOrDefault(AppPreferences.OFFICE_LAT),
      officeLng: getDoubleOrDefault(AppPreferences.OFFICE_LNG),
      officeRadius:
          getIntOrDefault(AppPreferences.OFFICE_RADIUS, defaultValue: 100),
      shiftId: getIntOrDefault(AppPreferences.SHIFT_ID),
      shiftName: getStringOrDefault(AppPreferences.SHIFT_NAME),
      shiftStart:
          getStringOrDefault(AppPreferences.SHIFT_START, defaultValue: '08:30'),
      shiftEnd:
          getStringOrDefault(AppPreferences.SHIFT_END, defaultValue: '17:30'),
      isWfa: getBoolOrDefault(AppPreferences.IS_WFA),
      isBanned: getBoolOrDefault(AppPreferences.IS_BANNED),
      bannedReason: getString(AppPreferences.BANNED_REASON),
    );
  }

  static Future<void> clearWorkSchedule() async {
    await removeMultiple([
      AppPreferences.SCHEDULE_ID,
      AppPreferences.OFFICE_ID,
      AppPreferences.OFFICE_NAME,
      AppPreferences.OFFICE_LAT,
      AppPreferences.OFFICE_LNG,
      AppPreferences.OFFICE_RADIUS,
      AppPreferences.SHIFT_ID,
      AppPreferences.SHIFT_NAME,
      AppPreferences.SHIFT_START,
      AppPreferences.SHIFT_END,
      AppPreferences.IS_WFA,
    ]);
  }

  // ========== AUTH STATUS ==========
  static bool isLoggedIn() {
    final token = getString(AppPreferences.AUTH_TOKEN);
    return token != null && token.isNotEmpty;
  }

  static bool needsPasswordChange() {
    return getBoolOrDefault(AppPreferences.IS_DEFAULT_PASSWORD);
  }

  static bool needsFaceRegistration() {
    return !getBoolOrDefault(AppPreferences.IS_FACE_REGISTERED);
  }

  static bool isBanned() {
    return getBoolOrDefault(AppPreferences.IS_BANNED);
  }

  // ========== LOGOUT ==========
  static Future<bool> logout() async {
    final keysToKeep = [
      AppPreferences.NOTIF_SETTING,
      AppPreferences.DARK_MODE,
      AppPreferences.LANGUAGE,
      AppPreferences.FCM_TOKEN,
    ];

    final allKeys = _p.getKeys();
    for (final key in allKeys) {
      if (!keysToKeep.contains(key)) {
        await _p.remove(key);
      }
    }

    await clearToken();
    return true;
  }

  static Future<bool> clearAll() async {
    return await _p.clear();
  }
}
