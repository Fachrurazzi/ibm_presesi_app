// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfficeEntityImpl _$$OfficeEntityImplFromJson(Map<String, dynamic> json) =>
    _$OfficeEntityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toInt(),
      radiusDisplay: json['radius_display'] as String?,
      supervisorName: json['supervisor_name'] as String?,
      googleMapsUrl: json['google_maps_url'] as String?,
      locationFull: json['location_full'] as String?,
    );

Map<String, dynamic> _$$OfficeEntityImplToJson(_$OfficeEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
      'radius_display': instance.radiusDisplay,
      'supervisor_name': instance.supervisorName,
      'google_maps_url': instance.googleMapsUrl,
      'location_full': instance.locationFull,
    };

_$OfficeWithDistanceImpl _$$OfficeWithDistanceImplFromJson(
        Map<String, dynamic> json) =>
    _$OfficeWithDistanceImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      isWithinRadius: json['is_within_radius'] as bool? ?? false,
    );

Map<String, dynamic> _$$OfficeWithDistanceImplToJson(
        _$OfficeWithDistanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
      'distance': instance.distance,
      'is_within_radius': instance.isWithinRadius,
    };
