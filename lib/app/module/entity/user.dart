import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// ========== USER ENTITY ==========
@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required int id,
    @Default("") String name,
    @Default("") String email,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    String? image,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'position_id') int? positionId,
    @JsonKey(name: 'position_name') String? positionName,
    PositionEntity? position,
    @JsonKey(name: 'join_date') String? joinDate,
    @JsonKey(name: 'leave_quota') @Default(12) int leaveQuota,
    @JsonKey(name: 'remaining_leave') @Default(12) int remainingLeave,
    @JsonKey(name: 'cashable_leave') @Default(0) int cashableLeave,
    @JsonKey(name: 'is_default_password')
    @Default(false)
    bool isDefaultPassword,
    @JsonKey(name: 'is_face_registered') @Default(false) bool isFaceRegistered,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  factory UserEntity.empty() => const UserEntity(id: 0);
}

// ========== POSITION ENTITY ==========
@freezed
class PositionEntity with _$PositionEntity {
  const factory PositionEntity({
    required int id,
    required String name,
  }) = _PositionEntity;

  factory PositionEntity.fromJson(Map<String, dynamic> json) =>
      _$PositionEntityFromJson(json);
}

// ========== USER SCHEDULE ENTITY ==========
@freezed
class UserSchedule with _$UserSchedule {
  const factory UserSchedule({
    required int id,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') String? endDate,
    required ShiftInfo shift,
    required OfficeInfo office,
    @JsonKey(name: 'is_wfa') @Default(false) bool isWfa,
    @JsonKey(name: 'is_active') @Default(false) bool isActive,
    @JsonKey(name: 'date_range') String? dateRange,
  }) = _UserSchedule;

  factory UserSchedule.fromJson(Map<String, dynamic> json) =>
      _$UserScheduleFromJson(json);
}

// ========== SHIFT INFO ==========
@freezed
class ShiftInfo with _$ShiftInfo {
  const factory ShiftInfo({
    required int id,
    required String name,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'is_overnight') @Default(false) bool isOvernight,
  }) = _ShiftInfo;

  factory ShiftInfo.fromJson(Map<String, dynamic> json) =>
      _$ShiftInfoFromJson(json);
}

// ========== OFFICE INFO ==========
@freezed
class OfficeInfo with _$OfficeInfo {
  const factory OfficeInfo({
    required int id,
    required String name,
    double? latitude,
    double? longitude,
    int? radius,
  }) = _OfficeInfo;

  factory OfficeInfo.fromJson(Map<String, dynamic> json) =>
      _$OfficeInfoFromJson(json);
}

// ========== TODAY SCHEDULE ENTITY ==========
@freezed
class TodaySchedule with _$TodaySchedule {
  const factory TodaySchedule({
    required int id,
    required String date,
    @JsonKey(name: 'day_name') required String dayName,
    required ShiftInfo shift,
    required OfficeInfo office,
    @JsonKey(name: 'is_wfa') @Default(false) bool isWfa,
    @JsonKey(name: 'is_banned') @Default(false) bool isBanned,
    @JsonKey(name: 'banned_reason') String? bannedReason,
  }) = _TodaySchedule;

  factory TodaySchedule.fromJson(Map<String, dynamic> json) =>
      _$TodayScheduleFromJson(json);
}

// ========== LEAVE SUMMARY ENTITY ==========
@freezed
class LeaveSummary with _$LeaveSummary {
  const factory LeaveSummary({
    required int year,
    @JsonKey(name: 'total_quota') @Default(12) int totalQuota,
    @JsonKey(name: 'used_leave') @Default(0) int usedLeave,
    @JsonKey(name: 'remaining_leave') @Default(12) int remainingLeave,
    @JsonKey(name: 'pending_count') @Default(0) int pendingCount,
    @JsonKey(name: 'cashable_leave') @Default(0) int cashableLeave,
  }) = _LeaveSummary;

  factory LeaveSummary.fromJson(Map<String, dynamic> json) =>
      _$LeaveSummaryFromJson(json);
}

// ========== PAGINATED SCHEDULE RESPONSE ==========
@freezed
class PaginatedUserSchedule with _$PaginatedUserSchedule {
  const factory PaginatedUserSchedule({
    required int month,
    required int year,
    @JsonKey(name: 'month_name') String? monthName,
    required List<UserSchedule> schedules,
    @Default(0) int total,
  }) = _PaginatedUserSchedule;

  factory PaginatedUserSchedule.fromJson(Map<String, dynamic> json) =>
      _$PaginatedUserScheduleFromJson(json);
}

// ========== PARAMETER CLASSES ==========

/// Parameter untuk update profile
class UserUpdateParams {
  final String name;
  final String? imagePath; // local file path untuk upload

  const UserUpdateParams({
    required this.name,
    this.imagePath,
  });

  bool get hasImage => imagePath != null && imagePath!.isNotEmpty;
}

/// Parameter untuk user schedule
class UserScheduleParams {
  final int month;
  final int year;

  const UserScheduleParams({
    required this.month,
    required this.year,
  });

  Map<String, dynamic> toQueryParams() => {
        'month': month.toString(),
        'year': year.toString(),
      };
}

/// Parameter untuk leave summary
class LeaveSummaryParams {
  final int year;

  const LeaveSummaryParams({required this.year});

  Map<String, dynamic> toQueryParams() => {'year': year.toString()};
}

/// Parameter untuk update FCM token
class FcmTokenParams {
  final String fcmToken;

  const FcmTokenParams({required this.fcmToken});

  Map<String, dynamic> toJson() => {'fcm_token': fcmToken};
}

/// Parameter untuk update location
class LocationUpdateParams {
  final double latitude;
  final double longitude;

  const LocationUpdateParams({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

// ========== EXTENSIONS ==========

extension UserEntityX on UserEntity {
  String get displayName => name.isNotEmpty ? name : 'Karyawan IBM';
  String get displayEmail => email;
  String get displayPosition => position?.name ?? positionName ?? 'Staff';
  String get displayJoinDate => joinDate ?? '-';

  bool get hasAvatar =>
      (image != null && image!.isNotEmpty) ||
      (imageUrl != null && imageUrl!.isNotEmpty);

  String get fullAvatarUrl {
    final img = imageUrl ?? image;
    if (img == null || img.isEmpty) return '';
    if (img.startsWith('http')) return img;
    return '${AppConfig.STORAGE_URL}/$img';
  }

  bool get isEmailVerified => emailVerifiedAt != null;
  bool get needsPasswordChange => isDefaultPassword;
  bool get needsFaceRegistration => !isFaceRegistered;

  double get leaveUsagePercentage {
    if (leaveQuota == 0) return 0;
    final used = leaveQuota - remainingLeave;
    return (used / leaveQuota) * 100;
  }

  String get leaveDisplay => '$remainingLeave/$leaveQuota hari';
}

extension UserScheduleX on UserSchedule {
  String get shiftDisplay =>
      '${shift.name} (${shift.startTime ?? '--:--'} - ${shift.endTime ?? '--:--'})';
  String get officeDisplay => office.name;
  String get dateDisplay =>
      dateRange ?? '$startDate - ${endDate ?? "Sekarang"}';

  bool get isActiveNow => isActive;
}

extension TodayScheduleX on TodaySchedule {
  bool get canCheckIn => !isBanned;
  bool get isOnLeave =>
      false; // 👈 Tambahkan default, atau ambil dari field jika ada
  String get shiftTimeDisplay =>
      '${shift.startTime ?? '--:--'} - ${shift.endTime ?? '--:--'}';
  String get statusMessage {
    if (isBanned) {
      return 'Akun ditangguhkan: ${bannedReason ?? "Tidak diketahui"}';
    }
    if (isWfa) return 'WFA - Absen dari rumah';
    return 'Siap untuk absen';
  }
}

extension LeaveSummaryX on LeaveSummary {
  double get usagePercentage {
    if (totalQuota == 0) return 0;
    return (usedLeave / totalQuota) * 100;
  }

  String get usageDisplay => '$usedLeave/$totalQuota hari';
  String get remainingDisplay => '$remainingLeave hari tersisa';

  bool get hasQuota => remainingLeave > 0;
  bool get hasPending => pendingCount > 0;
}
