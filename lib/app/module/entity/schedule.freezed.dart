// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleEntity _$ScheduleEntityFromJson(Map<String, dynamic> json) {
  return _ScheduleEntity.fromJson(json);
}

/// @nodoc
mixin _$ScheduleEntity {
  int get id => throw _privateConstructorUsedError;
  ScheduleUser get user => throw _privateConstructorUsedError;
  ShiftInfo get shift => throw _privateConstructorUsedError;
  OfficeInfo get office => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_range')
  String? get dateRange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleEntityCopyWith<ScheduleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleEntityCopyWith<$Res> {
  factory $ScheduleEntityCopyWith(
          ScheduleEntity value, $Res Function(ScheduleEntity) then) =
      _$ScheduleEntityCopyWithImpl<$Res, ScheduleEntity>;
  @useResult
  $Res call(
      {int id,
      ScheduleUser user,
      ShiftInfo shift,
      OfficeInfo office,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'date_range') String? dateRange});

  $ScheduleUserCopyWith<$Res> get user;
  $ShiftInfoCopyWith<$Res> get shift;
  $OfficeInfoCopyWith<$Res> get office;
}

/// @nodoc
class _$ScheduleEntityCopyWithImpl<$Res, $Val extends ScheduleEntity>
    implements $ScheduleEntityCopyWith<$Res> {
  _$ScheduleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? shift = null,
    Object? office = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isWfa = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
    Object? isActive = null,
    Object? dateRange = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ScheduleUser,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo,
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
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleUserCopyWith<$Res> get user {
    return $ScheduleUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShiftInfoCopyWith<$Res> get shift {
    return $ShiftInfoCopyWith<$Res>(_value.shift, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OfficeInfoCopyWith<$Res> get office {
    return $OfficeInfoCopyWith<$Res>(_value.office, (value) {
      return _then(_value.copyWith(office: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduleEntityImplCopyWith<$Res>
    implements $ScheduleEntityCopyWith<$Res> {
  factory _$$ScheduleEntityImplCopyWith(_$ScheduleEntityImpl value,
          $Res Function(_$ScheduleEntityImpl) then) =
      __$$ScheduleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      ScheduleUser user,
      ShiftInfo shift,
      OfficeInfo office,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      @JsonKey(name: 'is_wfa') bool isWfa,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'date_range') String? dateRange});

  @override
  $ScheduleUserCopyWith<$Res> get user;
  @override
  $ShiftInfoCopyWith<$Res> get shift;
  @override
  $OfficeInfoCopyWith<$Res> get office;
}

/// @nodoc
class __$$ScheduleEntityImplCopyWithImpl<$Res>
    extends _$ScheduleEntityCopyWithImpl<$Res, _$ScheduleEntityImpl>
    implements _$$ScheduleEntityImplCopyWith<$Res> {
  __$$ScheduleEntityImplCopyWithImpl(
      _$ScheduleEntityImpl _value, $Res Function(_$ScheduleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? shift = null,
    Object? office = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isWfa = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
    Object? isActive = null,
    Object? dateRange = freezed,
  }) {
    return _then(_$ScheduleEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ScheduleUser,
      shift: null == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as ShiftInfo,
      office: null == office
          ? _value.office
          : office // ignore: cast_nullable_to_non_nullable
              as OfficeInfo,
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
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleEntityImpl implements _ScheduleEntity {
  const _$ScheduleEntityImpl(
      {required this.id,
      required this.user,
      required this.shift,
      required this.office,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'is_wfa') this.isWfa = false,
      @JsonKey(name: 'is_banned') this.isBanned = false,
      @JsonKey(name: 'banned_reason') this.bannedReason,
      @JsonKey(name: 'is_active') this.isActive = false,
      @JsonKey(name: 'date_range') this.dateRange});

  factory _$ScheduleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleEntityImplFromJson(json);

  @override
  final int id;
  @override
  final ScheduleUser user;
  @override
  final ShiftInfo shift;
  @override
  final OfficeInfo office;
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
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'date_range')
  final String? dateRange;

  @override
  String toString() {
    return 'ScheduleEntity(id: $id, user: $user, shift: $shift, office: $office, startDate: $startDate, endDate: $endDate, isWfa: $isWfa, isBanned: $isBanned, bannedReason: $bannedReason, isActive: $isActive, dateRange: $dateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.office, office) || other.office == office) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.bannedReason, bannedReason) ||
                other.bannedReason == bannedReason) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, shift, office,
      startDate, endDate, isWfa, isBanned, bannedReason, isActive, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleEntityImplCopyWith<_$ScheduleEntityImpl> get copyWith =>
      __$$ScheduleEntityImplCopyWithImpl<_$ScheduleEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleEntityImplToJson(
      this,
    );
  }
}

abstract class _ScheduleEntity implements ScheduleEntity {
  const factory _ScheduleEntity(
          {required final int id,
          required final ScheduleUser user,
          required final ShiftInfo shift,
          required final OfficeInfo office,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') final String? endDate,
          @JsonKey(name: 'is_wfa') final bool isWfa,
          @JsonKey(name: 'is_banned') final bool isBanned,
          @JsonKey(name: 'banned_reason') final String? bannedReason,
          @JsonKey(name: 'is_active') final bool isActive,
          @JsonKey(name: 'date_range') final String? dateRange}) =
      _$ScheduleEntityImpl;

  factory _ScheduleEntity.fromJson(Map<String, dynamic> json) =
      _$ScheduleEntityImpl.fromJson;

  @override
  int get id;
  @override
  ScheduleUser get user;
  @override
  ShiftInfo get shift;
  @override
  OfficeInfo get office;
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
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'date_range')
  String? get dateRange;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleEntityImplCopyWith<_$ScheduleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduleUser _$ScheduleUserFromJson(Map<String, dynamic> json) {
  return _ScheduleUser.fromJson(json);
}

/// @nodoc
mixin _$ScheduleUser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleUserCopyWith<ScheduleUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleUserCopyWith<$Res> {
  factory $ScheduleUserCopyWith(
          ScheduleUser value, $Res Function(ScheduleUser) then) =
      _$ScheduleUserCopyWithImpl<$Res, ScheduleUser>;
  @useResult
  $Res call({int id, String name, String? position});
}

/// @nodoc
class _$ScheduleUserCopyWithImpl<$Res, $Val extends ScheduleUser>
    implements $ScheduleUserCopyWith<$Res> {
  _$ScheduleUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleUserImplCopyWith<$Res>
    implements $ScheduleUserCopyWith<$Res> {
  factory _$$ScheduleUserImplCopyWith(
          _$ScheduleUserImpl value, $Res Function(_$ScheduleUserImpl) then) =
      __$$ScheduleUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? position});
}

/// @nodoc
class __$$ScheduleUserImplCopyWithImpl<$Res>
    extends _$ScheduleUserCopyWithImpl<$Res, _$ScheduleUserImpl>
    implements _$$ScheduleUserImplCopyWith<$Res> {
  __$$ScheduleUserImplCopyWithImpl(
      _$ScheduleUserImpl _value, $Res Function(_$ScheduleUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? position = freezed,
  }) {
    return _then(_$ScheduleUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleUserImpl implements _ScheduleUser {
  const _$ScheduleUserImpl(
      {required this.id, required this.name, this.position});

  factory _$ScheduleUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleUserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? position;

  @override
  String toString() {
    return 'ScheduleUser(id: $id, name: $name, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleUserImplCopyWith<_$ScheduleUserImpl> get copyWith =>
      __$$ScheduleUserImplCopyWithImpl<_$ScheduleUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleUserImplToJson(
      this,
    );
  }
}

abstract class _ScheduleUser implements ScheduleUser {
  const factory _ScheduleUser(
      {required final int id,
      required final String name,
      final String? position}) = _$ScheduleUserImpl;

  factory _ScheduleUser.fromJson(Map<String, dynamic> json) =
      _$ScheduleUserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get position;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleUserImplCopyWith<_$ScheduleUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedSchedule _$PaginatedScheduleFromJson(Map<String, dynamic> json) {
  return _PaginatedSchedule.fromJson(json);
}

/// @nodoc
mixin _$PaginatedSchedule {
  List<ScheduleEntity> get data => throw _privateConstructorUsedError;
  SchedulePaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedScheduleCopyWith<PaginatedSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedScheduleCopyWith<$Res> {
  factory $PaginatedScheduleCopyWith(
          PaginatedSchedule value, $Res Function(PaginatedSchedule) then) =
      _$PaginatedScheduleCopyWithImpl<$Res, PaginatedSchedule>;
  @useResult
  $Res call({List<ScheduleEntity> data, SchedulePaginationMeta meta});

  $SchedulePaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedScheduleCopyWithImpl<$Res, $Val extends PaginatedSchedule>
    implements $PaginatedScheduleCopyWith<$Res> {
  _$PaginatedScheduleCopyWithImpl(this._value, this._then);

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
abstract class _$$PaginatedScheduleImplCopyWith<$Res>
    implements $PaginatedScheduleCopyWith<$Res> {
  factory _$$PaginatedScheduleImplCopyWith(_$PaginatedScheduleImpl value,
          $Res Function(_$PaginatedScheduleImpl) then) =
      __$$PaginatedScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScheduleEntity> data, SchedulePaginationMeta meta});

  @override
  $SchedulePaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedScheduleImplCopyWithImpl<$Res>
    extends _$PaginatedScheduleCopyWithImpl<$Res, _$PaginatedScheduleImpl>
    implements _$$PaginatedScheduleImplCopyWith<$Res> {
  __$$PaginatedScheduleImplCopyWithImpl(_$PaginatedScheduleImpl _value,
      $Res Function(_$PaginatedScheduleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedScheduleImpl(
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
class _$PaginatedScheduleImpl implements _PaginatedSchedule {
  const _$PaginatedScheduleImpl(
      {required final List<ScheduleEntity> data, required this.meta})
      : _data = data;

  factory _$PaginatedScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedScheduleImplFromJson(json);

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
    return 'PaginatedSchedule(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedScheduleImpl &&
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
  _$$PaginatedScheduleImplCopyWith<_$PaginatedScheduleImpl> get copyWith =>
      __$$PaginatedScheduleImplCopyWithImpl<_$PaginatedScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedScheduleImplToJson(
      this,
    );
  }
}

abstract class _PaginatedSchedule implements PaginatedSchedule {
  const factory _PaginatedSchedule(
      {required final List<ScheduleEntity> data,
      required final SchedulePaginationMeta meta}) = _$PaginatedScheduleImpl;

  factory _PaginatedSchedule.fromJson(Map<String, dynamic> json) =
      _$PaginatedScheduleImpl.fromJson;

  @override
  List<ScheduleEntity> get data;
  @override
  SchedulePaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedScheduleImplCopyWith<_$PaginatedScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SchedulePaginationMeta _$SchedulePaginationMetaFromJson(
    Map<String, dynamic> json) {
  return _SchedulePaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$SchedulePaginationMeta {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchedulePaginationMetaCopyWith<SchedulePaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchedulePaginationMetaCopyWith<$Res> {
  factory $SchedulePaginationMetaCopyWith(SchedulePaginationMeta value,
          $Res Function(SchedulePaginationMeta) then) =
      _$SchedulePaginationMetaCopyWithImpl<$Res, SchedulePaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class _$SchedulePaginationMetaCopyWithImpl<$Res,
        $Val extends SchedulePaginationMeta>
    implements $SchedulePaginationMetaCopyWith<$Res> {
  _$SchedulePaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? lastPage = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SchedulePaginationMetaImplCopyWith<$Res>
    implements $SchedulePaginationMetaCopyWith<$Res> {
  factory _$$SchedulePaginationMetaImplCopyWith(
          _$SchedulePaginationMetaImpl value,
          $Res Function(_$SchedulePaginationMetaImpl) then) =
      __$$SchedulePaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class __$$SchedulePaginationMetaImplCopyWithImpl<$Res>
    extends _$SchedulePaginationMetaCopyWithImpl<$Res,
        _$SchedulePaginationMetaImpl>
    implements _$$SchedulePaginationMetaImplCopyWith<$Res> {
  __$$SchedulePaginationMetaImplCopyWithImpl(
      _$SchedulePaginationMetaImpl _value,
      $Res Function(_$SchedulePaginationMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? lastPage = null,
  }) {
    return _then(_$SchedulePaginationMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SchedulePaginationMetaImpl implements _SchedulePaginationMeta {
  const _$SchedulePaginationMetaImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 10,
      this.total = 0,
      @JsonKey(name: 'last_page') this.lastPage = 1});

  factory _$SchedulePaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$SchedulePaginationMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;

  @override
  String toString() {
    return 'SchedulePaginationMeta(currentPage: $currentPage, perPage: $perPage, total: $total, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchedulePaginationMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, perPage, total, lastPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchedulePaginationMetaImplCopyWith<_$SchedulePaginationMetaImpl>
      get copyWith => __$$SchedulePaginationMetaImplCopyWithImpl<
          _$SchedulePaginationMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SchedulePaginationMetaImplToJson(
      this,
    );
  }
}

abstract class _SchedulePaginationMeta implements SchedulePaginationMeta {
  const factory _SchedulePaginationMeta(
          {@JsonKey(name: 'current_page') final int currentPage,
          @JsonKey(name: 'per_page') final int perPage,
          final int total,
          @JsonKey(name: 'last_page') final int lastPage}) =
      _$SchedulePaginationMetaImpl;

  factory _SchedulePaginationMeta.fromJson(Map<String, dynamic> json) =
      _$SchedulePaginationMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get total;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(ignore: true)
  _$$SchedulePaginationMetaImplCopyWith<_$SchedulePaginationMetaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
