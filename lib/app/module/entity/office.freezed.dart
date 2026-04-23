// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'office.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfficeEntity _$OfficeEntityFromJson(Map<String, dynamic> json) {
  return _OfficeEntity.fromJson(json);
}

/// @nodoc
mixin _$OfficeEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get radius => throw _privateConstructorUsedError;
  @JsonKey(name: 'radius_display')
  String? get radiusDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'supervisor_name')
  String? get supervisorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'google_maps_url')
  String? get googleMapsUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_full')
  String? get locationFull => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeEntityCopyWith<OfficeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeEntityCopyWith<$Res> {
  factory $OfficeEntityCopyWith(
          OfficeEntity value, $Res Function(OfficeEntity) then) =
      _$OfficeEntityCopyWithImpl<$Res, OfficeEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      double? latitude,
      double? longitude,
      int? radius,
      @JsonKey(name: 'radius_display') String? radiusDisplay,
      @JsonKey(name: 'supervisor_name') String? supervisorName,
      @JsonKey(name: 'google_maps_url') String? googleMapsUrl,
      @JsonKey(name: 'location_full') String? locationFull});
}

/// @nodoc
class _$OfficeEntityCopyWithImpl<$Res, $Val extends OfficeEntity>
    implements $OfficeEntityCopyWith<$Res> {
  _$OfficeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
    Object? radiusDisplay = freezed,
    Object? supervisorName = freezed,
    Object? googleMapsUrl = freezed,
    Object? locationFull = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
      radiusDisplay: freezed == radiusDisplay
          ? _value.radiusDisplay
          : radiusDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      supervisorName: freezed == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
              as String?,
      googleMapsUrl: freezed == googleMapsUrl
          ? _value.googleMapsUrl
          : googleMapsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      locationFull: freezed == locationFull
          ? _value.locationFull
          : locationFull // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficeEntityImplCopyWith<$Res>
    implements $OfficeEntityCopyWith<$Res> {
  factory _$$OfficeEntityImplCopyWith(
          _$OfficeEntityImpl value, $Res Function(_$OfficeEntityImpl) then) =
      __$$OfficeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double? latitude,
      double? longitude,
      int? radius,
      @JsonKey(name: 'radius_display') String? radiusDisplay,
      @JsonKey(name: 'supervisor_name') String? supervisorName,
      @JsonKey(name: 'google_maps_url') String? googleMapsUrl,
      @JsonKey(name: 'location_full') String? locationFull});
}

/// @nodoc
class __$$OfficeEntityImplCopyWithImpl<$Res>
    extends _$OfficeEntityCopyWithImpl<$Res, _$OfficeEntityImpl>
    implements _$$OfficeEntityImplCopyWith<$Res> {
  __$$OfficeEntityImplCopyWithImpl(
      _$OfficeEntityImpl _value, $Res Function(_$OfficeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
    Object? radiusDisplay = freezed,
    Object? supervisorName = freezed,
    Object? googleMapsUrl = freezed,
    Object? locationFull = freezed,
  }) {
    return _then(_$OfficeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
      radiusDisplay: freezed == radiusDisplay
          ? _value.radiusDisplay
          : radiusDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      supervisorName: freezed == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
              as String?,
      googleMapsUrl: freezed == googleMapsUrl
          ? _value.googleMapsUrl
          : googleMapsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      locationFull: freezed == locationFull
          ? _value.locationFull
          : locationFull // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeEntityImpl implements _OfficeEntity {
  const _$OfficeEntityImpl(
      {required this.id,
      required this.name,
      this.latitude,
      this.longitude,
      this.radius,
      @JsonKey(name: 'radius_display') this.radiusDisplay,
      @JsonKey(name: 'supervisor_name') this.supervisorName,
      @JsonKey(name: 'google_maps_url') this.googleMapsUrl,
      @JsonKey(name: 'location_full') this.locationFull});

  factory _$OfficeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? radius;
  @override
  @JsonKey(name: 'radius_display')
  final String? radiusDisplay;
  @override
  @JsonKey(name: 'supervisor_name')
  final String? supervisorName;
  @override
  @JsonKey(name: 'google_maps_url')
  final String? googleMapsUrl;
  @override
  @JsonKey(name: 'location_full')
  final String? locationFull;

  @override
  String toString() {
    return 'OfficeEntity(id: $id, name: $name, latitude: $latitude, longitude: $longitude, radius: $radius, radiusDisplay: $radiusDisplay, supervisorName: $supervisorName, googleMapsUrl: $googleMapsUrl, locationFull: $locationFull)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.radiusDisplay, radiusDisplay) ||
                other.radiusDisplay == radiusDisplay) &&
            (identical(other.supervisorName, supervisorName) ||
                other.supervisorName == supervisorName) &&
            (identical(other.googleMapsUrl, googleMapsUrl) ||
                other.googleMapsUrl == googleMapsUrl) &&
            (identical(other.locationFull, locationFull) ||
                other.locationFull == locationFull));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, latitude, longitude,
      radius, radiusDisplay, supervisorName, googleMapsUrl, locationFull);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeEntityImplCopyWith<_$OfficeEntityImpl> get copyWith =>
      __$$OfficeEntityImplCopyWithImpl<_$OfficeEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeEntityImplToJson(
      this,
    );
  }
}

abstract class _OfficeEntity implements OfficeEntity {
  const factory _OfficeEntity(
          {required final int id,
          required final String name,
          final double? latitude,
          final double? longitude,
          final int? radius,
          @JsonKey(name: 'radius_display') final String? radiusDisplay,
          @JsonKey(name: 'supervisor_name') final String? supervisorName,
          @JsonKey(name: 'google_maps_url') final String? googleMapsUrl,
          @JsonKey(name: 'location_full') final String? locationFull}) =
      _$OfficeEntityImpl;

  factory _OfficeEntity.fromJson(Map<String, dynamic> json) =
      _$OfficeEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get radius;
  @override
  @JsonKey(name: 'radius_display')
  String? get radiusDisplay;
  @override
  @JsonKey(name: 'supervisor_name')
  String? get supervisorName;
  @override
  @JsonKey(name: 'google_maps_url')
  String? get googleMapsUrl;
  @override
  @JsonKey(name: 'location_full')
  String? get locationFull;
  @override
  @JsonKey(ignore: true)
  _$$OfficeEntityImplCopyWith<_$OfficeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficeWithDistance _$OfficeWithDistanceFromJson(Map<String, dynamic> json) {
  return _OfficeWithDistance.fromJson(json);
}

/// @nodoc
mixin _$OfficeWithDistance {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get radius => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_within_radius')
  bool get isWithinRadius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeWithDistanceCopyWith<OfficeWithDistance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeWithDistanceCopyWith<$Res> {
  factory $OfficeWithDistanceCopyWith(
          OfficeWithDistance value, $Res Function(OfficeWithDistance) then) =
      _$OfficeWithDistanceCopyWithImpl<$Res, OfficeWithDistance>;
  @useResult
  $Res call(
      {int id,
      String name,
      double? latitude,
      double? longitude,
      int? radius,
      double distance,
      @JsonKey(name: 'is_within_radius') bool isWithinRadius});
}

/// @nodoc
class _$OfficeWithDistanceCopyWithImpl<$Res, $Val extends OfficeWithDistance>
    implements $OfficeWithDistanceCopyWith<$Res> {
  _$OfficeWithDistanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
    Object? distance = null,
    Object? isWithinRadius = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      isWithinRadius: null == isWithinRadius
          ? _value.isWithinRadius
          : isWithinRadius // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficeWithDistanceImplCopyWith<$Res>
    implements $OfficeWithDistanceCopyWith<$Res> {
  factory _$$OfficeWithDistanceImplCopyWith(_$OfficeWithDistanceImpl value,
          $Res Function(_$OfficeWithDistanceImpl) then) =
      __$$OfficeWithDistanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double? latitude,
      double? longitude,
      int? radius,
      double distance,
      @JsonKey(name: 'is_within_radius') bool isWithinRadius});
}

/// @nodoc
class __$$OfficeWithDistanceImplCopyWithImpl<$Res>
    extends _$OfficeWithDistanceCopyWithImpl<$Res, _$OfficeWithDistanceImpl>
    implements _$$OfficeWithDistanceImplCopyWith<$Res> {
  __$$OfficeWithDistanceImplCopyWithImpl(_$OfficeWithDistanceImpl _value,
      $Res Function(_$OfficeWithDistanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
    Object? distance = null,
    Object? isWithinRadius = null,
  }) {
    return _then(_$OfficeWithDistanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      isWithinRadius: null == isWithinRadius
          ? _value.isWithinRadius
          : isWithinRadius // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeWithDistanceImpl implements _OfficeWithDistance {
  const _$OfficeWithDistanceImpl(
      {required this.id,
      required this.name,
      this.latitude,
      this.longitude,
      this.radius,
      this.distance = 0.0,
      @JsonKey(name: 'is_within_radius') this.isWithinRadius = false});

  factory _$OfficeWithDistanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeWithDistanceImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? radius;
  @override
  @JsonKey()
  final double distance;
  @override
  @JsonKey(name: 'is_within_radius')
  final bool isWithinRadius;

  @override
  String toString() {
    return 'OfficeWithDistance(id: $id, name: $name, latitude: $latitude, longitude: $longitude, radius: $radius, distance: $distance, isWithinRadius: $isWithinRadius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeWithDistanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.isWithinRadius, isWithinRadius) ||
                other.isWithinRadius == isWithinRadius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, latitude, longitude,
      radius, distance, isWithinRadius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeWithDistanceImplCopyWith<_$OfficeWithDistanceImpl> get copyWith =>
      __$$OfficeWithDistanceImplCopyWithImpl<_$OfficeWithDistanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeWithDistanceImplToJson(
      this,
    );
  }
}

abstract class _OfficeWithDistance implements OfficeWithDistance {
  const factory _OfficeWithDistance(
          {required final int id,
          required final String name,
          final double? latitude,
          final double? longitude,
          final int? radius,
          final double distance,
          @JsonKey(name: 'is_within_radius') final bool isWithinRadius}) =
      _$OfficeWithDistanceImpl;

  factory _OfficeWithDistance.fromJson(Map<String, dynamic> json) =
      _$OfficeWithDistanceImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get radius;
  @override
  double get distance;
  @override
  @JsonKey(name: 'is_within_radius')
  bool get isWithinRadius;
  @override
  @JsonKey(ignore: true)
  _$$OfficeWithDistanceImplCopyWith<_$OfficeWithDistanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
