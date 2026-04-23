import 'package:freezed_annotation/freezed_annotation.dart';

part 'office.freezed.dart';
part 'office.g.dart';

// ========== OFFICE ENTITY ==========
@freezed
class OfficeEntity with _$OfficeEntity {
  const factory OfficeEntity({
    required int id,
    required String name,
    double? latitude,
    double? longitude,
    int? radius,
    @JsonKey(name: 'radius_display') String? radiusDisplay,
    @JsonKey(name: 'supervisor_name') String? supervisorName,
    @JsonKey(name: 'google_maps_url') String? googleMapsUrl,
    @JsonKey(name: 'location_full') String? locationFull,
  }) = _OfficeEntity;

  factory OfficeEntity.fromJson(Map<String, dynamic> json) =>
      _$OfficeEntityFromJson(json);
}

// ========== OFFICE WITH DISTANCE ==========
@freezed
class OfficeWithDistance with _$OfficeWithDistance {
  const factory OfficeWithDistance({
    required int id,
    required String name,
    double? latitude,
    double? longitude,
    int? radius,
    @Default(0.0) double distance,
    @JsonKey(name: 'is_within_radius') @Default(false) bool isWithinRadius,
  }) = _OfficeWithDistance;

  factory OfficeWithDistance.fromJson(Map<String, dynamic> json) =>
      _$OfficeWithDistanceFromJson(json);
}

// ========== PARAMETER CLASSES ==========

/// Parameter untuk mencari office terdekat
class NearestOfficeParams {
  final double latitude;
  final double longitude;

  const NearestOfficeParams({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toQueryParams() => {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
      };
}

/// Parameter untuk check radius
class CheckRadiusParams {
  final int officeId;
  final double latitude;
  final double longitude;

  const CheckRadiusParams({
    required this.officeId,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        'office_id': officeId,
        'latitude': latitude,
        'longitude': longitude,
      };
}

// ========== EXTENSIONS ==========
extension OfficeEntityX on OfficeEntity {
  bool get hasCoordinates => latitude != null && longitude != null;
  bool get hasRadius => radius != null && radius! > 0;

  String get coordinateDisplay {
    if (!hasCoordinates) return '-';
    return '${latitude!.toStringAsFixed(6)}, ${longitude!.toStringAsFixed(6)}';
  }

  String get radiusDisplayText => radiusDisplay ?? '$radius meter';
  String get mapsUrl =>
      googleMapsUrl ?? 'https://maps.google.com/?q=$latitude,$longitude';
}

extension OfficeWithDistanceX on OfficeWithDistance {
  String get distanceDisplay {
    if (distance < 1000) {
      return '${distance.toStringAsFixed(0)} m';
    }
    return '${(distance / 1000).toStringAsFixed(2)} km';
  }

  bool get isNearby => distance <= (radius ?? 100);
}
