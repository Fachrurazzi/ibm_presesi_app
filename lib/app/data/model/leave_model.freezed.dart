// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveRequest _$LeaveRequestFromJson(Map<String, dynamic> json) {
  return _LeaveRequest.fromJson(json);
}

/// @nodoc
mixin _$LeaveRequest {
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveRequestCopyWith<LeaveRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveRequestCopyWith<$Res> {
  factory $LeaveRequestCopyWith(
          LeaveRequest value, $Res Function(LeaveRequest) then) =
      _$LeaveRequestCopyWithImpl<$Res, LeaveRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String reason,
      String category});
}

/// @nodoc
class _$LeaveRequestCopyWithImpl<$Res, $Val extends LeaveRequest>
    implements $LeaveRequestCopyWith<$Res> {
  _$LeaveRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveRequestImplCopyWith<$Res>
    implements $LeaveRequestCopyWith<$Res> {
  factory _$$LeaveRequestImplCopyWith(
          _$LeaveRequestImpl value, $Res Function(_$LeaveRequestImpl) then) =
      __$$LeaveRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String reason,
      String category});
}

/// @nodoc
class __$$LeaveRequestImplCopyWithImpl<$Res>
    extends _$LeaveRequestCopyWithImpl<$Res, _$LeaveRequestImpl>
    implements _$$LeaveRequestImplCopyWith<$Res> {
  __$$LeaveRequestImplCopyWithImpl(
      _$LeaveRequestImpl _value, $Res Function(_$LeaveRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = null,
    Object? category = null,
  }) {
    return _then(_$LeaveRequestImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveRequestImpl implements _LeaveRequest {
  const _$LeaveRequestImpl(
      {@JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      required this.reason,
      this.category = 'annual'});

  factory _$LeaveRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveRequestImplFromJson(json);

  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  final String reason;
  @override
  @JsonKey()
  final String category;

  @override
  String toString() {
    return 'LeaveRequest(startDate: $startDate, endDate: $endDate, reason: $reason, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveRequestImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startDate, endDate, reason, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveRequestImplCopyWith<_$LeaveRequestImpl> get copyWith =>
      __$$LeaveRequestImplCopyWithImpl<_$LeaveRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveRequestImplToJson(
      this,
    );
  }
}

abstract class _LeaveRequest implements LeaveRequest {
  const factory _LeaveRequest(
      {@JsonKey(name: 'start_date') required final String startDate,
      @JsonKey(name: 'end_date') required final String endDate,
      required final String reason,
      final String category}) = _$LeaveRequestImpl;

  factory _LeaveRequest.fromJson(Map<String, dynamic> json) =
      _$LeaveRequestImpl.fromJson;

  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  String get reason;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$LeaveRequestImplCopyWith<_$LeaveRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveResponse _$LeaveResponseFromJson(Map<String, dynamic> json) {
  return _LeaveResponse.fromJson(json);
}

/// @nodoc
mixin _$LeaveResponse {
  LeaveEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveResponseCopyWith<LeaveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveResponseCopyWith<$Res> {
  factory $LeaveResponseCopyWith(
          LeaveResponse value, $Res Function(LeaveResponse) then) =
      _$LeaveResponseCopyWithImpl<$Res, LeaveResponse>;
  @useResult
  $Res call({LeaveEntity data});

  $LeaveEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$LeaveResponseCopyWithImpl<$Res, $Val extends LeaveResponse>
    implements $LeaveResponseCopyWith<$Res> {
  _$LeaveResponseCopyWithImpl(this._value, this._then);

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
              as LeaveEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeaveEntityCopyWith<$Res> get data {
    return $LeaveEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaveResponseImplCopyWith<$Res>
    implements $LeaveResponseCopyWith<$Res> {
  factory _$$LeaveResponseImplCopyWith(
          _$LeaveResponseImpl value, $Res Function(_$LeaveResponseImpl) then) =
      __$$LeaveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LeaveEntity data});

  @override
  $LeaveEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$LeaveResponseImplCopyWithImpl<$Res>
    extends _$LeaveResponseCopyWithImpl<$Res, _$LeaveResponseImpl>
    implements _$$LeaveResponseImplCopyWith<$Res> {
  __$$LeaveResponseImplCopyWithImpl(
      _$LeaveResponseImpl _value, $Res Function(_$LeaveResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LeaveResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LeaveEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveResponseImpl implements _LeaveResponse {
  const _$LeaveResponseImpl({required this.data});

  factory _$LeaveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveResponseImplFromJson(json);

  @override
  final LeaveEntity data;

  @override
  String toString() {
    return 'LeaveResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveResponseImplCopyWith<_$LeaveResponseImpl> get copyWith =>
      __$$LeaveResponseImplCopyWithImpl<_$LeaveResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveResponseImplToJson(
      this,
    );
  }
}

abstract class _LeaveResponse implements LeaveResponse {
  const factory _LeaveResponse({required final LeaveEntity data}) =
      _$LeaveResponseImpl;

  factory _LeaveResponse.fromJson(Map<String, dynamic> json) =
      _$LeaveResponseImpl.fromJson;

  @override
  LeaveEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$LeaveResponseImplCopyWith<_$LeaveResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedLeaveResponse _$PaginatedLeaveResponseFromJson(
    Map<String, dynamic> json) {
  return _PaginatedLeaveResponse.fromJson(json);
}

/// @nodoc
mixin _$PaginatedLeaveResponse {
  List<LeaveEntity> get data => throw _privateConstructorUsedError;
  LeavePaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedLeaveResponseCopyWith<PaginatedLeaveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedLeaveResponseCopyWith<$Res> {
  factory $PaginatedLeaveResponseCopyWith(PaginatedLeaveResponse value,
          $Res Function(PaginatedLeaveResponse) then) =
      _$PaginatedLeaveResponseCopyWithImpl<$Res, PaginatedLeaveResponse>;
  @useResult
  $Res call({List<LeaveEntity> data, LeavePaginationMeta meta});

  $LeavePaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedLeaveResponseCopyWithImpl<$Res,
        $Val extends PaginatedLeaveResponse>
    implements $PaginatedLeaveResponseCopyWith<$Res> {
  _$PaginatedLeaveResponseCopyWithImpl(this._value, this._then);

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
              as List<LeaveEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as LeavePaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeavePaginationMetaCopyWith<$Res> get meta {
    return $LeavePaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedLeaveResponseImplCopyWith<$Res>
    implements $PaginatedLeaveResponseCopyWith<$Res> {
  factory _$$PaginatedLeaveResponseImplCopyWith(
          _$PaginatedLeaveResponseImpl value,
          $Res Function(_$PaginatedLeaveResponseImpl) then) =
      __$$PaginatedLeaveResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LeaveEntity> data, LeavePaginationMeta meta});

  @override
  $LeavePaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedLeaveResponseImplCopyWithImpl<$Res>
    extends _$PaginatedLeaveResponseCopyWithImpl<$Res,
        _$PaginatedLeaveResponseImpl>
    implements _$$PaginatedLeaveResponseImplCopyWith<$Res> {
  __$$PaginatedLeaveResponseImplCopyWithImpl(
      _$PaginatedLeaveResponseImpl _value,
      $Res Function(_$PaginatedLeaveResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedLeaveResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LeaveEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as LeavePaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedLeaveResponseImpl implements _PaginatedLeaveResponse {
  const _$PaginatedLeaveResponseImpl(
      {required final List<LeaveEntity> data, required this.meta})
      : _data = data;

  factory _$PaginatedLeaveResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedLeaveResponseImplFromJson(json);

  final List<LeaveEntity> _data;
  @override
  List<LeaveEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final LeavePaginationMeta meta;

  @override
  String toString() {
    return 'PaginatedLeaveResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedLeaveResponseImpl &&
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
  _$$PaginatedLeaveResponseImplCopyWith<_$PaginatedLeaveResponseImpl>
      get copyWith => __$$PaginatedLeaveResponseImplCopyWithImpl<
          _$PaginatedLeaveResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedLeaveResponseImplToJson(
      this,
    );
  }
}

abstract class _PaginatedLeaveResponse implements PaginatedLeaveResponse {
  const factory _PaginatedLeaveResponse(
      {required final List<LeaveEntity> data,
      required final LeavePaginationMeta meta}) = _$PaginatedLeaveResponseImpl;

  factory _PaginatedLeaveResponse.fromJson(Map<String, dynamic> json) =
      _$PaginatedLeaveResponseImpl.fromJson;

  @override
  List<LeaveEntity> get data;
  @override
  LeavePaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedLeaveResponseImplCopyWith<_$PaginatedLeaveResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeaveTypesResponse _$LeaveTypesResponseFromJson(Map<String, dynamic> json) {
  return _LeaveTypesResponse.fromJson(json);
}

/// @nodoc
mixin _$LeaveTypesResponse {
  List<LeaveType> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveTypesResponseCopyWith<LeaveTypesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveTypesResponseCopyWith<$Res> {
  factory $LeaveTypesResponseCopyWith(
          LeaveTypesResponse value, $Res Function(LeaveTypesResponse) then) =
      _$LeaveTypesResponseCopyWithImpl<$Res, LeaveTypesResponse>;
  @useResult
  $Res call({List<LeaveType> data});
}

/// @nodoc
class _$LeaveTypesResponseCopyWithImpl<$Res, $Val extends LeaveTypesResponse>
    implements $LeaveTypesResponseCopyWith<$Res> {
  _$LeaveTypesResponseCopyWithImpl(this._value, this._then);

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
              as List<LeaveType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveTypesResponseImplCopyWith<$Res>
    implements $LeaveTypesResponseCopyWith<$Res> {
  factory _$$LeaveTypesResponseImplCopyWith(_$LeaveTypesResponseImpl value,
          $Res Function(_$LeaveTypesResponseImpl) then) =
      __$$LeaveTypesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LeaveType> data});
}

/// @nodoc
class __$$LeaveTypesResponseImplCopyWithImpl<$Res>
    extends _$LeaveTypesResponseCopyWithImpl<$Res, _$LeaveTypesResponseImpl>
    implements _$$LeaveTypesResponseImplCopyWith<$Res> {
  __$$LeaveTypesResponseImplCopyWithImpl(_$LeaveTypesResponseImpl _value,
      $Res Function(_$LeaveTypesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LeaveTypesResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LeaveType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveTypesResponseImpl implements _LeaveTypesResponse {
  const _$LeaveTypesResponseImpl({required final List<LeaveType> data})
      : _data = data;

  factory _$LeaveTypesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveTypesResponseImplFromJson(json);

  final List<LeaveType> _data;
  @override
  List<LeaveType> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LeaveTypesResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveTypesResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveTypesResponseImplCopyWith<_$LeaveTypesResponseImpl> get copyWith =>
      __$$LeaveTypesResponseImplCopyWithImpl<_$LeaveTypesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveTypesResponseImplToJson(
      this,
    );
  }
}

abstract class _LeaveTypesResponse implements LeaveTypesResponse {
  const factory _LeaveTypesResponse({required final List<LeaveType> data}) =
      _$LeaveTypesResponseImpl;

  factory _LeaveTypesResponse.fromJson(Map<String, dynamic> json) =
      _$LeaveTypesResponseImpl.fromJson;

  @override
  List<LeaveType> get data;
  @override
  @JsonKey(ignore: true)
  _$$LeaveTypesResponseImplCopyWith<_$LeaveTypesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveQuotaResponse _$LeaveQuotaResponseFromJson(Map<String, dynamic> json) {
  return _LeaveQuotaResponse.fromJson(json);
}

/// @nodoc
mixin _$LeaveQuotaResponse {
  LeaveQuota get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveQuotaResponseCopyWith<LeaveQuotaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveQuotaResponseCopyWith<$Res> {
  factory $LeaveQuotaResponseCopyWith(
          LeaveQuotaResponse value, $Res Function(LeaveQuotaResponse) then) =
      _$LeaveQuotaResponseCopyWithImpl<$Res, LeaveQuotaResponse>;
  @useResult
  $Res call({LeaveQuota data});

  $LeaveQuotaCopyWith<$Res> get data;
}

/// @nodoc
class _$LeaveQuotaResponseCopyWithImpl<$Res, $Val extends LeaveQuotaResponse>
    implements $LeaveQuotaResponseCopyWith<$Res> {
  _$LeaveQuotaResponseCopyWithImpl(this._value, this._then);

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
              as LeaveQuota,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeaveQuotaCopyWith<$Res> get data {
    return $LeaveQuotaCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaveQuotaResponseImplCopyWith<$Res>
    implements $LeaveQuotaResponseCopyWith<$Res> {
  factory _$$LeaveQuotaResponseImplCopyWith(_$LeaveQuotaResponseImpl value,
          $Res Function(_$LeaveQuotaResponseImpl) then) =
      __$$LeaveQuotaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LeaveQuota data});

  @override
  $LeaveQuotaCopyWith<$Res> get data;
}

/// @nodoc
class __$$LeaveQuotaResponseImplCopyWithImpl<$Res>
    extends _$LeaveQuotaResponseCopyWithImpl<$Res, _$LeaveQuotaResponseImpl>
    implements _$$LeaveQuotaResponseImplCopyWith<$Res> {
  __$$LeaveQuotaResponseImplCopyWithImpl(_$LeaveQuotaResponseImpl _value,
      $Res Function(_$LeaveQuotaResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LeaveQuotaResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LeaveQuota,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveQuotaResponseImpl implements _LeaveQuotaResponse {
  const _$LeaveQuotaResponseImpl({required this.data});

  factory _$LeaveQuotaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveQuotaResponseImplFromJson(json);

  @override
  final LeaveQuota data;

  @override
  String toString() {
    return 'LeaveQuotaResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveQuotaResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveQuotaResponseImplCopyWith<_$LeaveQuotaResponseImpl> get copyWith =>
      __$$LeaveQuotaResponseImplCopyWithImpl<_$LeaveQuotaResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveQuotaResponseImplToJson(
      this,
    );
  }
}

abstract class _LeaveQuotaResponse implements LeaveQuotaResponse {
  const factory _LeaveQuotaResponse({required final LeaveQuota data}) =
      _$LeaveQuotaResponseImpl;

  factory _LeaveQuotaResponse.fromJson(Map<String, dynamic> json) =
      _$LeaveQuotaResponseImpl.fromJson;

  @override
  LeaveQuota get data;
  @override
  @JsonKey(ignore: true)
  _$$LeaveQuotaResponseImplCopyWith<_$LeaveQuotaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveUpdateStatusRequest _$LeaveUpdateStatusRequestFromJson(
    Map<String, dynamic> json) {
  return _LeaveUpdateStatusRequest.fromJson(json);
}

/// @nodoc
mixin _$LeaveUpdateStatusRequest {
  String get status =>
      throw _privateConstructorUsedError; // APPROVED atau REJECTED
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveUpdateStatusRequestCopyWith<LeaveUpdateStatusRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveUpdateStatusRequestCopyWith<$Res> {
  factory $LeaveUpdateStatusRequestCopyWith(LeaveUpdateStatusRequest value,
          $Res Function(LeaveUpdateStatusRequest) then) =
      _$LeaveUpdateStatusRequestCopyWithImpl<$Res, LeaveUpdateStatusRequest>;
  @useResult
  $Res call({String status, String? note});
}

/// @nodoc
class _$LeaveUpdateStatusRequestCopyWithImpl<$Res,
        $Val extends LeaveUpdateStatusRequest>
    implements $LeaveUpdateStatusRequestCopyWith<$Res> {
  _$LeaveUpdateStatusRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$LeaveUpdateStatusRequestImplCopyWith<$Res>
    implements $LeaveUpdateStatusRequestCopyWith<$Res> {
  factory _$$LeaveUpdateStatusRequestImplCopyWith(
          _$LeaveUpdateStatusRequestImpl value,
          $Res Function(_$LeaveUpdateStatusRequestImpl) then) =
      __$$LeaveUpdateStatusRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String? note});
}

/// @nodoc
class __$$LeaveUpdateStatusRequestImplCopyWithImpl<$Res>
    extends _$LeaveUpdateStatusRequestCopyWithImpl<$Res,
        _$LeaveUpdateStatusRequestImpl>
    implements _$$LeaveUpdateStatusRequestImplCopyWith<$Res> {
  __$$LeaveUpdateStatusRequestImplCopyWithImpl(
      _$LeaveUpdateStatusRequestImpl _value,
      $Res Function(_$LeaveUpdateStatusRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? note = freezed,
  }) {
    return _then(_$LeaveUpdateStatusRequestImpl(
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
class _$LeaveUpdateStatusRequestImpl implements _LeaveUpdateStatusRequest {
  const _$LeaveUpdateStatusRequestImpl({required this.status, this.note});

  factory _$LeaveUpdateStatusRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveUpdateStatusRequestImplFromJson(json);

  @override
  final String status;
// APPROVED atau REJECTED
  @override
  final String? note;

  @override
  String toString() {
    return 'LeaveUpdateStatusRequest(status: $status, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveUpdateStatusRequestImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveUpdateStatusRequestImplCopyWith<_$LeaveUpdateStatusRequestImpl>
      get copyWith => __$$LeaveUpdateStatusRequestImplCopyWithImpl<
          _$LeaveUpdateStatusRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveUpdateStatusRequestImplToJson(
      this,
    );
  }
}

abstract class _LeaveUpdateStatusRequest implements LeaveUpdateStatusRequest {
  const factory _LeaveUpdateStatusRequest(
      {required final String status,
      final String? note}) = _$LeaveUpdateStatusRequestImpl;

  factory _LeaveUpdateStatusRequest.fromJson(Map<String, dynamic> json) =
      _$LeaveUpdateStatusRequestImpl.fromJson;

  @override
  String get status;
  @override // APPROVED atau REJECTED
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$LeaveUpdateStatusRequestImplCopyWith<_$LeaveUpdateStatusRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
