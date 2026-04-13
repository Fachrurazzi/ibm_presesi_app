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

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) {
  return _AttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceModel {
  /// Data absen hari ini (Bisa null jika karyawan belum absen sama sekali)
  AttendanceEntity? get today => throw _privateConstructorUsedError;

  /// Riwayat absen bulan berjalan (Gunakan List kosong [] sebagai default)
  @JsonKey(name: 'this_month')
  List<AttendanceEntity> get thisMonth => throw _privateConstructorUsedError;

  /// Tips: Tambahkan status server jika diperlukan untuk debugging
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceModelCopyWith<AttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceModelCopyWith<$Res> {
  factory $AttendanceModelCopyWith(
          AttendanceModel value, $Res Function(AttendanceModel) then) =
      _$AttendanceModelCopyWithImpl<$Res, AttendanceModel>;
  @useResult
  $Res call(
      {AttendanceEntity? today,
      @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth,
      String? message});
}

/// @nodoc
class _$AttendanceModelCopyWithImpl<$Res, $Val extends AttendanceModel>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = freezed,
    Object? thisMonth = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      today: freezed == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as AttendanceEntity?,
      thisMonth: null == thisMonth
          ? _value.thisMonth
          : thisMonth // ignore: cast_nullable_to_non_nullable
              as List<AttendanceEntity>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceModelImplCopyWith<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  factory _$$AttendanceModelImplCopyWith(_$AttendanceModelImpl value,
          $Res Function(_$AttendanceModelImpl) then) =
      __$$AttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AttendanceEntity? today,
      @JsonKey(name: 'this_month') List<AttendanceEntity> thisMonth,
      String? message});
}

/// @nodoc
class __$$AttendanceModelImplCopyWithImpl<$Res>
    extends _$AttendanceModelCopyWithImpl<$Res, _$AttendanceModelImpl>
    implements _$$AttendanceModelImplCopyWith<$Res> {
  __$$AttendanceModelImplCopyWithImpl(
      _$AttendanceModelImpl _value, $Res Function(_$AttendanceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = freezed,
    Object? thisMonth = null,
    Object? message = freezed,
  }) {
    return _then(_$AttendanceModelImpl(
      today: freezed == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as AttendanceEntity?,
      thisMonth: null == thisMonth
          ? _value._thisMonth
          : thisMonth // ignore: cast_nullable_to_non_nullable
              as List<AttendanceEntity>,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceModelImpl implements _AttendanceModel {
  const _$AttendanceModelImpl(
      {this.today,
      @JsonKey(name: 'this_month')
      final List<AttendanceEntity> thisMonth = const [],
      this.message})
      : _thisMonth = thisMonth;

  factory _$AttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceModelImplFromJson(json);

  /// Data absen hari ini (Bisa null jika karyawan belum absen sama sekali)
  @override
  final AttendanceEntity? today;

  /// Riwayat absen bulan berjalan (Gunakan List kosong [] sebagai default)
  final List<AttendanceEntity> _thisMonth;

  /// Riwayat absen bulan berjalan (Gunakan List kosong [] sebagai default)
  @override
  @JsonKey(name: 'this_month')
  List<AttendanceEntity> get thisMonth {
    if (_thisMonth is EqualUnmodifiableListView) return _thisMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thisMonth);
  }

  /// Tips: Tambahkan status server jika diperlukan untuk debugging
  @override
  final String? message;

  @override
  String toString() {
    return 'AttendanceModel(today: $today, thisMonth: $thisMonth, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceModelImpl &&
            const DeepCollectionEquality().equals(other.today, today) &&
            const DeepCollectionEquality()
                .equals(other._thisMonth, _thisMonth) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(today),
      const DeepCollectionEquality().hash(_thisMonth),
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      __$$AttendanceModelImplCopyWithImpl<_$AttendanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceModel implements AttendanceModel {
  const factory _AttendanceModel(
      {final AttendanceEntity? today,
      @JsonKey(name: 'this_month') final List<AttendanceEntity> thisMonth,
      final String? message}) = _$AttendanceModelImpl;

  factory _AttendanceModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceModelImpl.fromJson;

  @override

  /// Data absen hari ini (Bisa null jika karyawan belum absen sama sekali)
  AttendanceEntity? get today;
  @override

  /// Riwayat absen bulan berjalan (Gunakan List kosong [] sebagai default)
  @JsonKey(name: 'this_month')
  List<AttendanceEntity> get thisMonth;
  @override

  /// Tips: Tambahkan status server jika diperlukan untuk debugging
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
