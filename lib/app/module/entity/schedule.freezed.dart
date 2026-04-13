// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleEntity _$ScheduleEntityFromJson(Map<String, dynamic> json) {
  return _ScheduleEntity.fromJson(json);
}

/// @nodoc
mixin _$ScheduleEntity {
  @JsonKey(name: 'is_wfa')
  bool get isWfa => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_banned')
  bool get isBanned =>
      throw _privateConstructorUsedError; // Tambahkan ini untuk proteksi banned
  UserEntity? get user => throw _privateConstructorUsedError;
  OfficeEntity get office => throw _privateConstructorUsedError;
  ShiftEntity get shift => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleEntityCopyWith<ScheduleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleEntityCopyWith<$Res> {
  factory $ScheduleEntityCopyWith(
          ScheduleEntity value, $Res Function(ScheduleEntity) then) =
      _$ScheduleEntityCopyWithImpl<$Res, ScheduleEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      UserEntity? user,
      OfficeEntity office,
      ShiftEntity shift});

  $UserEntityCopyWith<$Res>? get user;
  $OfficeEntityCopyWith<$Res> get office;
  $ShiftEntityCopyWith<$Res> get shift;
}

/// @nodoc
class _$ScheduleEntityCopyWithImpl<$Res, $Val extends ScheduleEntity>
    implements $ScheduleEntityCopyWith<$Res> {
  _$ScheduleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWfa = null,
    Object? isBanned = null,
    Object? user = freezed,
    Object? office = null,
    Object? shift = null,
  }) {
    return _then(_value.copyWith(
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeEntity,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficeEntityCopyWith<$Res> get office {
    return $OfficeEntityCopyWith<$Res>(_value.office, (value) {
      return _then(_value.copyWith(office: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftEntityCopyWith<$Res> get shift {
    return $ShiftEntityCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleEntityImplCopyWith<$Res>
    implements $ScheduleEntityCopyWith<$Res> {
  factory _$$ScheduleEntityImplCopyWith(_$ScheduleEntityImpl value,
          $Res Function(_$ScheduleEntityImpl) then) =
      __$$ScheduleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      UserEntity? user,
      OfficeEntity office,
      ShiftEntity shift});

  @override
  $UserEntityCopyWith<$Res>? get user;
  @override
  $OfficeEntityCopyWith<$Res> get office;
  @override
  $ShiftEntityCopyWith<$Res> get shift;
}

/// @nodoc
class __$$ScheduleEntityImplCopyWithImpl<$Res>
    extends _$ScheduleEntityCopyWithImpl<$Res, _$ScheduleEntityImpl>
    implements _$$ScheduleEntityImplCopyWith<$Res> {
  __$$ScheduleEntityImplCopyWithImpl(
      _$ScheduleEntityImpl _value, $Res Function(_$ScheduleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isWfa = null,
    Object? isBanned = null,
    Object? user = freezed,
    Object? office = null,
    Object? shift = null,
  }) {
    return _then(_$ScheduleEntityImpl(
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeEntity,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleEntityImpl implements _ScheduleEntity {
  const _$ScheduleEntityImpl(
      {@JsonKey(name: 'is_wfa') this.isWfa = false,
      @JsonKey(name: 'is_banned') this.isBanned = false,
      this.user,
      required this.office,
      required this.shift});

  factory _$ScheduleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleEntityImplFromJson(json);

  @override
  @JsonKey(name: 'is_wfa')
  final bool isWfa;
  @override
  @JsonKey(name: 'is_banned')
  final bool isBanned;
// Tambahkan ini untuk proteksi banned
  @override
  final UserEntity? user;
  @override
  final OfficeEntity office;
  @override
  final ShiftEntity shift;

  @override
  String toString() {
    return 'ScheduleEntity(isWfa: $isWfa, isBanned: $isBanned, user: $user, office: $office, shift: $shift)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleEntityImpl &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.shift, shift) || other.shift == shift));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isWfa, isBanned, user, office, shift);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleEntityImplCopyWith<_$ScheduleEntityImpl> get copyWith =>
      __$$ScheduleEntityImplCopyWithImpl<_$ScheduleEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleEntityImplToJson(
      this,
    );
  }
}

abstract class _ScheduleEntity implements ScheduleEntity {
  const factory _ScheduleEntity(
      {@JsonKey(name: 'is_wfa') final bool isWfa,
      @JsonKey(name: 'is_banned') final bool isBanned,
      final UserEntity? user,
      required final OfficeEntity office,
      required final ShiftEntity shift}) = _$ScheduleEntityImpl;

  factory _ScheduleEntity.fromJson(Map<String, dynamic> json) =
      _$ScheduleEntityImpl.fromJson;

  @override
  @JsonKey(name: 'is_wfa')
  bool get isWfa;
  @override
  @JsonKey(name: 'is_banned')
  bool get isBanned;
  @override // Tambahkan ini untuk proteksi banned
  UserEntity? get user;
  @override
  OfficeEntity get office;
  @override
  ShiftEntity get shift;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleEntityImplCopyWith<_$ScheduleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficeEntity _$OfficeEntityFromJson(Map<String, dynamic> json) {
  return _OfficeEntity.fromJson(json);
}

/// @nodoc
mixin _$OfficeEntity {
  String get name => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;

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
  $Res call({String name, double latitude, double longitude, double radius});
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
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
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
  $Res call({String name, double latitude, double longitude, double radius});
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
    Object? name = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
  }) {
    return _then(_$OfficeEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeEntityImpl implements _OfficeEntity {
  const _$OfficeEntityImpl(
      {this.name = "Kantor IBM",
      required this.latitude,
      required this.longitude,
      this.radius = 100.0});

  factory _$OfficeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeEntityImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey()
  final double radius;

  @override
  String toString() {
    return 'OfficeEntity(name: $name, latitude: $latitude, longitude: $longitude, radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, latitude, longitude, radius);

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
      {final String name,
      required final double latitude,
      required final double longitude,
      final double radius}) = _$OfficeEntityImpl;

  factory _OfficeEntity.fromJson(Map<String, dynamic> json) =
      _$OfficeEntityImpl.fromJson;

  @override
  String get name;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get radius;
  @override
  @JsonKey(ignore: true)
  _$$OfficeEntityImplCopyWith<_$OfficeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftEntity _$ShiftEntityFromJson(Map<String, dynamic> json) {
  return _ShiftEntity.fromJson(json);
}

/// @nodoc
mixin _$ShiftEntity {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftEntityCopyWith<ShiftEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftEntityCopyWith<$Res> {
  factory $ShiftEntityCopyWith(
          ShiftEntity value, $Res Function(ShiftEntity) then) =
      _$ShiftEntityCopyWithImpl<$Res, ShiftEntity>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime});
}

/// @nodoc
class _$ShiftEntityCopyWithImpl<$Res, $Val extends ShiftEntity>
    implements $ShiftEntityCopyWith<$Res> {
  _$ShiftEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftEntityImplCopyWith<$Res>
    implements $ShiftEntityCopyWith<$Res> {
  factory _$$ShiftEntityImplCopyWith(
          _$ShiftEntityImpl value, $Res Function(_$ShiftEntityImpl) then) =
      __$$ShiftEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime});
}

/// @nodoc
class __$$ShiftEntityImplCopyWithImpl<$Res>
    extends _$ShiftEntityCopyWithImpl<$Res, _$ShiftEntityImpl>
    implements _$$ShiftEntityImplCopyWith<$Res> {
  __$$ShiftEntityImplCopyWithImpl(
      _$ShiftEntityImpl _value, $Res Function(_$ShiftEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(_$ShiftEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftEntityImpl implements _ShiftEntity {
  const _$ShiftEntityImpl(
      {this.name = "Shift Normal",
      @JsonKey(name: 'start_time') this.startTime = "08:30",
      @JsonKey(name: 'end_time') this.endTime = "17:30"});

  factory _$ShiftEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftEntityImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;

  @override
  String toString() {
    return 'ShiftEntity(name: $name, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftEntityImplCopyWith<_$ShiftEntityImpl> get copyWith =>
      __$$ShiftEntityImplCopyWithImpl<_$ShiftEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftEntityImplToJson(
      this,
    );
  }
}

abstract class _ShiftEntity implements ShiftEntity {
  const factory _ShiftEntity(
      {final String name,
      @JsonKey(name: 'start_time') final String startTime,
      @JsonKey(name: 'end_time') final String endTime}) = _$ShiftEntityImpl;

  factory _ShiftEntity.fromJson(Map<String, dynamic> json) =
      _$ShiftEntityImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  @JsonKey(ignore: true)
  _$$ShiftEntityImplCopyWith<_$ShiftEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
