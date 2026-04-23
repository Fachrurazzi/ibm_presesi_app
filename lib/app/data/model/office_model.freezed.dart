// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'office_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfficeRequest _$OfficeRequestFromJson(Map<String, dynamic> json) {
  return _OfficeRequest.fromJson(json);
}

/// @nodoc
mixin _$OfficeRequest {
  String get name => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get radius => throw _privateConstructorUsedError;
  @JsonKey(name: 'supervisor_name')
  String? get supervisorName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeRequestCopyWith<OfficeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeRequestCopyWith<$Res> {
  factory $OfficeRequestCopyWith(
          OfficeRequest value, $Res Function(OfficeRequest) then) =
      _$OfficeRequestCopyWithImpl<$Res, OfficeRequest>;
  @useResult
  $Res call(
      {String name,
      double? latitude,
      double? longitude,
      int? radius,
      @JsonKey(name: 'supervisor_name') String? supervisorName});
}

/// @nodoc
class _$OfficeRequestCopyWithImpl<$Res, $Val extends OfficeRequest>
    implements $OfficeRequestCopyWith<$Res> {
  _$OfficeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
    Object? supervisorName = freezed,
  }) {
    return _then(_value.copyWith(
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
      supervisorName: freezed == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficeRequestImplCopyWith<$Res>
    implements $OfficeRequestCopyWith<$Res> {
  factory _$$OfficeRequestImplCopyWith(
          _$OfficeRequestImpl value, $Res Function(_$OfficeRequestImpl) then) =
      __$$OfficeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double? latitude,
      double? longitude,
      int? radius,
      @JsonKey(name: 'supervisor_name') String? supervisorName});
}

/// @nodoc
class __$$OfficeRequestImplCopyWithImpl<$Res>
    extends _$OfficeRequestCopyWithImpl<$Res, _$OfficeRequestImpl>
    implements _$$OfficeRequestImplCopyWith<$Res> {
  __$$OfficeRequestImplCopyWithImpl(
      _$OfficeRequestImpl _value, $Res Function(_$OfficeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? radius = freezed,
    Object? supervisorName = freezed,
  }) {
    return _then(_$OfficeRequestImpl(
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
      supervisorName: freezed == supervisorName
          ? _value.supervisorName
          : supervisorName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeRequestImpl implements _OfficeRequest {
  const _$OfficeRequestImpl(
      {required this.name,
      this.latitude,
      this.longitude,
      this.radius,
      @JsonKey(name: 'supervisor_name') this.supervisorName});

  factory _$OfficeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeRequestImplFromJson(json);

  @override
  final String name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? radius;
  @override
  @JsonKey(name: 'supervisor_name')
  final String? supervisorName;

  @override
  String toString() {
    return 'OfficeRequest(name: $name, latitude: $latitude, longitude: $longitude, radius: $radius, supervisorName: $supervisorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.supervisorName, supervisorName) ||
                other.supervisorName == supervisorName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, latitude, longitude, radius, supervisorName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeRequestImplCopyWith<_$OfficeRequestImpl> get copyWith =>
      __$$OfficeRequestImplCopyWithImpl<_$OfficeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeRequestImplToJson(
      this,
    );
  }
}

abstract class _OfficeRequest implements OfficeRequest {
  const factory _OfficeRequest(
          {required final String name,
          final double? latitude,
          final double? longitude,
          final int? radius,
          @JsonKey(name: 'supervisor_name') final String? supervisorName}) =
      _$OfficeRequestImpl;

  factory _OfficeRequest.fromJson(Map<String, dynamic> json) =
      _$OfficeRequestImpl.fromJson;

  @override
  String get name;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get radius;
  @override
  @JsonKey(name: 'supervisor_name')
  String? get supervisorName;
  @override
  @JsonKey(ignore: true)
  _$$OfficeRequestImplCopyWith<_$OfficeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficeResponse _$OfficeResponseFromJson(Map<String, dynamic> json) {
  return _OfficeResponse.fromJson(json);
}

/// @nodoc
mixin _$OfficeResponse {
  OfficeEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeResponseCopyWith<OfficeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeResponseCopyWith<$Res> {
  factory $OfficeResponseCopyWith(
          OfficeResponse value, $Res Function(OfficeResponse) then) =
      _$OfficeResponseCopyWithImpl<$Res, OfficeResponse>;
  @useResult
  $Res call({OfficeEntity data});

  $OfficeEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$OfficeResponseCopyWithImpl<$Res, $Val extends OfficeResponse>
    implements $OfficeResponseCopyWith<$Res> {
  _$OfficeResponseCopyWithImpl(this._value, this._then);

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
              as OfficeEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficeEntityCopyWith<$Res> get data {
    return $OfficeEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OfficeResponseImplCopyWith<$Res>
    implements $OfficeResponseCopyWith<$Res> {
  factory _$$OfficeResponseImplCopyWith(_$OfficeResponseImpl value,
          $Res Function(_$OfficeResponseImpl) then) =
      __$$OfficeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OfficeEntity data});

  @override
  $OfficeEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$OfficeResponseImplCopyWithImpl<$Res>
    extends _$OfficeResponseCopyWithImpl<$Res, _$OfficeResponseImpl>
    implements _$$OfficeResponseImplCopyWith<$Res> {
  __$$OfficeResponseImplCopyWithImpl(
      _$OfficeResponseImpl _value, $Res Function(_$OfficeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$OfficeResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OfficeEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeResponseImpl implements _OfficeResponse {
  const _$OfficeResponseImpl({required this.data});

  factory _$OfficeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeResponseImplFromJson(json);

  @override
  final OfficeEntity data;

  @override
  String toString() {
    return 'OfficeResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeResponseImplCopyWith<_$OfficeResponseImpl> get copyWith =>
      __$$OfficeResponseImplCopyWithImpl<_$OfficeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeResponseImplToJson(
      this,
    );
  }
}

abstract class _OfficeResponse implements OfficeResponse {
  const factory _OfficeResponse({required final OfficeEntity data}) =
      _$OfficeResponseImpl;

  factory _OfficeResponse.fromJson(Map<String, dynamic> json) =
      _$OfficeResponseImpl.fromJson;

  @override
  OfficeEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$OfficeResponseImplCopyWith<_$OfficeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OfficeListResponse _$OfficeListResponseFromJson(Map<String, dynamic> json) {
  return _OfficeListResponse.fromJson(json);
}

/// @nodoc
mixin _$OfficeListResponse {
  List<OfficeEntity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeListResponseCopyWith<OfficeListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeListResponseCopyWith<$Res> {
  factory $OfficeListResponseCopyWith(
          OfficeListResponse value, $Res Function(OfficeListResponse) then) =
      _$OfficeListResponseCopyWithImpl<$Res, OfficeListResponse>;
  @useResult
  $Res call({List<OfficeEntity> data});
}

/// @nodoc
class _$OfficeListResponseCopyWithImpl<$Res, $Val extends OfficeListResponse>
    implements $OfficeListResponseCopyWith<$Res> {
  _$OfficeListResponseCopyWithImpl(this._value, this._then);

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
              as List<OfficeEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficeListResponseImplCopyWith<$Res>
    implements $OfficeListResponseCopyWith<$Res> {
  factory _$$OfficeListResponseImplCopyWith(_$OfficeListResponseImpl value,
          $Res Function(_$OfficeListResponseImpl) then) =
      __$$OfficeListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OfficeEntity> data});
}

/// @nodoc
class __$$OfficeListResponseImplCopyWithImpl<$Res>
    extends _$OfficeListResponseCopyWithImpl<$Res, _$OfficeListResponseImpl>
    implements _$$OfficeListResponseImplCopyWith<$Res> {
  __$$OfficeListResponseImplCopyWithImpl(_$OfficeListResponseImpl _value,
      $Res Function(_$OfficeListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$OfficeListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<OfficeEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeListResponseImpl implements _OfficeListResponse {
  const _$OfficeListResponseImpl({required final List<OfficeEntity> data})
      : _data = data;

  factory _$OfficeListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeListResponseImplFromJson(json);

  final List<OfficeEntity> _data;
  @override
  List<OfficeEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'OfficeListResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeListResponseImplCopyWith<_$OfficeListResponseImpl> get copyWith =>
      __$$OfficeListResponseImplCopyWithImpl<_$OfficeListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeListResponseImplToJson(
      this,
    );
  }
}

abstract class _OfficeListResponse implements OfficeListResponse {
  const factory _OfficeListResponse({required final List<OfficeEntity> data}) =
      _$OfficeListResponseImpl;

  factory _OfficeListResponse.fromJson(Map<String, dynamic> json) =
      _$OfficeListResponseImpl.fromJson;

  @override
  List<OfficeEntity> get data;
  @override
  @JsonKey(ignore: true)
  _$$OfficeListResponseImplCopyWith<_$OfficeListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckRadiusRequest _$CheckRadiusRequestFromJson(Map<String, dynamic> json) {
  return _CheckRadiusRequest.fromJson(json);
}

/// @nodoc
mixin _$CheckRadiusRequest {
  @JsonKey(name: 'office_id')
  int get officeId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckRadiusRequestCopyWith<CheckRadiusRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckRadiusRequestCopyWith<$Res> {
  factory $CheckRadiusRequestCopyWith(
          CheckRadiusRequest value, $Res Function(CheckRadiusRequest) then) =
      _$CheckRadiusRequestCopyWithImpl<$Res, CheckRadiusRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'office_id') int officeId,
      double latitude,
      double longitude});
}

/// @nodoc
class _$CheckRadiusRequestCopyWithImpl<$Res, $Val extends CheckRadiusRequest>
    implements $CheckRadiusRequestCopyWith<$Res> {
  _$CheckRadiusRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeId = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      officeId: null == officeId
          ? _value.officeId
          : officeId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckRadiusRequestImplCopyWith<$Res>
    implements $CheckRadiusRequestCopyWith<$Res> {
  factory _$$CheckRadiusRequestImplCopyWith(_$CheckRadiusRequestImpl value,
          $Res Function(_$CheckRadiusRequestImpl) then) =
      __$$CheckRadiusRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'office_id') int officeId,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$CheckRadiusRequestImplCopyWithImpl<$Res>
    extends _$CheckRadiusRequestCopyWithImpl<$Res, _$CheckRadiusRequestImpl>
    implements _$$CheckRadiusRequestImplCopyWith<$Res> {
  __$$CheckRadiusRequestImplCopyWithImpl(_$CheckRadiusRequestImpl _value,
      $Res Function(_$CheckRadiusRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officeId = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$CheckRadiusRequestImpl(
      officeId: null == officeId
          ? _value.officeId
          : officeId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckRadiusRequestImpl implements _CheckRadiusRequest {
  const _$CheckRadiusRequestImpl(
      {@JsonKey(name: 'office_id') required this.officeId,
      required this.latitude,
      required this.longitude});

  factory _$CheckRadiusRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckRadiusRequestImplFromJson(json);

  @override
  @JsonKey(name: 'office_id')
  final int officeId;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'CheckRadiusRequest(officeId: $officeId, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckRadiusRequestImpl &&
            (identical(other.officeId, officeId) ||
                other.officeId == officeId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, officeId, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckRadiusRequestImplCopyWith<_$CheckRadiusRequestImpl> get copyWith =>
      __$$CheckRadiusRequestImplCopyWithImpl<_$CheckRadiusRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckRadiusRequestImplToJson(
      this,
    );
  }
}

abstract class _CheckRadiusRequest implements CheckRadiusRequest {
  const factory _CheckRadiusRequest(
      {@JsonKey(name: 'office_id') required final int officeId,
      required final double latitude,
      required final double longitude}) = _$CheckRadiusRequestImpl;

  factory _CheckRadiusRequest.fromJson(Map<String, dynamic> json) =
      _$CheckRadiusRequestImpl.fromJson;

  @override
  @JsonKey(name: 'office_id')
  int get officeId;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$CheckRadiusRequestImplCopyWith<_$CheckRadiusRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
