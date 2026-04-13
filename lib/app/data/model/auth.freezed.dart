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

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return _AuthModel.fromJson(json);
}

/// @nodoc
mixin _$AuthModel {
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthModelCopyWith<AuthModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) then) =
      _$AuthModelCopyWithImpl<$Res, AuthModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res, $Val extends AuthModel>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthModelImplCopyWith<$Res>
    implements $AuthModelCopyWith<$Res> {
  factory _$$AuthModelImplCopyWith(
          _$AuthModelImpl value, $Res Function(_$AuthModelImpl) then) =
      __$$AuthModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthModelImplCopyWithImpl<$Res>
    extends _$AuthModelCopyWithImpl<$Res, _$AuthModelImpl>
    implements _$$AuthModelImplCopyWith<$Res> {
  __$$AuthModelImplCopyWithImpl(
      _$AuthModelImpl _value, $Res Function(_$AuthModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? tokenType = null,
    Object? user = freezed,
  }) {
    return _then(_$AuthModelImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthModelImpl implements _AuthModel {
  const _$AuthModelImpl(
      {@JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'token_type') this.tokenType = 'Bearer',
      this.user});

  factory _$AuthModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthModelImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'AuthModel(accessToken: $accessToken, tokenType: $tokenType, user: $user)';
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
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, tokenType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      __$$AuthModelImplCopyWithImpl<_$AuthModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthModelImplToJson(
      this,
    );
  }
}

abstract class _AuthModel implements AuthModel {
  const factory _AuthModel(
      {@JsonKey(name: 'access_token') final String? accessToken,
      @JsonKey(name: 'token_type') final String tokenType,
      final UserModel? user}) = _$AuthModelImpl;

  factory _AuthModel.fromJson(Map<String, dynamic> json) =
      _$AuthModelImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$AuthModelImplCopyWith<_$AuthModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
// Gunakan int? atau default yang masuk akal, jangan 0 jika id itu penting
  int? get id =>
      throw _privateConstructorUsedError; // Jangan beri default kosong jika kita ingin validasi data dari server
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl =>
      throw _privateConstructorUsedError; // Relasi Objek Position
  PositionModel? get position =>
      throw _privateConstructorUsedError; // Backup field position_name
  @JsonKey(name: 'position_name')
  String? get positionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'join_date')
  String? get joinDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'leave_quota')
  int? get leaveQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashable_leave')
  int? get cashableLeave =>
      throw _privateConstructorUsedError; // --- ONBOARDING STATUS PT IBM ---
  @JsonKey(name: 'is_default_password')
  bool get isDefaultPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_face_registered')
  bool get isFaceRegistered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? email,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'image_url') String? imageUrl,
      PositionModel? position,
      @JsonKey(name: 'position_name') String? positionName,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'leave_quota') int? leaveQuota,
      @JsonKey(name: 'cashable_leave') int? cashableLeave,
      @JsonKey(name: 'is_default_password') bool isDefaultPassword,
      @JsonKey(name: 'is_face_registered') bool isFaceRegistered});

  $PositionModelCopyWith<$Res>? get position;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

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
    Object? imageUrl = freezed,
    Object? position = freezed,
    Object? positionName = freezed,
    Object? joinDate = freezed,
    Object? leaveQuota = freezed,
    Object? cashableLeave = freezed,
    Object? isDefaultPassword = null,
    Object? isFaceRegistered = null,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveQuota: freezed == leaveQuota
          ? _value.leaveQuota
          : leaveQuota // ignore: cast_nullable_to_non_nullable
              as int?,
      cashableLeave: freezed == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $PositionModelCopyWith<$Res>? get position {
    if (_value.position == null) {
      return null;
    }

    return $PositionModelCopyWith<$Res>(_value.position!, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? email,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'image_url') String? imageUrl,
      PositionModel? position,
      @JsonKey(name: 'position_name') String? positionName,
      @JsonKey(name: 'join_date') String? joinDate,
      @JsonKey(name: 'leave_quota') int? leaveQuota,
      @JsonKey(name: 'cashable_leave') int? cashableLeave,
      @JsonKey(name: 'is_default_password') bool isDefaultPassword,
      @JsonKey(name: 'is_face_registered') bool isFaceRegistered});

  @override
  $PositionModelCopyWith<$Res>? get position;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? image = freezed,
    Object? imageUrl = freezed,
    Object? position = freezed,
    Object? positionName = freezed,
    Object? joinDate = freezed,
    Object? leaveQuota = freezed,
    Object? cashableLeave = freezed,
    Object? isDefaultPassword = null,
    Object? isFaceRegistered = null,
  }) {
    return _then(_$UserModelImpl(
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as PositionModel?,
      positionName: freezed == positionName
          ? _value.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
      leaveQuota: freezed == leaveQuota
          ? _value.leaveQuota
          : leaveQuota // ignore: cast_nullable_to_non_nullable
              as int?,
      cashableLeave: freezed == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.id,
      this.name,
      this.email,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'image_url') this.imageUrl,
      this.position,
      @JsonKey(name: 'position_name') this.positionName,
      @JsonKey(name: 'join_date') this.joinDate,
      @JsonKey(name: 'leave_quota') this.leaveQuota,
      @JsonKey(name: 'cashable_leave') this.cashableLeave,
      @JsonKey(name: 'is_default_password') this.isDefaultPassword = false,
      @JsonKey(name: 'is_face_registered') this.isFaceRegistered = false});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

// Gunakan int? atau default yang masuk akal, jangan 0 jika id itu penting
  @override
  final int? id;
// Jangan beri default kosong jika kita ingin validasi data dari server
  @override
  final String? name;
  @override
  final String? email;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
// Relasi Objek Position
  @override
  final PositionModel? position;
// Backup field position_name
  @override
  @JsonKey(name: 'position_name')
  final String? positionName;
  @override
  @JsonKey(name: 'join_date')
  final String? joinDate;
  @override
  @JsonKey(name: 'leave_quota')
  final int? leaveQuota;
  @override
  @JsonKey(name: 'cashable_leave')
  final int? cashableLeave;
// --- ONBOARDING STATUS PT IBM ---
  @override
  @JsonKey(name: 'is_default_password')
  final bool isDefaultPassword;
  @override
  @JsonKey(name: 'is_face_registered')
  final bool isFaceRegistered;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, image: $image, imageUrl: $imageUrl, position: $position, positionName: $positionName, joinDate: $joinDate, leaveQuota: $leaveQuota, cashableLeave: $cashableLeave, isDefaultPassword: $isDefaultPassword, isFaceRegistered: $isFaceRegistered)';
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
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.leaveQuota, leaveQuota) ||
                other.leaveQuota == leaveQuota) &&
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
      image,
      imageUrl,
      position,
      positionName,
      joinDate,
      leaveQuota,
      cashableLeave,
      isDefaultPassword,
      isFaceRegistered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {final int? id,
          final String? name,
          final String? email,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'image_url') final String? imageUrl,
          final PositionModel? position,
          @JsonKey(name: 'position_name') final String? positionName,
          @JsonKey(name: 'join_date') final String? joinDate,
          @JsonKey(name: 'leave_quota') final int? leaveQuota,
          @JsonKey(name: 'cashable_leave') final int? cashableLeave,
          @JsonKey(name: 'is_default_password') final bool isDefaultPassword,
          @JsonKey(name: 'is_face_registered') final bool isFaceRegistered}) =
      _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override // Gunakan int? atau default yang masuk akal, jangan 0 jika id itu penting
  int? get id;
  @override // Jangan beri default kosong jika kita ingin validasi data dari server
  String? get name;
  @override
  String? get email;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override // Relasi Objek Position
  PositionModel? get position;
  @override // Backup field position_name
  @JsonKey(name: 'position_name')
  String? get positionName;
  @override
  @JsonKey(name: 'join_date')
  String? get joinDate;
  @override
  @JsonKey(name: 'leave_quota')
  int? get leaveQuota;
  @override
  @JsonKey(name: 'cashable_leave')
  int? get cashableLeave;
  @override // --- ONBOARDING STATUS PT IBM ---
  @JsonKey(name: 'is_default_password')
  bool get isDefaultPassword;
  @override
  @JsonKey(name: 'is_face_registered')
  bool get isFaceRegistered;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PositionModel _$PositionModelFromJson(Map<String, dynamic> json) {
  return _PositionModel.fromJson(json);
}

/// @nodoc
mixin _$PositionModel {
  int? get id =>
      throw _privateConstructorUsedError; // Default 'Karyawan IBM' boleh tetap ada sebagai fallback UI
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionModelCopyWith<PositionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionModelCopyWith<$Res> {
  factory $PositionModelCopyWith(
          PositionModel value, $Res Function(PositionModel) then) =
      _$PositionModelCopyWithImpl<$Res, PositionModel>;
  @useResult
  $Res call({int? id, String name});
}

/// @nodoc
class _$PositionModelCopyWithImpl<$Res, $Val extends PositionModel>
    implements $PositionModelCopyWith<$Res> {
  _$PositionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionModelImplCopyWith<$Res>
    implements $PositionModelCopyWith<$Res> {
  factory _$$PositionModelImplCopyWith(
          _$PositionModelImpl value, $Res Function(_$PositionModelImpl) then) =
      __$$PositionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name});
}

/// @nodoc
class __$$PositionModelImplCopyWithImpl<$Res>
    extends _$PositionModelCopyWithImpl<$Res, _$PositionModelImpl>
    implements _$$PositionModelImplCopyWith<$Res> {
  __$$PositionModelImplCopyWithImpl(
      _$PositionModelImpl _value, $Res Function(_$PositionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
  }) {
    return _then(_$PositionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionModelImpl implements _PositionModel {
  const _$PositionModelImpl({this.id, this.name = 'Karyawan IBM'});

  factory _$PositionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionModelImplFromJson(json);

  @override
  final int? id;
// Default 'Karyawan IBM' boleh tetap ada sebagai fallback UI
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'PositionModel(id: $id, name: $name)';
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
  Map<String, dynamic> toJson() {
    return _$$PositionModelImplToJson(
      this,
    );
  }
}

abstract class _PositionModel implements PositionModel {
  const factory _PositionModel({final int? id, final String name}) =
      _$PositionModelImpl;

  factory _PositionModel.fromJson(Map<String, dynamic> json) =
      _$PositionModelImpl.fromJson;

  @override
  int? get id;
  @override // Default 'Karyawan IBM' boleh tetap ada sebagai fallback UI
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$PositionModelImplCopyWith<_$PositionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
