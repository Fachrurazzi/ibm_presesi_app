import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

// ========== ATTENDANCE ENTITY ==========
@freezed
class Attendance with _$Attendance {
  const Attendance._();

  const factory Attendance.entity({
    required int id,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'is_late') @Default(false) bool isLate,
    @JsonKey(name: 'has_permission') @Default(false) bool hasPermission,
    @JsonKey(name: 'permission_type') String? permissionType,
    @JsonKey(name: 'lunch_money') @Default(0) int lunchMoney,
    @JsonKey(name: 'lunch_money_label') @Default('Rp 0') String lunchMoneyLabel,
    @JsonKey(name: 'schedule_start') String? scheduleStart,
    @JsonKey(name: 'schedule_end') String? scheduleEnd,
    @JsonKey(name: 'work_duration') String? workDuration,
    @JsonKey(name: 'schedule_id') int? scheduleId,
    @JsonKey(name: 'office') OfficeInfo? office,
    @JsonKey(name: 'shift') ShiftInfo? shift,
  }) = AttendanceEntity;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}

// ========== OFFICE INFO (Embedded) ==========
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

// ========== SHIFT INFO (Embedded) ==========
@freezed
class ShiftInfo with _$ShiftInfo {
  const factory ShiftInfo({
    required int id,
    required String name,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
  }) = _ShiftInfo;

  factory ShiftInfo.fromJson(Map<String, dynamic> json) =>
      _$ShiftInfoFromJson(json);
}

// ========== ATTENDANCE SUMMARY ENTITY ==========
@freezed
class AttendanceSummary with _$AttendanceSummary {
  const factory AttendanceSummary({
    required int month,
    required int year,
    @JsonKey(name: 'total_working_days') @Default(0) int totalWorkingDays,
    @JsonKey(name: 'present_days') @Default(0) int presentDays,
    @JsonKey(name: 'late_days') @Default(0) int lateDays,
    @JsonKey(name: 'absent_days') @Default(0) int absentDays,
    @JsonKey(name: 'attendance_rate') @Default(0.0) double attendanceRate,
  }) = _AttendanceSummary;

  factory AttendanceSummary.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSummaryFromJson(json);
}

// ========== ATTENDANCE SCHEDULE ENTITY ==========
@freezed
class AttendanceSchedule with _$AttendanceSchedule {
  const factory AttendanceSchedule({
    required int id,
    required OfficeInfo office,
    required ShiftInfo shift,
    @JsonKey(name: 'is_wfa') @Default(false) bool isWfa,
    @JsonKey(name: 'is_banned') @Default(false) bool isBanned,
    @JsonKey(name: 'banned_reason') String? bannedReason,
    @JsonKey(name: 'is_on_leave') @Default(false) bool isOnLeave,
  }) = _AttendanceSchedule;

  factory AttendanceSchedule.fromJson(Map<String, dynamic> json) =>
      _$AttendanceScheduleFromJson(json);
}

// ========== PARAMETER CLASSES ==========

/// Parameter untuk check-in / check-out
class AttendanceSendParams {
  final double latitude;
  final double longitude;

  const AttendanceSendParams({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

/// Parameter untuk riwayat absen dengan pagination
class AttendanceHistoryParams {
  final int month;
  final int year;
  final int perPage;
  final int page;

  const AttendanceHistoryParams({
    required this.month,
    required this.year,
    this.perPage = 10,
    this.page = 1,
  });

  Map<String, dynamic> toQueryParams() => {
        'month': month.toString(),
        'year': year.toString(),
        'per_page': perPage.toString(),
        'page': page.toString(),
      };
}

/// Parameter untuk summary absen
class AttendanceSummaryParams {
  final int month;
  final int year;

  const AttendanceSummaryParams({
    required this.month,
    required this.year,
  });

  Map<String, dynamic> toQueryParams() => {
        'month': month.toString(),
        'year': year.toString(),
      };
}

/// Parameter untuk report suspicious activity
class ReportSuspiciousParams {
  final String reason;

  const ReportSuspiciousParams({this.reason = 'Terdeteksi fake GPS/emulator'});

  Map<String, dynamic> toJson() => {'reason': reason};
}

// ========== PAGINATED RESPONSE ==========
@freezed
class PaginatedAttendance with _$PaginatedAttendance {
  const factory PaginatedAttendance({
    required List<AttendanceEntity> data,
    required PaginationMeta meta,
  }) = _PaginatedAttendance;

  factory PaginatedAttendance.fromJson(Map<String, dynamic> json) =>
      _$PaginatedAttendanceFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'per_page') @Default(10) int perPage,
    @Default(0) int total,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

// ========== EXTENSIONS ==========
extension AttendanceEntityX on AttendanceEntity {
  bool get isCheckedIn => startTime != null && startTime!.isNotEmpty;
  bool get isCheckedOut => endTime != null && endTime!.isNotEmpty;
  bool get isComplete => isCheckedIn && isCheckedOut;
  bool get canCheckOut => isCheckedIn && !isCheckedOut;

  String get displayStartTime {
    if (startTime == null || startTime == "--:--") return '--:--';
    return _formatTime(startTime!);
  }

  String get displayEndTime {
    if (endTime == null || endTime == "--:--") return '--:--';
    return _formatTime(endTime!);
  }

  String get displayScheduleTime {
    if (scheduleStart == null || scheduleEnd == null) return '--:-- - --:--';
    return '${_formatTime(scheduleStart!)} - ${_formatTime(scheduleEnd!)}';
  }

  String get statusLabel {
    if (!isCheckedIn) return 'Belum Absen';
    if (!isCheckedOut) return 'Sedang Bekerja';
    if (isLate) return 'Terlambat';
    return 'Tepat Waktu';
  }

  Color get statusColor {
    if (!isCheckedIn) return Colors.grey;
    if (!isCheckedOut) return Colors.blue;
    if (isLate) return Colors.orange;
    return Colors.green;
  }

  String _formatTime(String time) {
    try {
      final parts = time.split(' ');
      if (parts.length > 1) return parts[1].substring(0, 5);
      return time.substring(0, 5);
    } catch (e) {
      return '--:--';
    }
  }
}

extension AttendanceSummaryX on AttendanceSummary {
  String get rateDisplay => '${attendanceRate.toStringAsFixed(1)}%';
  bool get isPerfect => attendanceRate >= 100;
  bool get isGood => attendanceRate >= 80;
  bool get isWarning => attendanceRate < 75;
}

extension AttendanceScheduleX on AttendanceSchedule {
  bool get canCheckIn => !isBanned && !isOnLeave;
  bool get isActive => !isBanned;

  String get shiftTimeDisplay {
    final start = shift.startTime ?? '--:--';
    final end = shift.endTime ?? '--:--';
    return '$start - $end';
  }

  String get statusMessage {
    if (isBanned) {
      return 'Akun ditangguhkan: ${bannedReason ?? "Tidak diketahui"}';
    }
    if (isOnLeave) return 'Sedang dalam masa cuti';
    if (isWfa) return 'WFA - Absen dari rumah';
    return 'Siap untuk absen';
  }
}
