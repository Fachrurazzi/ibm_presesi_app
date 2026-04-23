// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfficeRequestImpl _$$OfficeRequestImplFromJson(Map<String, dynamic> json) =>
    _$OfficeRequestImpl(
      name: json['name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toInt(),
      supervisorName: json['supervisor_name'] as String?,
    );

Map<String, dynamic> _$$OfficeRequestImplToJson(_$OfficeRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
      'supervisor_name': instance.supervisorName,
    };

_$OfficeResponseImpl _$$OfficeResponseImplFromJson(Map<String, dynamic> json) =>
    _$OfficeResponseImpl(
      data: OfficeEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OfficeResponseImplToJson(
        _$OfficeResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$OfficeListResponseImpl _$$OfficeListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OfficeListResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => OfficeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OfficeListResponseImplToJson(
        _$OfficeListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$CheckRadiusRequestImpl _$$CheckRadiusRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckRadiusRequestImpl(
      officeId: (json['office_id'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$CheckRadiusRequestImplToJson(
        _$CheckRadiusRequestImpl instance) =>
    <String, dynamic>{
      'office_id': instance.officeId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
