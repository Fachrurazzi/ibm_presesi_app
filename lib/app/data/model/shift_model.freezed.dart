// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShiftRequest _$ShiftRequestFromJson(Map<String, dynamic> json) {
  return _ShiftRequest.fromJson(json);
}

/// @nodoc
mixin _$ShiftRequest {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftRequestCopyWith<ShiftRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftRequestCopyWith<$Res> {
  factory $ShiftRequestCopyWith(
          ShiftRequest value, $Res Function(ShiftRequest) then) =
      _$ShiftRequestCopyWithImpl<$Res, ShiftRequest>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      String? description});
}

/// @nodoc
class _$ShiftRequestCopyWithImpl<$Res, $Val extends ShiftRequest>
    implements $ShiftRequestCopyWith<$Res> {
  _$ShiftRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftRequestImplCopyWith<$Res>
    implements $ShiftRequestCopyWith<$Res> {
  factory _$$ShiftRequestImplCopyWith(
          _$ShiftRequestImpl value, $Res Function(_$ShiftRequestImpl) then) =
      __$$ShiftRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      String? description});
}

/// @nodoc
class __$$ShiftRequestImplCopyWithImpl<$Res>
    extends _$ShiftRequestCopyWithImpl<$Res, _$ShiftRequestImpl>
    implements _$$ShiftRequestImplCopyWith<$Res> {
  __$$ShiftRequestImplCopyWithImpl(
      _$ShiftRequestImpl _value, $Res Function(_$ShiftRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? description = freezed,
  }) {
    return _then(_$ShiftRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftRequestImpl implements _ShiftRequest {
  const _$ShiftRequestImpl(
      {required this.name,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      this.description});

  factory _$ShiftRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftRequestImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  final String? description;

  @override
  String toString() {
    return 'ShiftRequest(name: $name, startTime: $startTime, endTime: $endTime, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, startTime, endTime, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftRequestImplCopyWith<_$ShiftRequestImpl> get copyWith =>
      __$$ShiftRequestImplCopyWithImpl<_$ShiftRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftRequestImplToJson(
      this,
    );
  }
}

abstract class _ShiftRequest implements ShiftRequest {
  const factory _ShiftRequest(
      {required final String name,
      @JsonKey(name: 'start_time') required final String startTime,
      @JsonKey(name: 'end_time') required final String endTime,
      final String? description}) = _$ShiftRequestImpl;

  factory _ShiftRequest.fromJson(Map<String, dynamic> json) =
      _$ShiftRequestImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ShiftRequestImplCopyWith<_$ShiftRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftListResponse _$ShiftListResponseFromJson(Map<String, dynamic> json) {
  return _ShiftListResponse.fromJson(json);
}

/// @nodoc
mixin _$ShiftListResponse {
  List<ShiftEntity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftListResponseCopyWith<ShiftListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftListResponseCopyWith<$Res> {
  factory $ShiftListResponseCopyWith(
          ShiftListResponse value, $Res Function(ShiftListResponse) then) =
      _$ShiftListResponseCopyWithImpl<$Res, ShiftListResponse>;
  @useResult
  $Res call({List<ShiftEntity> data});
}

/// @nodoc
class _$ShiftListResponseCopyWithImpl<$Res, $Val extends ShiftListResponse>
    implements $ShiftListResponseCopyWith<$Res> {
  _$ShiftListResponseCopyWithImpl(this._value, this._then);

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
              as List<ShiftEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShiftListResponseImplCopyWith<$Res>
    implements $ShiftListResponseCopyWith<$Res> {
  factory _$$ShiftListResponseImplCopyWith(_$ShiftListResponseImpl value,
          $Res Function(_$ShiftListResponseImpl) then) =
      __$$ShiftListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ShiftEntity> data});
}

/// @nodoc
class __$$ShiftListResponseImplCopyWithImpl<$Res>
    extends _$ShiftListResponseCopyWithImpl<$Res, _$ShiftListResponseImpl>
    implements _$$ShiftListResponseImplCopyWith<$Res> {
  __$$ShiftListResponseImplCopyWithImpl(_$ShiftListResponseImpl _value,
      $Res Function(_$ShiftListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ShiftListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ShiftEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftListResponseImpl implements _ShiftListResponse {
  const _$ShiftListResponseImpl({required final List<ShiftEntity> data})
      : _data = data;

  factory _$ShiftListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftListResponseImplFromJson(json);

  final List<ShiftEntity> _data;
  @override
  List<ShiftEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ShiftListResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftListResponseImplCopyWith<_$ShiftListResponseImpl> get copyWith =>
      __$$ShiftListResponseImplCopyWithImpl<_$ShiftListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftListResponseImplToJson(
      this,
    );
  }
}

abstract class _ShiftListResponse implements ShiftListResponse {
  const factory _ShiftListResponse({required final List<ShiftEntity> data}) =
      _$ShiftListResponseImpl;

  factory _ShiftListResponse.fromJson(Map<String, dynamic> json) =
      _$ShiftListResponseImpl.fromJson;

  @override
  List<ShiftEntity> get data;
  @override
  @JsonKey(ignore: true)
  _$$ShiftListResponseImplCopyWith<_$ShiftListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShiftResponse _$ShiftResponseFromJson(Map<String, dynamic> json) {
  return _ShiftResponse.fromJson(json);
}

/// @nodoc
mixin _$ShiftResponse {
  ShiftEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShiftResponseCopyWith<ShiftResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftResponseCopyWith<$Res> {
  factory $ShiftResponseCopyWith(
          ShiftResponse value, $Res Function(ShiftResponse) then) =
      _$ShiftResponseCopyWithImpl<$Res, ShiftResponse>;
  @useResult
  $Res call({ShiftEntity data});

  $ShiftEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$ShiftResponseCopyWithImpl<$Res, $Val extends ShiftResponse>
    implements $ShiftResponseCopyWith<$Res> {
  _$ShiftResponseCopyWithImpl(this._value, this._then);

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
              as ShiftEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftEntityCopyWith<$Res> get data {
    return $ShiftEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShiftResponseImplCopyWith<$Res>
    implements $ShiftResponseCopyWith<$Res> {
  factory _$$ShiftResponseImplCopyWith(
          _$ShiftResponseImpl value, $Res Function(_$ShiftResponseImpl) then) =
      __$$ShiftResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ShiftEntity data});

  @override
  $ShiftEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$ShiftResponseImplCopyWithImpl<$Res>
    extends _$ShiftResponseCopyWithImpl<$Res, _$ShiftResponseImpl>
    implements _$$ShiftResponseImplCopyWith<$Res> {
  __$$ShiftResponseImplCopyWithImpl(
      _$ShiftResponseImpl _value, $Res Function(_$ShiftResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ShiftResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ShiftEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShiftResponseImpl implements _ShiftResponse {
  const _$ShiftResponseImpl({required this.data});

  factory _$ShiftResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftResponseImplFromJson(json);

  @override
  final ShiftEntity data;

  @override
  String toString() {
    return 'ShiftResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftResponseImplCopyWith<_$ShiftResponseImpl> get copyWith =>
      __$$ShiftResponseImplCopyWithImpl<_$ShiftResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftResponseImplToJson(
      this,
    );
  }
}

abstract class _ShiftResponse implements ShiftResponse {
  const factory _ShiftResponse({required final ShiftEntity data}) =
      _$ShiftResponseImpl;

  factory _ShiftResponse.fromJson(Map<String, dynamic> json) =
      _$ShiftResponseImpl.fromJson;

  @override
  ShiftEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$ShiftResponseImplCopyWith<_$ShiftResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
