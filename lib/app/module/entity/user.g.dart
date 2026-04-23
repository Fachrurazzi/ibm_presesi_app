// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      emailVerifiedAt: json['email_verified_at'] as String?,
      image: json['image'] as String?,
      imageUrl: json['image_url'] as String?,
      positionId: (json['position_id'] as num?)?.toInt(),
      positionName: json['position_name'] as String?,
      position: json['position'] == null
          ? null
          : PositionEntity.fromJson(json['position'] as Map<String, dynamic>),
      joinDate: json['join_date'] as String?,
      leaveQuota: (json['leave_quota'] as num?)?.toInt() ?? 12,
      remainingLeave: (json['remaining_leave'] as num?)?.toInt() ?? 12,
      cashableLeave: (json['cashable_leave'] as num?)?.toInt() ?? 0,
      isDefaultPassword: json['is_default_password'] as bool? ?? false,
      isFaceRegistered: json['is_face_registered'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'image': instance.image,
      'image_url': instance.imageUrl,
      'position_id': instance.positionId,
      'position_name': instance.positionName,
      'position': instance.position,
      'join_date': instance.joinDate,
      'leave_quota': instance.leaveQuota,
      'remaining_leave': instance.remainingLeave,
      'cashable_leave': instance.cashableLeave,
      'is_default_password': instance.isDefaultPassword,
      'is_face_registered': instance.isFaceRegistered,
    };

_$PositionEntityImpl _$$PositionEntityImplFromJson(Map<String, dynamic> json) =>
    _$PositionEntityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$PositionEntityImplToJson(
        _$PositionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$UserScheduleImpl _$$UserScheduleImplFromJson(Map<String, dynamic> json) =>
    _$UserScheduleImpl(
      id: (json['id'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      shift: ShiftInfo.fromJson(json['shift'] as Map<String, dynamic>),
      office: OfficeInfo.fromJson(json['office'] as Map<String, dynamic>),
      isWfa: json['is_wfa'] as bool? ?? false,
      isActive: json['is_active'] as bool? ?? false,
      dateRange: json['date_range'] as String?,
    );

Map<String, dynamic> _$$UserScheduleImplToJson(_$UserScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'shift': instance.shift,
      'office': instance.office,
      'is_wfa': instance.isWfa,
      'is_active': instance.isActive,
      'date_range': instance.dateRange,
    };

_$ShiftInfoImpl _$$ShiftInfoImplFromJson(Map<String, dynamic> json) =>
    _$ShiftInfoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isOvernight: json['is_overnight'] as bool? ?? false,
    );

Map<String, dynamic> _$$ShiftInfoImplToJson(_$ShiftInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_overnight': instance.isOvernight,
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

_$TodayScheduleImpl _$$TodayScheduleImplFromJson(Map<String, dynamic> json) =>
    _$TodayScheduleImpl(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      dayName: json['day_name'] as String,
      shift: ShiftInfo.fromJson(json['shift'] as Map<String, dynamic>),
      office: OfficeInfo.fromJson(json['office'] as Map<String, dynamic>),
      isWfa: json['is_wfa'] as bool? ?? false,
      isBanned: json['is_banned'] as bool? ?? false,
      bannedReason: json['banned_reason'] as String?,
    );

Map<String, dynamic> _$$TodayScheduleImplToJson(_$TodayScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'day_name': instance.dayName,
      'shift': instance.shift,
      'office': instance.office,
      'is_wfa': instance.isWfa,
      'is_banned': instance.isBanned,
      'banned_reason': instance.bannedReason,
    };

_$LeaveSummaryImpl _$$LeaveSummaryImplFromJson(Map<String, dynamic> json) =>
    _$LeaveSummaryImpl(
      year: (json['year'] as num).toInt(),
      totalQuota: (json['total_quota'] as num?)?.toInt() ?? 12,
      usedLeave: (json['used_leave'] as num?)?.toInt() ?? 0,
      remainingLeave: (json['remaining_leave'] as num?)?.toInt() ?? 12,
      pendingCount: (json['pending_count'] as num?)?.toInt() ?? 0,
      cashableLeave: (json['cashable_leave'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$LeaveSummaryImplToJson(_$LeaveSummaryImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'total_quota': instance.totalQuota,
      'used_leave': instance.usedLeave,
      'remaining_leave': instance.remainingLeave,
      'pending_count': instance.pendingCount,
      'cashable_leave': instance.cashableLeave,
    };

_$PaginatedUserScheduleImpl _$$PaginatedUserScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedUserScheduleImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      monthName: json['month_name'] as String?,
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => UserSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PaginatedUserScheduleImplToJson(
        _$PaginatedUserScheduleImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'month_name': instance.monthName,
      'schedules': instance.schedules,
      'total': instance.total,
    };
