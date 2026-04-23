// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_id')
  int? get positionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_name')
  String? get positionName => throw _privateConstructorUsedError;
  PositionEntity? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'join_date')
  String? get joinDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'leave_quota')
  int get leaveQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_leave')
  int get remainingLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default_password')
  bool get isDefaultPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_face_registered')
  bool get isFaceRegistered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      String? image,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'position_id') int? positionId,
      @JsonKey(name: 'position_name') String? positionName,
      PositionEntity? position,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'leave_quota') int leaveQuota,
      @JsonKey(name: 'remaining_leave') int remainingLeave,
      @JsonKey(name: 'cashable_leave') int cashableLeave,
      @JsonKey(name: 'is_default_password') bool isDefaultPassword,
      @JsonKey(name: 'is_face_registered') bool isFaceRegistered});

  $PositionEntityCopyWith<$Res>? get position;
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

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
    Object? emailVerifiedAt = freezed,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? positionId = freezed,
    Object? positionName = freezed,
    Object? position = freezed,
    Object? joinDate = freezed,
    Object? leaveQuota = null,
    Object? remainingLeave = null,
    Object? cashableLeave = null,
    Object? isDefaultPassword = null,
    Object? isFaceRegistered = null,
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
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionEntity?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveQuota: null == leaveQuota
          ? _value.leaveQuota
          : leaveQuota // ignore: cast_nullable_to_non_nullable
              as int,
      remainingLeave: null == remainingLeave
          ? _value.remainingLeave
          : remainingLeave // ignore: cast_nullable_to_non_nullable
              as int,
      cashableLeave: null == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int,
      isDefaultPassword: null == isDefaultPassword
          ? _value.isDefaultPassword
          : isDefaultPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isFaceRegistered: null == isFaceRegistered
          ? _value.isFaceRegistered
          : isFaceRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PositionEntityCopyWith<$Res>? get position {
    if (_value.position == null) {
      return null;
    }

    return $PositionEntityCopyWith<$Res>(_value.position!, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      String? image,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'position_id') int? positionId,
      @JsonKey(name: 'position_name') String? positionName,
      PositionEntity? position,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'leave_quota') int leaveQuota,
      @JsonKey(name: 'remaining_leave') int remainingLeave,
      @JsonKey(name: 'cashable_leave') int cashableLeave,
      @JsonKey(name: 'is_default_password') bool isDefaultPassword,
      @JsonKey(name: 'is_face_registered') bool isFaceRegistered});

  @override
  $PositionEntityCopyWith<$Res>? get position;
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? emailVerifiedAt = freezed,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? positionId = freezed,
    Object? positionName = freezed,
    Object? position = freezed,
    Object? joinDate = freezed,
    Object? leaveQuota = null,
    Object? remainingLeave = null,
    Object? cashableLeave = null,
    Object? isDefaultPassword = null,
    Object? isFaceRegistered = null,
  }) {
    return _then(_$UserEntityImpl(
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
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionEntity?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveQuota: null == leaveQuota
          ? _value.leaveQuota
          : leaveQuota // ignore: cast_nullable_to_non_nullable
              as int,
      remainingLeave: null == remainingLeave
          ? _value.remainingLeave
          : remainingLeave // ignore: cast_nullable_to_non_nullable
              as int,
      cashableLeave: null == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int,
      isDefaultPassword: null == isDefaultPassword
          ? _value.isDefaultPassword
          : isDefaultPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isFaceRegistered: null == isFaceRegistered
          ? _value.isFaceRegistered
          : isFaceRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl extends _UserEntity {
  const _$UserEntityImpl(
      {required this.id,
      this.name = "",
      this.email = "",
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      this.image,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'position_id') this.positionId,
      @JsonKey(name: 'position_name') this.positionName,
      this.position,
      @JsonKey(name: 'join_date') this.joinDate,
      @JsonKey(name: 'leave_quota') this.leaveQuota = 12,
      @JsonKey(name: 'remaining_leave') this.remainingLeave = 12,
      @JsonKey(name: 'cashable_leave') this.cashableLeave = 0,
      @JsonKey(name: 'is_default_password') this.isDefaultPassword = false,
      @JsonKey(name: 'is_face_registered') this.isFaceRegistered = false})
      : super._();

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @override
  final String? image;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'position_id')
  final int? positionId;
  @override
  @JsonKey(name: 'position_name')
  final String? positionName;
  @override
  final PositionEntity? position;
  @override
  @JsonKey(name: 'join_date')
  final String? joinDate;
  @override
  @JsonKey(name: 'leave_quota')
  final int leaveQuota;
  @override
  @JsonKey(name: 'remaining_leave')
  final int remainingLeave;
  @override
  @JsonKey(name: 'cashable_leave')
  final int cashableLeave;
  @override
  @JsonKey(name: 'is_default_password')
  final bool isDefaultPassword;
  @override
  @JsonKey(name: 'is_face_registered')
  final bool isFaceRegistered;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, image: $image, imageUrl: $imageUrl, positionId: $positionId, positionName: $positionName, position: $position, joinDate: $joinDate, leaveQuota: $leaveQuota, remainingLeave: $remainingLeave, cashableLeave: $cashableLeave, isDefaultPassword: $isDefaultPassword, isFaceRegistered: $isFaceRegistered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.leaveQuota, leaveQuota) ||
                other.leaveQuota == leaveQuota) &&
            (identical(other.remainingLeave, remainingLeave) ||
                other.remainingLeave == remainingLeave) &&
            (identical(other.cashableLeave, cashableLeave) ||
                other.cashableLeave == cashableLeave) &&
            (identical(other.isDefaultPassword, isDefaultPassword) ||
                other.isDefaultPassword == isDefaultPassword) &&
            (identical(other.isFaceRegistered, isFaceRegistered) ||
                other.isFaceRegistered == isFaceRegistered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      emailVerifiedAt,
      image,
      imageUrl,
      positionId,
      positionName,
      position,
      joinDate,
      leaveQuota,
      remainingLeave,
      cashableLeave,
      isDefaultPassword,
      isFaceRegistered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }
}

abstract class _UserEntity extends UserEntity {
  const factory _UserEntity(
          {required final int id,
          final String name,
          final String email,
          @JsonKey(name: 'email_verified_at') final String? emailVerifiedAt,
          final String? image,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'position_id') final int? positionId,
          @JsonKey(name: 'position_name') final String? positionName,
          final PositionEntity? position,
          @JsonKey(name: 'join_date') final String? joinDate,
          @JsonKey(name: 'leave_quota') final int leaveQuota,
          @JsonKey(name: 'remaining_leave') final int remainingLeave,
          @JsonKey(name: 'cashable_leave') final int cashableLeave,
          @JsonKey(name: 'is_default_password') final bool isDefaultPassword,
          @JsonKey(name: 'is_face_registered') final bool isFaceRegistered}) =
      _$UserEntityImpl;
  const _UserEntity._() : super._();

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt;
  @override
  String? get image;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'position_id')
  int? get positionId;
  @override
  @JsonKey(name: 'position_name')
  String? get positionName;
  @override
  PositionEntity? get position;
  @override
  @JsonKey(name: 'join_date')
  String? get joinDate;
  @override
  @JsonKey(name: 'leave_quota')
  int get leaveQuota;
  @override
  @JsonKey(name: 'remaining_leave')
  int get remainingLeave;
  @override
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave;
  @override
  @JsonKey(name: 'is_default_password')
  bool get isDefaultPassword;
  @override
  @JsonKey(name: 'is_face_registered')
  bool get isFaceRegistered;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PositionEntity _$PositionEntityFromJson(Map<String, dynamic> json) {
  return _PositionEntity.fromJson(json);
}

/// @nodoc
mixin _$PositionEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionEntityCopyWith<PositionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionEntityCopyWith<$Res> {
  factory $PositionEntityCopyWith(
          PositionEntity value, $Res Function(PositionEntity) then) =
      _$PositionEntityCopyWithImpl<$Res, PositionEntity>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$PositionEntityCopyWithImpl<$Res, $Val extends PositionEntity>
    implements $PositionEntityCopyWith<$Res> {
  _$PositionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionEntityImplCopyWith<$Res>
    implements $PositionEntityCopyWith<$Res> {
  factory _$$PositionEntityImplCopyWith(_$PositionEntityImpl value,
          $Res Function(_$PositionEntityImpl) then) =
      __$$PositionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$PositionEntityImplCopyWithImpl<$Res>
    extends _$PositionEntityCopyWithImpl<$Res, _$PositionEntityImpl>
    implements _$$PositionEntityImplCopyWith<$Res> {
  __$$PositionEntityImplCopyWithImpl(
      _$PositionEntityImpl _value, $Res Function(_$PositionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$PositionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionEntityImpl implements _PositionEntity {
  const _$PositionEntityImpl({required this.id, required this.name});

  factory _$PositionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'PositionEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      __$$PositionEntityImplCopyWithImpl<_$PositionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionEntityImplToJson(
      this,
    );
  }
}

abstract class _PositionEntity implements PositionEntity {
  const factory _PositionEntity(
      {required final int id,
      required final String name}) = _$PositionEntityImpl;

  factory _PositionEntity.fromJson(Map<String, dynamic> json) =
      _$PositionEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSchedule _$UserScheduleFromJson(Map<String, dynamic> json) {
  return _UserSchedule.fromJson(json);
}

/// @nodoc
mixin _$UserSchedule {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  ShiftInfo get shift => throw _privateConstructorUsedError;
  OfficeInfo get office => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_wfa')
  bool get isWfa => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_range')
  String? get dateRange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserScheduleCopyWith<UserSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserScheduleCopyWith<$Res> {
  factory $UserScheduleCopyWith(
          UserSchedule value, $Res Function(UserSchedule) then) =
      _$UserScheduleCopyWithImpl<$Res, UserSchedule>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      ShiftInfo shift,
      OfficeInfo office,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'date_range') String? dateRange});

  $ShiftInfoCopyWith<$Res> get shift;
  $OfficeInfoCopyWith<$Res> get office;
}

/// @nodoc
class _$UserScheduleCopyWithImpl<$Res, $Val extends UserSchedule>
    implements $UserScheduleCopyWith<$Res> {
  _$UserScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? shift = null,
    Object? office = null,
    Object? isWfa = null,
    Object? isActive = null,
    Object? dateRange = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo,
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftInfoCopyWith<$Res> get shift {
    return $ShiftInfoCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficeInfoCopyWith<$Res> get office {
    return $OfficeInfoCopyWith<$Res>(_value.office, (value) {
      return _then(_value.copyWith(office: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserScheduleImplCopyWith<$Res>
    implements $UserScheduleCopyWith<$Res> {
  factory _$$UserScheduleImplCopyWith(
          _$UserScheduleImpl value, $Res Function(_$UserScheduleImpl) then) =
      __$$UserScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      ShiftInfo shift,
      OfficeInfo office,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'date_range') String? dateRange});

  @override
  $ShiftInfoCopyWith<$Res> get shift;
  @override
  $OfficeInfoCopyWith<$Res> get office;
}

/// @nodoc
class __$$UserScheduleImplCopyWithImpl<$Res>
    extends _$UserScheduleCopyWithImpl<$Res, _$UserScheduleImpl>
    implements _$$UserScheduleImplCopyWith<$Res> {
  __$$UserScheduleImplCopyWithImpl(
      _$UserScheduleImpl _value, $Res Function(_$UserScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? shift = null,
    Object? office = null,
    Object? isWfa = null,
    Object? isActive = null,
    Object? dateRange = freezed,
  }) {
    return _then(_$UserScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo,
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserScheduleImpl implements _UserSchedule {
  const _$UserScheduleImpl(
      {required this.id,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      required this.shift,
      required this.office,
      @JsonKey(name: 'is_wfa') this.isWfa = false,
      @JsonKey(name: 'is_active') this.isActive = false,
      @JsonKey(name: 'date_range') this.dateRange});

  factory _$UserScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserScheduleImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  final ShiftInfo shift;
  @override
  final OfficeInfo office;
  @override
  @JsonKey(name: 'is_wfa')
  final bool isWfa;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'date_range')
  final String? dateRange;

  @override
  String toString() {
    return 'UserSchedule(id: $id, startDate: $startDate, endDate: $endDate, shift: $shift, office: $office, isWfa: $isWfa, isActive: $isActive, dateRange: $dateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startDate, endDate, shift,
      office, isWfa, isActive, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserScheduleImplCopyWith<_$UserScheduleImpl> get copyWith =>
      __$$UserScheduleImplCopyWithImpl<_$UserScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserScheduleImplToJson(
      this,
    );
  }
}

abstract class _UserSchedule implements UserSchedule {
  const factory _UserSchedule(
          {required final int id,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') final String? endDate,
          required final ShiftInfo shift,
          required final OfficeInfo office,
          @JsonKey(name: 'is_wfa') final bool isWfa,
          @JsonKey(name: 'is_active') final bool isActive,
          @JsonKey(name: 'date_range') final String? dateRange}) =
      _$UserScheduleImpl;

  factory _UserSchedule.fromJson(Map<String, dynamic> json) =
      _$UserScheduleImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  ShiftInfo get shift;
  @override
  OfficeInfo get office;
  @override
  @JsonKey(name: 'is_wfa')
  bool get isWfa;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'date_range')
  String? get dateRange;
  @override
  @JsonKey(ignore: true)
  _$$UserScheduleImplCopyWith<_$UserScheduleImpl> get copyWith =>
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
  @JsonKey(name: 'is_overnight')
  bool get isOvernight => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'is_overnight') bool isOvernight});
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
    Object? isOvernight = null,
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
      isOvernight: null == isOvernight
          ? _value.isOvernight
          : isOvernight // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'is_overnight') bool isOvernight});
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
    Object? isOvernight = null,
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
      isOvernight: null == isOvernight
          ? _value.isOvernight
          : isOvernight // ignore: cast_nullable_to_non_nullable
              as bool,
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
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'is_overnight') this.isOvernight = false});

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
  @JsonKey(name: 'is_overnight')
  final bool isOvernight;

  @override
  String toString() {
    return 'ShiftInfo(id: $id, name: $name, startTime: $startTime, endTime: $endTime, isOvernight: $isOvernight)';
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
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isOvernight, isOvernight) ||
                other.isOvernight == isOvernight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, startTime, endTime, isOvernight);

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
      @JsonKey(name: 'end_time') final String? endTime,
      @JsonKey(name: 'is_overnight') final bool isOvernight}) = _$ShiftInfoImpl;

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
  @JsonKey(name: 'is_overnight')
  bool get isOvernight;
  @override
  @JsonKey(ignore: true)
  _$$ShiftInfoImplCopyWith<_$ShiftInfoImpl> get copyWith =>
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

TodaySchedule _$TodayScheduleFromJson(Map<String, dynamic> json) {
  return _TodaySchedule.fromJson(json);
}

/// @nodoc
mixin _$TodaySchedule {
  int get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_name')
  String get dayName => throw _privateConstructorUsedError;
  ShiftInfo get shift => throw _privateConstructorUsedError;
  OfficeInfo get office => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_wfa')
  bool get isWfa => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_banned')
  bool get isBanned => throw _privateConstructorUsedError;
  @JsonKey(name: 'banned_reason')
  String? get bannedReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodayScheduleCopyWith<TodaySchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayScheduleCopyWith<$Res> {
  factory $TodayScheduleCopyWith(
          TodaySchedule value, $Res Function(TodaySchedule) then) =
      _$TodayScheduleCopyWithImpl<$Res, TodaySchedule>;
  @useResult
  $Res call(
      {int id,
      String date,
      @JsonKey(name: 'day_name') String dayName,
      ShiftInfo shift,
      OfficeInfo office,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason});

  $ShiftInfoCopyWith<$Res> get shift;
  $OfficeInfoCopyWith<$Res> get office;
}

/// @nodoc
class _$TodayScheduleCopyWithImpl<$Res, $Val extends TodaySchedule>
    implements $TodayScheduleCopyWith<$Res> {
  _$TodayScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? dayName = null,
    Object? shift = null,
    Object? office = null,
    Object? isWfa = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
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
      dayName: null == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo,
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftInfoCopyWith<$Res> get shift {
    return $ShiftInfoCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficeInfoCopyWith<$Res> get office {
    return $OfficeInfoCopyWith<$Res>(_value.office, (value) {
      return _then(_value.copyWith(office: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodayScheduleImplCopyWith<$Res>
    implements $TodayScheduleCopyWith<$Res> {
  factory _$$TodayScheduleImplCopyWith(
          _$TodayScheduleImpl value, $Res Function(_$TodayScheduleImpl) then) =
      __$$TodayScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String date,
      @JsonKey(name: 'day_name') String dayName,
      ShiftInfo shift,
      OfficeInfo office,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason});

  @override
  $ShiftInfoCopyWith<$Res> get shift;
  @override
  $OfficeInfoCopyWith<$Res> get office;
}

/// @nodoc
class __$$TodayScheduleImplCopyWithImpl<$Res>
    extends _$TodayScheduleCopyWithImpl<$Res, _$TodayScheduleImpl>
    implements _$$TodayScheduleImplCopyWith<$Res> {
  __$$TodayScheduleImplCopyWithImpl(
      _$TodayScheduleImpl _value, $Res Function(_$TodayScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? dayName = null,
    Object? shift = null,
    Object? office = null,
    Object? isWfa = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
  }) {
    return _then(_$TodayScheduleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dayName: null == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayScheduleImpl implements _TodaySchedule {
  const _$TodayScheduleImpl(
      {required this.id,
      required this.date,
      @JsonKey(name: 'day_name') required this.dayName,
      required this.shift,
      required this.office,
      @JsonKey(name: 'is_wfa') this.isWfa = false,
      @JsonKey(name: 'is_banned') this.isBanned = false,
      @JsonKey(name: 'banned_reason') this.bannedReason});

  factory _$TodayScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayScheduleImplFromJson(json);

  @override
  final int id;
  @override
  final String date;
  @override
  @JsonKey(name: 'day_name')
  final String dayName;
  @override
  final ShiftInfo shift;
  @override
  final OfficeInfo office;
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
  String toString() {
    return 'TodaySchedule(id: $id, date: $date, dayName: $dayName, shift: $shift, office: $office, isWfa: $isWfa, isBanned: $isBanned, bannedReason: $bannedReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.bannedReason, bannedReason) ||
                other.bannedReason == bannedReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, dayName, shift, office,
      isWfa, isBanned, bannedReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayScheduleImplCopyWith<_$TodayScheduleImpl> get copyWith =>
      __$$TodayScheduleImplCopyWithImpl<_$TodayScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayScheduleImplToJson(
      this,
    );
  }
}

abstract class _TodaySchedule implements TodaySchedule {
  const factory _TodaySchedule(
          {required final int id,
          required final String date,
          @JsonKey(name: 'day_name') required final String dayName,
          required final ShiftInfo shift,
          required final OfficeInfo office,
          @JsonKey(name: 'is_wfa') final bool isWfa,
          @JsonKey(name: 'is_banned') final bool isBanned,
          @JsonKey(name: 'banned_reason') final String? bannedReason}) =
      _$TodayScheduleImpl;

  factory _TodaySchedule.fromJson(Map<String, dynamic> json) =
      _$TodayScheduleImpl.fromJson;

  @override
  int get id;
  @override
  String get date;
  @override
  @JsonKey(name: 'day_name')
  String get dayName;
  @override
  ShiftInfo get shift;
  @override
  OfficeInfo get office;
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
  @JsonKey(ignore: true)
  _$$TodayScheduleImplCopyWith<_$TodayScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveSummary _$LeaveSummaryFromJson(Map<String, dynamic> json) {
  return _LeaveSummary.fromJson(json);
}

/// @nodoc
mixin _$LeaveSummary {
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quota')
  int get totalQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_leave')
  int get usedLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_leave')
  int get remainingLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_count')
  int get pendingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveSummaryCopyWith<LeaveSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveSummaryCopyWith<$Res> {
  factory $LeaveSummaryCopyWith(
          LeaveSummary value, $Res Function(LeaveSummary) then) =
      _$LeaveSummaryCopyWithImpl<$Res, LeaveSummary>;
  @useResult
  $Res call(
      {int year,
      @JsonKey(name: 'total_quota') int totalQuota,
      @JsonKey(name: 'used_leave') int usedLeave,
      @JsonKey(name: 'remaining_leave') int remainingLeave,
      @JsonKey(name: 'pending_count') int pendingCount,
      @JsonKey(name: 'cashable_leave') int cashableLeave});
}

/// @nodoc
class _$LeaveSummaryCopyWithImpl<$Res, $Val extends LeaveSummary>
    implements $LeaveSummaryCopyWith<$Res> {
  _$LeaveSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? totalQuota = null,
    Object? usedLeave = null,
    Object? remainingLeave = null,
    Object? pendingCount = null,
    Object? cashableLeave = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuota: null == totalQuota
          ? _value.totalQuota
          : totalQuota // ignore: cast_nullable_to_non_nullable
              as int,
      usedLeave: null == usedLeave
          ? _value.usedLeave
          : usedLeave // ignore: cast_nullable_to_non_nullable
              as int,
      remainingLeave: null == remainingLeave
          ? _value.remainingLeave
          : remainingLeave // ignore: cast_nullable_to_non_nullable
              as int,
      pendingCount: null == pendingCount
          ? _value.pendingCount
          : pendingCount // ignore: cast_nullable_to_non_nullable
              as int,
      cashableLeave: null == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveSummaryImplCopyWith<$Res>
    implements $LeaveSummaryCopyWith<$Res> {
  factory _$$LeaveSummaryImplCopyWith(
          _$LeaveSummaryImpl value, $Res Function(_$LeaveSummaryImpl) then) =
      __$$LeaveSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int year,
      @JsonKey(name: 'total_quota') int totalQuota,
      @JsonKey(name: 'used_leave') int usedLeave,
      @JsonKey(name: 'remaining_leave') int remainingLeave,
      @JsonKey(name: 'pending_count') int pendingCount,
      @JsonKey(name: 'cashable_leave') int cashableLeave});
}

/// @nodoc
class __$$LeaveSummaryImplCopyWithImpl<$Res>
    extends _$LeaveSummaryCopyWithImpl<$Res, _$LeaveSummaryImpl>
    implements _$$LeaveSummaryImplCopyWith<$Res> {
  __$$LeaveSummaryImplCopyWithImpl(
      _$LeaveSummaryImpl _value, $Res Function(_$LeaveSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? totalQuota = null,
    Object? usedLeave = null,
    Object? remainingLeave = null,
    Object? pendingCount = null,
    Object? cashableLeave = null,
  }) {
    return _then(_$LeaveSummaryImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuota: null == totalQuota
          ? _value.totalQuota
          : totalQuota // ignore: cast_nullable_to_non_nullable
              as int,
      usedLeave: null == usedLeave
          ? _value.usedLeave
          : usedLeave // ignore: cast_nullable_to_non_nullable
              as int,
      remainingLeave: null == remainingLeave
          ? _value.remainingLeave
          : remainingLeave // ignore: cast_nullable_to_non_nullable
              as int,
      pendingCount: null == pendingCount
          ? _value.pendingCount
          : pendingCount // ignore: cast_nullable_to_non_nullable
              as int,
      cashableLeave: null == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveSummaryImpl implements _LeaveSummary {
  const _$LeaveSummaryImpl(
      {required this.year,
      @JsonKey(name: 'total_quota') this.totalQuota = 12,
      @JsonKey(name: 'used_leave') this.usedLeave = 0,
      @JsonKey(name: 'remaining_leave') this.remainingLeave = 12,
      @JsonKey(name: 'pending_count') this.pendingCount = 0,
      @JsonKey(name: 'cashable_leave') this.cashableLeave = 0});

  factory _$LeaveSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveSummaryImplFromJson(json);

  @override
  final int year;
  @override
  @JsonKey(name: 'total_quota')
  final int totalQuota;
  @override
  @JsonKey(name: 'used_leave')
  final int usedLeave;
  @override
  @JsonKey(name: 'remaining_leave')
  final int remainingLeave;
  @override
  @JsonKey(name: 'pending_count')
  final int pendingCount;
  @override
  @JsonKey(name: 'cashable_leave')
  final int cashableLeave;

  @override
  String toString() {
    return 'LeaveSummary(year: $year, totalQuota: $totalQuota, usedLeave: $usedLeave, remainingLeave: $remainingLeave, pendingCount: $pendingCount, cashableLeave: $cashableLeave)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveSummaryImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.totalQuota, totalQuota) ||
                other.totalQuota == totalQuota) &&
            (identical(other.usedLeave, usedLeave) ||
                other.usedLeave == usedLeave) &&
            (identical(other.remainingLeave, remainingLeave) ||
                other.remainingLeave == remainingLeave) &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount) &&
            (identical(other.cashableLeave, cashableLeave) ||
                other.cashableLeave == cashableLeave));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, year, totalQuota, usedLeave,
      remainingLeave, pendingCount, cashableLeave);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveSummaryImplCopyWith<_$LeaveSummaryImpl> get copyWith =>
      __$$LeaveSummaryImplCopyWithImpl<_$LeaveSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveSummaryImplToJson(
      this,
    );
  }
}

abstract class _LeaveSummary implements LeaveSummary {
  const factory _LeaveSummary(
          {required final int year,
          @JsonKey(name: 'total_quota') final int totalQuota,
          @JsonKey(name: 'used_leave') final int usedLeave,
          @JsonKey(name: 'remaining_leave') final int remainingLeave,
          @JsonKey(name: 'pending_count') final int pendingCount,
          @JsonKey(name: 'cashable_leave') final int cashableLeave}) =
      _$LeaveSummaryImpl;

  factory _LeaveSummary.fromJson(Map<String, dynamic> json) =
      _$LeaveSummaryImpl.fromJson;

  @override
  int get year;
  @override
  @JsonKey(name: 'total_quota')
  int get totalQuota;
  @override
  @JsonKey(name: 'used_leave')
  int get usedLeave;
  @override
  @JsonKey(name: 'remaining_leave')
  int get remainingLeave;
  @override
  @JsonKey(name: 'pending_count')
  int get pendingCount;
  @override
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave;
  @override
  @JsonKey(ignore: true)
  _$$LeaveSummaryImplCopyWith<_$LeaveSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedUserSchedule _$PaginatedUserScheduleFromJson(
    Map<String, dynamic> json) {
  return _PaginatedUserSchedule.fromJson(json);
}

/// @nodoc
mixin _$PaginatedUserSchedule {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month_name')
  String? get monthName => throw _privateConstructorUsedError;
  List<UserSchedule> get schedules => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedUserScheduleCopyWith<PaginatedUserSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedUserScheduleCopyWith<$Res> {
  factory $PaginatedUserScheduleCopyWith(PaginatedUserSchedule value,
          $Res Function(PaginatedUserSchedule) then) =
      _$PaginatedUserScheduleCopyWithImpl<$Res, PaginatedUserSchedule>;
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'month_name') String? monthName,
      List<UserSchedule> schedules,
      int total});
}

/// @nodoc
class _$PaginatedUserScheduleCopyWithImpl<$Res,
        $Val extends PaginatedUserSchedule>
    implements $PaginatedUserScheduleCopyWith<$Res> {
  _$PaginatedUserScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? monthName = freezed,
    Object? schedules = null,
    Object? total = null,
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
      monthName: freezed == monthName
          ? _value.monthName
          : monthName // ignore: cast_nullable_to_non_nullable
              as String?,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<UserSchedule>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedUserScheduleImplCopyWith<$Res>
    implements $PaginatedUserScheduleCopyWith<$Res> {
  factory _$$PaginatedUserScheduleImplCopyWith(
          _$PaginatedUserScheduleImpl value,
          $Res Function(_$PaginatedUserScheduleImpl) then) =
      __$$PaginatedUserScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'month_name') String? monthName,
      List<UserSchedule> schedules,
      int total});
}

/// @nodoc
class __$$PaginatedUserScheduleImplCopyWithImpl<$Res>
    extends _$PaginatedUserScheduleCopyWithImpl<$Res,
        _$PaginatedUserScheduleImpl>
    implements _$$PaginatedUserScheduleImplCopyWith<$Res> {
  __$$PaginatedUserScheduleImplCopyWithImpl(_$PaginatedUserScheduleImpl _value,
      $Res Function(_$PaginatedUserScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? monthName = freezed,
    Object? schedules = null,
    Object? total = null,
  }) {
    return _then(_$PaginatedUserScheduleImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      monthName: freezed == monthName
          ? _value.monthName
          : monthName // ignore: cast_nullable_to_non_nullable
              as String?,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<UserSchedule>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedUserScheduleImpl implements _PaginatedUserSchedule {
  const _$PaginatedUserScheduleImpl(
      {required this.month,
      required this.year,
      @JsonKey(name: 'month_name') this.monthName,
      required final List<UserSchedule> schedules,
      this.total = 0})
      : _schedules = schedules;

  factory _$PaginatedUserScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedUserScheduleImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'month_name')
  final String? monthName;
  final List<UserSchedule> _schedules;
  @override
  List<UserSchedule> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'PaginatedUserSchedule(month: $month, year: $year, monthName: $monthName, schedules: $schedules, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedUserScheduleImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.monthName, monthName) ||
                other.monthName == monthName) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, year, monthName,
      const DeepCollectionEquality().hash(_schedules), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedUserScheduleImplCopyWith<_$PaginatedUserScheduleImpl>
      get copyWith => __$$PaginatedUserScheduleImplCopyWithImpl<
          _$PaginatedUserScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedUserScheduleImplToJson(
      this,
    );
  }
}

abstract class _PaginatedUserSchedule implements PaginatedUserSchedule {
  const factory _PaginatedUserSchedule(
      {required final int month,
      required final int year,
      @JsonKey(name: 'month_name') final String? monthName,
      required final List<UserSchedule> schedules,
      final int total}) = _$PaginatedUserScheduleImpl;

  factory _PaginatedUserSchedule.fromJson(Map<String, dynamic> json) =
      _$PaginatedUserScheduleImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'month_name')
  String? get monthName;
  @override
  List<UserSchedule> get schedules;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedUserScheduleImplCopyWith<_$PaginatedUserScheduleImpl>
      get copyWith => throw _privateConstructorUsedError;
}
