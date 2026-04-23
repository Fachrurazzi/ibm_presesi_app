// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleRequestImpl _$$ScheduleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleRequestImpl(
      userId: (json['user_id'] as num).toInt(),
      shiftId: (json['shift_id'] as num).toInt(),
      officeId: (json['office_id'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      isWfa: json['is_wfa'] as bool? ?? false,
      isBanned: json['is_banned'] as bool? ?? false,
      bannedReason: json['banned_reason'] as String?,
    );

Map<String, dynamic> _$$ScheduleRequestImplToJson(
        _$ScheduleRequestImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'shift_id': instance.shiftId,
      'office_id': instance.officeId,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_wfa': instance.isWfa,
      'is_banned': instance.isBanned,
      'banned_reason': instance.bannedReason,
    };

_$ScheduleResponseImpl _$$ScheduleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduleResponseImpl(
      data: ScheduleEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleResponseImplToJson(
        _$ScheduleResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$PaginatedScheduleResponseImpl _$$PaginatedScheduleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedScheduleResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ScheduleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta:
          SchedulePaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedScheduleResponseImplToJson(
        _$PaginatedScheduleResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$BanScheduleRequestImpl _$$BanScheduleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$BanScheduleRequestImpl(
      bannedReason: json['banned_reason'] as String,
    );

Map<String, dynamic> _$$BanScheduleRequestImplToJson(
        _$BanScheduleRequestImpl instance) =>
    <String, dynamic>{
      'banned_reason': instance.bannedReason,
    };
