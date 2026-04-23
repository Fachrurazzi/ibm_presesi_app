// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceEntityImpl _$$AttendanceEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceEntityImpl(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isLate: json['is_late'] as bool? ?? false,
      hasPermission: json['has_permission'] as bool? ?? false,
      permissionType: json['permission_type'] as String?,
      lunchMoney: (json['lunch_money'] as num?)?.toInt() ?? 0,
      lunchMoneyLabel: json['lunch_money_label'] as String? ?? 'Rp 0',
      scheduleStart: json['schedule_start'] as String?,
      scheduleEnd: json['schedule_end'] as String?,
      workDuration: json['work_duration'] as String?,
      scheduleId: (json['schedule_id'] as num?)?.toInt(),
      office: json['office'] == null
          ? null
          : OfficeInfo.fromJson(json['office'] as Map<String, dynamic>),
      shift: json['shift'] == null
          ? null
          : ShiftInfo.fromJson(json['shift'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceEntityImplToJson(
        _$AttendanceEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_late': instance.isLate,
      'has_permission': instance.hasPermission,
      'permission_type': instance.permissionType,
      'lunch_money': instance.lunchMoney,
      'lunch_money_label': instance.lunchMoneyLabel,
      'schedule_start': instance.scheduleStart,
      'schedule_end': instance.scheduleEnd,
      'work_duration': instance.workDuration,
      'schedule_id': instance.scheduleId,
      'office': instance.office,
      'shift': instance.shift,
    };

_$OfficeInfoImpl _$$OfficeInfoImplFromJson(Map<String, dynamic> json) =>
    _$OfficeInfoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OfficeInfoImplToJson(_$OfficeInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
    };

_$ShiftInfoImpl _$$ShiftInfoImplFromJson(Map<String, dynamic> json) =>
    _$ShiftInfoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$ShiftInfoImplToJson(_$ShiftInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

_$AttendanceSummaryImpl _$$AttendanceSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceSummaryImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      totalWorkingDays: (json['total_working_days'] as num?)?.toInt() ?? 0,
      presentDays: (json['present_days'] as num?)?.toInt() ?? 0,
      lateDays: (json['late_days'] as num?)?.toInt() ?? 0,
      absentDays: (json['absent_days'] as num?)?.toInt() ?? 0,
      attendanceRate: (json['attendance_rate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$AttendanceSummaryImplToJson(
        _$AttendanceSummaryImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'total_working_days': instance.totalWorkingDays,
      'present_days': instance.presentDays,
      'late_days': instance.lateDays,
      'absent_days': instance.absentDays,
      'attendance_rate': instance.attendanceRate,
    };

_$AttendanceScheduleImpl _$$AttendanceScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceScheduleImpl(
      id: (json['id'] as num).toInt(),
      office: OfficeInfo.fromJson(json['office'] as Map<String, dynamic>),
      shift: ShiftInfo.fromJson(json['shift'] as Map<String, dynamic>),
      isWfa: json['is_wfa'] as bool? ?? false,
      isBanned: json['is_banned'] as bool? ?? false,
      bannedReason: json['banned_reason'] as String?,
      isOnLeave: json['is_on_leave'] as bool? ?? false,
    );

Map<String, dynamic> _$$AttendanceScheduleImplToJson(
        _$AttendanceScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'office': instance.office,
      'shift': instance.shift,
      'is_wfa': instance.isWfa,
      'is_banned': instance.isBanned,
      'banned_reason': instance.bannedReason,
      'is_on_leave': instance.isOnLeave,
    };

_$PaginatedAttendanceImpl _$$PaginatedAttendanceImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedAttendanceImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => AttendanceEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedAttendanceImplToJson(
        _$PaginatedAttendanceImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 10,
      total: (json['total'] as num?)?.toInt() ?? 0,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
        _$PaginationMetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'last_page': instance.lastPage,
    };
