// ignore_for_file: constant_identifier_names

class AppConfig {
  static const String HOST = 'http://192.168.100.83:8000';

  // Endpoint API
  static const String BASE_URL = '$HOST/api/v1';

  // HANYA SAMPAI SINI (Karena database sudah punya folder)
  static const String STORAGE_URL = '$HOST/api/storage';
}

class AppPreferences {
  static const String AUTH_TOKEN = 'auth_token';
  static const String USER_ID = 'user_id';
  static const String USER_NAME = 'user_name';
  static const String USER_EMAIL = 'user_email';

  // Simpan URL foto lengkap yang didapat dari Laravel showPhoto
  static const String IMAGE_URL = 'image_url';

  // Data Kepegawaian PT INTIBOGA MANDIRI
  static const String POSITION_ID = 'position_id';
  static const String POSITION_NAME = 'position_name';
  static const String LEAVE_QUOTA = 'leave_quota';
  static const String JOIN_DATE = 'join_date';
  static const String CASHABLE_LEAVE = 'cashable_leave';

  // --- LOKASI DEPO / KANTOR PT INTIBOGA MANDIRI ---
  static const String OFFICE_NAME = 'office_name';
  static const String OFFICE_LAT = 'office_lat';
  static const String OFFICE_LNG = 'office_lng';

  // --- PENGATURAN APLIKASI ---
  static const String NOTIF_SETTING = 'notif_setting';
  static const String START_SHIFT = 'start_shift';
  static const String END_SHIFT = 'end_shift';
}
