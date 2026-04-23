// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceRequest _$AttendanceRequestFromJson(Map<String, dynamic> json) {
  return _AttendanceRequest.fromJson(json);
}

/// @nodoc
mixin _$AttendanceRequest {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceRequestCopyWith<AttendanceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceRequestCopyWith<$Res> {
  factory $AttendanceRequestCopyWith(
          AttendanceRequest value, $Res Function(AttendanceRequest) then) =
      _$AttendanceRequestCopyWithImpl<$Res, AttendanceRequest>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$AttendanceRequestCopyWithImpl<$Res, $Val extends AttendanceRequest>
    implements $AttendanceRequestCopyWith<$Res> {
  _$AttendanceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$AttendanceRequestImplCopyWith<$Res>
    implements $AttendanceRequestCopyWith<$Res> {
  factory _$$AttendanceRequestImplCopyWith(_$AttendanceRequestImpl value,
          $Res Function(_$AttendanceRequestImpl) then) =
      __$$AttendanceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$AttendanceRequestImplCopyWithImpl<$Res>
    extends _$AttendanceRequestCopyWithImpl<$Res, _$AttendanceRequestImpl>
    implements _$$AttendanceRequestImplCopyWith<$Res> {
  __$$AttendanceRequestImplCopyWithImpl(_$AttendanceRequestImpl _value,
      $Res Function(_$AttendanceRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$AttendanceRequestImpl(
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
class _$AttendanceRequestImpl implements _AttendanceRequest {
  const _$AttendanceRequestImpl(
      {required this.latitude, required this.longitude});

  factory _$AttendanceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceRequestImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'AttendanceRequest(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRequestImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRequestImplCopyWith<_$AttendanceRequestImpl> get copyWith =>
      __$$AttendanceRequestImplCopyWithImpl<_$AttendanceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceRequestImplToJson(
      this,
    );
  }
}

abstract class _AttendanceRequest implements AttendanceRequest {
  const factory _AttendanceRequest(
      {required final double latitude,
      required final double longitude}) = _$AttendanceRequestImpl;

  factory _AttendanceRequest.fromJson(Map<String, dynamic> json) =
      _$AttendanceRequestImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceRequestImplCopyWith<_$AttendanceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) {
  return _AttendanceResponse.fromJson(json);
}

/// @nodoc
mixin _$AttendanceResponse {
  AttendanceEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceResponseCopyWith<AttendanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceResponseCopyWith<$Res> {
  factory $AttendanceResponseCopyWith(
          AttendanceResponse value, $Res Function(AttendanceResponse) then) =
      _$AttendanceResponseCopyWithImpl<$Res, AttendanceResponse>;
  @useResult
  $Res call({AttendanceEntity data});
}

/// @nodoc
class _$AttendanceResponseCopyWithImpl<$Res, $Val extends AttendanceResponse>
    implements $AttendanceResponseCopyWith<$Res> {
  _$AttendanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AttendanceEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceResponseImplCopyWith<$Res>
    implements $AttendanceResponseCopyWith<$Res> {
  factory _$$AttendanceResponseImplCopyWith(_$AttendanceResponseImpl value,
          $Res Function(_$AttendanceResponseImpl) then) =
      __$$AttendanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AttendanceEntity data});
}

/// @nodoc
class __$$AttendanceResponseImplCopyWithImpl<$Res>
    extends _$AttendanceResponseCopyWithImpl<$Res, _$AttendanceResponseImpl>
    implements _$$AttendanceResponseImplCopyWith<$Res> {
  __$$AttendanceResponseImplCopyWithImpl(_$AttendanceResponseImpl _value,
      $Res Function(_$AttendanceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AttendanceResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AttendanceEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceResponseImpl implements _AttendanceResponse {
  const _$AttendanceResponseImpl({required this.data});

  factory _$AttendanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceResponseImplFromJson(json);

  @override
  final AttendanceEntity data;

  @override
  String toString() {
    return 'AttendanceResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceResponseImpl &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceResponseImplCopyWith<_$AttendanceResponseImpl> get copyWith =>
      __$$AttendanceResponseImplCopyWithImpl<_$AttendanceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceResponseImplToJson(
      this,
    );
  }
}

abstract class _AttendanceResponse implements AttendanceResponse {
  const factory _AttendanceResponse({required final AttendanceEntity data}) =
      _$AttendanceResponseImpl;

  factory _AttendanceResponse.fromJson(Map<String, dynamic> json) =
      _$AttendanceResponseImpl.fromJson;

  @override
  AttendanceEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceResponseImplCopyWith<_$AttendanceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttendanceScheduleResponse _$AttendanceScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return _AttendanceScheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$AttendanceScheduleResponse {
  AttendanceSchedule get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceScheduleResponseCopyWith<AttendanceScheduleResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceScheduleResponseCopyWith<$Res> {
  factory $AttendanceScheduleResponseCopyWith(AttendanceScheduleResponse value,
          $Res Function(AttendanceScheduleResponse) then) =
      _$AttendanceScheduleResponseCopyWithImpl<$Res,
          AttendanceScheduleResponse>;
  @useResult
  $Res call({AttendanceSchedule data});

  $AttendanceScheduleCopyWith<$Res> get data;
}

/// @nodoc
class _$AttendanceScheduleResponseCopyWithImpl<$Res,
        $Val extends AttendanceScheduleResponse>
    implements $AttendanceScheduleResponseCopyWith<$Res> {
  _$AttendanceScheduleResponseCopyWithImpl(this._value, this._then);

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
              as AttendanceSchedule,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttendanceScheduleCopyWith<$Res> get data {
    return $AttendanceScheduleCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceScheduleResponseImplCopyWith<$Res>
    implements $AttendanceScheduleResponseCopyWith<$Res> {
  factory _$$AttendanceScheduleResponseImplCopyWith(
          _$AttendanceScheduleResponseImpl value,
          $Res Function(_$AttendanceScheduleResponseImpl) then) =
      __$$AttendanceScheduleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AttendanceSchedule data});

  @override
  $AttendanceScheduleCopyWith<$Res> get data;
}

/// @nodoc
class __$$AttendanceScheduleResponseImplCopyWithImpl<$Res>
    extends _$AttendanceScheduleResponseCopyWithImpl<$Res,
        _$AttendanceScheduleResponseImpl>
    implements _$$AttendanceScheduleResponseImplCopyWith<$Res> {
  __$$AttendanceScheduleResponseImplCopyWithImpl(
      _$AttendanceScheduleResponseImpl _value,
      $Res Function(_$AttendanceScheduleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AttendanceScheduleResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AttendanceSchedule,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceScheduleResponseImpl implements _AttendanceScheduleResponse {
  const _$AttendanceScheduleResponseImpl({required this.data});

  factory _$AttendanceScheduleResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AttendanceScheduleResponseImplFromJson(json);

  @override
  final AttendanceSchedule data;

  @override
  String toString() {
    return 'AttendanceScheduleResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceScheduleResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceScheduleResponseImplCopyWith<_$AttendanceScheduleResponseImpl>
      get copyWith => __$$AttendanceScheduleResponseImplCopyWithImpl<
          _$AttendanceScheduleResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceScheduleResponseImplToJson(
      this,
    );
  }
}

abstract class _AttendanceScheduleResponse
    implements AttendanceScheduleResponse {
  const factory _AttendanceScheduleResponse(
          {required final AttendanceSchedule data}) =
      _$AttendanceScheduleResponseImpl;

  factory _AttendanceScheduleResponse.fromJson(Map<String, dynamic> json) =
      _$AttendanceScheduleResponseImpl.fromJson;

  @override
  AttendanceSchedule get data;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceScheduleResponseImplCopyWith<_$AttendanceScheduleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AttendanceSummaryResponse _$AttendanceSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _AttendanceSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$AttendanceSummaryResponse {
  AttendanceSummary get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceSummaryResponseCopyWith<AttendanceSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceSummaryResponseCopyWith<$Res> {
  factory $AttendanceSummaryResponseCopyWith(AttendanceSummaryResponse value,
          $Res Function(AttendanceSummaryResponse) then) =
      _$AttendanceSummaryResponseCopyWithImpl<$Res, AttendanceSummaryResponse>;
  @useResult
  $Res call({AttendanceSummary data});

  $AttendanceSummaryCopyWith<$Res> get data;
}

/// @nodoc
class _$AttendanceSummaryResponseCopyWithImpl<$Res,
        $Val extends AttendanceSummaryResponse>
    implements $AttendanceSummaryResponseCopyWith<$Res> {
  _$AttendanceSummaryResponseCopyWithImpl(this._value, this._then);

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
              as AttendanceSummary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttendanceSummaryCopyWith<$Res> get data {
    return $AttendanceSummaryCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceSummaryResponseImplCopyWith<$Res>
    implements $AttendanceSummaryResponseCopyWith<$Res> {
  factory _$$AttendanceSummaryResponseImplCopyWith(
          _$AttendanceSummaryResponseImpl value,
          $Res Function(_$AttendanceSummaryResponseImpl) then) =
      __$$AttendanceSummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AttendanceSummary data});

  @override
  $AttendanceSummaryCopyWith<$Res> get data;
}

/// @nodoc
class __$$AttendanceSummaryResponseImplCopyWithImpl<$Res>
    extends _$AttendanceSummaryResponseCopyWithImpl<$Res,
        _$AttendanceSummaryResponseImpl>
    implements _$$AttendanceSummaryResponseImplCopyWith<$Res> {
  __$$AttendanceSummaryResponseImplCopyWithImpl(
      _$AttendanceSummaryResponseImpl _value,
      $Res Function(_$AttendanceSummaryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AttendanceSummaryResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AttendanceSummary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceSummaryResponseImpl implements _AttendanceSummaryResponse {
  const _$AttendanceSummaryResponseImpl({required this.data});

  factory _$AttendanceSummaryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceSummaryResponseImplFromJson(json);

  @override
  final AttendanceSummary data;

  @override
  String toString() {
    return 'AttendanceSummaryResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceSummaryResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceSummaryResponseImplCopyWith<_$AttendanceSummaryResponseImpl>
      get copyWith => __$$AttendanceSummaryResponseImplCopyWithImpl<
          _$AttendanceSummaryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceSummaryResponseImplToJson(
      this,
    );
  }
}

abstract class _AttendanceSummaryResponse implements AttendanceSummaryResponse {
  const factory _AttendanceSummaryResponse(
          {required final AttendanceSummary data}) =
      _$AttendanceSummaryResponseImpl;

  factory _AttendanceSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$AttendanceSummaryResponseImpl.fromJson;

  @override
  AttendanceSummary get data;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceSummaryResponseImplCopyWith<_$AttendanceSummaryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaginatedAttendanceResponse _$PaginatedAttendanceResponseFromJson(
    Map<String, dynamic> json) {
  return _PaginatedAttendanceResponse.fromJson(json);
}

/// @nodoc
mixin _$PaginatedAttendanceResponse {
  List<AttendanceEntity> get data => throw _privateConstructorUsedError;
  PaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedAttendanceResponseCopyWith<PaginatedAttendanceResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedAttendanceResponseCopyWith<$Res> {
  factory $PaginatedAttendanceResponseCopyWith(
          PaginatedAttendanceResponse value,
          $Res Function(PaginatedAttendanceResponse) then) =
      _$PaginatedAttendanceResponseCopyWithImpl<$Res,
          PaginatedAttendanceResponse>;
  @useResult
  $Res call({List<AttendanceEntity> data, PaginationMeta meta});

  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedAttendanceResponseCopyWithImpl<$Res,
        $Val extends PaginatedAttendanceResponse>
    implements $PaginatedAttendanceResponseCopyWith<$Res> {
  _$PaginatedAttendanceResponseCopyWithImpl(this._value, this._then);

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
              as List<AttendanceEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get meta {
    return $PaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedAttendanceResponseImplCopyWith<$Res>
    implements $PaginatedAttendanceResponseCopyWith<$Res> {
  factory _$$PaginatedAttendanceResponseImplCopyWith(
          _$PaginatedAttendanceResponseImpl value,
          $Res Function(_$PaginatedAttendanceResponseImpl) then) =
      __$$PaginatedAttendanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AttendanceEntity> data, PaginationMeta meta});

  @override
  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedAttendanceResponseImplCopyWithImpl<$Res>
    extends _$PaginatedAttendanceResponseCopyWithImpl<$Res,
        _$PaginatedAttendanceResponseImpl>
    implements _$$PaginatedAttendanceResponseImplCopyWith<$Res> {
  __$$PaginatedAttendanceResponseImplCopyWithImpl(
      _$PaginatedAttendanceResponseImpl _value,
      $Res Function(_$PaginatedAttendanceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedAttendanceResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AttendanceEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedAttendanceResponseImpl
    implements _PaginatedAttendanceResponse {
  const _$PaginatedAttendanceResponseImpl(
      {required final List<AttendanceEntity> data, required this.meta})
      : _data = data;

  factory _$PaginatedAttendanceResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedAttendanceResponseImplFromJson(json);

  final List<AttendanceEntity> _data;
  @override
  List<AttendanceEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PaginationMeta meta;

  @override
  String toString() {
    return 'PaginatedAttendanceResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedAttendanceResponseImpl &&
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
  _$$PaginatedAttendanceResponseImplCopyWith<_$PaginatedAttendanceResponseImpl>
      get copyWith => __$$PaginatedAttendanceResponseImplCopyWithImpl<
          _$PaginatedAttendanceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedAttendanceResponseImplToJson(
      this,
    );
  }
}

abstract class _PaginatedAttendanceResponse
    implements PaginatedAttendanceResponse {
  const factory _PaginatedAttendanceResponse(
      {required final List<AttendanceEntity> data,
      required final PaginationMeta meta}) = _$PaginatedAttendanceResponseImpl;

  factory _PaginatedAttendanceResponse.fromJson(Map<String, dynamic> json) =
      _$PaginatedAttendanceResponseImpl.fromJson;

  @override
  List<AttendanceEntity> get data;
  @override
  PaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedAttendanceResponseImplCopyWith<_$PaginatedAttendanceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReportSuspiciousRequest _$ReportSuspiciousRequestFromJson(
    Map<String, dynamic> json) {
  return _ReportSuspiciousRequest.fromJson(json);
}

/// @nodoc
mixin _$ReportSuspiciousRequest {
  String get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportSuspiciousRequestCopyWith<ReportSuspiciousRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportSuspiciousRequestCopyWith<$Res> {
  factory $ReportSuspiciousRequestCopyWith(ReportSuspiciousRequest value,
          $Res Function(ReportSuspiciousRequest) then) =
      _$ReportSuspiciousRequestCopyWithImpl<$Res, ReportSuspiciousRequest>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$ReportSuspiciousRequestCopyWithImpl<$Res,
        $Val extends ReportSuspiciousRequest>
    implements $ReportSuspiciousRequestCopyWith<$Res> {
  _$ReportSuspiciousRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportSuspiciousRequestImplCopyWith<$Res>
    implements $ReportSuspiciousRequestCopyWith<$Res> {
  factory _$$ReportSuspiciousRequestImplCopyWith(
          _$ReportSuspiciousRequestImpl value,
          $Res Function(_$ReportSuspiciousRequestImpl) then) =
      __$$ReportSuspiciousRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$ReportSuspiciousRequestImplCopyWithImpl<$Res>
    extends _$ReportSuspiciousRequestCopyWithImpl<$Res,
        _$ReportSuspiciousRequestImpl>
    implements _$$ReportSuspiciousRequestImplCopyWith<$Res> {
  __$$ReportSuspiciousRequestImplCopyWithImpl(
      _$ReportSuspiciousRequestImpl _value,
      $Res Function(_$ReportSuspiciousRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$ReportSuspiciousRequestImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportSuspiciousRequestImpl implements _ReportSuspiciousRequest {
  const _$ReportSuspiciousRequestImpl(
      {this.reason = 'Terdeteksi fake GPS/emulator'});

  factory _$ReportSuspiciousRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportSuspiciousRequestImplFromJson(json);

  @override
  @JsonKey()
  final String reason;

  @override
  String toString() {
    return 'ReportSuspiciousRequest(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportSuspiciousRequestImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportSuspiciousRequestImplCopyWith<_$ReportSuspiciousRequestImpl>
      get copyWith => __$$ReportSuspiciousRequestImplCopyWithImpl<
          _$ReportSuspiciousRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportSuspiciousRequestImplToJson(
      this,
    );
  }
}

abstract class _ReportSuspiciousRequest implements ReportSuspiciousRequest {
  const factory _ReportSuspiciousRequest({final String reason}) =
      _$ReportSuspiciousRequestImpl;

  factory _ReportSuspiciousRequest.fromJson(Map<String, dynamic> json) =
      _$ReportSuspiciousRequestImpl.fromJson;

  @override
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$ReportSuspiciousRequestImplCopyWith<_$ReportSuspiciousRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
