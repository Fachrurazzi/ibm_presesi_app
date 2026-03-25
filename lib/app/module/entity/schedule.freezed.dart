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
// Tambahkan field lain yang ada di database Laravel jika diperlukan (misal: id, user_id)
  @JsonKey(name: 'is_wfa')
  bool get isWfa => throw _privateConstructorUsedError;
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
      OfficeEntity office,
      ShiftEntity shift});

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
    Object? office = null,
    Object? shift = null,
  }) {
    return _then(_value.copyWith(
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
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
      OfficeEntity office,
      ShiftEntity shift});

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
    Object? office = null,
    Object? shift = null,
  }) {
    return _then(_$ScheduleEntityImpl(
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {@JsonKey(name: 'is_wfa') required this.isWfa,
      required this.office,
      required this.shift});

  factory _$ScheduleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleEntityImplFromJson(json);

// Tambahkan field lain yang ada di database Laravel jika diperlukan (misal: id, user_id)
  @override
  @JsonKey(name: 'is_wfa')
  final bool isWfa;
  @override
  final OfficeEntity office;
  @override
  final ShiftEntity shift;

  @override
  String toString() {
    return 'ScheduleEntity(isWfa: $isWfa, office: $office, shift: $shift)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleEntityImpl &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.shift, shift) || other.shift == shift));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isWfa, office, shift);

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
      {@JsonKey(name: 'is_wfa') required final bool isWfa,
      required final OfficeEntity office,
      required final ShiftEntity shift}) = _$ScheduleEntityImpl;

  factory _ScheduleEntity.fromJson(Map<String, dynamic> json) =
      _$ScheduleEntityImpl.fromJson;

  @override // Tambahkan field lain yang ada di database Laravel jika diperlukan (misal: id, user_id)
  @JsonKey(name: 'is_wfa')
  bool get isWfa;
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
// Tambahkan id jika diperlukan
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
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.radius});

  factory _$OfficeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeEntityImplFromJson(json);

// Tambahkan id jika diperlukan
  @override
  final String name;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
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
      {required final String name,
      required final double latitude,
      required final double longitude,
      required final double radius}) = _$OfficeEntityImpl;

  factory _OfficeEntity.fromJson(Map<String, dynamic> json) =
      _$OfficeEntityImpl.fromJson;

  @override // Tambahkan id jika diperlukan
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
// Tambahkan id jika diperlukan
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
      {required this.name,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime});

  factory _$ShiftEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftEntityImplFromJson(json);

// Tambahkan id jika diperlukan
  @override
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
          {required final String name,
          @JsonKey(name: 'start_time') required final String startTime,
          @JsonKey(name: 'end_time') required final String endTime}) =
      _$ShiftEntityImpl;

  factory _ShiftEntity.fromJson(Map<String, dynamic> json) =
      _$ShiftEntityImpl.fromJson;

  @override // Tambahkan id jika diperlukan
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
