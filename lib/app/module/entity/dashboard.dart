import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

// ========== DASHBOARD STATS ENTITY ==========
@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    required DashboardUser user,
    @JsonKey(name: 'today_info') required TodayInfo todayInfo,
    required DashboardStatsData stats,
    @JsonKey(name: 'schedule_today') ScheduleToday? scheduleToday,
    @JsonKey(name: 'attendance_today') AttendanceToday? attendanceToday,
    @JsonKey(name: 'can_check_in') @Default(false) bool canCheckIn,
    @JsonKey(name: 'can_check_out') @Default(false) bool canCheckOut,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsFromJson(json);
}

// ========== DASHBOARD USER ==========
@freezed
class DashboardUser with _$DashboardUser {
  const factory DashboardUser({
    required int id,
    required String name,
    required String email,
    String? position,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'join_date') String? joinDate,
  }) = _DashboardUser;

  factory DashboardUser.fromJson(Map<String, dynamic> json) =>
      _$DashboardUserFromJson(json);
}

// ========== TODAY INFO ==========
@freezed
class TodayInfo with _$TodayInfo {
  const factory TodayInfo({
    required String date,
    @JsonKey(name: 'day_name') required String dayName,
    @JsonKey(name: 'is_working_day') @Default(false) bool isWorkingDay,
    @JsonKey(name: 'has_schedule') @Default(false) bool hasSchedule,
    @JsonKey(name: 'is_banned') @Default(false) bool isBanned,
    @JsonKey(name: 'banned_reason') String? bannedReason,
  }) = _TodayInfo;

  factory TodayInfo.fromJson(Map<String, dynamic> json) =>
      _$TodayInfoFromJson(json);
}

// ========== DASHBOARD STATS DATA ==========
@freezed
class DashboardStatsData with _$DashboardStatsData {
  const factory DashboardStatsData({
    @JsonKey(name: 'hadir_bulan_ini') @Default(0) int hadirBulanIni,
    @JsonKey(name: 'total_hari_kerja') @Default(0) int totalHariKerja,
    @JsonKey(name: 'persentase_kehadiran')
    @Default(0.0)
    double persentaseKehadiran,
    @JsonKey(name: 'sisa_cuti') @Default(0) int sisaCuti,
    @JsonKey(name: 'total_cuti') @Default(12) int totalCuti,
    @JsonKey(name: 'terlambat_bulan_ini') @Default(0) int terlambatBulanIni,
    @JsonKey(name: 'total_izin_pending') @Default(0) int totalIzinPending,
    @JsonKey(name: 'total_cuti_pending') @Default(0) int totalCutiPending,
  }) = _DashboardStatsData;

  factory DashboardStatsData.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsDataFromJson(json);
}

// ========== SCHEDULE TODAY ==========
@freezed
class ScheduleToday with _$ScheduleToday {
  const factory ScheduleToday({
    required int id,
    @JsonKey(name: 'shift_name') String? shiftName,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'office_name') String? officeName,
    @JsonKey(name: 'office_latitude') double? officeLatitude,
    @JsonKey(name: 'office_longitude') double? officeLongitude,
    @JsonKey(name: 'is_wfa') @Default(false) bool isWfa,
  }) = _ScheduleToday;

  factory ScheduleToday.fromJson(Map<String, dynamic> json) =>
      _$ScheduleTodayFromJson(json);
}

// ========== ATTENDANCE TODAY ==========
@freezed
class AttendanceToday with _$AttendanceToday {
  const factory AttendanceToday({
    required int id,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'is_late') @Default(false) bool isLate,
    @JsonKey(name: 'work_duration') String? workDuration,
    @JsonKey(name: 'lunch_money') String? lunchMoney,
    @JsonKey(name: 'has_checked_out') @Default(false) bool hasCheckedOut,
    @JsonKey(name: 'permission_type') String? permissionType,
  }) = _AttendanceToday;

  factory AttendanceToday.fromJson(Map<String, dynamic> json) =>
      _$AttendanceTodayFromJson(json);
}

// ========== MONTHLY SUMMARY ENTITY ==========
@freezed
class MonthlySummary with _$MonthlySummary {
  const factory MonthlySummary({
    required int month,
    required int year,
    @JsonKey(name: 'month_name') String? monthName,
    @JsonKey(name: 'total_working_days') @Default(0) int totalWorkingDays,
    @JsonKey(name: 'present_days') @Default(0) int presentDays,
    @JsonKey(name: 'late_days') @Default(0) int lateDays,
    @JsonKey(name: 'absent_days') @Default(0) int absentDays,
    @JsonKey(name: 'attendance_rate') @Default(0.0) double attendanceRate,
    List<CalendarDay>? calendar,
  }) = _MonthlySummary;

  factory MonthlySummary.fromJson(Map<String, dynamic> json) =>
      _$MonthlySummaryFromJson(json);
}

// ========== CALENDAR DAY ==========
@freezed
class CalendarDay with _$CalendarDay {
  const factory CalendarDay({
    required String date,
    required String day,
    @JsonKey(name: 'day_name') String? dayName,
    required String status, // present, absent, holiday
    @JsonKey(name: 'is_late') @Default(false) bool isLate,
    @JsonKey(name: 'check_in') String? checkIn,
    @JsonKey(name: 'check_out') String? checkOut,
  }) = _CalendarDay;

  factory CalendarDay.fromJson(Map<String, dynamic> json) =>
      _$CalendarDayFromJson(json);
}

// ========== RECENT ACTIVITY ENTITY ==========
@freezed
class RecentActivity with _$RecentActivity {
  const factory RecentActivity({
    required String type, // attendance, leave, permission
    required String date,
    String? time,
    required String status,
    required String icon,
    required String message,
    int? duration,
  }) = _RecentActivity;

  factory RecentActivity.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityFromJson(json);
}

// ========== PARAMETER CLASSES ==========

/// Parameter untuk monthly summary
class MonthlySummaryParams {
  final int month;
  final int year;

  const MonthlySummaryParams({
    required this.month,
    required this.year,
  });

  Map<String, dynamic> toQueryParams() => {
        'month': month.toString(),
        'year': year.toString(),
      };
}

// ========== EXTENSIONS ==========

extension DashboardStatsX on DashboardStats {
  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 11) return 'Selamat Pagi';
    if (hour < 15) return 'Selamat Siang';
    if (hour < 18) return 'Selamat Sore';
    return 'Selamat Malam';
  }

  String get displayName => user.name;
  String get displayPosition => user.position ?? 'Karyawan';

  bool get isBanned => todayInfo.isBanned;
  String get bannedMessage => todayInfo.bannedReason ?? 'Akun ditangguhkan';

  bool get hasSchedule => scheduleToday != null;
  bool get hasAttendance => attendanceToday != null;
  bool get isCheckedIn => attendanceToday != null;
  bool get isCheckedOut => attendanceToday?.hasCheckedOut ?? false;
}

extension DashboardStatsDataX on DashboardStatsData {
  String get attendanceRateDisplay =>
      '${persentaseKehadiran.toStringAsFixed(1)}%';

  double get leaveUsagePercentage {
    if (totalCuti == 0) return 0;
    final used = totalCuti - sisaCuti;
    return (used / totalCuti) * 100;
  }

  String get leaveDisplay => '$sisaCuti/$totalCuti hari';

  Color get attendanceRateColor {
    if (persentaseKehadiran >= 90) return Colors.green;
    if (persentaseKehadiran >= 75) return Colors.orange;
    return Colors.red;
  }
}

extension MonthlySummaryX on MonthlySummary {
  String get attendanceRateDisplay => '${attendanceRate.toStringAsFixed(1)}%';

  String get summaryText => '$presentDays dari $totalWorkingDays hari kerja';

  Color get rateColor {
    if (attendanceRate >= 90) return Colors.green;
    if (attendanceRate >= 75) return Colors.orange;
    return Colors.red;
  }

  List<CalendarDay> get workingDays =>
      calendar?.where((d) => d.status != 'holiday').toList() ?? [];

  int get totalCalendarDays => calendar?.length ?? 0;
}

extension CalendarDayX on CalendarDay {
  bool get isPresent => status == 'present';
  bool get isAbsent => status == 'absent';
  bool get isHoliday => status == 'holiday';
  bool get isWeekend => dayName == 'Sab' || dayName == 'Min';

  Color get statusColor {
    if (isPresent && isLate) return Colors.orange;
    if (isPresent) return Colors.green;
    if (isAbsent) return Colors.red;
    return Colors.grey;
  }

  String get displayStatus {
    if (isPresent && isLate) return 'Terlambat';
    if (isPresent) return 'Hadir';
    if (isAbsent) return 'Tidak Hadir';
    return '-';
  }
}

extension RecentActivityX on RecentActivity {
  bool get isAttendance => type == 'attendance';
  bool get isLeave => type == 'leave';
  bool get isPermission => type == 'permission';

  IconData get typeIcon {
    if (isAttendance) return Icons.fingerprint_rounded;
    if (isLeave) return Icons.beach_access_rounded;
    return Icons.note_alt_rounded;
  }

  Color get statusColor {
    if (status == 'approved' || status == 'on_time') return Colors.green;
    if (status == 'rejected' || status == 'late') return Colors.red;
    return Colors.orange;
  }
}

extension DashboardStatsExtension on DashboardStats {
  static DashboardStats empty() => const DashboardStats(
        user: DashboardUser(id: 0, name: '', email: ''),
        todayInfo: TodayInfo(date: '', dayName: ''),
        stats: DashboardStatsData(),
      );
}
