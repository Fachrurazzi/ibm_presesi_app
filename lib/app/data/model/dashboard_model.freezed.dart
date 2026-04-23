// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardStatsResponse _$DashboardStatsResponseFromJson(
    Map<String, dynamic> json) {
  return _DashboardStatsResponse.fromJson(json);
}

/// @nodoc
mixin _$DashboardStatsResponse {
  DashboardStats get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardStatsResponseCopyWith<DashboardStatsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsResponseCopyWith<$Res> {
  factory $DashboardStatsResponseCopyWith(DashboardStatsResponse value,
          $Res Function(DashboardStatsResponse) then) =
      _$DashboardStatsResponseCopyWithImpl<$Res, DashboardStatsResponse>;
  @useResult
  $Res call({DashboardStats data});

  $DashboardStatsCopyWith<$Res> get data;
}

/// @nodoc
class _$DashboardStatsResponseCopyWithImpl<$Res,
        $Val extends DashboardStatsResponse>
    implements $DashboardStatsResponseCopyWith<$Res> {
  _$DashboardStatsResponseCopyWithImpl(this._value, this._then);

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
              as DashboardStats,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardStatsCopyWith<$Res> get data {
    return $DashboardStatsCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStatsResponseImplCopyWith<$Res>
    implements $DashboardStatsResponseCopyWith<$Res> {
  factory _$$DashboardStatsResponseImplCopyWith(
          _$DashboardStatsResponseImpl value,
          $Res Function(_$DashboardStatsResponseImpl) then) =
      __$$DashboardStatsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardStats data});

  @override
  $DashboardStatsCopyWith<$Res> get data;
}

/// @nodoc
class __$$DashboardStatsResponseImplCopyWithImpl<$Res>
    extends _$DashboardStatsResponseCopyWithImpl<$Res,
        _$DashboardStatsResponseImpl>
    implements _$$DashboardStatsResponseImplCopyWith<$Res> {
  __$$DashboardStatsResponseImplCopyWithImpl(
      _$DashboardStatsResponseImpl _value,
      $Res Function(_$DashboardStatsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$DashboardStatsResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashboardStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsResponseImpl implements _DashboardStatsResponse {
  const _$DashboardStatsResponseImpl({required this.data});

  factory _$DashboardStatsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsResponseImplFromJson(json);

  @override
  final DashboardStats data;

  @override
  String toString() {
    return 'DashboardStatsResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsResponseImplCopyWith<_$DashboardStatsResponseImpl>
      get copyWith => __$$DashboardStatsResponseImplCopyWithImpl<
          _$DashboardStatsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsResponseImplToJson(
      this,
    );
  }
}

abstract class _DashboardStatsResponse implements DashboardStatsResponse {
  const factory _DashboardStatsResponse({required final DashboardStats data}) =
      _$DashboardStatsResponseImpl;

  factory _DashboardStatsResponse.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsResponseImpl.fromJson;

  @override
  DashboardStats get data;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStatsResponseImplCopyWith<_$DashboardStatsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MonthlySummaryResponse _$MonthlySummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _MonthlySummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$MonthlySummaryResponse {
  MonthlySummary get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlySummaryResponseCopyWith<MonthlySummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySummaryResponseCopyWith<$Res> {
  factory $MonthlySummaryResponseCopyWith(MonthlySummaryResponse value,
          $Res Function(MonthlySummaryResponse) then) =
      _$MonthlySummaryResponseCopyWithImpl<$Res, MonthlySummaryResponse>;
  @useResult
  $Res call({MonthlySummary data});

  $MonthlySummaryCopyWith<$Res> get data;
}

/// @nodoc
class _$MonthlySummaryResponseCopyWithImpl<$Res,
        $Val extends MonthlySummaryResponse>
    implements $MonthlySummaryResponseCopyWith<$Res> {
  _$MonthlySummaryResponseCopyWithImpl(this._value, this._then);

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
              as MonthlySummary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MonthlySummaryCopyWith<$Res> get data {
    return $MonthlySummaryCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonthlySummaryResponseImplCopyWith<$Res>
    implements $MonthlySummaryResponseCopyWith<$Res> {
  factory _$$MonthlySummaryResponseImplCopyWith(
          _$MonthlySummaryResponseImpl value,
          $Res Function(_$MonthlySummaryResponseImpl) then) =
      __$$MonthlySummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MonthlySummary data});

  @override
  $MonthlySummaryCopyWith<$Res> get data;
}

/// @nodoc
class __$$MonthlySummaryResponseImplCopyWithImpl<$Res>
    extends _$MonthlySummaryResponseCopyWithImpl<$Res,
        _$MonthlySummaryResponseImpl>
    implements _$$MonthlySummaryResponseImplCopyWith<$Res> {
  __$$MonthlySummaryResponseImplCopyWithImpl(
      _$MonthlySummaryResponseImpl _value,
      $Res Function(_$MonthlySummaryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MonthlySummaryResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MonthlySummary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlySummaryResponseImpl implements _MonthlySummaryResponse {
  const _$MonthlySummaryResponseImpl({required this.data});

  factory _$MonthlySummaryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlySummaryResponseImplFromJson(json);

  @override
  final MonthlySummary data;

  @override
  String toString() {
    return 'MonthlySummaryResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySummaryResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySummaryResponseImplCopyWith<_$MonthlySummaryResponseImpl>
      get copyWith => __$$MonthlySummaryResponseImplCopyWithImpl<
          _$MonthlySummaryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlySummaryResponseImplToJson(
      this,
    );
  }
}

abstract class _MonthlySummaryResponse implements MonthlySummaryResponse {
  const factory _MonthlySummaryResponse({required final MonthlySummary data}) =
      _$MonthlySummaryResponseImpl;

  factory _MonthlySummaryResponse.fromJson(Map<String, dynamic> json) =
      _$MonthlySummaryResponseImpl.fromJson;

  @override
  MonthlySummary get data;
  @override
  @JsonKey(ignore: true)
  _$$MonthlySummaryResponseImplCopyWith<_$MonthlySummaryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RecentActivitiesResponse _$RecentActivitiesResponseFromJson(
    Map<String, dynamic> json) {
  return _RecentActivitiesResponse.fromJson(json);
}

/// @nodoc
mixin _$RecentActivitiesResponse {
  List<RecentActivity> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentActivitiesResponseCopyWith<RecentActivitiesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentActivitiesResponseCopyWith<$Res> {
  factory $RecentActivitiesResponseCopyWith(RecentActivitiesResponse value,
          $Res Function(RecentActivitiesResponse) then) =
      _$RecentActivitiesResponseCopyWithImpl<$Res, RecentActivitiesResponse>;
  @useResult
  $Res call({List<RecentActivity> data});
}

/// @nodoc
class _$RecentActivitiesResponseCopyWithImpl<$Res,
        $Val extends RecentActivitiesResponse>
    implements $RecentActivitiesResponseCopyWith<$Res> {
  _$RecentActivitiesResponseCopyWithImpl(this._value, this._then);

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
              as List<RecentActivity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentActivitiesResponseImplCopyWith<$Res>
    implements $RecentActivitiesResponseCopyWith<$Res> {
  factory _$$RecentActivitiesResponseImplCopyWith(
          _$RecentActivitiesResponseImpl value,
          $Res Function(_$RecentActivitiesResponseImpl) then) =
      __$$RecentActivitiesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecentActivity> data});
}

/// @nodoc
class __$$RecentActivitiesResponseImplCopyWithImpl<$Res>
    extends _$RecentActivitiesResponseCopyWithImpl<$Res,
        _$RecentActivitiesResponseImpl>
    implements _$$RecentActivitiesResponseImplCopyWith<$Res> {
  __$$RecentActivitiesResponseImplCopyWithImpl(
      _$RecentActivitiesResponseImpl _value,
      $Res Function(_$RecentActivitiesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$RecentActivitiesResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RecentActivity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentActivitiesResponseImpl implements _RecentActivitiesResponse {
  const _$RecentActivitiesResponseImpl(
      {required final List<RecentActivity> data})
      : _data = data;

  factory _$RecentActivitiesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentActivitiesResponseImplFromJson(json);

  final List<RecentActivity> _data;
  @override
  List<RecentActivity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'RecentActivitiesResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentActivitiesResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentActivitiesResponseImplCopyWith<_$RecentActivitiesResponseImpl>
      get copyWith => __$$RecentActivitiesResponseImplCopyWithImpl<
          _$RecentActivitiesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentActivitiesResponseImplToJson(
      this,
    );
  }
}

abstract class _RecentActivitiesResponse implements RecentActivitiesResponse {
  const factory _RecentActivitiesResponse(
          {required final List<RecentActivity> data}) =
      _$RecentActivitiesResponseImpl;

  factory _RecentActivitiesResponse.fromJson(Map<String, dynamic> json) =
      _$RecentActivitiesResponseImpl.fromJson;

  @override
  List<RecentActivity> get data;
  @override
  @JsonKey(ignore: true)
  _$$RecentActivitiesResponseImplCopyWith<_$RecentActivitiesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
