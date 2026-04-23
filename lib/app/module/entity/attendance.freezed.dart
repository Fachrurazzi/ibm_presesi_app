// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return AttendanceEntity.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_late')
  bool get isLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_permission')
  bool get hasPermission => throw _privateConstructorUsedError;
  @JsonKey(name: 'permission_type')
  String? get permissionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'lunch_money')
  int get lunchMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'lunch_money_label')
  String get lunchMoneyLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_start')
  String? get scheduleStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_end')
  String? get scheduleEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_duration')
  String? get workDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  int? get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'office')
  OfficeInfo? get office => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift')
  ShiftInfo? get shift => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'has_permission') bool hasPermission,
            @JsonKey(name: 'permission_type') String? permissionType,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd,
            @JsonKey(name: 'work_duration') String? workDuration,
            @JsonKey(name: 'schedule_id') int? scheduleId,
            @JsonKey(name: 'office') OfficeInfo? office,
            @JsonKey(name: 'shift') ShiftInfo? shift)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'has_permission') bool hasPermission,
            @JsonKey(name: 'permission_type') String? permissionType,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd,
            @JsonKey(name: 'work_duration') String? workDuration,
            @JsonKey(name: 'schedule_id') int? scheduleId,
            @JsonKey(name: 'office') OfficeInfo? office,
            @JsonKey(name: 'shift') ShiftInfo? shift)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'has_permission') bool hasPermission,
            @JsonKey(name: 'permission_type') String? permissionType,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd,
            @JsonKey(name: 'work_duration') String? workDuration,
            @JsonKey(name: 'schedule_id') int? scheduleId,
            @JsonKey(name: 'office') OfficeInfo? office,
            @JsonKey(name: 'shift') ShiftInfo? shift)?
        entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'is_late') bool isLate,
      @JsonKey(name: 'has_permission') bool hasPermission,
      @JsonKey(name: 'permission_type') String? permissionType,
      @JsonKey(name: 'lunch_money') int lunchMoney,
      @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
      @JsonKey(name: 'schedule_start') String? scheduleStart,
      @JsonKey(name: 'schedule_end') String? scheduleEnd,
      @JsonKey(name: 'work_duration') String? workDuration,
      @JsonKey(name: 'schedule_id') int? scheduleId,
      @JsonKey(name: 'office') OfficeInfo? office,
      @JsonKey(name: 'shift') ShiftInfo? shift});

  $OfficeInfoCopyWith<$Res>? get office;
  $ShiftInfoCopyWith<$Res>? get shift;
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isLate = null,
    Object? hasPermission = null,
    Object? permissionType = freezed,
    Object? lunchMoney = null,
    Object? lunchMoneyLabel = null,
    Object? scheduleStart = freezed,
    Object? scheduleEnd = freezed,
    Object? workDuration = freezed,
    Object? scheduleId = freezed,
    Object? office = freezed,
    Object? shift = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: null == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPermission: null == hasPermission
          ? _value.hasPermission
          : hasPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionType: freezed == permissionType
          ? _value.permissionType
          : permissionType // ignore: cast_nullable_to_non_nullable
              as String?,
      lunchMoney: null == lunchMoney
          ? _value.lunchMoney
          : lunchMoney // ignore: cast_nullable_to_non_nullable
              as int,
      lunchMoneyLabel: null == lunchMoneyLabel
          ? _value.lunchMoneyLabel
          : lunchMoneyLabel // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleStart: freezed == scheduleStart
          ? _value.scheduleStart
          : scheduleStart // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleEnd: freezed == scheduleEnd
          ? _value.scheduleEnd
          : scheduleEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      workDuration: freezed == workDuration
          ? _value.workDuration
          : workDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      office: freezed == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficeInfoCopyWith<$Res>? get office {
    if (_value.office == null) {
      return null;
    }

    return $OfficeInfoCopyWith<$Res>(_value.office!, (value) {
      return _then(_value.copyWith(office: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftInfoCopyWith<$Res>? get shift {
    if (_value.shift == null) {
      return null;
    }

    return $ShiftInfoCopyWith<$Res>(_value.shift!, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceEntityImplCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$AttendanceEntityImplCopyWith(_$AttendanceEntityImpl value,
          $Res Function(_$AttendanceEntityImpl) then) =
      __$$AttendanceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'is_late') bool isLate,
      @JsonKey(name: 'has_permission') bool hasPermission,
      @JsonKey(name: 'permission_type') String? permissionType,
      @JsonKey(name: 'lunch_money') int lunchMoney,
      @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
      @JsonKey(name: 'schedule_start') String? scheduleStart,
      @JsonKey(name: 'schedule_end') String? scheduleEnd,
      @JsonKey(name: 'work_duration') String? workDuration,
      @JsonKey(name: 'schedule_id') int? scheduleId,
      @JsonKey(name: 'office') OfficeInfo? office,
      @JsonKey(name: 'shift') ShiftInfo? shift});

  @override
  $OfficeInfoCopyWith<$Res>? get office;
  @override
  $ShiftInfoCopyWith<$Res>? get shift;
}

/// @nodoc
class __$$AttendanceEntityImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceEntityImpl>
    implements _$$AttendanceEntityImplCopyWith<$Res> {
  __$$AttendanceEntityImplCopyWithImpl(_$AttendanceEntityImpl _value,
      $Res Function(_$AttendanceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isLate = null,
    Object? hasPermission = null,
    Object? permissionType = freezed,
    Object? lunchMoney = null,
    Object? lunchMoneyLabel = null,
    Object? scheduleStart = freezed,
    Object? scheduleEnd = freezed,
    Object? workDuration = freezed,
    Object? scheduleId = freezed,
    Object? office = freezed,
    Object? shift = freezed,
  }) {
    return _then(_$AttendanceEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: null == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPermission: null == hasPermission
          ? _value.hasPermission
          : hasPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionType: freezed == permissionType
          ? _value.permissionType
          : permissionType // ignore: cast_nullable_to_non_nullable
              as String?,
      lunchMoney: null == lunchMoney
          ? _value.lunchMoney
          : lunchMoney // ignore: cast_nullable_to_non_nullable
              as int,
      lunchMoneyLabel: null == lunchMoneyLabel
          ? _value.lunchMoneyLabel
          : lunchMoneyLabel // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleStart: freezed == scheduleStart
          ? _value.scheduleStart
          : scheduleStart // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleEnd: freezed == scheduleEnd
          ? _value.scheduleEnd
          : scheduleEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      workDuration: freezed == workDuration
          ? _value.workDuration
          : workDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      office: freezed == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceEntityImpl extends AttendanceEntity {
  const _$AttendanceEntityImpl(
      {required this.id,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'is_late') this.isLate = false,
      @JsonKey(name: 'has_permission') this.hasPermission = false,
      @JsonKey(name: 'permission_type') this.permissionType,
      @JsonKey(name: 'lunch_money') this.lunchMoney = 0,
      @JsonKey(name: 'lunch_money_label') this.lunchMoneyLabel = 'Rp 0',
      @JsonKey(name: 'schedule_start') this.scheduleStart,
      @JsonKey(name: 'schedule_end') this.scheduleEnd,
      @JsonKey(name: 'work_duration') this.workDuration,
      @JsonKey(name: 'schedule_id') this.scheduleId,
      @JsonKey(name: 'office') this.office,
      @JsonKey(name: 'shift') this.shift})
      : super._();

  factory _$AttendanceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceEntityImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'is_late')
  final bool isLate;
  @override
  @JsonKey(name: 'has_permission')
  final bool hasPermission;
  @override
  @JsonKey(name: 'permission_type')
  final String? permissionType;
  @override
  @JsonKey(name: 'lunch_money')
  final int lunchMoney;
  @override
  @JsonKey(name: 'lunch_money_label')
  final String lunchMoneyLabel;
  @override
  @JsonKey(name: 'schedule_start')
  final String? scheduleStart;
  @override
  @JsonKey(name: 'schedule_end')
  final String? scheduleEnd;
  @override
  @JsonKey(name: 'work_duration')
  final String? workDuration;
  @override
  @JsonKey(name: 'schedule_id')
  final int? scheduleId;
  @override
  @JsonKey(name: 'office')
  final OfficeInfo? office;
  @override
  @JsonKey(name: 'shift')
  final ShiftInfo? shift;

  @override
  String toString() {
    return 'Attendance.entity(id: $id, date: $date, startTime: $startTime, endTime: $endTime, isLate: $isLate, hasPermission: $hasPermission, permissionType: $permissionType, lunchMoney: $lunchMoney, lunchMoneyLabel: $lunchMoneyLabel, scheduleStart: $scheduleStart, scheduleEnd: $scheduleEnd, workDuration: $workDuration, scheduleId: $scheduleId, office: $office, shift: $shift)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isLate, isLate) || other.isLate == isLate) &&
            (identical(other.hasPermission, hasPermission) ||
                other.hasPermission == hasPermission) &&
            (identical(other.permissionType, permissionType) ||
                other.permissionType == permissionType) &&
            (identical(other.lunchMoney, lunchMoney) ||
                other.lunchMoney == lunchMoney) &&
            (identical(other.lunchMoneyLabel, lunchMoneyLabel) ||
                other.lunchMoneyLabel == lunchMoneyLabel) &&
            (identical(other.scheduleStart, scheduleStart) ||
                other.scheduleStart == scheduleStart) &&
            (identical(other.scheduleEnd, scheduleEnd) ||
                other.scheduleEnd == scheduleEnd) &&
            (identical(other.workDuration, workDuration) ||
                other.workDuration == workDuration) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.shift, shift) || other.shift == shift));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      startTime,
      endTime,
      isLate,
      hasPermission,
      permissionType,
      lunchMoney,
      lunchMoneyLabel,
      scheduleStart,
      scheduleEnd,
      workDuration,
      scheduleId,
      office,
      shift);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceEntityImplCopyWith<_$AttendanceEntityImpl> get copyWith =>
      __$$AttendanceEntityImplCopyWithImpl<_$AttendanceEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'has_permission') bool hasPermission,
            @JsonKey(name: 'permission_type') String? permissionType,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd,
            @JsonKey(name: 'work_duration') String? workDuration,
            @JsonKey(name: 'schedule_id') int? scheduleId,
            @JsonKey(name: 'office') OfficeInfo? office,
            @JsonKey(name: 'shift') ShiftInfo? shift)
        entity,
  }) {
    return entity(
        id,
        date,
        startTime,
        endTime,
        isLate,
        hasPermission,
        permissionType,
        lunchMoney,
        lunchMoneyLabel,
        scheduleStart,
        scheduleEnd,
        workDuration,
        scheduleId,
        office,
        shift);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'has_permission') bool hasPermission,
            @JsonKey(name: 'permission_type') String? permissionType,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd,
            @JsonKey(name: 'work_duration') String? workDuration,
            @JsonKey(name: 'schedule_id') int? scheduleId,
            @JsonKey(name: 'office') OfficeInfo? office,
            @JsonKey(name: 'shift') ShiftInfo? shift)?
        entity,
  }) {
    return entity?.call(
        id,
        date,
        startTime,
        endTime,
        isLate,
        hasPermission,
        permissionType,
        lunchMoney,
        lunchMoneyLabel,
        scheduleStart,
        scheduleEnd,
        workDuration,
        scheduleId,
        office,
        shift);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            @JsonKey(name: 'date') String date,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'has_permission') bool hasPermission,
            @JsonKey(name: 'permission_type') String? permissionType,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd,
            @JsonKey(name: 'work_duration') String? workDuration,
            @JsonKey(name: 'schedule_id') int? scheduleId,
            @JsonKey(name: 'office') OfficeInfo? office,
            @JsonKey(name: 'shift') ShiftInfo? shift)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(
          id,
          date,
          startTime,
          endTime,
          isLate,
          hasPermission,
          permissionType,
          lunchMoney,
          lunchMoneyLabel,
          scheduleStart,
          scheduleEnd,
          workDuration,
          scheduleId,
          office,
          shift);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceEntityImplToJson(
      this,
    );
  }
}

abstract class AttendanceEntity extends Attendance {
  const factory AttendanceEntity(
      {required final int id,
      @JsonKey(name: 'date') required final String date,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      @JsonKey(name: 'is_late') final bool isLate,
      @JsonKey(name: 'has_permission') final bool hasPermission,
      @JsonKey(name: 'permission_type') final String? permissionType,
      @JsonKey(name: 'lunch_money') final int lunchMoney,
      @JsonKey(name: 'lunch_money_label') final String lunchMoneyLabel,
      @JsonKey(name: 'schedule_start') final String? scheduleStart,
      @JsonKey(name: 'schedule_end') final String? scheduleEnd,
      @JsonKey(name: 'work_duration') final String? workDuration,
      @JsonKey(name: 'schedule_id') final int? scheduleId,
      @JsonKey(name: 'office') final OfficeInfo? office,
      @JsonKey(name: 'shift') final ShiftInfo? shift}) = _$AttendanceEntityImpl;
  const AttendanceEntity._() : super._();

  factory AttendanceEntity.fromJson(Map<String, dynamic> json) =
      _$AttendanceEntityImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'is_late')
  bool get isLate;
  @override
  @JsonKey(name: 'has_permission')
  bool get hasPermission;
  @override
  @JsonKey(name: 'permission_type')
  String? get permissionType;
  @override
  @JsonKey(name: 'lunch_money')
  int get lunchMoney;
  @override
  @JsonKey(name: 'lunch_money_label')
  String get lunchMoneyLabel;
  @override
  @JsonKey(name: 'schedule_start')
  String? get scheduleStart;
  @override
  @JsonKey(name: 'schedule_end')
  String? get scheduleEnd;
  @override
  @JsonKey(name: 'work_duration')
  String? get workDuration;
  @override
  @JsonKey(name: 'schedule_id')
  int? get scheduleId;
  @override
  @JsonKey(name: 'office')
  OfficeInfo? get office;
  @override
  @JsonKey(name: 'shift')
  ShiftInfo? get shift;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceEntityImplCopyWith<_$AttendanceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficeInfo _$OfficeInfoFromJson(Map<String, dynamic> json) {
  return _OfficeInfo.fromJson(json);
}

/// @nodoc
mixin _$OfficeInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get radius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeInfoCopyWith<OfficeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeInfoCopyWith<$Res> {
  factory $OfficeInfoCopyWith(
          OfficeInfo value, $Res Function(OfficeInfo) then) =
      _$OfficeInfoCopyWithImpl<$Res, OfficeInfo>;
  @useResult
  $Res call(
      {int id, String name, double? latitude, double? longitude, int? radius});
}

/// @nodoc
class _$OfficeInfoCopyWithImpl<$Res, $Val extends OfficeInfo>
    implements $OfficeInfoCopyWith<$Res> {
  _$OfficeInfoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficeInfoImplCopyWith<$Res>
    implements $OfficeInfoCopyWith<$Res> {
  factory _$$OfficeInfoImplCopyWith(
          _$OfficeInfoImpl value, $Res Function(_$OfficeInfoImpl) then) =
      __$$OfficeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, double? latitude, double? longitude, int? radius});
}

/// @nodoc
class __$$OfficeInfoImplCopyWithImpl<$Res>
    extends _$OfficeInfoCopyWithImpl<$Res, _$OfficeInfoImpl>
    implements _$$OfficeInfoImplCopyWith<$Res> {
  __$$OfficeInfoImplCopyWithImpl(
      _$OfficeInfoImpl _value, $Res Function(_$OfficeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
  }) {
    return _then(_$OfficeInfoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeInfoImpl implements _OfficeInfo {
  const _$OfficeInfoImpl(
      {required this.id,
      required this.name,
      this.latitude,
      this.longitude,
      this.radius});

  factory _$OfficeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeInfoImplFromJson(json);

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
  String toString() {
    return 'OfficeInfo(id: $id, name: $name, latitude: $latitude, longitude: $longitude, radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
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
      Object.hash(runtimeType, id, name, latitude, longitude, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeInfoImplCopyWith<_$OfficeInfoImpl> get copyWith =>
      __$$OfficeInfoImplCopyWithImpl<_$OfficeInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeInfoImplToJson(
      this,
    );
  }
}

abstract class _OfficeInfo implements OfficeInfo {
  const factory _OfficeInfo(
      {required final int id,
      required final String name,
      final double? latitude,
      final double? longitude,
      final int? radius}) = _$OfficeInfoImpl;

  factory _OfficeInfo.fromJson(Map<String, dynamic> json) =
      _$OfficeInfoImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$OfficeInfoImplCopyWith<_$OfficeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftInfo _$ShiftInfoFromJson(Map<String, dynamic> json) {
  return _ShiftInfo.fromJson(json);
}

/// @nodoc
mixin _$ShiftInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftInfoCopyWith<ShiftInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftInfoCopyWith<$Res> {
  factory $ShiftInfoCopyWith(ShiftInfo value, $Res Function(ShiftInfo) then) =
      _$ShiftInfoCopyWithImpl<$Res, ShiftInfo>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class _$ShiftInfoCopyWithImpl<$Res, $Val extends ShiftInfo>
    implements $ShiftInfoCopyWith<$Res> {
  _$ShiftInfoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftInfoImplCopyWith<$Res>
    implements $ShiftInfoCopyWith<$Res> {
  factory _$$ShiftInfoImplCopyWith(
          _$ShiftInfoImpl value, $Res Function(_$ShiftInfoImpl) then) =
      __$$ShiftInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class __$$ShiftInfoImplCopyWithImpl<$Res>
    extends _$ShiftInfoCopyWithImpl<$Res, _$ShiftInfoImpl>
    implements _$$ShiftInfoImplCopyWith<$Res> {
  __$$ShiftInfoImplCopyWithImpl(
      _$ShiftInfoImpl _value, $Res Function(_$ShiftInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$ShiftInfoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftInfoImpl implements _ShiftInfo {
  const _$ShiftInfoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime});

  factory _$ShiftInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftInfoImplFromJson(json);

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
  String toString() {
    return 'ShiftInfo(id: $id, name: $name, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, startTime, endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftInfoImplCopyWith<_$ShiftInfoImpl> get copyWith =>
      __$$ShiftInfoImplCopyWithImpl<_$ShiftInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftInfoImplToJson(
      this,
    );
  }
}

abstract class _ShiftInfo implements ShiftInfo {
  const factory _ShiftInfo(
      {required final int id,
      required final String name,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime}) = _$ShiftInfoImpl;

  factory _ShiftInfo.fromJson(Map<String, dynamic> json) =
      _$ShiftInfoImpl.fromJson;

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
  @JsonKey(ignore: true)
  _$$ShiftInfoImplCopyWith<_$ShiftInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttendanceSummary _$AttendanceSummaryFromJson(Map<String, dynamic> json) {
  return _AttendanceSummary.fromJson(json);
}

/// @nodoc
mixin _$AttendanceSummary {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_working_days')
  int get totalWorkingDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'present_days')
  int get presentDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'late_days')
  int get lateDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'absent_days')
  int get absentDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_rate')
  double get attendanceRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceSummaryCopyWith<AttendanceSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceSummaryCopyWith<$Res> {
  factory $AttendanceSummaryCopyWith(
          AttendanceSummary value, $Res Function(AttendanceSummary) then) =
      _$AttendanceSummaryCopyWithImpl<$Res, AttendanceSummary>;
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'total_working_days') int totalWorkingDays,
      @JsonKey(name: 'present_days') int presentDays,
      @JsonKey(name: 'late_days') int lateDays,
      @JsonKey(name: 'absent_days') int absentDays,
      @JsonKey(name: 'attendance_rate') double attendanceRate});
}

/// @nodoc
class _$AttendanceSummaryCopyWithImpl<$Res, $Val extends AttendanceSummary>
    implements $AttendanceSummaryCopyWith<$Res> {
  _$AttendanceSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalWorkingDays = null,
    Object? presentDays = null,
    Object? lateDays = null,
    Object? absentDays = null,
    Object? attendanceRate = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalWorkingDays: null == totalWorkingDays
          ? _value.totalWorkingDays
          : totalWorkingDays // ignore: cast_nullable_to_non_nullable
              as int,
      presentDays: null == presentDays
          ? _value.presentDays
          : presentDays // ignore: cast_nullable_to_non_nullable
              as int,
      lateDays: null == lateDays
          ? _value.lateDays
          : lateDays // ignore: cast_nullable_to_non_nullable
              as int,
      absentDays: null == absentDays
          ? _value.absentDays
          : absentDays // ignore: cast_nullable_to_non_nullable
              as int,
      attendanceRate: null == attendanceRate
          ? _value.attendanceRate
          : attendanceRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceSummaryImplCopyWith<$Res>
    implements $AttendanceSummaryCopyWith<$Res> {
  factory _$$AttendanceSummaryImplCopyWith(_$AttendanceSummaryImpl value,
          $Res Function(_$AttendanceSummaryImpl) then) =
      __$$AttendanceSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'total_working_days') int totalWorkingDays,
      @JsonKey(name: 'present_days') int presentDays,
      @JsonKey(name: 'late_days') int lateDays,
      @JsonKey(name: 'absent_days') int absentDays,
      @JsonKey(name: 'attendance_rate') double attendanceRate});
}

/// @nodoc
class __$$AttendanceSummaryImplCopyWithImpl<$Res>
    extends _$AttendanceSummaryCopyWithImpl<$Res, _$AttendanceSummaryImpl>
    implements _$$AttendanceSummaryImplCopyWith<$Res> {
  __$$AttendanceSummaryImplCopyWithImpl(_$AttendanceSummaryImpl _value,
      $Res Function(_$AttendanceSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? totalWorkingDays = null,
    Object? presentDays = null,
    Object? lateDays = null,
    Object? absentDays = null,
    Object? attendanceRate = null,
  }) {
    return _then(_$AttendanceSummaryImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalWorkingDays: null == totalWorkingDays
          ? _value.totalWorkingDays
          : totalWorkingDays // ignore: cast_nullable_to_non_nullable
              as int,
      presentDays: null == presentDays
          ? _value.presentDays
          : presentDays // ignore: cast_nullable_to_non_nullable
              as int,
      lateDays: null == lateDays
          ? _value.lateDays
          : lateDays // ignore: cast_nullable_to_non_nullable
              as int,
      absentDays: null == absentDays
          ? _value.absentDays
          : absentDays // ignore: cast_nullable_to_non_nullable
              as int,
      attendanceRate: null == attendanceRate
          ? _value.attendanceRate
          : attendanceRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceSummaryImpl implements _AttendanceSummary {
  const _$AttendanceSummaryImpl(
      {required this.month,
      required this.year,
      @JsonKey(name: 'total_working_days') this.totalWorkingDays = 0,
      @JsonKey(name: 'present_days') this.presentDays = 0,
      @JsonKey(name: 'late_days') this.lateDays = 0,
      @JsonKey(name: 'absent_days') this.absentDays = 0,
      @JsonKey(name: 'attendance_rate') this.attendanceRate = 0.0});

  factory _$AttendanceSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceSummaryImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'total_working_days')
  final int totalWorkingDays;
  @override
  @JsonKey(name: 'present_days')
  final int presentDays;
  @override
  @JsonKey(name: 'late_days')
  final int lateDays;
  @override
  @JsonKey(name: 'absent_days')
  final int absentDays;
  @override
  @JsonKey(name: 'attendance_rate')
  final double attendanceRate;

  @override
  String toString() {
    return 'AttendanceSummary(month: $month, year: $year, totalWorkingDays: $totalWorkingDays, presentDays: $presentDays, lateDays: $lateDays, absentDays: $absentDays, attendanceRate: $attendanceRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceSummaryImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalWorkingDays, totalWorkingDays) ||
                other.totalWorkingDays == totalWorkingDays) &&
            (identical(other.presentDays, presentDays) ||
                other.presentDays == presentDays) &&
            (identical(other.lateDays, lateDays) ||
                other.lateDays == lateDays) &&
            (identical(other.absentDays, absentDays) ||
                other.absentDays == absentDays) &&
            (identical(other.attendanceRate, attendanceRate) ||
                other.attendanceRate == attendanceRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, year, totalWorkingDays,
      presentDays, lateDays, absentDays, attendanceRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceSummaryImplCopyWith<_$AttendanceSummaryImpl> get copyWith =>
      __$$AttendanceSummaryImplCopyWithImpl<_$AttendanceSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceSummaryImplToJson(
      this,
    );
  }
}

abstract class _AttendanceSummary implements AttendanceSummary {
  const factory _AttendanceSummary(
          {required final int month,
          required final int year,
          @JsonKey(name: 'total_working_days') final int totalWorkingDays,
          @JsonKey(name: 'present_days') final int presentDays,
          @JsonKey(name: 'late_days') final int lateDays,
          @JsonKey(name: 'absent_days') final int absentDays,
          @JsonKey(name: 'attendance_rate') final double attendanceRate}) =
      _$AttendanceSummaryImpl;

  factory _AttendanceSummary.fromJson(Map<String, dynamic> json) =
      _$AttendanceSummaryImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'total_working_days')
  int get totalWorkingDays;
  @override
  @JsonKey(name: 'present_days')
  int get presentDays;
  @override
  @JsonKey(name: 'late_days')
  int get lateDays;
  @override
  @JsonKey(name: 'absent_days')
  int get absentDays;
  @override
  @JsonKey(name: 'attendance_rate')
  double get attendanceRate;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceSummaryImplCopyWith<_$AttendanceSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttendanceSchedule _$AttendanceScheduleFromJson(Map<String, dynamic> json) {
  return _AttendanceSchedule.fromJson(json);
}

/// @nodoc
mixin _$AttendanceSchedule {
  int get id => throw _privateConstructorUsedError;
  OfficeInfo get office => throw _privateConstructorUsedError;
  ShiftInfo get shift => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_wfa')
  bool get isWfa => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_banned')
  bool get isBanned => throw _privateConstructorUsedError;
  @JsonKey(name: 'banned_reason')
  String? get bannedReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_on_leave')
  bool get isOnLeave => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceScheduleCopyWith<AttendanceSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceScheduleCopyWith<$Res> {
  factory $AttendanceScheduleCopyWith(
          AttendanceSchedule value, $Res Function(AttendanceSchedule) then) =
      _$AttendanceScheduleCopyWithImpl<$Res, AttendanceSchedule>;
  @useResult
  $Res call(
      {int id,
      OfficeInfo office,
      ShiftInfo shift,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason,
      @JsonKey(name: 'is_on_leave') bool isOnLeave});

  $OfficeInfoCopyWith<$Res> get office;
  $ShiftInfoCopyWith<$Res> get shift;
}

/// @nodoc
class _$AttendanceScheduleCopyWithImpl<$Res, $Val extends AttendanceSchedule>
    implements $AttendanceScheduleCopyWith<$Res> {
  _$AttendanceScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? office = null,
    Object? shift = null,
    Object? isWfa = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
    Object? isOnLeave = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo,
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      bannedReason: freezed == bannedReason
          ? _value.bannedReason
          : bannedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnLeave: null == isOnLeave
          ? _value.isOnLeave
          : isOnLeave // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficeInfoCopyWith<$Res> get office {
    return $OfficeInfoCopyWith<$Res>(_value.office, (value) {
      return _then(_value.copyWith(office: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftInfoCopyWith<$Res> get shift {
    return $ShiftInfoCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceScheduleImplCopyWith<$Res>
    implements $AttendanceScheduleCopyWith<$Res> {
  factory _$$AttendanceScheduleImplCopyWith(_$AttendanceScheduleImpl value,
          $Res Function(_$AttendanceScheduleImpl) then) =
      __$$AttendanceScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      OfficeInfo office,
      ShiftInfo shift,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason,
      @JsonKey(name: 'is_on_leave') bool isOnLeave});

  @override
  $OfficeInfoCopyWith<$Res> get office;
  @override
  $ShiftInfoCopyWith<$Res> get shift;
}

/// @nodoc
class __$$AttendanceScheduleImplCopyWithImpl<$Res>
    extends _$AttendanceScheduleCopyWithImpl<$Res, _$AttendanceScheduleImpl>
    implements _$$AttendanceScheduleImplCopyWith<$Res> {
  __$$AttendanceScheduleImplCopyWithImpl(_$AttendanceScheduleImpl _value,
      $Res Function(_$AttendanceScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? office = null,
    Object? shift = null,
    Object? isWfa = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
    Object? isOnLeave = null,
  }) {
    return _then(_$AttendanceScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo,
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      bannedReason: freezed == bannedReason
          ? _value.bannedReason
          : bannedReason // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnLeave: null == isOnLeave
          ? _value.isOnLeave
          : isOnLeave // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceScheduleImpl implements _AttendanceSchedule {
  const _$AttendanceScheduleImpl(
      {required this.id,
      required this.office,
      required this.shift,
      @JsonKey(name: 'is_wfa') this.isWfa = false,
      @JsonKey(name: 'is_banned') this.isBanned = false,
      @JsonKey(name: 'banned_reason') this.bannedReason,
      @JsonKey(name: 'is_on_leave') this.isOnLeave = false});

  factory _$AttendanceScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceScheduleImplFromJson(json);

  @override
  final int id;
  @override
  final OfficeInfo office;
  @override
  final ShiftInfo shift;
  @override
  @JsonKey(name: 'is_wfa')
  final bool isWfa;
  @override
  @JsonKey(name: 'is_banned')
  final bool isBanned;
  @override
  @JsonKey(name: 'banned_reason')
  final String? bannedReason;
  @override
  @JsonKey(name: 'is_on_leave')
  final bool isOnLeave;

  @override
  String toString() {
    return 'AttendanceSchedule(id: $id, office: $office, shift: $shift, isWfa: $isWfa, isBanned: $isBanned, bannedReason: $bannedReason, isOnLeave: $isOnLeave)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.bannedReason, bannedReason) ||
                other.bannedReason == bannedReason) &&
            (identical(other.isOnLeave, isOnLeave) ||
                other.isOnLeave == isOnLeave));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, office, shift, isWfa, isBanned, bannedReason, isOnLeave);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceScheduleImplCopyWith<_$AttendanceScheduleImpl> get copyWith =>
      __$$AttendanceScheduleImplCopyWithImpl<_$AttendanceScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceScheduleImplToJson(
      this,
    );
  }
}

abstract class _AttendanceSchedule implements AttendanceSchedule {
  const factory _AttendanceSchedule(
          {required final int id,
          required final OfficeInfo office,
          required final ShiftInfo shift,
          @JsonKey(name: 'is_wfa') final bool isWfa,
          @JsonKey(name: 'is_banned') final bool isBanned,
          @JsonKey(name: 'banned_reason') final String? bannedReason,
          @JsonKey(name: 'is_on_leave') final bool isOnLeave}) =
      _$AttendanceScheduleImpl;

  factory _AttendanceSchedule.fromJson(Map<String, dynamic> json) =
      _$AttendanceScheduleImpl.fromJson;

  @override
  int get id;
  @override
  OfficeInfo get office;
  @override
  ShiftInfo get shift;
  @override
  @JsonKey(name: 'is_wfa')
  bool get isWfa;
  @override
  @JsonKey(name: 'is_banned')
  bool get isBanned;
  @override
  @JsonKey(name: 'banned_reason')
  String? get bannedReason;
  @override
  @JsonKey(name: 'is_on_leave')
  bool get isOnLeave;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceScheduleImplCopyWith<_$AttendanceScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedAttendance _$PaginatedAttendanceFromJson(Map<String, dynamic> json) {
  return _PaginatedAttendance.fromJson(json);
}

/// @nodoc
mixin _$PaginatedAttendance {
  List<AttendanceEntity> get data => throw _privateConstructorUsedError;
  PaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedAttendanceCopyWith<PaginatedAttendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedAttendanceCopyWith<$Res> {
  factory $PaginatedAttendanceCopyWith(
          PaginatedAttendance value, $Res Function(PaginatedAttendance) then) =
      _$PaginatedAttendanceCopyWithImpl<$Res, PaginatedAttendance>;
  @useResult
  $Res call({List<AttendanceEntity> data, PaginationMeta meta});

  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedAttendanceCopyWithImpl<$Res, $Val extends PaginatedAttendance>
    implements $PaginatedAttendanceCopyWith<$Res> {
  _$PaginatedAttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AttendanceEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get meta {
    return $PaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedAttendanceImplCopyWith<$Res>
    implements $PaginatedAttendanceCopyWith<$Res> {
  factory _$$PaginatedAttendanceImplCopyWith(_$PaginatedAttendanceImpl value,
          $Res Function(_$PaginatedAttendanceImpl) then) =
      __$$PaginatedAttendanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AttendanceEntity> data, PaginationMeta meta});

  @override
  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedAttendanceImplCopyWithImpl<$Res>
    extends _$PaginatedAttendanceCopyWithImpl<$Res, _$PaginatedAttendanceImpl>
    implements _$$PaginatedAttendanceImplCopyWith<$Res> {
  __$$PaginatedAttendanceImplCopyWithImpl(_$PaginatedAttendanceImpl _value,
      $Res Function(_$PaginatedAttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedAttendanceImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AttendanceEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedAttendanceImpl implements _PaginatedAttendance {
  const _$PaginatedAttendanceImpl(
      {required final List<AttendanceEntity> data, required this.meta})
      : _data = data;

  factory _$PaginatedAttendanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedAttendanceImplFromJson(json);

  final List<AttendanceEntity> _data;
  @override
  List<AttendanceEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PaginationMeta meta;

  @override
  String toString() {
    return 'PaginatedAttendance(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedAttendanceImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedAttendanceImplCopyWith<_$PaginatedAttendanceImpl> get copyWith =>
      __$$PaginatedAttendanceImplCopyWithImpl<_$PaginatedAttendanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedAttendanceImplToJson(
      this,
    );
  }
}

abstract class _PaginatedAttendance implements PaginatedAttendance {
  const factory _PaginatedAttendance(
      {required final List<AttendanceEntity> data,
      required final PaginationMeta meta}) = _$PaginatedAttendanceImpl;

  factory _PaginatedAttendance.fromJson(Map<String, dynamic> json) =
      _$PaginatedAttendanceImpl.fromJson;

  @override
  List<AttendanceEntity> get data;
  @override
  PaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedAttendanceImplCopyWith<_$PaginatedAttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) then) =
      _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationMetaImplCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$PaginationMetaImplCopyWith(_$PaginationMetaImpl value,
          $Res Function(_$PaginationMetaImpl) then) =
      __$$PaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class __$$PaginationMetaImplCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$PaginationMetaImpl>
    implements _$$PaginationMetaImplCopyWith<$Res> {
  __$$PaginationMetaImplCopyWithImpl(
      _$PaginationMetaImpl _value, $Res Function(_$PaginationMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? lastPage = null,
  }) {
    return _then(_$PaginationMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl implements _PaginationMeta {
  const _$PaginationMetaImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 10,
      this.total = 0,
      @JsonKey(name: 'last_page') this.lastPage = 1});

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;

  @override
  String toString() {
    return 'PaginationMeta(currentPage: $currentPage, perPage: $perPage, total: $total, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, perPage, total, lastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      __$$PaginationMetaImplCopyWithImpl<_$PaginationMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationMetaImplToJson(
      this,
    );
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  const factory _PaginationMeta(
      {@JsonKey(name: 'current_page') final int currentPage,
      @JsonKey(name: 'per_page') final int perPage,
      final int total,
      @JsonKey(name: 'last_page') final int lastPage}) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get total;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(ignore: true)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
