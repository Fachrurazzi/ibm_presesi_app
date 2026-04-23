// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionRequest _$PermissionRequestFromJson(Map<String, dynamic> json) {
  return _PermissionRequest.fromJson(json);
}

/// @nodoc
mixin _$PermissionRequest {
  String get type => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionRequestCopyWith<PermissionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionRequestCopyWith<$Res> {
  factory $PermissionRequestCopyWith(
          PermissionRequest value, $Res Function(PermissionRequest) then) =
      _$PermissionRequestCopyWithImpl<$Res, PermissionRequest>;
  @useResult
  $Res call({String type, String date, String reason});
}

/// @nodoc
class _$PermissionRequestCopyWithImpl<$Res, $Val extends PermissionRequest>
    implements $PermissionRequestCopyWith<$Res> {
  _$PermissionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? date = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionRequestImplCopyWith<$Res>
    implements $PermissionRequestCopyWith<$Res> {
  factory _$$PermissionRequestImplCopyWith(_$PermissionRequestImpl value,
          $Res Function(_$PermissionRequestImpl) then) =
      __$$PermissionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String date, String reason});
}

/// @nodoc
class __$$PermissionRequestImplCopyWithImpl<$Res>
    extends _$PermissionRequestCopyWithImpl<$Res, _$PermissionRequestImpl>
    implements _$$PermissionRequestImplCopyWith<$Res> {
  __$$PermissionRequestImplCopyWithImpl(_$PermissionRequestImpl _value,
      $Res Function(_$PermissionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? date = null,
    Object? reason = null,
  }) {
    return _then(_$PermissionRequestImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionRequestImpl implements _PermissionRequest {
  const _$PermissionRequestImpl(
      {required this.type, required this.date, required this.reason});

  factory _$PermissionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionRequestImplFromJson(json);

  @override
  final String type;
  @override
  final String date;
  @override
  final String reason;

  @override
  String toString() {
    return 'PermissionRequest(type: $type, date: $date, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionRequestImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, date, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionRequestImplCopyWith<_$PermissionRequestImpl> get copyWith =>
      __$$PermissionRequestImplCopyWithImpl<_$PermissionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionRequestImplToJson(
      this,
    );
  }
}

abstract class _PermissionRequest implements PermissionRequest {
  const factory _PermissionRequest(
      {required final String type,
      required final String date,
      required final String reason}) = _$PermissionRequestImpl;

  factory _PermissionRequest.fromJson(Map<String, dynamic> json) =
      _$PermissionRequestImpl.fromJson;

  @override
  String get type;
  @override
  String get date;
  @override
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$PermissionRequestImplCopyWith<_$PermissionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PermissionResponse _$PermissionResponseFromJson(Map<String, dynamic> json) {
  return _PermissionResponse.fromJson(json);
}

/// @nodoc
mixin _$PermissionResponse {
  PermissionEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionResponseCopyWith<PermissionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionResponseCopyWith<$Res> {
  factory $PermissionResponseCopyWith(
          PermissionResponse value, $Res Function(PermissionResponse) then) =
      _$PermissionResponseCopyWithImpl<$Res, PermissionResponse>;
  @useResult
  $Res call({PermissionEntity data});

  $PermissionEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$PermissionResponseCopyWithImpl<$Res, $Val extends PermissionResponse>
    implements $PermissionResponseCopyWith<$Res> {
  _$PermissionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PermissionEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionEntityCopyWith<$Res> get data {
    return $PermissionEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermissionResponseImplCopyWith<$Res>
    implements $PermissionResponseCopyWith<$Res> {
  factory _$$PermissionResponseImplCopyWith(_$PermissionResponseImpl value,
          $Res Function(_$PermissionResponseImpl) then) =
      __$$PermissionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PermissionEntity data});

  @override
  $PermissionEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$PermissionResponseImplCopyWithImpl<$Res>
    extends _$PermissionResponseCopyWithImpl<$Res, _$PermissionResponseImpl>
    implements _$$PermissionResponseImplCopyWith<$Res> {
  __$$PermissionResponseImplCopyWithImpl(_$PermissionResponseImpl _value,
      $Res Function(_$PermissionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PermissionResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PermissionEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionResponseImpl implements _PermissionResponse {
  const _$PermissionResponseImpl({required this.data});

  factory _$PermissionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionResponseImplFromJson(json);

  @override
  final PermissionEntity data;

  @override
  String toString() {
    return 'PermissionResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionResponseImplCopyWith<_$PermissionResponseImpl> get copyWith =>
      __$$PermissionResponseImplCopyWithImpl<_$PermissionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionResponseImplToJson(
      this,
    );
  }
}

abstract class _PermissionResponse implements PermissionResponse {
  const factory _PermissionResponse({required final PermissionEntity data}) =
      _$PermissionResponseImpl;

  factory _PermissionResponse.fromJson(Map<String, dynamic> json) =
      _$PermissionResponseImpl.fromJson;

  @override
  PermissionEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$PermissionResponseImplCopyWith<_$PermissionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedPermissionResponse _$PaginatedPermissionResponseFromJson(
    Map<String, dynamic> json) {
  return _PaginatedPermissionResponse.fromJson(json);
}

/// @nodoc
mixin _$PaginatedPermissionResponse {
  List<PermissionEntity> get data => throw _privateConstructorUsedError;
  PermissionPaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedPermissionResponseCopyWith<PaginatedPermissionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedPermissionResponseCopyWith<$Res> {
  factory $PaginatedPermissionResponseCopyWith(
          PaginatedPermissionResponse value,
          $Res Function(PaginatedPermissionResponse) then) =
      _$PaginatedPermissionResponseCopyWithImpl<$Res,
          PaginatedPermissionResponse>;
  @useResult
  $Res call({List<PermissionEntity> data, PermissionPaginationMeta meta});

  $PermissionPaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedPermissionResponseCopyWithImpl<$Res,
        $Val extends PaginatedPermissionResponse>
    implements $PaginatedPermissionResponseCopyWith<$Res> {
  _$PaginatedPermissionResponseCopyWithImpl(this._value, this._then);

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
              as List<PermissionEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PermissionPaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionPaginationMetaCopyWith<$Res> get meta {
    return $PermissionPaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedPermissionResponseImplCopyWith<$Res>
    implements $PaginatedPermissionResponseCopyWith<$Res> {
  factory _$$PaginatedPermissionResponseImplCopyWith(
          _$PaginatedPermissionResponseImpl value,
          $Res Function(_$PaginatedPermissionResponseImpl) then) =
      __$$PaginatedPermissionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PermissionEntity> data, PermissionPaginationMeta meta});

  @override
  $PermissionPaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedPermissionResponseImplCopyWithImpl<$Res>
    extends _$PaginatedPermissionResponseCopyWithImpl<$Res,
        _$PaginatedPermissionResponseImpl>
    implements _$$PaginatedPermissionResponseImplCopyWith<$Res> {
  __$$PaginatedPermissionResponseImplCopyWithImpl(
      _$PaginatedPermissionResponseImpl _value,
      $Res Function(_$PaginatedPermissionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedPermissionResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PermissionEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PermissionPaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedPermissionResponseImpl
    implements _PaginatedPermissionResponse {
  const _$PaginatedPermissionResponseImpl(
      {required final List<PermissionEntity> data, required this.meta})
      : _data = data;

  factory _$PaginatedPermissionResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedPermissionResponseImplFromJson(json);

  final List<PermissionEntity> _data;
  @override
  List<PermissionEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PermissionPaginationMeta meta;

  @override
  String toString() {
    return 'PaginatedPermissionResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedPermissionResponseImpl &&
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
  _$$PaginatedPermissionResponseImplCopyWith<_$PaginatedPermissionResponseImpl>
      get copyWith => __$$PaginatedPermissionResponseImplCopyWithImpl<
          _$PaginatedPermissionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedPermissionResponseImplToJson(
      this,
    );
  }
}

abstract class _PaginatedPermissionResponse
    implements PaginatedPermissionResponse {
  const factory _PaginatedPermissionResponse(
          {required final List<PermissionEntity> data,
          required final PermissionPaginationMeta meta}) =
      _$PaginatedPermissionResponseImpl;

  factory _PaginatedPermissionResponse.fromJson(Map<String, dynamic> json) =
      _$PaginatedPermissionResponseImpl.fromJson;

  @override
  List<PermissionEntity> get data;
  @override
  PermissionPaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedPermissionResponseImplCopyWith<_$PaginatedPermissionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PermissionTypesResponse _$PermissionTypesResponseFromJson(
    Map<String, dynamic> json) {
  return _PermissionTypesResponse.fromJson(json);
}

/// @nodoc
mixin _$PermissionTypesResponse {
  List<PermissionType> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionTypesResponseCopyWith<PermissionTypesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionTypesResponseCopyWith<$Res> {
  factory $PermissionTypesResponseCopyWith(PermissionTypesResponse value,
          $Res Function(PermissionTypesResponse) then) =
      _$PermissionTypesResponseCopyWithImpl<$Res, PermissionTypesResponse>;
  @useResult
  $Res call({List<PermissionType> data});
}

/// @nodoc
class _$PermissionTypesResponseCopyWithImpl<$Res,
        $Val extends PermissionTypesResponse>
    implements $PermissionTypesResponseCopyWith<$Res> {
  _$PermissionTypesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PermissionType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionTypesResponseImplCopyWith<$Res>
    implements $PermissionTypesResponseCopyWith<$Res> {
  factory _$$PermissionTypesResponseImplCopyWith(
          _$PermissionTypesResponseImpl value,
          $Res Function(_$PermissionTypesResponseImpl) then) =
      __$$PermissionTypesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PermissionType> data});
}

/// @nodoc
class __$$PermissionTypesResponseImplCopyWithImpl<$Res>
    extends _$PermissionTypesResponseCopyWithImpl<$Res,
        _$PermissionTypesResponseImpl>
    implements _$$PermissionTypesResponseImplCopyWith<$Res> {
  __$$PermissionTypesResponseImplCopyWithImpl(
      _$PermissionTypesResponseImpl _value,
      $Res Function(_$PermissionTypesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PermissionTypesResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PermissionType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionTypesResponseImpl implements _PermissionTypesResponse {
  const _$PermissionTypesResponseImpl(
      {required final List<PermissionType> data})
      : _data = data;

  factory _$PermissionTypesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionTypesResponseImplFromJson(json);

  final List<PermissionType> _data;
  @override
  List<PermissionType> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PermissionTypesResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionTypesResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionTypesResponseImplCopyWith<_$PermissionTypesResponseImpl>
      get copyWith => __$$PermissionTypesResponseImplCopyWithImpl<
          _$PermissionTypesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionTypesResponseImplToJson(
      this,
    );
  }
}

abstract class _PermissionTypesResponse implements PermissionTypesResponse {
  const factory _PermissionTypesResponse(
          {required final List<PermissionType> data}) =
      _$PermissionTypesResponseImpl;

  factory _PermissionTypesResponse.fromJson(Map<String, dynamic> json) =
      _$PermissionTypesResponseImpl.fromJson;

  @override
  List<PermissionType> get data;
  @override
  @JsonKey(ignore: true)
  _$$PermissionTypesResponseImplCopyWith<_$PermissionTypesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PermissionCheckResponse _$PermissionCheckResponseFromJson(
    Map<String, dynamic> json) {
  return _PermissionCheckResponse.fromJson(json);
}

/// @nodoc
mixin _$PermissionCheckResponse {
  PermissionCheckResult get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionCheckResponseCopyWith<PermissionCheckResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCheckResponseCopyWith<$Res> {
  factory $PermissionCheckResponseCopyWith(PermissionCheckResponse value,
          $Res Function(PermissionCheckResponse) then) =
      _$PermissionCheckResponseCopyWithImpl<$Res, PermissionCheckResponse>;
  @useResult
  $Res call({PermissionCheckResult data});

  $PermissionCheckResultCopyWith<$Res> get data;
}

/// @nodoc
class _$PermissionCheckResponseCopyWithImpl<$Res,
        $Val extends PermissionCheckResponse>
    implements $PermissionCheckResponseCopyWith<$Res> {
  _$PermissionCheckResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PermissionCheckResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionCheckResultCopyWith<$Res> get data {
    return $PermissionCheckResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermissionCheckResponseImplCopyWith<$Res>
    implements $PermissionCheckResponseCopyWith<$Res> {
  factory _$$PermissionCheckResponseImplCopyWith(
          _$PermissionCheckResponseImpl value,
          $Res Function(_$PermissionCheckResponseImpl) then) =
      __$$PermissionCheckResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PermissionCheckResult data});

  @override
  $PermissionCheckResultCopyWith<$Res> get data;
}

/// @nodoc
class __$$PermissionCheckResponseImplCopyWithImpl<$Res>
    extends _$PermissionCheckResponseCopyWithImpl<$Res,
        _$PermissionCheckResponseImpl>
    implements _$$PermissionCheckResponseImplCopyWith<$Res> {
  __$$PermissionCheckResponseImplCopyWithImpl(
      _$PermissionCheckResponseImpl _value,
      $Res Function(_$PermissionCheckResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PermissionCheckResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PermissionCheckResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionCheckResponseImpl implements _PermissionCheckResponse {
  const _$PermissionCheckResponseImpl({required this.data});

  factory _$PermissionCheckResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionCheckResponseImplFromJson(json);

  @override
  final PermissionCheckResult data;

  @override
  String toString() {
    return 'PermissionCheckResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionCheckResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionCheckResponseImplCopyWith<_$PermissionCheckResponseImpl>
      get copyWith => __$$PermissionCheckResponseImplCopyWithImpl<
          _$PermissionCheckResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionCheckResponseImplToJson(
      this,
    );
  }
}

abstract class _PermissionCheckResponse implements PermissionCheckResponse {
  const factory _PermissionCheckResponse(
          {required final PermissionCheckResult data}) =
      _$PermissionCheckResponseImpl;

  factory _PermissionCheckResponse.fromJson(Map<String, dynamic> json) =
      _$PermissionCheckResponseImpl.fromJson;

  @override
  PermissionCheckResult get data;
  @override
  @JsonKey(ignore: true)
  _$$PermissionCheckResponseImplCopyWith<_$PermissionCheckResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PermissionUpdateStatusRequest _$PermissionUpdateStatusRequestFromJson(
    Map<String, dynamic> json) {
  return _PermissionUpdateStatusRequest.fromJson(json);
}

/// @nodoc
mixin _$PermissionUpdateStatusRequest {
  String get status => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionUpdateStatusRequestCopyWith<PermissionUpdateStatusRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionUpdateStatusRequestCopyWith<$Res> {
  factory $PermissionUpdateStatusRequestCopyWith(
          PermissionUpdateStatusRequest value,
          $Res Function(PermissionUpdateStatusRequest) then) =
      _$PermissionUpdateStatusRequestCopyWithImpl<$Res,
          PermissionUpdateStatusRequest>;
  @useResult
  $Res call({String status, String? note});
}

/// @nodoc
class _$PermissionUpdateStatusRequestCopyWithImpl<$Res,
        $Val extends PermissionUpdateStatusRequest>
    implements $PermissionUpdateStatusRequestCopyWith<$Res> {
  _$PermissionUpdateStatusRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionUpdateStatusRequestImplCopyWith<$Res>
    implements $PermissionUpdateStatusRequestCopyWith<$Res> {
  factory _$$PermissionUpdateStatusRequestImplCopyWith(
          _$PermissionUpdateStatusRequestImpl value,
          $Res Function(_$PermissionUpdateStatusRequestImpl) then) =
      __$$PermissionUpdateStatusRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? note});
}

/// @nodoc
class __$$PermissionUpdateStatusRequestImplCopyWithImpl<$Res>
    extends _$PermissionUpdateStatusRequestCopyWithImpl<$Res,
        _$PermissionUpdateStatusRequestImpl>
    implements _$$PermissionUpdateStatusRequestImplCopyWith<$Res> {
  __$$PermissionUpdateStatusRequestImplCopyWithImpl(
      _$PermissionUpdateStatusRequestImpl _value,
      $Res Function(_$PermissionUpdateStatusRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? note = freezed,
  }) {
    return _then(_$PermissionUpdateStatusRequestImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionUpdateStatusRequestImpl
    implements _PermissionUpdateStatusRequest {
  const _$PermissionUpdateStatusRequestImpl({required this.status, this.note});

  factory _$PermissionUpdateStatusRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PermissionUpdateStatusRequestImplFromJson(json);

  @override
  final String status;
  @override
  final String? note;

  @override
  String toString() {
    return 'PermissionUpdateStatusRequest(status: $status, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionUpdateStatusRequestImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionUpdateStatusRequestImplCopyWith<
          _$PermissionUpdateStatusRequestImpl>
      get copyWith => __$$PermissionUpdateStatusRequestImplCopyWithImpl<
          _$PermissionUpdateStatusRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionUpdateStatusRequestImplToJson(
      this,
    );
  }
}

abstract class _PermissionUpdateStatusRequest
    implements PermissionUpdateStatusRequest {
  const factory _PermissionUpdateStatusRequest(
      {required final String status,
      final String? note}) = _$PermissionUpdateStatusRequestImpl;

  factory _PermissionUpdateStatusRequest.fromJson(Map<String, dynamic> json) =
      _$PermissionUpdateStatusRequestImpl.fromJson;

  @override
  String get status;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$PermissionUpdateStatusRequestImplCopyWith<
          _$PermissionUpdateStatusRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
