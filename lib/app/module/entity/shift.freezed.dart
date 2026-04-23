// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShiftEntity _$ShiftEntityFromJson(Map<String, dynamic> json) {
  return _ShiftEntity.fromJson(json);
}

/// @nodoc
mixin _$ShiftEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time_display')
  String? get startTimeDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time_display')
  String? get endTimeDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_hours')
  double get durationHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_overnight')
  bool get isOvernight => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

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
      {int id,
      String name,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'start_time_display') String? startTimeDisplay,
      @JsonKey(name: 'end_time_display') String? endTimeDisplay,
      @JsonKey(name: 'duration_hours') double durationHours,
      @JsonKey(name: 'is_overnight') bool isOvernight,
      String? description});
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
    Object? id = null,
    Object? name = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? startTimeDisplay = freezed,
    Object? endTimeDisplay = freezed,
    Object? durationHours = null,
    Object? isOvernight = null,
    Object? description = freezed,
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
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      startTimeDisplay: freezed == startTimeDisplay
          ? _value.startTimeDisplay
          : startTimeDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      endTimeDisplay: freezed == endTimeDisplay
          ? _value.endTimeDisplay
          : endTimeDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      durationHours: null == durationHours
          ? _value.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double,
      isOvernight: null == isOvernight
          ? _value.isOvernight
          : isOvernight // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {int id,
      String name,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'start_time_display') String? startTimeDisplay,
      @JsonKey(name: 'end_time_display') String? endTimeDisplay,
      @JsonKey(name: 'duration_hours') double durationHours,
      @JsonKey(name: 'is_overnight') bool isOvernight,
      String? description});
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
    Object? id = null,
    Object? name = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? startTimeDisplay = freezed,
    Object? endTimeDisplay = freezed,
    Object? durationHours = null,
    Object? isOvernight = null,
    Object? description = freezed,
  }) {
    return _then(_$ShiftEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      startTimeDisplay: freezed == startTimeDisplay
          ? _value.startTimeDisplay
          : startTimeDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      endTimeDisplay: freezed == endTimeDisplay
          ? _value.endTimeDisplay
          : endTimeDisplay // ignore: cast_nullable_to_non_nullable
              as String?,
      durationHours: null == durationHours
          ? _value.durationHours
          : durationHours // ignore: cast_nullable_to_non_nullable
              as double,
      isOvernight: null == isOvernight
          ? _value.isOvernight
          : isOvernight // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftEntityImpl implements _ShiftEntity {
  const _$ShiftEntityImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'start_time_display') this.startTimeDisplay,
      @JsonKey(name: 'end_time_display') this.endTimeDisplay,
      @JsonKey(name: 'duration_hours') this.durationHours = 0.0,
      @JsonKey(name: 'is_overnight') this.isOvernight = false,
      this.description});

  factory _$ShiftEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'start_time_display')
  final String? startTimeDisplay;
  @override
  @JsonKey(name: 'end_time_display')
  final String? endTimeDisplay;
  @override
  @JsonKey(name: 'duration_hours')
  final double durationHours;
  @override
  @JsonKey(name: 'is_overnight')
  final bool isOvernight;
  @override
  final String? description;

  @override
  String toString() {
    return 'ShiftEntity(id: $id, name: $name, startTime: $startTime, endTime: $endTime, startTimeDisplay: $startTimeDisplay, endTimeDisplay: $endTimeDisplay, durationHours: $durationHours, isOvernight: $isOvernight, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.startTimeDisplay, startTimeDisplay) ||
                other.startTimeDisplay == startTimeDisplay) &&
            (identical(other.endTimeDisplay, endTimeDisplay) ||
                other.endTimeDisplay == endTimeDisplay) &&
            (identical(other.durationHours, durationHours) ||
                other.durationHours == durationHours) &&
            (identical(other.isOvernight, isOvernight) ||
                other.isOvernight == isOvernight) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      startTime,
      endTime,
      startTimeDisplay,
      endTimeDisplay,
      durationHours,
      isOvernight,
      description);

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
      {required final int id,
      required final String name,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      @JsonKey(name: 'start_time_display') final String? startTimeDisplay,
      @JsonKey(name: 'end_time_display') final String? endTimeDisplay,
      @JsonKey(name: 'duration_hours') final double durationHours,
      @JsonKey(name: 'is_overnight') final bool isOvernight,
      final String? description}) = _$ShiftEntityImpl;

  factory _ShiftEntity.fromJson(Map<String, dynamic> json) =
      _$ShiftEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'start_time_display')
  String? get startTimeDisplay;
  @override
  @JsonKey(name: 'end_time_display')
  String? get endTimeDisplay;
  @override
  @JsonKey(name: 'duration_hours')
  double get durationHours;
  @override
  @JsonKey(name: 'is_overnight')
  bool get isOvernight;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ShiftEntityImplCopyWith<_$ShiftEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
