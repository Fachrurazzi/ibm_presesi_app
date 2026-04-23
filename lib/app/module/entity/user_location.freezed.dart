// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) {
  return _UserLocation.fromJson(json);
}

/// @nodoc
mixin _$UserLocation {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_name')
  String? get positionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_latitude')
  double? get lastLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_longitude')
  double? get lastLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_location_at')
  DateTime? get lastLocationAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_online')
  bool get isOnline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLocationCopyWith<UserLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationCopyWith<$Res> {
  factory $UserLocationCopyWith(
          UserLocation value, $Res Function(UserLocation) then) =
      _$UserLocationCopyWithImpl<$Res, UserLocation>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'position_name') String? positionName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'last_latitude') double? lastLatitude,
      @JsonKey(name: 'last_longitude') double? lastLongitude,
      @JsonKey(name: 'last_location_at') DateTime? lastLocationAt,
      @JsonKey(name: 'is_online') bool isOnline});
}

/// @nodoc
class _$UserLocationCopyWithImpl<$Res, $Val extends UserLocation>
    implements $UserLocationCopyWith<$Res> {
  _$UserLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? positionName = freezed,
    Object? avatarUrl = freezed,
    Object? lastLatitude = freezed,
    Object? lastLongitude = freezed,
    Object? lastLocationAt = freezed,
    Object? isOnline = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLatitude: freezed == lastLatitude
          ? _value.lastLatitude
          : lastLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      lastLongitude: freezed == lastLongitude
          ? _value.lastLongitude
          : lastLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      lastLocationAt: freezed == lastLocationAt
          ? _value.lastLocationAt
          : lastLocationAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLocationImplCopyWith<$Res>
    implements $UserLocationCopyWith<$Res> {
  factory _$$UserLocationImplCopyWith(
          _$UserLocationImpl value, $Res Function(_$UserLocationImpl) then) =
      __$$UserLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'position_name') String? positionName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'last_latitude') double? lastLatitude,
      @JsonKey(name: 'last_longitude') double? lastLongitude,
      @JsonKey(name: 'last_location_at') DateTime? lastLocationAt,
      @JsonKey(name: 'is_online') bool isOnline});
}

/// @nodoc
class __$$UserLocationImplCopyWithImpl<$Res>
    extends _$UserLocationCopyWithImpl<$Res, _$UserLocationImpl>
    implements _$$UserLocationImplCopyWith<$Res> {
  __$$UserLocationImplCopyWithImpl(
      _$UserLocationImpl _value, $Res Function(_$UserLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? positionName = freezed,
    Object? avatarUrl = freezed,
    Object? lastLatitude = freezed,
    Object? lastLongitude = freezed,
    Object? lastLocationAt = freezed,
    Object? isOnline = null,
  }) {
    return _then(_$UserLocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastLatitude: freezed == lastLatitude
          ? _value.lastLatitude
          : lastLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      lastLongitude: freezed == lastLongitude
          ? _value.lastLongitude
          : lastLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      lastLocationAt: freezed == lastLocationAt
          ? _value.lastLocationAt
          : lastLocationAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLocationImpl implements _UserLocation {
  const _$UserLocationImpl(
      {required this.id,
      required this.name,
      required this.email,
      @JsonKey(name: 'position_name') this.positionName,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'last_latitude') this.lastLatitude,
      @JsonKey(name: 'last_longitude') this.lastLongitude,
      @JsonKey(name: 'last_location_at') this.lastLocationAt,
      @JsonKey(name: 'is_online') this.isOnline = false});

  factory _$UserLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLocationImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey(name: 'position_name')
  final String? positionName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'last_latitude')
  final double? lastLatitude;
  @override
  @JsonKey(name: 'last_longitude')
  final double? lastLongitude;
  @override
  @JsonKey(name: 'last_location_at')
  final DateTime? lastLocationAt;
  @override
  @JsonKey(name: 'is_online')
  final bool isOnline;

  @override
  String toString() {
    return 'UserLocation(id: $id, name: $name, email: $email, positionName: $positionName, avatarUrl: $avatarUrl, lastLatitude: $lastLatitude, lastLongitude: $lastLongitude, lastLocationAt: $lastLocationAt, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.lastLatitude, lastLatitude) ||
                other.lastLatitude == lastLatitude) &&
            (identical(other.lastLongitude, lastLongitude) ||
                other.lastLongitude == lastLongitude) &&
            (identical(other.lastLocationAt, lastLocationAt) ||
                other.lastLocationAt == lastLocationAt) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, positionName,
      avatarUrl, lastLatitude, lastLongitude, lastLocationAt, isOnline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLocationImplCopyWith<_$UserLocationImpl> get copyWith =>
      __$$UserLocationImplCopyWithImpl<_$UserLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLocationImplToJson(
      this,
    );
  }
}

abstract class _UserLocation implements UserLocation {
  const factory _UserLocation(
      {required final int id,
      required final String name,
      required final String email,
      @JsonKey(name: 'position_name') final String? positionName,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      @JsonKey(name: 'last_latitude') final double? lastLatitude,
      @JsonKey(name: 'last_longitude') final double? lastLongitude,
      @JsonKey(name: 'last_location_at') final DateTime? lastLocationAt,
      @JsonKey(name: 'is_online') final bool isOnline}) = _$UserLocationImpl;

  factory _UserLocation.fromJson(Map<String, dynamic> json) =
      _$UserLocationImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'position_name')
  String? get positionName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'last_latitude')
  double? get lastLatitude;
  @override
  @JsonKey(name: 'last_longitude')
  double? get lastLongitude;
  @override
  @JsonKey(name: 'last_location_at')
  DateTime? get lastLocationAt;
  @override
  @JsonKey(name: 'is_online')
  bool get isOnline;
  @override
  @JsonKey(ignore: true)
  _$$UserLocationImplCopyWith<_$UserLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
