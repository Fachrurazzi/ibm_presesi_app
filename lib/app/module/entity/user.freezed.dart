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
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email =>
      throw _privateConstructorUsedError; // LOG API: Laravel mengirim 'image' berisi path file
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'leave_quota')
  int? get leaveQuota =>
      throw _privateConstructorUsedError; // LOG API: Laravel mengirim 'join_date' (tadi di log muncul sebagai ISO String)
  @JsonKey(name: 'join_date')
  String? get joinDate =>
      throw _privateConstructorUsedError; // TAMBAHAN PENTING: Sesuai log API kamu tadi
  @JsonKey(name: 'is_face_registered')
  bool? get isFaceRegistered => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_id')
  int? get positionId =>
      throw _privateConstructorUsedError; // Relasi ke Jabatan (Nested Object)
  PositionEntity? get position => throw _privateConstructorUsedError;

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
      {int? id,
      String? name,
      String? email,
      String? image,
      @JsonKey(name: 'leave_quota') int? leaveQuota,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'is_face_registered') bool? isFaceRegistered,
      @JsonKey(name: 'position_id') int? positionId,
      PositionEntity? position});

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
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? leaveQuota = freezed,
    Object? joinDate = freezed,
    Object? isFaceRegistered = freezed,
    Object? positionId = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveQuota: freezed == leaveQuota
          ? _value.leaveQuota
          : leaveQuota // ignore: cast_nullable_to_non_nullable
              as int?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isFaceRegistered: freezed == isFaceRegistered
          ? _value.isFaceRegistered
          : isFaceRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionEntity?,
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
      {int? id,
      String? name,
      String? email,
      String? image,
      @JsonKey(name: 'leave_quota') int? leaveQuota,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'is_face_registered') bool? isFaceRegistered,
      @JsonKey(name: 'position_id') int? positionId,
      PositionEntity? position});

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
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? leaveQuota = freezed,
    Object? joinDate = freezed,
    Object? isFaceRegistered = freezed,
    Object? positionId = freezed,
    Object? position = freezed,
  }) {
    return _then(_$UserEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveQuota: freezed == leaveQuota
          ? _value.leaveQuota
          : leaveQuota // ignore: cast_nullable_to_non_nullable
              as int?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isFaceRegistered: freezed == isFaceRegistered
          ? _value.isFaceRegistered
          : isFaceRegistered // ignore: cast_nullable_to_non_nullable
              as bool?,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl(
      {this.id,
      this.name,
      this.email,
      this.image,
      @JsonKey(name: 'leave_quota') this.leaveQuota,
      @JsonKey(name: 'join_date') this.joinDate,
      @JsonKey(name: 'is_face_registered') this.isFaceRegistered,
      @JsonKey(name: 'position_id') this.positionId,
      this.position});

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
// LOG API: Laravel mengirim 'image' berisi path file
  @override
  final String? image;
  @override
  @JsonKey(name: 'leave_quota')
  final int? leaveQuota;
// LOG API: Laravel mengirim 'join_date' (tadi di log muncul sebagai ISO String)
  @override
  @JsonKey(name: 'join_date')
  final String? joinDate;
// TAMBAHAN PENTING: Sesuai log API kamu tadi
  @override
  @JsonKey(name: 'is_face_registered')
  final bool? isFaceRegistered;
  @override
  @JsonKey(name: 'position_id')
  final int? positionId;
// Relasi ke Jabatan (Nested Object)
  @override
  final PositionEntity? position;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, image: $image, leaveQuota: $leaveQuota, joinDate: $joinDate, isFaceRegistered: $isFaceRegistered, positionId: $positionId, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.leaveQuota, leaveQuota) ||
                other.leaveQuota == leaveQuota) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.isFaceRegistered, isFaceRegistered) ||
                other.isFaceRegistered == isFaceRegistered) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, image,
      leaveQuota, joinDate, isFaceRegistered, positionId, position);

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

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {final int? id,
      final String? name,
      final String? email,
      final String? image,
      @JsonKey(name: 'leave_quota') final int? leaveQuota,
      @JsonKey(name: 'join_date') final String? joinDate,
      @JsonKey(name: 'is_face_registered') final bool? isFaceRegistered,
      @JsonKey(name: 'position_id') final int? positionId,
      final PositionEntity? position}) = _$UserEntityImpl;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override // LOG API: Laravel mengirim 'image' berisi path file
  String? get image;
  @override
  @JsonKey(name: 'leave_quota')
  int? get leaveQuota;
  @override // LOG API: Laravel mengirim 'join_date' (tadi di log muncul sebagai ISO String)
  @JsonKey(name: 'join_date')
  String? get joinDate;
  @override // TAMBAHAN PENTING: Sesuai log API kamu tadi
  @JsonKey(name: 'is_face_registered')
  bool? get isFaceRegistered;
  @override
  @JsonKey(name: 'position_id')
  int? get positionId;
  @override // Relasi ke Jabatan (Nested Object)
  PositionEntity? get position;
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
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

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
  $Res call({int? id, String? name});
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
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({int? id, String? name});
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
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$PositionEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionEntityImpl implements _PositionEntity {
  const _$PositionEntityImpl({this.id, this.name});

  factory _$PositionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

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
  const factory _PositionEntity({final int? id, final String? name}) =
      _$PositionEntityImpl;

  factory _PositionEntity.fromJson(Map<String, dynamic> json) =
      _$PositionEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
