// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleRequest _$ScheduleRequestFromJson(Map<String, dynamic> json) {
  return _ScheduleRequest.fromJson(json);
}

/// @nodoc
mixin _$ScheduleRequest {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_id')
  int get shiftId => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_id')
  int get officeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_wfa')
  bool get isWfa => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_banned')
  bool get isBanned => throw _privateConstructorUsedError;
  @JsonKey(name: 'banned_reason')
  String? get bannedReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleRequestCopyWith<ScheduleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleRequestCopyWith<$Res> {
  factory $ScheduleRequestCopyWith(
          ScheduleRequest value, $Res Function(ScheduleRequest) then) =
      _$ScheduleRequestCopyWithImpl<$Res, ScheduleRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'shift_id') int shiftId,
      @JsonKey(name: 'office_id') int officeId,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason});
}

/// @nodoc
class _$ScheduleRequestCopyWithImpl<$Res, $Val extends ScheduleRequest>
    implements $ScheduleRequestCopyWith<$Res> {
  _$ScheduleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? shiftId = null,
    Object? officeId = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isWfa = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int,
      officeId: null == officeId
          ? _value.officeId
          : officeId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      bannedReason: freezed == bannedReason
          ? _value.bannedReason
          : bannedReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleRequestImplCopyWith<$Res>
    implements $ScheduleRequestCopyWith<$Res> {
  factory _$$ScheduleRequestImplCopyWith(_$ScheduleRequestImpl value,
          $Res Function(_$ScheduleRequestImpl) then) =
      __$$ScheduleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'shift_id') int shiftId,
      @JsonKey(name: 'office_id') int officeId,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason});
}

/// @nodoc
class __$$ScheduleRequestImplCopyWithImpl<$Res>
    extends _$ScheduleRequestCopyWithImpl<$Res, _$ScheduleRequestImpl>
    implements _$$ScheduleRequestImplCopyWith<$Res> {
  __$$ScheduleRequestImplCopyWithImpl(
      _$ScheduleRequestImpl _value, $Res Function(_$ScheduleRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? shiftId = null,
    Object? officeId = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isWfa = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
  }) {
    return _then(_$ScheduleRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shiftId: null == shiftId
          ? _value.shiftId
          : shiftId // ignore: cast_nullable_to_non_nullable
              as int,
      officeId: null == officeId
          ? _value.officeId
          : officeId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      bannedReason: freezed == bannedReason
          ? _value.bannedReason
          : bannedReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleRequestImpl implements _ScheduleRequest {
  const _$ScheduleRequestImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'shift_id') required this.shiftId,
      @JsonKey(name: 'office_id') required this.officeId,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'is_wfa') this.isWfa = false,
      @JsonKey(name: 'is_banned') this.isBanned = false,
      @JsonKey(name: 'banned_reason') this.bannedReason});

  factory _$ScheduleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleRequestImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'shift_id')
  final int shiftId;
  @override
  @JsonKey(name: 'office_id')
  final int officeId;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  @JsonKey(name: 'is_wfa')
  final bool isWfa;
  @override
  @JsonKey(name: 'is_banned')
  final bool isBanned;
  @override
  @JsonKey(name: 'banned_reason')
  final String? bannedReason;

  @override
  String toString() {
    return 'ScheduleRequest(userId: $userId, shiftId: $shiftId, officeId: $officeId, startDate: $startDate, endDate: $endDate, isWfa: $isWfa, isBanned: $isBanned, bannedReason: $bannedReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.shiftId, shiftId) || other.shiftId == shiftId) &&
            (identical(other.officeId, officeId) ||
                other.officeId == officeId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.bannedReason, bannedReason) ||
                other.bannedReason == bannedReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, shiftId, officeId,
      startDate, endDate, isWfa, isBanned, bannedReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleRequestImplCopyWith<_$ScheduleRequestImpl> get copyWith =>
      __$$ScheduleRequestImplCopyWithImpl<_$ScheduleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleRequestImplToJson(
      this,
    );
  }
}

abstract class _ScheduleRequest implements ScheduleRequest {
  const factory _ScheduleRequest(
          {@JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'shift_id') required final int shiftId,
          @JsonKey(name: 'office_id') required final int officeId,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') final String? endDate,
          @JsonKey(name: 'is_wfa') final bool isWfa,
          @JsonKey(name: 'is_banned') final bool isBanned,
          @JsonKey(name: 'banned_reason') final String? bannedReason}) =
      _$ScheduleRequestImpl;

  factory _ScheduleRequest.fromJson(Map<String, dynamic> json) =
      _$ScheduleRequestImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'shift_id')
  int get shiftId;
  @override
  @JsonKey(name: 'office_id')
  int get officeId;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  @JsonKey(name: 'is_wfa')
  bool get isWfa;
  @override
  @JsonKey(name: 'is_banned')
  bool get isBanned;
  @override
  @JsonKey(name: 'banned_reason')
  String? get bannedReason;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleRequestImplCopyWith<_$ScheduleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduleResponse _$ScheduleResponseFromJson(Map<String, dynamic> json) {
  return _ScheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$ScheduleResponse {
  ScheduleEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleResponseCopyWith<ScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleResponseCopyWith<$Res> {
  factory $ScheduleResponseCopyWith(
          ScheduleResponse value, $Res Function(ScheduleResponse) then) =
      _$ScheduleResponseCopyWithImpl<$Res, ScheduleResponse>;
  @useResult
  $Res call({ScheduleEntity data});

  $ScheduleEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$ScheduleResponseCopyWithImpl<$Res, $Val extends ScheduleResponse>
    implements $ScheduleResponseCopyWith<$Res> {
  _$ScheduleResponseCopyWithImpl(this._value, this._then);

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
              as ScheduleEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleEntityCopyWith<$Res> get data {
    return $ScheduleEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleResponseImplCopyWith<$Res>
    implements $ScheduleResponseCopyWith<$Res> {
  factory _$$ScheduleResponseImplCopyWith(_$ScheduleResponseImpl value,
          $Res Function(_$ScheduleResponseImpl) then) =
      __$$ScheduleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ScheduleEntity data});

  @override
  $ScheduleEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$ScheduleResponseImplCopyWithImpl<$Res>
    extends _$ScheduleResponseCopyWithImpl<$Res, _$ScheduleResponseImpl>
    implements _$$ScheduleResponseImplCopyWith<$Res> {
  __$$ScheduleResponseImplCopyWithImpl(_$ScheduleResponseImpl _value,
      $Res Function(_$ScheduleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ScheduleResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ScheduleEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleResponseImpl implements _ScheduleResponse {
  const _$ScheduleResponseImpl({required this.data});

  factory _$ScheduleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleResponseImplFromJson(json);

  @override
  final ScheduleEntity data;

  @override
  String toString() {
    return 'ScheduleResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleResponseImplCopyWith<_$ScheduleResponseImpl> get copyWith =>
      __$$ScheduleResponseImplCopyWithImpl<_$ScheduleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleResponseImplToJson(
      this,
    );
  }
}

abstract class _ScheduleResponse implements ScheduleResponse {
  const factory _ScheduleResponse({required final ScheduleEntity data}) =
      _$ScheduleResponseImpl;

  factory _ScheduleResponse.fromJson(Map<String, dynamic> json) =
      _$ScheduleResponseImpl.fromJson;

  @override
  ScheduleEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleResponseImplCopyWith<_$ScheduleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedScheduleResponse _$PaginatedScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return _PaginatedScheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$PaginatedScheduleResponse {
  List<ScheduleEntity> get data => throw _privateConstructorUsedError;
  SchedulePaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedScheduleResponseCopyWith<PaginatedScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedScheduleResponseCopyWith<$Res> {
  factory $PaginatedScheduleResponseCopyWith(PaginatedScheduleResponse value,
          $Res Function(PaginatedScheduleResponse) then) =
      _$PaginatedScheduleResponseCopyWithImpl<$Res, PaginatedScheduleResponse>;
  @useResult
  $Res call({List<ScheduleEntity> data, SchedulePaginationMeta meta});

  $SchedulePaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedScheduleResponseCopyWithImpl<$Res,
        $Val extends PaginatedScheduleResponse>
    implements $PaginatedScheduleResponseCopyWith<$Res> {
  _$PaginatedScheduleResponseCopyWithImpl(this._value, this._then);

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
              as List<ScheduleEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SchedulePaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SchedulePaginationMetaCopyWith<$Res> get meta {
    return $SchedulePaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedScheduleResponseImplCopyWith<$Res>
    implements $PaginatedScheduleResponseCopyWith<$Res> {
  factory _$$PaginatedScheduleResponseImplCopyWith(
          _$PaginatedScheduleResponseImpl value,
          $Res Function(_$PaginatedScheduleResponseImpl) then) =
      __$$PaginatedScheduleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScheduleEntity> data, SchedulePaginationMeta meta});

  @override
  $SchedulePaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedScheduleResponseImplCopyWithImpl<$Res>
    extends _$PaginatedScheduleResponseCopyWithImpl<$Res,
        _$PaginatedScheduleResponseImpl>
    implements _$$PaginatedScheduleResponseImplCopyWith<$Res> {
  __$$PaginatedScheduleResponseImplCopyWithImpl(
      _$PaginatedScheduleResponseImpl _value,
      $Res Function(_$PaginatedScheduleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedScheduleResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ScheduleEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as SchedulePaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedScheduleResponseImpl implements _PaginatedScheduleResponse {
  const _$PaginatedScheduleResponseImpl(
      {required final List<ScheduleEntity> data, required this.meta})
      : _data = data;

  factory _$PaginatedScheduleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedScheduleResponseImplFromJson(json);

  final List<ScheduleEntity> _data;
  @override
  List<ScheduleEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final SchedulePaginationMeta meta;

  @override
  String toString() {
    return 'PaginatedScheduleResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedScheduleResponseImpl &&
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
  _$$PaginatedScheduleResponseImplCopyWith<_$PaginatedScheduleResponseImpl>
      get copyWith => __$$PaginatedScheduleResponseImplCopyWithImpl<
          _$PaginatedScheduleResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedScheduleResponseImplToJson(
      this,
    );
  }
}

abstract class _PaginatedScheduleResponse implements PaginatedScheduleResponse {
  const factory _PaginatedScheduleResponse(
          {required final List<ScheduleEntity> data,
          required final SchedulePaginationMeta meta}) =
      _$PaginatedScheduleResponseImpl;

  factory _PaginatedScheduleResponse.fromJson(Map<String, dynamic> json) =
      _$PaginatedScheduleResponseImpl.fromJson;

  @override
  List<ScheduleEntity> get data;
  @override
  SchedulePaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedScheduleResponseImplCopyWith<_$PaginatedScheduleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BanScheduleRequest _$BanScheduleRequestFromJson(Map<String, dynamic> json) {
  return _BanScheduleRequest.fromJson(json);
}

/// @nodoc
mixin _$BanScheduleRequest {
  @JsonKey(name: 'banned_reason')
  String get bannedReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BanScheduleRequestCopyWith<BanScheduleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BanScheduleRequestCopyWith<$Res> {
  factory $BanScheduleRequestCopyWith(
          BanScheduleRequest value, $Res Function(BanScheduleRequest) then) =
      _$BanScheduleRequestCopyWithImpl<$Res, BanScheduleRequest>;
  @useResult
  $Res call({@JsonKey(name: 'banned_reason') String bannedReason});
}

/// @nodoc
class _$BanScheduleRequestCopyWithImpl<$Res, $Val extends BanScheduleRequest>
    implements $BanScheduleRequestCopyWith<$Res> {
  _$BanScheduleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannedReason = null,
  }) {
    return _then(_value.copyWith(
      bannedReason: null == bannedReason
          ? _value.bannedReason
          : bannedReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BanScheduleRequestImplCopyWith<$Res>
    implements $BanScheduleRequestCopyWith<$Res> {
  factory _$$BanScheduleRequestImplCopyWith(_$BanScheduleRequestImpl value,
          $Res Function(_$BanScheduleRequestImpl) then) =
      __$$BanScheduleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'banned_reason') String bannedReason});
}

/// @nodoc
class __$$BanScheduleRequestImplCopyWithImpl<$Res>
    extends _$BanScheduleRequestCopyWithImpl<$Res, _$BanScheduleRequestImpl>
    implements _$$BanScheduleRequestImplCopyWith<$Res> {
  __$$BanScheduleRequestImplCopyWithImpl(_$BanScheduleRequestImpl _value,
      $Res Function(_$BanScheduleRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannedReason = null,
  }) {
    return _then(_$BanScheduleRequestImpl(
      bannedReason: null == bannedReason
          ? _value.bannedReason
          : bannedReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BanScheduleRequestImpl implements _BanScheduleRequest {
  const _$BanScheduleRequestImpl(
      {@JsonKey(name: 'banned_reason') required this.bannedReason});

  factory _$BanScheduleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BanScheduleRequestImplFromJson(json);

  @override
  @JsonKey(name: 'banned_reason')
  final String bannedReason;

  @override
  String toString() {
    return 'BanScheduleRequest(bannedReason: $bannedReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BanScheduleRequestImpl &&
            (identical(other.bannedReason, bannedReason) ||
                other.bannedReason == bannedReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bannedReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BanScheduleRequestImplCopyWith<_$BanScheduleRequestImpl> get copyWith =>
      __$$BanScheduleRequestImplCopyWithImpl<_$BanScheduleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BanScheduleRequestImplToJson(
      this,
    );
  }
}

abstract class _BanScheduleRequest implements BanScheduleRequest {
  const factory _BanScheduleRequest(
      {@JsonKey(name: 'banned_reason')
      required final String bannedReason}) = _$BanScheduleRequestImpl;

  factory _BanScheduleRequest.fromJson(Map<String, dynamic> json) =
      _$BanScheduleRequestImpl.fromJson;

  @override
  @JsonKey(name: 'banned_reason')
  String get bannedReason;
  @override
  @JsonKey(ignore: true)
  _$$BanScheduleRequestImplCopyWith<_$BanScheduleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
