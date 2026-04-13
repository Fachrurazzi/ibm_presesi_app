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
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Map<String, dynamic>? get position => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'id') String? id,
            String? email,
            String? password,
            String? name,
            Map<String, dynamic>? position,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'access_token') String? accessToken)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'id') String? id,
            String? email,
            String? password,
            String? name,
            Map<String, dynamic>? position,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'access_token') String? accessToken)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'id') String? id,
            String? email,
            String? password,
            String? name,
            Map<String, dynamic>? position,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'access_token') String? accessToken)?
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
      {@JsonKey(name: 'id') String? id,
      String? email,
      String? password,
      String? name,
      Map<String, dynamic>? position,
      @JsonKey(name: 'position_name') String? positionName,
      @JsonKey(name: 'is_default_password') bool isDefaultPassword,
      @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'access_token') String? accessToken});
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
    Object? id = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? position = freezed,
    Object? positionName = freezed,
    Object? isDefaultPassword = null,
    Object? isFaceRegistered = null,
    Object? imageUrl = null,
    Object? joinDate = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') String? id,
      String? email,
      String? password,
      String? name,
      Map<String, dynamic>? position,
      @JsonKey(name: 'position_name') String? positionName,
      @JsonKey(name: 'is_default_password') bool isDefaultPassword,
      @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'access_token') String? accessToken});
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
    Object? id = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? position = freezed,
    Object? positionName = freezed,
    Object? isDefaultPassword = null,
    Object? isFaceRegistered = null,
    Object? imageUrl = null,
    Object? joinDate = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_$AuthEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value._position
          : position // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthEntityImpl extends AuthEntity {
  const _$AuthEntityImpl(
      {@JsonKey(name: 'id') this.id,
      required this.email,
      required this.password,
      this.name,
      final Map<String, dynamic>? position,
      @JsonKey(name: 'position_name') this.positionName,
      @JsonKey(name: 'is_default_password') this.isDefaultPassword = false,
      @JsonKey(name: 'is_face_registered') this.isFaceRegistered = false,
      @JsonKey(name: 'image_url') this.imageUrl = '',
      @JsonKey(name: 'join_date') this.joinDate,
      @JsonKey(name: 'access_token') this.accessToken})
      : _position = position,
        super._();

  factory _$AuthEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthEntityImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? name;
  final Map<String, dynamic>? _position;
  @override
  Map<String, dynamic>? get position {
    final value = _position;
    if (value == null) return null;
    if (_position is EqualUnmodifiableMapView) return _position;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
  @JsonKey(name: 'access_token')
  final String? accessToken;

  @override
  String toString() {
    return 'Auth.entity(id: $id, email: $email, password: $password, name: $name, position: $position, positionName: $positionName, isDefaultPassword: $isDefaultPassword, isFaceRegistered: $isFaceRegistered, imageUrl: $imageUrl, joinDate: $joinDate, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._position, _position) &&
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
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      password,
      name,
      const DeepCollectionEquality().hash(_position),
      positionName,
      isDefaultPassword,
      isFaceRegistered,
      imageUrl,
      joinDate,
      accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthEntityImplCopyWith<_$AuthEntityImpl> get copyWith =>
      __$$AuthEntityImplCopyWithImpl<_$AuthEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'id') String? id,
            String? email,
            String? password,
            String? name,
            Map<String, dynamic>? position,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'access_token') String? accessToken)
        entity,
  }) {
    return entity(id, email, password, name, position, positionName,
        isDefaultPassword, isFaceRegistered, imageUrl, joinDate, accessToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'id') String? id,
            String? email,
            String? password,
            String? name,
            Map<String, dynamic>? position,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'access_token') String? accessToken)?
        entity,
  }) {
    return entity?.call(id, email, password, name, position, positionName,
        isDefaultPassword, isFaceRegistered, imageUrl, joinDate, accessToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'id') String? id,
            String? email,
            String? password,
            String? name,
            Map<String, dynamic>? position,
            @JsonKey(name: 'position_name') String? positionName,
            @JsonKey(name: 'is_default_password') bool isDefaultPassword,
            @JsonKey(name: 'is_face_registered') bool isFaceRegistered,
            @JsonKey(name: 'image_url') String imageUrl,
            @JsonKey(name: 'join_date') String? joinDate,
            @JsonKey(name: 'access_token') String? accessToken)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(id, email, password, name, position, positionName,
          isDefaultPassword, isFaceRegistered, imageUrl, joinDate, accessToken);
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
          {@JsonKey(name: 'id') final String? id,
          required final String? email,
          required final String? password,
          final String? name,
          final Map<String, dynamic>? position,
          @JsonKey(name: 'position_name') final String? positionName,
          @JsonKey(name: 'is_default_password') final bool isDefaultPassword,
          @JsonKey(name: 'is_face_registered') final bool isFaceRegistered,
          @JsonKey(name: 'image_url') final String imageUrl,
          @JsonKey(name: 'join_date') final String? joinDate,
          @JsonKey(name: 'access_token') final String? accessToken}) =
      _$AuthEntityImpl;
  const AuthEntity._() : super._();

  factory AuthEntity.fromJson(Map<String, dynamic> json) =
      _$AuthEntityImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get name;
  @override
  Map<String, dynamic>? get position;
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
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$AuthEntityImplCopyWith<_$AuthEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
