// ignore_for_file: constant_identifier_names

import 'package:ibm_presensi_app/app/module/entity/auth.dart';

class AppConfig {
  // ========== ENVIRONMENT ==========
  static const String HOST = 'http://10.0.2.2:8000';

  // static const String HOST = 'http://192.168.100.83:8000';
  static const String BASE_URL = '$HOST/api/v1';
  static const String STORAGE_URL = '$HOST/storage';

  // ========== ENDPOINTS ==========
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  static const String me = '/me';
  static const String logout = '/logout';
  static const String logoutAll = '/logout-all';
  static const String updatePassword = '/password';
  static const String registerFace = '/register-face';
  static const String resendVerification = '/resend-verification';

  static const String dashboardStats = '/dashboard/stats';
  static const String dashboardMonthly = '/dashboard/monthly-summary';
  static const String dashboardActivities = '/dashboard/recent-activities';

  static const String userProfile = '/user/profile';
  static const String userUpdate = '/user';
  static const String userPhoto = '/user/photo';
  static const String userSchedule = '/user/schedule';
  static const String userScheduleToday = '/user/schedule/today';
  static const String userLeaveSummary = '/user/leave-summary';
  static const String userFcmToken = '/user/fcm-token';
  static const String userLocation = '/user/location';

  static const String attendanceToday = '/attendance/today';
  static const String attendanceHistory = '/attendance/history';
  static const String attendanceSchedule = '/attendance/schedule';
  static const String attendanceSummary = '/attendance/summary';
  static const String attendanceStore = '/attendance';
  static const String attendanceReportSuspicious =
      '/attendance/report-suspicious';

  static const String leavesList = '/leaves';
  static const String leavesTypes = '/leaves/types';
  static const String leavesQuota = '/leaves/quota';

  static const String permissionsList = '/permissions';
  static const String permissionsTypes = '/permissions/types';
  static const String permissionsCheck = '/permissions/check';

  static const String officesList = '/offices';
  static const String officesNearest = '/offices/nearest';
  static const String officesCheckRadius = '/offices/check-radius';

  static const String positionsList = '/positions';
  static const String shiftsList = '/shifts';
  static const String schedulesList = '/schedules';

  // ========== USER LOCATION TRACKING ==========
  static const String userLocationsAll = '/user-locations/all';
  static const String userLocationsTeam = '/user-locations/team';
  static const String userLocationDetail = '/user-locations/'; // + userId

  static const String userLocationsSummary = '/user-locations/summary';

  // ========== TIMEOUT CONFIG ==========
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;
  static const int uploadTimeout = 60;

  // ========== HELPER METHODS ==========
  static String getImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    if (path.startsWith('http')) return path;
    if (path.startsWith('storage/')) return '$HOST/$path';
    return '$STORAGE_URL/$path';
  }

  static String endpoint(String path) => '$BASE_URL$path';
  static String endpointWithId(String path, int id) => '$BASE_URL$path/$id';
  static String endpointStatus(String path, int id) =>
      '$BASE_URL$path/$id/status';
}

// ============================================================================
// APP PREFERENCES KEYS
// ============================================================================

class AppPreferences {
  // ========== AUTHENTICATION ==========
  static const String AUTH_TOKEN = 'auth_token';
  static const String TOKEN_TYPE = 'token_type';
  static const String USER_ID = 'user_id';
  static const String USER_NAME = 'user_name';
  static const String USER_EMAIL = 'user_email';
  static const String USER_AVATAR = 'user_avatar';
  static const String USER_EMAIL_VERIFIED_AT = 'user_email_verified_at';

  // ========== PASSWORD & SECURITY ==========
  static const String IS_DEFAULT_PASSWORD = 'is_default_password';
  static const String IS_FACE_REGISTERED = 'is_face_registered';
  static const String IS_BANNED = 'is_banned';
  static const String BANNED_REASON = 'banned_reason';

  // ========== EMPLOYMENT DATA ==========
  static const String POSITION_ID = 'position_id';
  static const String POSITION_NAME = 'position_name';
  static const String JOIN_DATE = 'join_date';

  // ========== LEAVE DATA ==========
  static const String LEAVE_QUOTA = 'leave_quota';
  static const String REMAINING_LEAVE = 'remaining_leave';
  static const String CASHABLE_LEAVE = 'cashable_leave';

  // ========== WORK LOCATION (SCHEDULE-BASED) ==========
  static const String OFFICE_ID = 'office_id';
  static const String OFFICE_NAME = 'office_name';
  static const String OFFICE_LAT = 'office_lat';
  static const String OFFICE_LNG = 'office_lng';
  static const String OFFICE_RADIUS = 'office_radius';
  static const String IS_WFA = 'is_wfa';

  // ========== SHIFT DATA ==========
  static const String SHIFT_ID = 'shift_id';
  static const String SHIFT_NAME = 'shift_name';
  static const String SHIFT_START = 'shift_start';
  static const String SHIFT_END = 'shift_end';
  static const String SHIFT_IS_OVERNIGHT = 'shift_is_overnight';

  // ========== SCHEDULE DATA ==========
  static const String SCHEDULE_ID = 'schedule_id';
  static const String SCHEDULE_START_DATE = 'schedule_start_date';
  static const String SCHEDULE_END_DATE = 'schedule_end_date';

  // ========== ATTENDANCE STATUS ==========
  static const String HAS_CHECKED_IN_TODAY = 'has_checked_in_today';
  static const String LAST_CHECK_IN_TIME = 'last_check_in_time';
  static const String LAST_CHECK_OUT_TIME = 'last_check_out_time';
  static const String ATTENDANCE_TODAY_ID = 'attendance_today_id';

  // ========== DASHBOARD CACHE ==========
  static const String CACHED_DASHBOARD_STATS = 'cached_dashboard_stats';
  static const String CACHED_DASHBOARD_TIME = 'cached_dashboard_time';

  // ========== SETTINGS ==========
  static const String NOTIF_SETTING = 'notif_setting';
  static const String FCM_TOKEN = 'fcm_token';
  static const String DARK_MODE = 'dark_mode';
  static const String LANGUAGE = 'language';
  static const String BIOMETRIC_ENABLED = 'biometric_enabled';

  // ========== ONBOARDING ==========
  static const String ONBOARDING_COMPLETED = 'onboarding_completed';
  static const String APP_INSTALL_DATE = 'app_install_date';

  // ========== KEYS TO KEEP ON LOGOUT ==========
  static const List<String> keysToKeep = [
    NOTIF_SETTING,
    DARK_MODE,
    LANGUAGE,
    FCM_TOKEN,
    BIOMETRIC_ENABLED,
    ONBOARDING_COMPLETED,
    APP_INSTALL_DATE,
  ];
}

// ============================================================================
// USER SESSION MODEL
// ============================================================================

class UserSession {
  final int id;
  final String name;
  final String email;
  final String? avatar;
  final int? positionId;
  final String? positionName;
  final String? joinDate;
  final int leaveQuota;
  final int remainingLeave;
  final int cashableLeave;
  final bool isDefaultPassword;
  final bool isFaceRegistered;
  final bool isBanned;
  final String? bannedReason;
  final List<String> roles; // 🆕 Tambahan
  final List<String> permissions; // 🆕 Tambahan

  const UserSession({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.positionId,
    this.positionName,
    this.joinDate,
    required this.leaveQuota,
    required this.remainingLeave,
    required this.cashableLeave,
    required this.isDefaultPassword,
    required this.isFaceRegistered,
    this.isBanned = false,
    this.bannedReason,
    this.roles = const [], // 🆕
    this.permissions = const [], // 🆕
  });

  // 🆕 Role checkers
  bool get isAdmin => roles.any(
      (r) => r.toLowerCase() == 'admin' || r.toLowerCase() == 'super_admin');
  bool get isManager => roles.any((r) => r.toLowerCase() == 'manager');
  bool get isUser => !isAdmin && !isManager;

  // 🆕 Permission checkers
  bool can(String permission) => permissions.contains(permission);
  bool get canApproveLeave => can('approve_leave') || isAdmin || isManager;
  bool get canApprovePermission =>
      can('approve_permission') || isAdmin || isManager;
  bool get canManageUsers => can('manage_users') || isAdmin;
  bool get canManageMasterData => can('manage_master_data') || isAdmin;

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatar: json['image_url'] ?? json['avatar'],
      positionId: json['position_id'],
      positionName: json['position_name'],
      joinDate: json['join_date'],
      leaveQuota: json['leave_quota'] ?? 12,
      remainingLeave: json['remaining_leave'] ?? 12,
      cashableLeave: json['cashable_leave'] ?? 0,
      isDefaultPassword: json['is_default_password'] ?? true,
      isFaceRegistered: json['is_face_registered'] ?? false,
      isBanned: json['is_banned'] ?? false,
      bannedReason: json['banned_reason'],
      roles: (json['roles'] as List?)?.cast<String>() ?? [], // 🆕
      permissions: (json['permissions'] as List?)?.cast<String>() ?? [], // 🆕
    );
  }

  factory UserSession.fromUserEntity(AuthEntity user) {
    return UserSession(
      id: user.id,
      name: user.name,
      email: user.email,
      avatar: user.imageUrl,
      positionId: user.positionId,
      positionName: user.positionName,
      joinDate: user.joinDate,
      leaveQuota: user.leaveQuota,
      remainingLeave: user.remainingLeave,
      cashableLeave: user.cashableLeave,
      isDefaultPassword: user.isDefaultPassword,
      isFaceRegistered: user.isFaceRegistered,
      // 🆕 TODO: Ambil roles & permissions dari API response
      roles: user.roles ?? [],
      permissions: user.permissions ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'position_id': positionId,
      'position_name': positionName,
      'join_date': joinDate,
      'leave_quota': leaveQuota,
      'remaining_leave': remainingLeave,
      'cashable_leave': cashableLeave,
      'is_default_password': isDefaultPassword,
      'is_face_registered': isFaceRegistered,
      'is_banned': isBanned,
      'banned_reason': bannedReason,
      'roles': roles,
      'permissions': permissions,
    };
  }

  UserSession copyWith({
    int? id,
    String? name,
    String? email,
    String? avatar,
    int? positionId,
    String? positionName,
    String? joinDate,
    int? leaveQuota,
    int? remainingLeave,
    int? cashableLeave,
    bool? isDefaultPassword,
    bool? isFaceRegistered,
    bool? isBanned,
    String? bannedReason,
    List<String>? roles,
    List<String>? permissions,
  }) {
    return UserSession(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      positionId: positionId ?? this.positionId,
      positionName: positionName ?? this.positionName,
      joinDate: joinDate ?? this.joinDate,
      leaveQuota: leaveQuota ?? this.leaveQuota,
      remainingLeave: remainingLeave ?? this.remainingLeave,
      cashableLeave: cashableLeave ?? this.cashableLeave,
      isDefaultPassword: isDefaultPassword ?? this.isDefaultPassword,
      isFaceRegistered: isFaceRegistered ?? this.isFaceRegistered,
      isBanned: isBanned ?? this.isBanned,
      bannedReason: bannedReason ?? this.bannedReason,
      roles: roles ?? this.roles,
      permissions: permissions ?? this.permissions,
    );
  }

  String get displayName => name.isNotEmpty ? name : 'Karyawan IBM';
  String get avatarUrl => avatar ?? '';
  String get positionDisplay => positionName ?? 'Staff';
  String get roleDisplay {
    if (isAdmin) return 'Administrator';
    if (isManager) return 'Manager';
    return 'Karyawan';
  }
}

// ============================================================================
// WORK SCHEDULE SESSION MODEL
// ============================================================================

class WorkScheduleSession {
  final int scheduleId;
  final int officeId;
  final String officeName;
  final double officeLat;
  final double officeLng;
  final int officeRadius;
  final int shiftId;
  final String shiftName;
  final String shiftStart;
  final String shiftEnd;
  final bool isWfa;
  final bool isBanned;
  final String? bannedReason;

  const WorkScheduleSession({
    required this.scheduleId,
    required this.officeId,
    required this.officeName,
    required this.officeLat,
    required this.officeLng,
    required this.officeRadius,
    required this.shiftId,
    required this.shiftName,
    required this.shiftStart,
    required this.shiftEnd,
    required this.isWfa,
    this.isBanned = false,
    this.bannedReason,
  });

  // ========== FACTORY METHODS ==========

  factory WorkScheduleSession.fromJson(Map<String, dynamic> json) {
    return WorkScheduleSession(
      scheduleId: json['id'] ?? json['schedule_id'] ?? 0,
      officeId: json['office']?['id'] ?? json['office_id'] ?? 0,
      officeName: json['office']?['name'] ?? json['office_name'] ?? '',
      officeLat:
          (json['office']?['latitude'] ?? json['office_lat'] ?? 0).toDouble(),
      officeLng:
          (json['office']?['longitude'] ?? json['office_lng'] ?? 0).toDouble(),
      officeRadius: json['office']?['radius'] ?? json['office_radius'] ?? 100,
      shiftId: json['shift']?['id'] ?? json['shift_id'] ?? 0,
      shiftName: json['shift']?['name'] ?? json['shift_name'] ?? '',
      shiftStart:
          json['shift']?['start_time'] ?? json['shift_start'] ?? '08:30',
      shiftEnd: json['shift']?['end_time'] ?? json['shift_end'] ?? '17:30',
      isWfa: json['is_wfa'] ?? false,
      isBanned: json['is_banned'] ?? false,
      bannedReason: json['banned_reason'],
    );
  }

  factory WorkScheduleSession.fromTodaySchedule(dynamic schedule) {
    return WorkScheduleSession(
      scheduleId: schedule.id,
      officeId: schedule.office.id,
      officeName: schedule.office.name,
      officeLat: schedule.office.latitude ?? 0,
      officeLng: schedule.office.longitude ?? 0,
      officeRadius: schedule.office.radius ?? 100,
      shiftId: schedule.shift.id,
      shiftName: schedule.shift.name,
      shiftStart: schedule.shift.startTime ?? '08:30',
      shiftEnd: schedule.shift.endTime ?? '17:30',
      isWfa: schedule.isWfa,
      isBanned: schedule.isBanned,
      bannedReason: schedule.bannedReason,
    );
  }

  factory WorkScheduleSession.empty() {
    return const WorkScheduleSession(
      scheduleId: 0,
      officeId: 0,
      officeName: '',
      officeLat: 0,
      officeLng: 0,
      officeRadius: 100,
      shiftId: 0,
      shiftName: '',
      shiftStart: '08:30',
      shiftEnd: '17:30',
      isWfa: false,
    );
  }

  // ========== TO JSON ==========

  Map<String, dynamic> toJson() {
    return {
      'schedule_id': scheduleId,
      'office_id': officeId,
      'office_name': officeName,
      'office_lat': officeLat,
      'office_lng': officeLng,
      'office_radius': officeRadius,
      'shift_id': shiftId,
      'shift_name': shiftName,
      'shift_start': shiftStart,
      'shift_end': shiftEnd,
      'is_wfa': isWfa,
      'is_banned': isBanned,
      'banned_reason': bannedReason,
    };
  }

  // ========== COPY WITH ==========

  WorkScheduleSession copyWith({
    int? scheduleId,
    int? officeId,
    String? officeName,
    double? officeLat,
    double? officeLng,
    int? officeRadius,
    int? shiftId,
    String? shiftName,
    String? shiftStart,
    String? shiftEnd,
    bool? isWfa,
    bool? isBanned,
    String? bannedReason,
  }) {
    return WorkScheduleSession(
      scheduleId: scheduleId ?? this.scheduleId,
      officeId: officeId ?? this.officeId,
      officeName: officeName ?? this.officeName,
      officeLat: officeLat ?? this.officeLat,
      officeLng: officeLng ?? this.officeLng,
      officeRadius: officeRadius ?? this.officeRadius,
      shiftId: shiftId ?? this.shiftId,
      shiftName: shiftName ?? this.shiftName,
      shiftStart: shiftStart ?? this.shiftStart,
      shiftEnd: shiftEnd ?? this.shiftEnd,
      isWfa: isWfa ?? this.isWfa,
      isBanned: isBanned ?? this.isBanned,
      bannedReason: bannedReason ?? this.bannedReason,
    );
  }

  // ========== COMPUTED PROPERTIES ==========

  bool get canCheckIn => !isBanned && scheduleId > 0;
  bool get skipGpsValidation => isWfa;
  bool get isValid => scheduleId > 0 && officeId > 0 && shiftId > 0;

  String get shiftTimeDisplay => '$shiftStart - $shiftEnd';
  String get officeDisplay => officeName;
  String get coordinateDisplay => '$officeLat, $officeLng';
  String get statusDisplay =>
      isBanned ? 'Ditangguhkan' : (isWfa ? 'WFA' : 'Kantor');

  String get statusMessage {
    if (isBanned) {
      return 'Akun ditangguhkan: ${bannedReason ?? "Tidak diketahui"}';
    }
    if (isWfa) return 'WFA - Absen dari rumah';
    return 'Siap untuk absen di $officeName';
  }
}
