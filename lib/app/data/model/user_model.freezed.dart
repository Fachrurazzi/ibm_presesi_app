// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) {
  return _UserUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$UserUpdateRequest {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUpdateRequestCopyWith<UserUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUpdateRequestCopyWith<$Res> {
  factory $UserUpdateRequestCopyWith(
          UserUpdateRequest value, $Res Function(UserUpdateRequest) then) =
      _$UserUpdateRequestCopyWithImpl<$Res, UserUpdateRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$UserUpdateRequestCopyWithImpl<$Res, $Val extends UserUpdateRequest>
    implements $UserUpdateRequestCopyWith<$Res> {
  _$UserUpdateRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$UserUpdateRequestImplCopyWith<$Res>
    implements $UserUpdateRequestCopyWith<$Res> {
  factory _$$UserUpdateRequestImplCopyWith(_$UserUpdateRequestImpl value,
          $Res Function(_$UserUpdateRequestImpl) then) =
      __$$UserUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UserUpdateRequestImplCopyWithImpl<$Res>
    extends _$UserUpdateRequestCopyWithImpl<$Res, _$UserUpdateRequestImpl>
    implements _$$UserUpdateRequestImplCopyWith<$Res> {
  __$$UserUpdateRequestImplCopyWithImpl(_$UserUpdateRequestImpl _value,
      $Res Function(_$UserUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UserUpdateRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUpdateRequestImpl implements _UserUpdateRequest {
  const _$UserUpdateRequestImpl({required this.name});

  factory _$UserUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserUpdateRequestImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'UserUpdateRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdateRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdateRequestImplCopyWith<_$UserUpdateRequestImpl> get copyWith =>
      __$$UserUpdateRequestImplCopyWithImpl<_$UserUpdateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _UserUpdateRequest implements UserUpdateRequest {
  const factory _UserUpdateRequest({required final String name}) =
      _$UserUpdateRequestImpl;

  factory _UserUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$UserUpdateRequestImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserUpdateRequestImplCopyWith<_$UserUpdateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) {
  return _UserProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$UserProfileResponse {
  UserEntity get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileResponseCopyWith<UserProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileResponseCopyWith<$Res> {
  factory $UserProfileResponseCopyWith(
          UserProfileResponse value, $Res Function(UserProfileResponse) then) =
      _$UserProfileResponseCopyWithImpl<$Res, UserProfileResponse>;
  @useResult
  $Res call({UserEntity data});

  $UserEntityCopyWith<$Res> get data;
}

/// @nodoc
class _$UserProfileResponseCopyWithImpl<$Res, $Val extends UserProfileResponse>
    implements $UserProfileResponseCopyWith<$Res> {
  _$UserProfileResponseCopyWithImpl(this._value, this._then);

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
              as UserEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get data {
    return $UserEntityCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileResponseImplCopyWith<$Res>
    implements $UserProfileResponseCopyWith<$Res> {
  factory _$$UserProfileResponseImplCopyWith(_$UserProfileResponseImpl value,
          $Res Function(_$UserProfileResponseImpl) then) =
      __$$UserProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserEntity data});

  @override
  $UserEntityCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserProfileResponseImplCopyWithImpl<$Res>
    extends _$UserProfileResponseCopyWithImpl<$Res, _$UserProfileResponseImpl>
    implements _$$UserProfileResponseImplCopyWith<$Res> {
  __$$UserProfileResponseImplCopyWithImpl(_$UserProfileResponseImpl _value,
      $Res Function(_$UserProfileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserProfileResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileResponseImpl implements _UserProfileResponse {
  const _$UserProfileResponseImpl({required this.data});

  factory _$UserProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileResponseImplFromJson(json);

  @override
  final UserEntity data;

  @override
  String toString() {
    return 'UserProfileResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileResponseImplCopyWith<_$UserProfileResponseImpl> get copyWith =>
      __$$UserProfileResponseImplCopyWithImpl<_$UserProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _UserProfileResponse implements UserProfileResponse {
  const factory _UserProfileResponse({required final UserEntity data}) =
      _$UserProfileResponseImpl;

  factory _UserProfileResponse.fromJson(Map<String, dynamic> json) =
      _$UserProfileResponseImpl.fromJson;

  @override
  UserEntity get data;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileResponseImplCopyWith<_$UserProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPhotoResponse _$UserPhotoResponseFromJson(Map<String, dynamic> json) {
  return _UserPhotoResponse.fromJson(json);
}

/// @nodoc
mixin _$UserPhotoResponse {
  @JsonKey(name: 'full_url')
  String get fullUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPhotoResponseCopyWith<UserPhotoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPhotoResponseCopyWith<$Res> {
  factory $UserPhotoResponseCopyWith(
          UserPhotoResponse value, $Res Function(UserPhotoResponse) then) =
      _$UserPhotoResponseCopyWithImpl<$Res, UserPhotoResponse>;
  @useResult
  $Res call({@JsonKey(name: 'full_url') String fullUrl});
}

/// @nodoc
class _$UserPhotoResponseCopyWithImpl<$Res, $Val extends UserPhotoResponse>
    implements $UserPhotoResponseCopyWith<$Res> {
  _$UserPhotoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullUrl = null,
  }) {
    return _then(_value.copyWith(
      fullUrl: null == fullUrl
          ? _value.fullUrl
          : fullUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPhotoResponseImplCopyWith<$Res>
    implements $UserPhotoResponseCopyWith<$Res> {
  factory _$$UserPhotoResponseImplCopyWith(_$UserPhotoResponseImpl value,
          $Res Function(_$UserPhotoResponseImpl) then) =
      __$$UserPhotoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'full_url') String fullUrl});
}

/// @nodoc
class __$$UserPhotoResponseImplCopyWithImpl<$Res>
    extends _$UserPhotoResponseCopyWithImpl<$Res, _$UserPhotoResponseImpl>
    implements _$$UserPhotoResponseImplCopyWith<$Res> {
  __$$UserPhotoResponseImplCopyWithImpl(_$UserPhotoResponseImpl _value,
      $Res Function(_$UserPhotoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullUrl = null,
  }) {
    return _then(_$UserPhotoResponseImpl(
      fullUrl: null == fullUrl
          ? _value.fullUrl
          : fullUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPhotoResponseImpl implements _UserPhotoResponse {
  const _$UserPhotoResponseImpl(
      {@JsonKey(name: 'full_url') required this.fullUrl});

  factory _$UserPhotoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPhotoResponseImplFromJson(json);

  @override
  @JsonKey(name: 'full_url')
  final String fullUrl;

  @override
  String toString() {
    return 'UserPhotoResponse(fullUrl: $fullUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPhotoResponseImpl &&
            (identical(other.fullUrl, fullUrl) || other.fullUrl == fullUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPhotoResponseImplCopyWith<_$UserPhotoResponseImpl> get copyWith =>
      __$$UserPhotoResponseImplCopyWithImpl<_$UserPhotoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPhotoResponseImplToJson(
      this,
    );
  }
}

abstract class _UserPhotoResponse implements UserPhotoResponse {
  const factory _UserPhotoResponse(
          {@JsonKey(name: 'full_url') required final String fullUrl}) =
      _$UserPhotoResponseImpl;

  factory _UserPhotoResponse.fromJson(Map<String, dynamic> json) =
      _$UserPhotoResponseImpl.fromJson;

  @override
  @JsonKey(name: 'full_url')
  String get fullUrl;
  @override
  @JsonKey(ignore: true)
  _$$UserPhotoResponseImplCopyWith<_$UserPhotoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserScheduleResponse _$UserScheduleResponseFromJson(Map<String, dynamic> json) {
  return _UserScheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$UserScheduleResponse {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month_name')
  String? get monthName => throw _privateConstructorUsedError;
  List<UserSchedule> get schedules => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserScheduleResponseCopyWith<UserScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserScheduleResponseCopyWith<$Res> {
  factory $UserScheduleResponseCopyWith(UserScheduleResponse value,
          $Res Function(UserScheduleResponse) then) =
      _$UserScheduleResponseCopyWithImpl<$Res, UserScheduleResponse>;
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'month_name') String? monthName,
      List<UserSchedule> schedules,
      int total});
}

/// @nodoc
class _$UserScheduleResponseCopyWithImpl<$Res,
        $Val extends UserScheduleResponse>
    implements $UserScheduleResponseCopyWith<$Res> {
  _$UserScheduleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? monthName = freezed,
    Object? schedules = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      monthName: freezed == monthName
          ? _value.monthName
          : monthName // ignore: cast_nullable_to_non_nullable
              as String?,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<UserSchedule>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserScheduleResponseImplCopyWith<$Res>
    implements $UserScheduleResponseCopyWith<$Res> {
  factory _$$UserScheduleResponseImplCopyWith(_$UserScheduleResponseImpl value,
          $Res Function(_$UserScheduleResponseImpl) then) =
      __$$UserScheduleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'month_name') String? monthName,
      List<UserSchedule> schedules,
      int total});
}

/// @nodoc
class __$$UserScheduleResponseImplCopyWithImpl<$Res>
    extends _$UserScheduleResponseCopyWithImpl<$Res, _$UserScheduleResponseImpl>
    implements _$$UserScheduleResponseImplCopyWith<$Res> {
  __$$UserScheduleResponseImplCopyWithImpl(_$UserScheduleResponseImpl _value,
      $Res Function(_$UserScheduleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? monthName = freezed,
    Object? schedules = null,
    Object? total = null,
  }) {
    return _then(_$UserScheduleResponseImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      monthName: freezed == monthName
          ? _value.monthName
          : monthName // ignore: cast_nullable_to_non_nullable
              as String?,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<UserSchedule>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserScheduleResponseImpl implements _UserScheduleResponse {
  const _$UserScheduleResponseImpl(
      {required this.month,
      required this.year,
      @JsonKey(name: 'month_name') this.monthName,
      required final List<UserSchedule> schedules,
      this.total = 0})
      : _schedules = schedules;

  factory _$UserScheduleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserScheduleResponseImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'month_name')
  final String? monthName;
  final List<UserSchedule> _schedules;
  @override
  List<UserSchedule> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'UserScheduleResponse(month: $month, year: $year, monthName: $monthName, schedules: $schedules, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserScheduleResponseImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.monthName, monthName) ||
                other.monthName == monthName) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, year, monthName,
      const DeepCollectionEquality().hash(_schedules), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserScheduleResponseImplCopyWith<_$UserScheduleResponseImpl>
      get copyWith =>
          __$$UserScheduleResponseImplCopyWithImpl<_$UserScheduleResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserScheduleResponseImplToJson(
      this,
    );
  }
}

abstract class _UserScheduleResponse implements UserScheduleResponse {
  const factory _UserScheduleResponse(
      {required final int month,
      required final int year,
      @JsonKey(name: 'month_name') final String? monthName,
      required final List<UserSchedule> schedules,
      final int total}) = _$UserScheduleResponseImpl;

  factory _UserScheduleResponse.fromJson(Map<String, dynamic> json) =
      _$UserScheduleResponseImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'month_name')
  String? get monthName;
  @override
  List<UserSchedule> get schedules;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$UserScheduleResponseImplCopyWith<_$UserScheduleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TodayScheduleResponse _$TodayScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return _TodayScheduleResponse.fromJson(json);
}

/// @nodoc
mixin _$TodayScheduleResponse {
  TodaySchedule get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodayScheduleResponseCopyWith<TodayScheduleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayScheduleResponseCopyWith<$Res> {
  factory $TodayScheduleResponseCopyWith(TodayScheduleResponse value,
          $Res Function(TodayScheduleResponse) then) =
      _$TodayScheduleResponseCopyWithImpl<$Res, TodayScheduleResponse>;
  @useResult
  $Res call({TodaySchedule data});

  $TodayScheduleCopyWith<$Res> get data;
}

/// @nodoc
class _$TodayScheduleResponseCopyWithImpl<$Res,
        $Val extends TodayScheduleResponse>
    implements $TodayScheduleResponseCopyWith<$Res> {
  _$TodayScheduleResponseCopyWithImpl(this._value, this._then);

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
              as TodaySchedule,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodayScheduleCopyWith<$Res> get data {
    return $TodayScheduleCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TodayScheduleResponseImplCopyWith<$Res>
    implements $TodayScheduleResponseCopyWith<$Res> {
  factory _$$TodayScheduleResponseImplCopyWith(
          _$TodayScheduleResponseImpl value,
          $Res Function(_$TodayScheduleResponseImpl) then) =
      __$$TodayScheduleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TodaySchedule data});

  @override
  $TodayScheduleCopyWith<$Res> get data;
}

/// @nodoc
class __$$TodayScheduleResponseImplCopyWithImpl<$Res>
    extends _$TodayScheduleResponseCopyWithImpl<$Res,
        _$TodayScheduleResponseImpl>
    implements _$$TodayScheduleResponseImplCopyWith<$Res> {
  __$$TodayScheduleResponseImplCopyWithImpl(_$TodayScheduleResponseImpl _value,
      $Res Function(_$TodayScheduleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$TodayScheduleResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TodaySchedule,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodayScheduleResponseImpl implements _TodayScheduleResponse {
  const _$TodayScheduleResponseImpl({required this.data});

  factory _$TodayScheduleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayScheduleResponseImplFromJson(json);

  @override
  final TodaySchedule data;

  @override
  String toString() {
    return 'TodayScheduleResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayScheduleResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayScheduleResponseImplCopyWith<_$TodayScheduleResponseImpl>
      get copyWith => __$$TodayScheduleResponseImplCopyWithImpl<
          _$TodayScheduleResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayScheduleResponseImplToJson(
      this,
    );
  }
}

abstract class _TodayScheduleResponse implements TodayScheduleResponse {
  const factory _TodayScheduleResponse({required final TodaySchedule data}) =
      _$TodayScheduleResponseImpl;

  factory _TodayScheduleResponse.fromJson(Map<String, dynamic> json) =
      _$TodayScheduleResponseImpl.fromJson;

  @override
  TodaySchedule get data;
  @override
  @JsonKey(ignore: true)
  _$$TodayScheduleResponseImplCopyWith<_$TodayScheduleResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeaveSummaryResponse _$LeaveSummaryResponseFromJson(Map<String, dynamic> json) {
  return _LeaveSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$LeaveSummaryResponse {
  LeaveSummary get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveSummaryResponseCopyWith<LeaveSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveSummaryResponseCopyWith<$Res> {
  factory $LeaveSummaryResponseCopyWith(LeaveSummaryResponse value,
          $Res Function(LeaveSummaryResponse) then) =
      _$LeaveSummaryResponseCopyWithImpl<$Res, LeaveSummaryResponse>;
  @useResult
  $Res call({LeaveSummary data});

  $LeaveSummaryCopyWith<$Res> get data;
}

/// @nodoc
class _$LeaveSummaryResponseCopyWithImpl<$Res,
        $Val extends LeaveSummaryResponse>
    implements $LeaveSummaryResponseCopyWith<$Res> {
  _$LeaveSummaryResponseCopyWithImpl(this._value, this._then);

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
              as LeaveSummary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeaveSummaryCopyWith<$Res> get data {
    return $LeaveSummaryCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeaveSummaryResponseImplCopyWith<$Res>
    implements $LeaveSummaryResponseCopyWith<$Res> {
  factory _$$LeaveSummaryResponseImplCopyWith(_$LeaveSummaryResponseImpl value,
          $Res Function(_$LeaveSummaryResponseImpl) then) =
      __$$LeaveSummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LeaveSummary data});

  @override
  $LeaveSummaryCopyWith<$Res> get data;
}

/// @nodoc
class __$$LeaveSummaryResponseImplCopyWithImpl<$Res>
    extends _$LeaveSummaryResponseCopyWithImpl<$Res, _$LeaveSummaryResponseImpl>
    implements _$$LeaveSummaryResponseImplCopyWith<$Res> {
  __$$LeaveSummaryResponseImplCopyWithImpl(_$LeaveSummaryResponseImpl _value,
      $Res Function(_$LeaveSummaryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LeaveSummaryResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LeaveSummary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveSummaryResponseImpl implements _LeaveSummaryResponse {
  const _$LeaveSummaryResponseImpl({required this.data});

  factory _$LeaveSummaryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveSummaryResponseImplFromJson(json);

  @override
  final LeaveSummary data;

  @override
  String toString() {
    return 'LeaveSummaryResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveSummaryResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveSummaryResponseImplCopyWith<_$LeaveSummaryResponseImpl>
      get copyWith =>
          __$$LeaveSummaryResponseImplCopyWithImpl<_$LeaveSummaryResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveSummaryResponseImplToJson(
      this,
    );
  }
}

abstract class _LeaveSummaryResponse implements LeaveSummaryResponse {
  const factory _LeaveSummaryResponse({required final LeaveSummary data}) =
      _$LeaveSummaryResponseImpl;

  factory _LeaveSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$LeaveSummaryResponseImpl.fromJson;

  @override
  LeaveSummary get data;
  @override
  @JsonKey(ignore: true)
  _$$LeaveSummaryResponseImplCopyWith<_$LeaveSummaryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FcmTokenRequest _$FcmTokenRequestFromJson(Map<String, dynamic> json) {
  return _FcmTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$FcmTokenRequest {
  @JsonKey(name: 'fcm_token')
  String get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FcmTokenRequestCopyWith<FcmTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmTokenRequestCopyWith<$Res> {
  factory $FcmTokenRequestCopyWith(
          FcmTokenRequest value, $Res Function(FcmTokenRequest) then) =
      _$FcmTokenRequestCopyWithImpl<$Res, FcmTokenRequest>;
  @useResult
  $Res call({@JsonKey(name: 'fcm_token') String fcmToken});
}

/// @nodoc
class _$FcmTokenRequestCopyWithImpl<$Res, $Val extends FcmTokenRequest>
    implements $FcmTokenRequestCopyWith<$Res> {
  _$FcmTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_value.copyWith(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FcmTokenRequestImplCopyWith<$Res>
    implements $FcmTokenRequestCopyWith<$Res> {
  factory _$$FcmTokenRequestImplCopyWith(_$FcmTokenRequestImpl value,
          $Res Function(_$FcmTokenRequestImpl) then) =
      __$$FcmTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'fcm_token') String fcmToken});
}

/// @nodoc
class __$$FcmTokenRequestImplCopyWithImpl<$Res>
    extends _$FcmTokenRequestCopyWithImpl<$Res, _$FcmTokenRequestImpl>
    implements _$$FcmTokenRequestImplCopyWith<$Res> {
  __$$FcmTokenRequestImplCopyWithImpl(
      _$FcmTokenRequestImpl _value, $Res Function(_$FcmTokenRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
  }) {
    return _then(_$FcmTokenRequestImpl(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FcmTokenRequestImpl implements _FcmTokenRequest {
  const _$FcmTokenRequestImpl(
      {@JsonKey(name: 'fcm_token') required this.fcmToken});

  factory _$FcmTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FcmTokenRequestImplFromJson(json);

  @override
  @JsonKey(name: 'fcm_token')
  final String fcmToken;

  @override
  String toString() {
    return 'FcmTokenRequest(fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FcmTokenRequestImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FcmTokenRequestImplCopyWith<_$FcmTokenRequestImpl> get copyWith =>
      __$$FcmTokenRequestImplCopyWithImpl<_$FcmTokenRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FcmTokenRequestImplToJson(
      this,
    );
  }
}

abstract class _FcmTokenRequest implements FcmTokenRequest {
  const factory _FcmTokenRequest(
          {@JsonKey(name: 'fcm_token') required final String fcmToken}) =
      _$FcmTokenRequestImpl;

  factory _FcmTokenRequest.fromJson(Map<String, dynamic> json) =
      _$FcmTokenRequestImpl.fromJson;

  @override
  @JsonKey(name: 'fcm_token')
  String get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$FcmTokenRequestImplCopyWith<_$FcmTokenRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationUpdateRequest _$LocationUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return _LocationUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$LocationUpdateRequest {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationUpdateRequestCopyWith<LocationUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationUpdateRequestCopyWith<$Res> {
  factory $LocationUpdateRequestCopyWith(LocationUpdateRequest value,
          $Res Function(LocationUpdateRequest) then) =
      _$LocationUpdateRequestCopyWithImpl<$Res, LocationUpdateRequest>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$LocationUpdateRequestCopyWithImpl<$Res,
        $Val extends LocationUpdateRequest>
    implements $LocationUpdateRequestCopyWith<$Res> {
  _$LocationUpdateRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$LocationUpdateRequestImplCopyWith<$Res>
    implements $LocationUpdateRequestCopyWith<$Res> {
  factory _$$LocationUpdateRequestImplCopyWith(
          _$LocationUpdateRequestImpl value,
          $Res Function(_$LocationUpdateRequestImpl) then) =
      __$$LocationUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$LocationUpdateRequestImplCopyWithImpl<$Res>
    extends _$LocationUpdateRequestCopyWithImpl<$Res,
        _$LocationUpdateRequestImpl>
    implements _$$LocationUpdateRequestImplCopyWith<$Res> {
  __$$LocationUpdateRequestImplCopyWithImpl(_$LocationUpdateRequestImpl _value,
      $Res Function(_$LocationUpdateRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationUpdateRequestImpl(
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
class _$LocationUpdateRequestImpl implements _LocationUpdateRequest {
  const _$LocationUpdateRequestImpl(
      {required this.latitude, required this.longitude});

  factory _$LocationUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationUpdateRequestImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'LocationUpdateRequest(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationUpdateRequestImpl &&
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
  _$$LocationUpdateRequestImplCopyWith<_$LocationUpdateRequestImpl>
      get copyWith => __$$LocationUpdateRequestImplCopyWithImpl<
          _$LocationUpdateRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _LocationUpdateRequest implements LocationUpdateRequest {
  const factory _LocationUpdateRequest(
      {required final double latitude,
      required final double longitude}) = _$LocationUpdateRequestImpl;

  factory _LocationUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$LocationUpdateRequestImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$LocationUpdateRequestImplCopyWith<_$LocationUpdateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
