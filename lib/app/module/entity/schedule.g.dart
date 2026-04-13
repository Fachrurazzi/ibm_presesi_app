// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleEntityImpl _$$ScheduleEntityImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleEntityImpl(
      isWfa: json['is_wfa'] as bool? ?? false,
      isBanned: json['is_banned'] as bool? ?? false,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      office: OfficeEntity.fromJson(json['office'] as Map<String, dynamic>),
      shift: ShiftEntity.fromJson(json['shift'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleEntityImplToJson(
        _$ScheduleEntityImpl instance) =>
    <String, dynamic>{
      'is_wfa': instance.isWfa,
      'is_banned': instance.isBanned,
      'user': instance.user,
      'office': instance.office,
      'shift': instance.shift,
    };

_$OfficeEntityImpl _$$OfficeEntityImplFromJson(Map<String, dynamic> json) =>
    _$OfficeEntityImpl(
      name: json['name'] as String? ?? "Kantor IBM",
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radius: (json['radius'] as num?)?.toDouble() ?? 100.0,
    );

Map<String, dynamic> _$$OfficeEntityImplToJson(_$OfficeEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
    };

_$ShiftEntityImpl _$$ShiftEntityImplFromJson(Map<String, dynamic> json) =>
    _$ShiftEntityImpl(
      name: json['name'] as String? ?? "Shift Normal",
      startTime: json['start_time'] as String? ?? "08:30",
      endTime: json['end_time'] as String? ?? "17:30",
    );

Map<String, dynamic> _$$ShiftEntityImplToJson(_$ShiftEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
