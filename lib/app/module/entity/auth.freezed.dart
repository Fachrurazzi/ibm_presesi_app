// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return AuthEntity.fromJson(json);
}

/// @nodoc
mixin _$Auth {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_id')
  int? get positionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'position_name')
  String? get positionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default_password')
  bool get isDefaultPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_face_registered')
  bool get isFaceRegistered => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'join_date')
  String? get joinDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'leave_quota')
  int get leaveQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_leave')
  int get remainingLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<String> get roles => throw _privateConstructorUsedError;
  @JsonKey(name: 'permissions')
  List<String> get permissions => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String email,
            String name,
            @JsonKey(name: 'position_id') int? positionId,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'remaining_leave') int remainingLeave,
            @JsonKey(name: 'cashable_leave') int cashableLeave,
            @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
            @JsonKey(name: 'access_token') String? accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'roles') List<String> roles,
            @JsonKey(name: 'permissions') List<String> permissions)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String email,
            String name,
            @JsonKey(name: 'position_id') int? positionId,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'remaining_leave') int remainingLeave,
            @JsonKey(name: 'cashable_leave') int cashableLeave,
            @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
            @JsonKey(name: 'access_token') String? accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'roles') List<String> roles,
            @JsonKey(name: 'permissions') List<String> permissions)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String email,
            String name,
            @JsonKey(name: 'position_id') int? positionId,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'remaining_leave') int remainingLeave,
            @JsonKey(name: 'cashable_leave') int cashableLeave,
            @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
            @JsonKey(name: 'access_token') String? accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'roles') List<String> roles,
            @JsonKey(name: 'permissions') List<String> permissions)?
        entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthCopyWith<Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res, Auth>;
  @useResult
  $Res call(
      {int id,
      String email,
      String name,
      @JsonKey(name: 'position_id') int? positionId,
      @JsonKey(name: 'position_name') String? positionName,
      @JsonKey(name: 'is_default_password') bool isDefaultPassword,
      @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'leave_quota') int leaveQuota,
      @JsonKey(name: 'remaining_leave') int remainingLeave,
      @JsonKey(name: 'cashable_leave') int cashableLeave,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'roles') List<String> roles,
      @JsonKey(name: 'permissions') List<String> permissions});
}

/// @nodoc
class _$AuthCopyWithImpl<$Res, $Val extends Auth>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? positionId = freezed,
    Object? positionName = freezed,
    Object? isDefaultPassword = null,
    Object? isFaceRegistered = null,
    Object? imageUrl = null,
    Object? joinDate = freezed,
    Object? leaveQuota = null,
    Object? remainingLeave = null,
    Object? cashableLeave = null,
    Object? emailVerifiedAt = freezed,
    Object? accessToken = freezed,
    Object? tokenType = null,
    Object? roles = null,
    Object? permissions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefaultPassword: null == isDefaultPassword
          ? _value.isDefaultPassword
          : isDefaultPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isFaceRegistered: null == isFaceRegistered
          ? _value.isFaceRegistered
          : isFaceRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthEntityImplCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$$AuthEntityImplCopyWith(
          _$AuthEntityImpl value, $Res Function(_$AuthEntityImpl) then) =
      __$$AuthEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String name,
      @JsonKey(name: 'position_id') int? positionId,
      @JsonKey(name: 'position_name') String? positionName,
      @JsonKey(name: 'is_default_password') bool isDefaultPassword,
      @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'leave_quota') int leaveQuota,
      @JsonKey(name: 'remaining_leave') int remainingLeave,
      @JsonKey(name: 'cashable_leave') int cashableLeave,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'roles') List<String> roles,
      @JsonKey(name: 'permissions') List<String> permissions});
}

/// @nodoc
class __$$AuthEntityImplCopyWithImpl<$Res>
    extends _$AuthCopyWithImpl<$Res, _$AuthEntityImpl>
    implements _$$AuthEntityImplCopyWith<$Res> {
  __$$AuthEntityImplCopyWithImpl(
      _$AuthEntityImpl _value, $Res Function(_$AuthEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? positionId = freezed,
    Object? positionName = freezed,
    Object? isDefaultPassword = null,
    Object? isFaceRegistered = null,
    Object? imageUrl = null,
    Object? joinDate = freezed,
    Object? leaveQuota = null,
    Object? remainingLeave = null,
    Object? cashableLeave = null,
    Object? emailVerifiedAt = freezed,
    Object? accessToken = freezed,
    Object? tokenType = null,
    Object? roles = null,
    Object? permissions = null,
  }) {
    return _then(_$AuthEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefaultPassword: null == isDefaultPassword
          ? _value.isDefaultPassword
          : isDefaultPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isFaceRegistered: null == isFaceRegistered
          ? _value.isFaceRegistered
          : isFaceRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthEntityImpl extends AuthEntity {
  const _$AuthEntityImpl(
      {required this.id,
      required this.email,
      required this.name,
      @JsonKey(name: 'position_id') this.positionId,
      @JsonKey(name: 'position_name') this.positionName,
      @JsonKey(name: 'is_default_password') this.isDefaultPassword = false,
      @JsonKey(name: 'is_face_registered') this.isFaceRegistered = false,
      @JsonKey(name: 'image_url') this.imageUrl = '',
      @JsonKey(name: 'join_date') this.joinDate,
      @JsonKey(name: 'leave_quota') this.leaveQuota = 12,
      @JsonKey(name: 'remaining_leave') this.remainingLeave = 12,
      @JsonKey(name: 'cashable_leave') this.cashableLeave = 0,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'token_type') this.tokenType = 'Bearer',
      @JsonKey(name: 'roles') final List<String> roles = const [],
      @JsonKey(name: 'permissions') final List<String> permissions = const []})
      : _roles = roles,
        _permissions = permissions,
        super._();

  factory _$AuthEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  @JsonKey(name: 'position_id')
  final int? positionId;
  @override
  @JsonKey(name: 'position_name')
  final String? positionName;
  @override
  @JsonKey(name: 'is_default_password')
  final bool isDefaultPassword;
  @override
  @JsonKey(name: 'is_face_registered')
  final bool isFaceRegistered;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
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
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  final List<String> _roles;
  @override
  @JsonKey(name: 'roles')
  List<String> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  final List<String> _permissions;
  @override
  @JsonKey(name: 'permissions')
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'Auth.entity(id: $id, email: $email, name: $name, positionId: $positionId, positionName: $positionName, isDefaultPassword: $isDefaultPassword, isFaceRegistered: $isFaceRegistered, imageUrl: $imageUrl, joinDate: $joinDate, leaveQuota: $leaveQuota, remainingLeave: $remainingLeave, cashableLeave: $cashableLeave, emailVerifiedAt: $emailVerifiedAt, accessToken: $accessToken, tokenType: $tokenType, roles: $roles, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.isDefaultPassword, isDefaultPassword) ||
                other.isDefaultPassword == isDefaultPassword) &&
            (identical(other.isFaceRegistered, isFaceRegistered) ||
                other.isFaceRegistered == isFaceRegistered) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.leaveQuota, leaveQuota) ||
                other.leaveQuota == leaveQuota) &&
            (identical(other.remainingLeave, remainingLeave) ||
                other.remainingLeave == remainingLeave) &&
            (identical(other.cashableLeave, cashableLeave) ||
                other.cashableLeave == cashableLeave) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      name,
      positionId,
      positionName,
      isDefaultPassword,
      isFaceRegistered,
      imageUrl,
      joinDate,
      leaveQuota,
      remainingLeave,
      cashableLeave,
      emailVerifiedAt,
      accessToken,
      tokenType,
      const DeepCollectionEquality().hash(_roles),
      const DeepCollectionEquality().hash(_permissions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEntityImplCopyWith<_$AuthEntityImpl> get copyWith =>
      __$$AuthEntityImplCopyWithImpl<_$AuthEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String email,
            String name,
            @JsonKey(name: 'position_id') int? positionId,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'remaining_leave') int remainingLeave,
            @JsonKey(name: 'cashable_leave') int cashableLeave,
            @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
            @JsonKey(name: 'access_token') String? accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'roles') List<String> roles,
            @JsonKey(name: 'permissions') List<String> permissions)
        entity,
  }) {
    return entity(
        id,
        email,
        name,
        positionId,
        positionName,
        isDefaultPassword,
        isFaceRegistered,
        imageUrl,
        joinDate,
        leaveQuota,
        remainingLeave,
        cashableLeave,
        emailVerifiedAt,
        accessToken,
        tokenType,
        roles,
        permissions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String email,
            String name,
            @JsonKey(name: 'position_id') int? positionId,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'remaining_leave') int remainingLeave,
            @JsonKey(name: 'cashable_leave') int cashableLeave,
            @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
            @JsonKey(name: 'access_token') String? accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'roles') List<String> roles,
            @JsonKey(name: 'permissions') List<String> permissions)?
        entity,
  }) {
    return entity?.call(
        id,
        email,
        name,
        positionId,
        positionName,
        isDefaultPassword,
        isFaceRegistered,
        imageUrl,
        joinDate,
        leaveQuota,
        remainingLeave,
        cashableLeave,
        emailVerifiedAt,
        accessToken,
        tokenType,
        roles,
        permissions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String email,
            String name,
            @JsonKey(name: 'position_id') int? positionId,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'remaining_leave') int remainingLeave,
            @JsonKey(name: 'cashable_leave') int cashableLeave,
            @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
            @JsonKey(name: 'access_token') String? accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'roles') List<String> roles,
            @JsonKey(name: 'permissions') List<String> permissions)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(
          id,
          email,
          name,
          positionId,
          positionName,
          isDefaultPassword,
          isFaceRegistered,
          imageUrl,
          joinDate,
          leaveQuota,
          remainingLeave,
          cashableLeave,
          emailVerifiedAt,
          accessToken,
          tokenType,
          roles,
          permissions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthEntityImplToJson(
      this,
    );
  }
}

abstract class AuthEntity extends Auth {
  const factory AuthEntity(
          {required final int id,
          required final String email,
          required final String name,
          @JsonKey(name: 'position_id') final int? positionId,
          @JsonKey(name: 'position_name') final String? positionName,
          @JsonKey(name: 'is_default_password') final bool isDefaultPassword,
          @JsonKey(name: 'is_face_registered') final bool isFaceRegistered,
          @JsonKey(name: 'image_url') final String imageUrl,
          @JsonKey(name: 'join_date') final String? joinDate,
          @JsonKey(name: 'leave_quota') final int leaveQuota,
          @JsonKey(name: 'remaining_leave') final int remainingLeave,
          @JsonKey(name: 'cashable_leave') final int cashableLeave,
          @JsonKey(name: 'email_verified_at') final String? emailVerifiedAt,
          @JsonKey(name: 'access_token') final String? accessToken,
          @JsonKey(name: 'token_type') final String tokenType,
          @JsonKey(name: 'roles') final List<String> roles,
          @JsonKey(name: 'permissions') final List<String> permissions}) =
      _$AuthEntityImpl;
  const AuthEntity._() : super._();

  factory AuthEntity.fromJson(Map<String, dynamic> json) =
      _$AuthEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get name;
  @override
  @JsonKey(name: 'position_id')
  int? get positionId;
  @override
  @JsonKey(name: 'position_name')
  String? get positionName;
  @override
  @JsonKey(name: 'is_default_password')
  bool get isDefaultPassword;
  @override
  @JsonKey(name: 'is_face_registered')
  bool get isFaceRegistered;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
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
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt;
  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @JsonKey(name: 'roles')
  List<String> get roles;
  @override
  @JsonKey(name: 'permissions')
  List<String> get permissions;
  @override
  @JsonKey(ignore: true)
  _$$AuthEntityImplCopyWith<_$AuthEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
