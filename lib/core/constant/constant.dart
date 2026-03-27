// ignore_for_file: constant_identifier_names

class AppConfig {
  // 10.0.2.2 adalah IP khusus untuk akses localhost laptop dari Emulator Android
  static const String BASE_URL = 'http://10.0.2.2:8000/api/v1';
}

class AppPreferences {
  static const String AUTH_TOKEN = 'auth_token';
  static const String USER_ID = 'user_id';
  static const String USER_NAME = 'user_name';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PHOTO = 'user_photo';

  // Data Kepegawaian PT INTIBOGA MANDIRI
  static const String LEAVE_QUOTA = 'leave_quota';
  static const String JOIN_DATE = 'join_date';
  static const String CASHABLE_LEAVE = 'cashable_leave';
  static const String POSITION_ID = 'position_id';
  static const String POSITION_NAME = 'position_name'; // <--- TAMBAHKAN INI

  // Pengaturan Aplikasi
  static const String NOTIF_SETTING = 'notif_setting';
  static const String START_SHIFT = 'start_shift';
  static const String END_SHIFT = 'end_shift';
}
