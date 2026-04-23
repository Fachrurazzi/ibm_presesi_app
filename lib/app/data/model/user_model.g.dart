// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserUpdateRequestImpl _$$UserUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserUpdateRequestImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserUpdateRequestImplToJson(
        _$UserUpdateRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$UserProfileResponseImpl _$$UserProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileResponseImpl(
      data: UserEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileResponseImplToJson(
        _$UserProfileResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$UserPhotoResponseImpl _$$UserPhotoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPhotoResponseImpl(
      fullUrl: json['full_url'] as String,
    );

Map<String, dynamic> _$$UserPhotoResponseImplToJson(
        _$UserPhotoResponseImpl instance) =>
    <String, dynamic>{
      'full_url': instance.fullUrl,
    };

_$UserScheduleResponseImpl _$$UserScheduleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserScheduleResponseImpl(
      month: (json['month'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      monthName: json['month_name'] as String?,
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => UserSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserScheduleResponseImplToJson(
        _$UserScheduleResponseImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'month_name': instance.monthName,
      'schedules': instance.schedules,
      'total': instance.total,
    };

_$TodayScheduleResponseImpl _$$TodayScheduleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TodayScheduleResponseImpl(
      data: TodaySchedule.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TodayScheduleResponseImplToJson(
        _$TodayScheduleResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$LeaveSummaryResponseImpl _$$LeaveSummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaveSummaryResponseImpl(
      data: LeaveSummary.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeaveSummaryResponseImplToJson(
        _$LeaveSummaryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$FcmTokenRequestImpl _$$FcmTokenRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$FcmTokenRequestImpl(
      fcmToken: json['fcm_token'] as String,
    );

Map<String, dynamic> _$$FcmTokenRequestImplToJson(
        _$FcmTokenRequestImpl instance) =>
    <String, dynamic>{
      'fcm_token': instance.fcmToken,
    };

_$LocationUpdateRequestImpl _$$LocationUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationUpdateRequestImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationUpdateRequestImplToJson(
        _$LocationUpdateRequestImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
