// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStatsImpl _$$DashboardStatsImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStatsImpl(
      user: DashboardUser.fromJson(json['user'] as Map<String, dynamic>),
      todayInfo: TodayInfo.fromJson(json['today_info'] as Map<String, dynamic>),
      stats: DashboardStatsData.fromJson(json['stats'] as Map<String, dynamic>),
      scheduleToday: json['schedule_today'] == null
          ? null
          : ScheduleToday.fromJson(
              json['schedule_today'] as Map<String, dynamic>),
      attendanceToday: json['attendance_today'] == null
          ? null
          : AttendanceToday.fromJson(
              json['attendance_today'] as Map<String, dynamic>),
      canCheckIn: json['can_check_in'] as bool? ?? false,
      canCheckOut: json['can_check_out'] as bool? ?? false,
    );

Map<String, dynamic> _$$DashboardStatsImplToJson(
        _$DashboardStatsImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'today_info': instance.todayInfo,
      'stats': instance.stats,
      'schedule_today': instance.scheduleToday,
      'attendance_today': instance.attendanceToday,
      'can_check_in': instance.canCheckIn,
      'can_check_out': instance.canCheckOut,
    };

_$DashboardUserImpl _$$DashboardUserImplFromJson(Map<String, dynamic> json) =>
    _$DashboardUserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      position: json['position'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      joinDate: json['join_date'] as String?,
    );

Map<String, dynamic> _$$DashboardUserImplToJson(_$DashboardUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'position': instance.position,
      'avatar_url': instance.avatarUrl,
      'join_date': instance.joinDate,
    };

_$TodayInfoImpl _$$TodayInfoImplFromJson(Map<String, dynamic> json) =>
    _$TodayInfoImpl(
      date: json['date'] as String,
      dayName: json['day_name'] as String,
      isWorkingDay: json['is_working_day'] as bool? ?? false,
      hasSchedule: json['has_schedule'] as bool? ?? false,
      isBanned: json['is_banned'] as bool? ?? false,
      bannedReason: json['banned_reason'] as String?,
    );

Map<String, dynamic> _$$TodayInfoImplToJson(_$TodayInfoImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day_name': instance.dayName,
      'is_working_day': instance.isWorkingDay,
      'has_schedule': instance.hasSchedule,
      'is_banned': instance.isBanned,
      'banned_reason': instance.bannedReason,
    };

_$DashboardStatsDataImpl _$$DashboardStatsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardStatsDataImpl(
      hadirBulanIni: (json['hadir_bulan_ini'] as num?)?.toInt() ?? 0,
      totalHariKerja: (json['total_hari_kerja'] as num?)?.toInt() ?? 0,
      persentaseKehadiran:
          (json['persentase_kehadiran'] as num?)?.toDouble() ?? 0.0,
      sisaCuti: (json['sisa_cuti'] as num?)?.toInt() ?? 0,
      totalCuti: (json['total_cuti'] as num?)?.toInt() ?? 12,
      terlambatBulanIni: (json['terlambat_bulan_ini'] as num?)?.toInt() ?? 0,
      totalIzinPending: (json['total_izin_pending'] as num?)?.toInt() ?? 0,
      totalCutiPending: (json['total_cuti_pending'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DashboardStatsDataImplToJson(
        _$DashboardStatsDataImpl instance) =>
    <String, dynamic>{
      'hadir_bulan_ini': instance.hadirBulanIni,
      'total_hari_kerja': instance.totalHariKerja,
      'persentase_kehadiran': instance.persentaseKehadiran,
      'sisa_cuti': instance.sisaCuti,
      'total_cuti': instance.totalCuti,
      'terlambat_bulan_ini': instance.terlambatBulanIni,
      'total_izin_pending': instance.totalIzinPending,
      'total_cuti_pending': instance.totalCutiPending,
    };

_$ScheduleTodayImpl _$$ScheduleTodayImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleTodayImpl(
      id: (json['id'] as num).toInt(),
      shiftName: json['shift_name'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      officeName: json['office_name'] as String?,
      officeLatitude: (json['office_latitude'] as num?)?.toDouble(),
      officeLongitude: (json['office_longitude'] as num?)?.toDouble(),
      isWfa: json['is_wfa'] as bool? ?? false,
    );

Map<String, dynamic> _$$ScheduleTodayImplToJson(_$ScheduleTodayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shift_name': instance.shiftName,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'office_name': instance.officeName,
      'office_latitude': instance.officeLatitude,
      'office_longitude': instance.officeLongitude,
      'is_wfa': instance.isWfa,
    };

_$AttendanceTodayImpl _$$AttendanceTodayImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceTodayImpl(
      id: (json['id'] as num).toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isLate: json['is_late'] as bool? ?? false,
      workDuration: json['work_duration'] as String?,
      lunchMoney: json['lunch_money'] as String?,
      hasCheckedOut: json['has_checked_out'] as bool? ?? false,
      permissionType: json['permission_type'] as String?,
    );

Map<String, dynamic> _$$AttendanceTodayImplToJson(
        _$AttendanceTodayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_late': instance.isLate,
      'work_duration': instance.workDuration,
      'lunch_money': instance.lunchMoney,
      'has_checked_out': instance.hasCheckedOut,
      'permission_type': instance.permissionType,
    };

_$MonthlySummaryImpl _$$MonthlySummaryImplFromJson(Map<String, dynamic> json) =>
    _$MonthlySummaryImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      monthName: json['month_name'] as String?,
      totalWorkingDays: (json['total_working_days'] as num?)?.toInt() ?? 0,
      presentDays: (json['present_days'] as num?)?.toInt() ?? 0,
      lateDays: (json['late_days'] as num?)?.toInt() ?? 0,
      absentDays: (json['absent_days'] as num?)?.toInt() ?? 0,
      attendanceRate: (json['attendance_rate'] as num?)?.toDouble() ?? 0.0,
      calendar: (json['calendar'] as List<dynamic>?)
          ?.map((e) => CalendarDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MonthlySummaryImplToJson(
        _$MonthlySummaryImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'month_name': instance.monthName,
      'total_working_days': instance.totalWorkingDays,
      'present_days': instance.presentDays,
      'late_days': instance.lateDays,
      'absent_days': instance.absentDays,
      'attendance_rate': instance.attendanceRate,
      'calendar': instance.calendar,
    };

_$CalendarDayImpl _$$CalendarDayImplFromJson(Map<String, dynamic> json) =>
    _$CalendarDayImpl(
      date: json['date'] as String,
      day: json['day'] as String,
      dayName: json['day_name'] as String?,
      status: json['status'] as String,
      isLate: json['is_late'] as bool? ?? false,
      checkIn: json['check_in'] as String?,
      checkOut: json['check_out'] as String?,
    );

Map<String, dynamic> _$$CalendarDayImplToJson(_$CalendarDayImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'day_name': instance.dayName,
      'status': instance.status,
      'is_late': instance.isLate,
      'check_in': instance.checkIn,
      'check_out': instance.checkOut,
    };

_$RecentActivityImpl _$$RecentActivityImplFromJson(Map<String, dynamic> json) =>
    _$RecentActivityImpl(
      type: json['type'] as String,
      date: json['date'] as String,
      time: json['time'] as String?,
      status: json['status'] as String,
      icon: json['icon'] as String,
      message: json['message'] as String,
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RecentActivityImplToJson(
        _$RecentActivityImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'icon': instance.icon,
      'message': instance.message,
      'duration': instance.duration,
    };
