// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleEntityImpl _$$ScheduleEntityImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleEntityImpl(
      id: (json['id'] as num).toInt(),
      user: ScheduleUser.fromJson(json['user'] as Map<String, dynamic>),
      shift: ShiftInfo.fromJson(json['shift'] as Map<String, dynamic>),
      office: OfficeInfo.fromJson(json['office'] as Map<String, dynamic>),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      isWfa: json['is_wfa'] as bool? ?? false,
      isBanned: json['is_banned'] as bool? ?? false,
      bannedReason: json['banned_reason'] as String?,
      isActive: json['is_active'] as bool? ?? false,
      dateRange: json['date_range'] as String?,
    );

Map<String, dynamic> _$$ScheduleEntityImplToJson(
        _$ScheduleEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'shift': instance.shift,
      'office': instance.office,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_wfa': instance.isWfa,
      'is_banned': instance.isBanned,
      'banned_reason': instance.bannedReason,
      'is_active': instance.isActive,
      'date_range': instance.dateRange,
    };

_$ScheduleUserImpl _$$ScheduleUserImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleUserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$$ScheduleUserImplToJson(_$ScheduleUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
    };

_$PaginatedScheduleImpl _$$PaginatedScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedScheduleImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ScheduleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta:
          SchedulePaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedScheduleImplToJson(
        _$PaginatedScheduleImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$SchedulePaginationMetaImpl _$$SchedulePaginationMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$SchedulePaginationMetaImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 10,
      total: (json['total'] as num?)?.toInt() ?? 0,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$SchedulePaginationMetaImplToJson(
        _$SchedulePaginationMetaImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'last_page': instance.lastPage,
    };
