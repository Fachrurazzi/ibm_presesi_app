// ignore_for_file: constant_identifier_names

class AppConfig {
  /// Alamat server lokal PT Intiboga Mandiri
  /// Pastikan IP ini sesuai dengan IP Laptop/Server saat pengembangan
  static const String HOST = 'http://192.168.8.106:8000';

  // Endpoint API Versioning
  static const String BASE_URL = '$HOST/api/v1';

  // Endpoint khusus untuk akses file gambar (Foto Profil/Bukti Cuti)
  static const String STORAGE_URL = '$HOST/storage';
}

class AppPreferences {
  // --- AUTHENTICATION ---
  static const String AUTH_TOKEN = 'auth_token';
  static const String USER_ID = 'user_id';
  static const String USER_NAME = 'user_name';
  static const String USER_EMAIL = 'user_email';
  static const String IMAGE_URL = 'image_url';

  // --- PT INTIBOGA MANDIRI BUSINESS LOGIC ---
  // Status onboarding karyawan
  static const String IS_DEFAULT_PASSWORD = 'is_default_password'; // Boolean
  static const String IS_FACE_REGISTERED = 'is_face_registered'; // Boolean

  // Data Kepegawaian (Data ini yang sering hilang jika Key-nya salah panggil)
  static const String POSITION_ID = 'position_id'; // Integer
  static const String POSITION_NAME = 'position_name'; // String
  static const String LEAVE_QUOTA = 'leave_quota'; // Integer (Sisa Cuti)
  static const String JOIN_DATE = 'join_date'; // String
  static const String CASHABLE_LEAVE = 'cashable_leave'; // Integer

  // --- LOKASI KERJA (GEOLOCATION) ---
  static const String OFFICE_NAME = 'office_name';
  static const String OFFICE_LAT = 'office_lat';
  static const String OFFICE_LNG = 'office_lng';

  // --- PENGATURAN & SCHEDULER ---
  static const String NOTIF_SETTING = 'notif_setting'; // Integer (Menit)
  static const String START_SHIFT = 'start_shift'; // String (HH:mm)
  static const String END_SHIFT = 'end_shift'; // String (HH:mm)
}
