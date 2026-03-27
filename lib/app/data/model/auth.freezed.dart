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
  return AuthModel.fromJson(json);
}

/// @nodoc
mixin _$Auth {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType, UserModel user)
        model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType, UserModel user)?
        model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType, UserModel user)?
        model,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthModel value) model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthModel value)? model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthModel value)? model,
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
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      UserModel user});
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
    Object? accessToken = null,
    Object? tokenType = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthModelImplCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$$AuthModelImplCopyWith(
          _$AuthModelImpl value, $Res Function(_$AuthModelImpl) then) =
      __$$AuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      UserModel user});
}

/// @nodoc
class __$$AuthModelImplCopyWithImpl<$Res>
    extends _$AuthCopyWithImpl<$Res, _$AuthModelImpl>
    implements _$$AuthModelImplCopyWith<$Res> {
  __$$AuthModelImplCopyWithImpl(
      _$AuthModelImpl _value, $Res Function(_$AuthModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? user = freezed,
  }) {
    return _then(_$AuthModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthModelImpl implements AuthModel {
  _$AuthModelImpl(
      {@JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'token_type') required this.tokenType,
      required this.user});

  factory _$AuthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthModelImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'Auth.model(accessToken: $accessToken, tokenType: $tokenType, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, tokenType,
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      __$$AuthModelImplCopyWithImpl<_$AuthModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType, UserModel user)
        model,
  }) {
    return model(accessToken, tokenType, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType, UserModel user)?
        model,
  }) {
    return model?.call(accessToken, tokenType, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType, UserModel user)?
        model,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(accessToken, tokenType, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthModel value) model,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthModel value)? model,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthModel value)? model,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthModelImplToJson(
      this,
    );
  }
}

abstract class AuthModel implements Auth {
  factory AuthModel(
      {@JsonKey(name: 'access_token') required final String accessToken,
      @JsonKey(name: 'token_type') required final String tokenType,
      required final UserModel user}) = _$AuthModelImpl;

  factory AuthModel.fromJson(Map<String, dynamic> json) =
      _$AuthModelImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return UserModel.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  PositionModel? get position =>
      throw _privateConstructorUsedError; // Menggunakan objek Position
  @JsonKey(name: 'join_date')
  String get joinDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'leave_quota')
  int get leaveQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            PositionModel? position,
            @JsonKey(name: 'join_date') String joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'cashable_leave') int cashableLeave)
        model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            PositionModel? position,
            @JsonKey(name: 'join_date') String joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'cashable_leave') int cashableLeave)?
        model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            PositionModel? position,
            @JsonKey(name: 'join_date') String joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'cashable_leave') int cashableLeave)?
        model,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserModel value) model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserModel value)? model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserModel value)? model,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'image') String? image,
      PositionModel? position,
      @JsonKey(name: 'join_date') String joinDate,
      @JsonKey(name: 'leave_quota') int leaveQuota,
      @JsonKey(name: 'cashable_leave') int cashableLeave});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
    Object? position = freezed,
    Object? joinDate = null,
    Object? leaveQuota = null,
    Object? cashableLeave = null,
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
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
      leaveQuota: null == leaveQuota
          ? _value.leaveQuota
          : leaveQuota // ignore: cast_nullable_to_non_nullable
              as int,
      cashableLeave: null == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'image') String? image,
      PositionModel? position,
      @JsonKey(name: 'join_date') String joinDate,
      @JsonKey(name: 'leave_quota') int leaveQuota,
      @JsonKey(name: 'cashable_leave') int cashableLeave});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? image = freezed,
    Object? position = freezed,
    Object? joinDate = null,
    Object? leaveQuota = null,
    Object? cashableLeave = null,
  }) {
    return _then(_$UserModelImpl(
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
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String,
      leaveQuota: null == leaveQuota
          ? _value.leaveQuota
          : leaveQuota // ignore: cast_nullable_to_non_nullable
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
class _$UserModelImpl implements UserModel {
  _$UserModelImpl(
      {required this.id,
      required this.name,
      required this.email,
      @JsonKey(name: 'image') this.image,
      required this.position,
      @JsonKey(name: 'join_date') required this.joinDate,
      @JsonKey(name: 'leave_quota') required this.leaveQuota,
      @JsonKey(name: 'cashable_leave') required this.cashableLeave});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  final PositionModel? position;
// Menggunakan objek Position
  @override
  @JsonKey(name: 'join_date')
  final String joinDate;
  @override
  @JsonKey(name: 'leave_quota')
  final int leaveQuota;
  @override
  @JsonKey(name: 'cashable_leave')
  final int cashableLeave;

  @override
  String toString() {
    return 'User.model(id: $id, name: $name, email: $email, image: $image, position: $position, joinDate: $joinDate, leaveQuota: $leaveQuota, cashableLeave: $cashableLeave)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.leaveQuota, leaveQuota) ||
                other.leaveQuota == leaveQuota) &&
            (identical(other.cashableLeave, cashableLeave) ||
                other.cashableLeave == cashableLeave));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      image,
      const DeepCollectionEquality().hash(position),
      joinDate,
      leaveQuota,
      cashableLeave);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            PositionModel? position,
            @JsonKey(name: 'join_date') String joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'cashable_leave') int cashableLeave)
        model,
  }) {
    return model(
        id, name, email, image, position, joinDate, leaveQuota, cashableLeave);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            PositionModel? position,
            @JsonKey(name: 'join_date') String joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'cashable_leave') int cashableLeave)?
        model,
  }) {
    return model?.call(
        id, name, email, image, position, joinDate, leaveQuota, cashableLeave);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String name,
            String email,
            @JsonKey(name: 'image') String? image,
            PositionModel? position,
            @JsonKey(name: 'join_date') String joinDate,
            @JsonKey(name: 'leave_quota') int leaveQuota,
            @JsonKey(name: 'cashable_leave') int cashableLeave)?
        model,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(id, name, email, image, position, joinDate, leaveQuota,
          cashableLeave);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserModel value) model,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserModel value)? model,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserModel value)? model,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class UserModel implements User {
  factory UserModel(
          {required final int id,
          required final String name,
          required final String email,
          @JsonKey(name: 'image') final String? image,
          required final PositionModel? position,
          @JsonKey(name: 'join_date') required final String joinDate,
          @JsonKey(name: 'leave_quota') required final int leaveQuota,
          @JsonKey(name: 'cashable_leave') required final int cashableLeave}) =
      _$UserModelImpl;

  factory UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

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
  PositionModel? get position;
  @override // Menggunakan objek Position
  @JsonKey(name: 'join_date')
  String get joinDate;
  @override
  @JsonKey(name: 'leave_quota')
  int get leaveQuota;
  @override
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Position _$PositionFromJson(Map<String, dynamic> json) {
  return PositionModel.fromJson(json);
}

/// @nodoc
mixin _$Position {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String name) model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name)? model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name)? model,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PositionModel value) model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PositionModel value)? model,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PositionModel value)? model,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionCopyWith<Position> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res, Position>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$PositionCopyWithImpl<$Res, $Val extends Position>
    implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

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
abstract class _$$PositionModelImplCopyWith<$Res>
    implements $PositionCopyWith<$Res> {
  factory _$$PositionModelImplCopyWith(
          _$PositionModelImpl value, $Res Function(_$PositionModelImpl) then) =
      __$$PositionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$PositionModelImplCopyWithImpl<$Res>
    extends _$PositionCopyWithImpl<$Res, _$PositionModelImpl>
    implements _$$PositionModelImplCopyWith<$Res> {
  __$$PositionModelImplCopyWithImpl(
      _$PositionModelImpl _value, $Res Function(_$PositionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$PositionModelImpl(
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
class _$PositionModelImpl implements PositionModel {
  _$PositionModelImpl({required this.id, required this.name});

  factory _$PositionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Position.model(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionModelImplCopyWith<_$PositionModelImpl> get copyWith =>
      __$$PositionModelImplCopyWithImpl<_$PositionModelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, String name) model,
  }) {
    return model(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, String name)? model,
  }) {
    return model?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, String name)? model,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PositionModel value) model,
  }) {
    return model(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PositionModel value)? model,
  }) {
    return model?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PositionModel value)? model,
    required TResult orElse(),
  }) {
    if (model != null) {
      return model(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionModelImplToJson(
      this,
    );
  }
}

abstract class PositionModel implements Position {
  factory PositionModel({required final int id, required final String name}) =
      _$PositionModelImpl;

  factory PositionModel.fromJson(Map<String, dynamic> json) =
      _$PositionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$PositionModelImplCopyWith<_$PositionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
