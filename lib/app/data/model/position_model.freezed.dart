// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionRequest _$PositionRequestFromJson(Map<String, dynamic> json) {
  return _PositionRequest.fromJson(json);
}

/// @nodoc
mixin _$PositionRequest {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionRequestCopyWith<PositionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionRequestCopyWith<$Res> {
  factory $PositionRequestCopyWith(
          PositionRequest value, $Res Function(PositionRequest) then) =
      _$PositionRequestCopyWithImpl<$Res, PositionRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$PositionRequestCopyWithImpl<$Res, $Val extends PositionRequest>
    implements $PositionRequestCopyWith<$Res> {
  _$PositionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionRequestImplCopyWith<$Res>
    implements $PositionRequestCopyWith<$Res> {
  factory _$$PositionRequestImplCopyWith(_$PositionRequestImpl value,
          $Res Function(_$PositionRequestImpl) then) =
      __$$PositionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$PositionRequestImplCopyWithImpl<$Res>
    extends _$PositionRequestCopyWithImpl<$Res, _$PositionRequestImpl>
    implements _$$PositionRequestImplCopyWith<$Res> {
  __$$PositionRequestImplCopyWithImpl(
      _$PositionRequestImpl _value, $Res Function(_$PositionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$PositionRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionRequestImpl implements _PositionRequest {
  const _$PositionRequestImpl({required this.name});

  factory _$PositionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionRequestImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'PositionRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionRequestImplCopyWith<_$PositionRequestImpl> get copyWith =>
      __$$PositionRequestImplCopyWithImpl<_$PositionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionRequestImplToJson(
      this,
    );
  }
}

abstract class _PositionRequest implements PositionRequest {
  const factory _PositionRequest({required final String name}) =
      _$PositionRequestImpl;

  factory _PositionRequest.fromJson(Map<String, dynamic> json) =
      _$PositionRequestImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$PositionRequestImplCopyWith<_$PositionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PositionListResponse _$PositionListResponseFromJson(Map<String, dynamic> json) {
  return _PositionListResponse.fromJson(json);
}

/// @nodoc
mixin _$PositionListResponse {
  List<PositionEntity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionListResponseCopyWith<PositionListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionListResponseCopyWith<$Res> {
  factory $PositionListResponseCopyWith(PositionListResponse value,
          $Res Function(PositionListResponse) then) =
      _$PositionListResponseCopyWithImpl<$Res, PositionListResponse>;
  @useResult
  $Res call({List<PositionEntity> data});
}

/// @nodoc
class _$PositionListResponseCopyWithImpl<$Res,
        $Val extends PositionListResponse>
    implements $PositionListResponseCopyWith<$Res> {
  _$PositionListResponseCopyWithImpl(this._value, this._then);

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
              as List<PositionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionListResponseImplCopyWith<$Res>
    implements $PositionListResponseCopyWith<$Res> {
  factory _$$PositionListResponseImplCopyWith(_$PositionListResponseImpl value,
          $Res Function(_$PositionListResponseImpl) then) =
      __$$PositionListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PositionEntity> data});
}

/// @nodoc
class __$$PositionListResponseImplCopyWithImpl<$Res>
    extends _$PositionListResponseCopyWithImpl<$Res, _$PositionListResponseImpl>
    implements _$$PositionListResponseImplCopyWith<$Res> {
  __$$PositionListResponseImplCopyWithImpl(_$PositionListResponseImpl _value,
      $Res Function(_$PositionListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PositionListResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PositionEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionListResponseImpl implements _PositionListResponse {
  const _$PositionListResponseImpl({required final List<PositionEntity> data})
      : _data = data;

  factory _$PositionListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionListResponseImplFromJson(json);

  final List<PositionEntity> _data;
  @override
  List<PositionEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PositionListResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionListResponseImplCopyWith<_$PositionListResponseImpl>
      get copyWith =>
          __$$PositionListResponseImplCopyWithImpl<_$PositionListResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionListResponseImplToJson(
      this,
    );
  }
}

abstract class _PositionListResponse implements PositionListResponse {
  const factory _PositionListResponse(
      {required final List<PositionEntity> data}) = _$PositionListResponseImpl;

  factory _PositionListResponse.fromJson(Map<String, dynamic> json) =
      _$PositionListResponseImpl.fromJson;

  @override
  List<PositionEntity> get data;
  @override
  @JsonKey(ignore: true)
  _$$PositionListResponseImplCopyWith<_$PositionListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
