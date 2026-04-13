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
  switch (json['runtimeType']) {
    case 'entity':
      return AttendanceEntity.fromJson(json);
    case 'paramEntity':
      return AttendanceParamEntity.fromJson(json);
    case 'paramGetEntity':
      return AttendanceParamGetEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Attendance',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Attendance {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)
        entity,
    required TResult Function(
            double latitude, double longitude, String address, String image)
        paramEntity,
    required TResult Function(int month, int year) paramGetEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)?
        entity,
    TResult? Function(
            double latitude, double longitude, String address, String image)?
        paramEntity,
    TResult? Function(int month, int year)? paramGetEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)?
        entity,
    TResult Function(
            double latitude, double longitude, String address, String image)?
        paramEntity,
    TResult Function(int month, int year)? paramGetEntity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceEntity value) entity,
    required TResult Function(AttendanceParamEntity value) paramEntity,
    required TResult Function(AttendanceParamGetEntity value) paramGetEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceEntity value)? entity,
    TResult? Function(AttendanceParamEntity value)? paramEntity,
    TResult? Function(AttendanceParamGetEntity value)? paramGetEntity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceEntity value)? entity,
    TResult Function(AttendanceParamEntity value)? paramEntity,
    TResult Function(AttendanceParamGetEntity value)? paramGetEntity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AttendanceEntityImplCopyWith<$Res> {
  factory _$$AttendanceEntityImplCopyWith(_$AttendanceEntityImpl value,
          $Res Function(_$AttendanceEntityImpl) then) =
      __$$AttendanceEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String? date,
      @JsonKey(name: 'is_late') bool isLate,
      @JsonKey(name: 'lunch_money') int lunchMoney,
      @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
      @JsonKey(name: 'schedule_start') String? scheduleStart,
      @JsonKey(name: 'schedule_end') String? scheduleEnd});
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
    Object? id = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? date = freezed,
    Object? isLate = null,
    Object? lunchMoney = null,
    Object? lunchMoneyLabel = null,
    Object? scheduleStart = freezed,
    Object? scheduleEnd = freezed,
  }) {
    return _then(_$AttendanceEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: null == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceEntityImpl implements AttendanceEntity {
  const _$AttendanceEntityImpl(
      {this.id,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      this.date,
      @JsonKey(name: 'is_late') this.isLate = false,
      @JsonKey(name: 'lunch_money') this.lunchMoney = 0,
      @JsonKey(name: 'lunch_money_label') this.lunchMoneyLabel = 'Rp 0',
      @JsonKey(name: 'schedule_start') this.scheduleStart,
      @JsonKey(name: 'schedule_end') this.scheduleEnd,
      final String? $type})
      : $type = $type ?? 'entity';

  factory _$AttendanceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceEntityImplFromJson(json);

  @override
  final int? id;
// REVISI: Tambahkan tanda tanya (?) agar boleh null jika belum absen
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  final String? date;
  @override
  @JsonKey(name: 'is_late')
  final bool isLate;
  @override
  @JsonKey(name: 'lunch_money')
  final int lunchMoney;
  @override
  @JsonKey(name: 'lunch_money_label')
  final String lunchMoneyLabel;
// Jam kerja seharusnya
  @override
  @JsonKey(name: 'schedule_start')
  final String? scheduleStart;
  @override
  @JsonKey(name: 'schedule_end')
  final String? scheduleEnd;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Attendance.entity(id: $id, startTime: $startTime, endTime: $endTime, date: $date, isLate: $isLate, lunchMoney: $lunchMoney, lunchMoneyLabel: $lunchMoneyLabel, scheduleStart: $scheduleStart, scheduleEnd: $scheduleEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isLate, isLate) || other.isLate == isLate) &&
            (identical(other.lunchMoney, lunchMoney) ||
                other.lunchMoney == lunchMoney) &&
            (identical(other.lunchMoneyLabel, lunchMoneyLabel) ||
                other.lunchMoneyLabel == lunchMoneyLabel) &&
            (identical(other.scheduleStart, scheduleStart) ||
                other.scheduleStart == scheduleStart) &&
            (identical(other.scheduleEnd, scheduleEnd) ||
                other.scheduleEnd == scheduleEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startTime, endTime, date,
      isLate, lunchMoney, lunchMoneyLabel, scheduleStart, scheduleEnd);

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
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)
        entity,
    required TResult Function(
            double latitude, double longitude, String address, String image)
        paramEntity,
    required TResult Function(int month, int year) paramGetEntity,
  }) {
    return entity(id, startTime, endTime, date, isLate, lunchMoney,
        lunchMoneyLabel, scheduleStart, scheduleEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)?
        entity,
    TResult? Function(
            double latitude, double longitude, String address, String image)?
        paramEntity,
    TResult? Function(int month, int year)? paramGetEntity,
  }) {
    return entity?.call(id, startTime, endTime, date, isLate, lunchMoney,
        lunchMoneyLabel, scheduleStart, scheduleEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)?
        entity,
    TResult Function(
            double latitude, double longitude, String address, String image)?
        paramEntity,
    TResult Function(int month, int year)? paramGetEntity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(id, startTime, endTime, date, isLate, lunchMoney,
          lunchMoneyLabel, scheduleStart, scheduleEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceEntity value) entity,
    required TResult Function(AttendanceParamEntity value) paramEntity,
    required TResult Function(AttendanceParamGetEntity value) paramGetEntity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceEntity value)? entity,
    TResult? Function(AttendanceParamEntity value)? paramEntity,
    TResult? Function(AttendanceParamGetEntity value)? paramGetEntity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceEntity value)? entity,
    TResult Function(AttendanceParamEntity value)? paramEntity,
    TResult Function(AttendanceParamGetEntity value)? paramGetEntity,
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

abstract class AttendanceEntity implements Attendance {
  const factory AttendanceEntity(
          {final int? id,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime,
          final String? date,
          @JsonKey(name: 'is_late') final bool isLate,
          @JsonKey(name: 'lunch_money') final int lunchMoney,
          @JsonKey(name: 'lunch_money_label') final String lunchMoneyLabel,
          @JsonKey(name: 'schedule_start') final String? scheduleStart,
          @JsonKey(name: 'schedule_end') final String? scheduleEnd}) =
      _$AttendanceEntityImpl;

  factory AttendanceEntity.fromJson(Map<String, dynamic> json) =
      _$AttendanceEntityImpl.fromJson;

  int?
      get id; // REVISI: Tambahkan tanda tanya (?) agar boleh null jika belum absen
  @JsonKey(name: 'start_time')
  String? get startTime;
  @JsonKey(name: 'end_time')
  String? get endTime;
  String? get date;
  @JsonKey(name: 'is_late')
  bool get isLate;
  @JsonKey(name: 'lunch_money')
  int get lunchMoney;
  @JsonKey(name: 'lunch_money_label')
  String get lunchMoneyLabel; // Jam kerja seharusnya
  @JsonKey(name: 'schedule_start')
  String? get scheduleStart;
  @JsonKey(name: 'schedule_end')
  String? get scheduleEnd;
  @JsonKey(ignore: true)
  _$$AttendanceEntityImplCopyWith<_$AttendanceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttendanceParamEntityImplCopyWith<$Res> {
  factory _$$AttendanceParamEntityImplCopyWith(
          _$AttendanceParamEntityImpl value,
          $Res Function(_$AttendanceParamEntityImpl) then) =
      __$$AttendanceParamEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double latitude, double longitude, String address, String image});
}

/// @nodoc
class __$$AttendanceParamEntityImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceParamEntityImpl>
    implements _$$AttendanceParamEntityImplCopyWith<$Res> {
  __$$AttendanceParamEntityImplCopyWithImpl(_$AttendanceParamEntityImpl _value,
      $Res Function(_$AttendanceParamEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = null,
    Object? image = null,
  }) {
    return _then(_$AttendanceParamEntityImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceParamEntityImpl implements AttendanceParamEntity {
  const _$AttendanceParamEntityImpl(
      {required this.latitude,
      required this.longitude,
      this.address = '',
      this.image = '',
      final String? $type})
      : $type = $type ?? 'paramEntity';

  factory _$AttendanceParamEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceParamEntityImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String image;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Attendance.paramEntity(latitude: $latitude, longitude: $longitude, address: $address, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceParamEntityImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, address, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceParamEntityImplCopyWith<_$AttendanceParamEntityImpl>
      get copyWith => __$$AttendanceParamEntityImplCopyWithImpl<
          _$AttendanceParamEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)
        entity,
    required TResult Function(
            double latitude, double longitude, String address, String image)
        paramEntity,
    required TResult Function(int month, int year) paramGetEntity,
  }) {
    return paramEntity(latitude, longitude, address, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)?
        entity,
    TResult? Function(
            double latitude, double longitude, String address, String image)?
        paramEntity,
    TResult? Function(int month, int year)? paramGetEntity,
  }) {
    return paramEntity?.call(latitude, longitude, address, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)?
        entity,
    TResult Function(
            double latitude, double longitude, String address, String image)?
        paramEntity,
    TResult Function(int month, int year)? paramGetEntity,
    required TResult orElse(),
  }) {
    if (paramEntity != null) {
      return paramEntity(latitude, longitude, address, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceEntity value) entity,
    required TResult Function(AttendanceParamEntity value) paramEntity,
    required TResult Function(AttendanceParamGetEntity value) paramGetEntity,
  }) {
    return paramEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceEntity value)? entity,
    TResult? Function(AttendanceParamEntity value)? paramEntity,
    TResult? Function(AttendanceParamGetEntity value)? paramGetEntity,
  }) {
    return paramEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceEntity value)? entity,
    TResult Function(AttendanceParamEntity value)? paramEntity,
    TResult Function(AttendanceParamGetEntity value)? paramGetEntity,
    required TResult orElse(),
  }) {
    if (paramEntity != null) {
      return paramEntity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceParamEntityImplToJson(
      this,
    );
  }
}

abstract class AttendanceParamEntity implements Attendance {
  const factory AttendanceParamEntity(
      {required final double latitude,
      required final double longitude,
      final String address,
      final String image}) = _$AttendanceParamEntityImpl;

  factory AttendanceParamEntity.fromJson(Map<String, dynamic> json) =
      _$AttendanceParamEntityImpl.fromJson;

  double get latitude;
  double get longitude;
  String get address;
  String get image;
  @JsonKey(ignore: true)
  _$$AttendanceParamEntityImplCopyWith<_$AttendanceParamEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttendanceParamGetEntityImplCopyWith<$Res> {
  factory _$$AttendanceParamGetEntityImplCopyWith(
          _$AttendanceParamGetEntityImpl value,
          $Res Function(_$AttendanceParamGetEntityImpl) then) =
      __$$AttendanceParamGetEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int month, int year});
}

/// @nodoc
class __$$AttendanceParamGetEntityImplCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$AttendanceParamGetEntityImpl>
    implements _$$AttendanceParamGetEntityImplCopyWith<$Res> {
  __$$AttendanceParamGetEntityImplCopyWithImpl(
      _$AttendanceParamGetEntityImpl _value,
      $Res Function(_$AttendanceParamGetEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_$AttendanceParamGetEntityImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceParamGetEntityImpl implements AttendanceParamGetEntity {
  const _$AttendanceParamGetEntityImpl(
      {required this.month, required this.year, final String? $type})
      : $type = $type ?? 'paramGetEntity';

  factory _$AttendanceParamGetEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceParamGetEntityImplFromJson(json);

  @override
  final int month;
  @override
  final int year;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Attendance.paramGetEntity(month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceParamGetEntityImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, year);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceParamGetEntityImplCopyWith<_$AttendanceParamGetEntityImpl>
      get copyWith => __$$AttendanceParamGetEntityImplCopyWithImpl<
          _$AttendanceParamGetEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)
        entity,
    required TResult Function(
            double latitude, double longitude, String address, String image)
        paramEntity,
    required TResult Function(int month, int year) paramGetEntity,
  }) {
    return paramGetEntity(month, year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)?
        entity,
    TResult? Function(
            double latitude, double longitude, String address, String image)?
        paramEntity,
    TResult? Function(int month, int year)? paramGetEntity,
  }) {
    return paramGetEntity?.call(month, year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? id,
            @JsonKey(name: 'start_time') String? startTime,
            @JsonKey(name: 'end_time') String? endTime,
            String? date,
            @JsonKey(name: 'is_late') bool isLate,
            @JsonKey(name: 'lunch_money') int lunchMoney,
            @JsonKey(name: 'lunch_money_label') String lunchMoneyLabel,
            @JsonKey(name: 'schedule_start') String? scheduleStart,
            @JsonKey(name: 'schedule_end') String? scheduleEnd)?
        entity,
    TResult Function(
            double latitude, double longitude, String address, String image)?
        paramEntity,
    TResult Function(int month, int year)? paramGetEntity,
    required TResult orElse(),
  }) {
    if (paramGetEntity != null) {
      return paramGetEntity(month, year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AttendanceEntity value) entity,
    required TResult Function(AttendanceParamEntity value) paramEntity,
    required TResult Function(AttendanceParamGetEntity value) paramGetEntity,
  }) {
    return paramGetEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AttendanceEntity value)? entity,
    TResult? Function(AttendanceParamEntity value)? paramEntity,
    TResult? Function(AttendanceParamGetEntity value)? paramGetEntity,
  }) {
    return paramGetEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AttendanceEntity value)? entity,
    TResult Function(AttendanceParamEntity value)? paramEntity,
    TResult Function(AttendanceParamGetEntity value)? paramGetEntity,
    required TResult orElse(),
  }) {
    if (paramGetEntity != null) {
      return paramGetEntity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceParamGetEntityImplToJson(
      this,
    );
  }
}

abstract class AttendanceParamGetEntity implements Attendance {
  const factory AttendanceParamGetEntity(
      {required final int month,
      required final int year}) = _$AttendanceParamGetEntityImpl;

  factory AttendanceParamGetEntity.fromJson(Map<String, dynamic> json) =
      _$AttendanceParamGetEntityImpl.fromJson;

  int get month;
  int get year;
  @JsonKey(ignore: true)
  _$$AttendanceParamGetEntityImplCopyWith<_$AttendanceParamGetEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
