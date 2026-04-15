// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return ProfileEntity.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;

  /// Format: YYYY-MM-DD dari Laravel
  @JsonKey(name: 'join_date')
  String get joinDate => throw _privateConstructorUsedError;

  /// REVISI: Menggunakan PositionEntity agar sinkron dengan struktur JSON
  /// JSON: "position": { "id": 1, "name": "Admin" }
  PositionEntity? get position => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            @JsonKey(name: 'join_date') String joinDate,
            PositionEntity? position)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            @JsonKey(name: 'join_date') String joinDate,
            PositionEntity? position)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            @JsonKey(name: 'join_date') String joinDate,
            PositionEntity? position)?
        entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'join_date') String joinDate,
      PositionEntity? position});

  $PositionEntityCopyWith<$Res>? get position;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

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
    Object? image = freezed,
    Object? joinDate = null,
    Object? position = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$ProfileEntityImplCopyWith<$Res>
    implements $ProfileCopyWith<$Res> {
  factory _$$ProfileEntityImplCopyWith(
          _$ProfileEntityImpl value, $Res Function(_$ProfileEntityImpl) then) =
      __$$ProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'join_date') String joinDate,
      PositionEntity? position});

  @override
  $PositionEntityCopyWith<$Res>? get position;
}

/// @nodoc
class __$$ProfileEntityImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileEntityImpl>
    implements _$$ProfileEntityImplCopyWith<$Res> {
  __$$ProfileEntityImplCopyWithImpl(
      _$ProfileEntityImpl _value, $Res Function(_$ProfileEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? image = freezed,
    Object? joinDate = null,
    Object? position = freezed,
  }) {
    return _then(_$ProfileEntityImpl(
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileEntityImpl implements ProfileEntity {
  const _$ProfileEntityImpl(
      {this.id = 0,
      this.name = "Karyawan IBM",
      this.email = "",
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'join_date') this.joinDate = "-",
      this.position});

  factory _$ProfileEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileEntityImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey(name: 'image')
  final String? image;

  /// Format: YYYY-MM-DD dari Laravel
  @override
  @JsonKey(name: 'join_date')
  final String joinDate;

  /// REVISI: Menggunakan PositionEntity agar sinkron dengan struktur JSON
  /// JSON: "position": { "id": 1, "name": "Admin" }
  @override
  final PositionEntity? position;

  @override
  String toString() {
    return 'Profile.entity(id: $id, name: $name, email: $email, image: $image, joinDate: $joinDate, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, image, joinDate, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      __$$ProfileEntityImplCopyWithImpl<_$ProfileEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            @JsonKey(name: 'join_date') String joinDate,
            PositionEntity? position)
        entity,
  }) {
    return entity(id, name, email, image, joinDate, position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            @JsonKey(name: 'join_date') String joinDate,
            PositionEntity? position)?
        entity,
  }) {
    return entity?.call(id, name, email, image, joinDate, position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            @JsonKey(name: 'join_date') String joinDate,
            PositionEntity? position)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(id, name, email, image, joinDate, position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileEntityImplToJson(
      this,
    );
  }
}

abstract class ProfileEntity implements Profile {
  const factory ProfileEntity(
      {final int id,
      final String name,
      final String email,
      @JsonKey(name: 'image') final String? image,
      @JsonKey(name: 'join_date') final String joinDate,
      final PositionEntity? position}) = _$ProfileEntityImpl;

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =
      _$ProfileEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override

  /// Format: YYYY-MM-DD dari Laravel
  @JsonKey(name: 'join_date')
  String get joinDate;
  @override

  /// REVISI: Menggunakan PositionEntity agar sinkron dengan struktur JSON
  /// JSON: "position": { "id": 1, "name": "Admin" }
  PositionEntity? get position;
  @override
  @JsonKey(ignore: true)
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
