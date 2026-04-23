// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) {
  return _DashboardStats.fromJson(json);
}

/// @nodoc
mixin _$DashboardStats {
  DashboardUser get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'today_info')
  TodayInfo get todayInfo => throw _privateConstructorUsedError;
  DashboardStatsData get stats => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_today')
  ScheduleToday? get scheduleToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_today')
  AttendanceToday? get attendanceToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_check_in')
  bool get canCheckIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_check_out')
  bool get canCheckOut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
          DashboardStats value, $Res Function(DashboardStats) then) =
      _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call(
      {DashboardUser user,
      @JsonKey(name: 'today_info') TodayInfo todayInfo,
      DashboardStatsData stats,
      @JsonKey(name: 'schedule_today') ScheduleToday? scheduleToday,
      @JsonKey(name: 'attendance_today') AttendanceToday? attendanceToday,
      @JsonKey(name: 'can_check_in') bool canCheckIn,
      @JsonKey(name: 'can_check_out') bool canCheckOut});

  $DashboardUserCopyWith<$Res> get user;
  $TodayInfoCopyWith<$Res> get todayInfo;
  $DashboardStatsDataCopyWith<$Res> get stats;
  $ScheduleTodayCopyWith<$Res>? get scheduleToday;
  $AttendanceTodayCopyWith<$Res>? get attendanceToday;
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? todayInfo = null,
    Object? stats = null,
    Object? scheduleToday = freezed,
    Object? attendanceToday = freezed,
    Object? canCheckIn = null,
    Object? canCheckOut = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DashboardUser,
      todayInfo: null == todayInfo
          ? _value.todayInfo
          : todayInfo // ignore: cast_nullable_to_non_nullable
              as TodayInfo,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStatsData,
      scheduleToday: freezed == scheduleToday
          ? _value.scheduleToday
          : scheduleToday // ignore: cast_nullable_to_non_nullable
              as ScheduleToday?,
      attendanceToday: freezed == attendanceToday
          ? _value.attendanceToday
          : attendanceToday // ignore: cast_nullable_to_non_nullable
              as AttendanceToday?,
      canCheckIn: null == canCheckIn
          ? _value.canCheckIn
          : canCheckIn // ignore: cast_nullable_to_non_nullable
              as bool,
      canCheckOut: null == canCheckOut
          ? _value.canCheckOut
          : canCheckOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardUserCopyWith<$Res> get user {
    return $DashboardUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TodayInfoCopyWith<$Res> get todayInfo {
    return $TodayInfoCopyWith<$Res>(_value.todayInfo, (value) {
      return _then(_value.copyWith(todayInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardStatsDataCopyWith<$Res> get stats {
    return $DashboardStatsDataCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleTodayCopyWith<$Res>? get scheduleToday {
    if (_value.scheduleToday == null) {
      return null;
    }

    return $ScheduleTodayCopyWith<$Res>(_value.scheduleToday!, (value) {
      return _then(_value.copyWith(scheduleToday: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AttendanceTodayCopyWith<$Res>? get attendanceToday {
    if (_value.attendanceToday == null) {
      return null;
    }

    return $AttendanceTodayCopyWith<$Res>(_value.attendanceToday!, (value) {
      return _then(_value.copyWith(attendanceToday: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardStatsImplCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$DashboardStatsImplCopyWith(_$DashboardStatsImpl value,
          $Res Function(_$DashboardStatsImpl) then) =
      __$$DashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DashboardUser user,
      @JsonKey(name: 'today_info') TodayInfo todayInfo,
      DashboardStatsData stats,
      @JsonKey(name: 'schedule_today') ScheduleToday? scheduleToday,
      @JsonKey(name: 'attendance_today') AttendanceToday? attendanceToday,
      @JsonKey(name: 'can_check_in') bool canCheckIn,
      @JsonKey(name: 'can_check_out') bool canCheckOut});

  @override
  $DashboardUserCopyWith<$Res> get user;
  @override
  $TodayInfoCopyWith<$Res> get todayInfo;
  @override
  $DashboardStatsDataCopyWith<$Res> get stats;
  @override
  $ScheduleTodayCopyWith<$Res>? get scheduleToday;
  @override
  $AttendanceTodayCopyWith<$Res>? get attendanceToday;
}

/// @nodoc
class __$$DashboardStatsImplCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$DashboardStatsImpl>
    implements _$$DashboardStatsImplCopyWith<$Res> {
  __$$DashboardStatsImplCopyWithImpl(
      _$DashboardStatsImpl _value, $Res Function(_$DashboardStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? todayInfo = null,
    Object? stats = null,
    Object? scheduleToday = freezed,
    Object? attendanceToday = freezed,
    Object? canCheckIn = null,
    Object? canCheckOut = null,
  }) {
    return _then(_$DashboardStatsImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as DashboardUser,
      todayInfo: null == todayInfo
          ? _value.todayInfo
          : todayInfo // ignore: cast_nullable_to_non_nullable
              as TodayInfo,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as DashboardStatsData,
      scheduleToday: freezed == scheduleToday
          ? _value.scheduleToday
          : scheduleToday // ignore: cast_nullable_to_non_nullable
              as ScheduleToday?,
      attendanceToday: freezed == attendanceToday
          ? _value.attendanceToday
          : attendanceToday // ignore: cast_nullable_to_non_nullable
              as AttendanceToday?,
      canCheckIn: null == canCheckIn
          ? _value.canCheckIn
          : canCheckIn // ignore: cast_nullable_to_non_nullable
              as bool,
      canCheckOut: null == canCheckOut
          ? _value.canCheckOut
          : canCheckOut // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsImpl implements _DashboardStats {
  const _$DashboardStatsImpl(
      {required this.user,
      @JsonKey(name: 'today_info') required this.todayInfo,
      required this.stats,
      @JsonKey(name: 'schedule_today') this.scheduleToday,
      @JsonKey(name: 'attendance_today') this.attendanceToday,
      @JsonKey(name: 'can_check_in') this.canCheckIn = false,
      @JsonKey(name: 'can_check_out') this.canCheckOut = false});

  factory _$DashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsImplFromJson(json);

  @override
  final DashboardUser user;
  @override
  @JsonKey(name: 'today_info')
  final TodayInfo todayInfo;
  @override
  final DashboardStatsData stats;
  @override
  @JsonKey(name: 'schedule_today')
  final ScheduleToday? scheduleToday;
  @override
  @JsonKey(name: 'attendance_today')
  final AttendanceToday? attendanceToday;
  @override
  @JsonKey(name: 'can_check_in')
  final bool canCheckIn;
  @override
  @JsonKey(name: 'can_check_out')
  final bool canCheckOut;

  @override
  String toString() {
    return 'DashboardStats(user: $user, todayInfo: $todayInfo, stats: $stats, scheduleToday: $scheduleToday, attendanceToday: $attendanceToday, canCheckIn: $canCheckIn, canCheckOut: $canCheckOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.todayInfo, todayInfo) ||
                other.todayInfo == todayInfo) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.scheduleToday, scheduleToday) ||
                other.scheduleToday == scheduleToday) &&
            (identical(other.attendanceToday, attendanceToday) ||
                other.attendanceToday == attendanceToday) &&
            (identical(other.canCheckIn, canCheckIn) ||
                other.canCheckIn == canCheckIn) &&
            (identical(other.canCheckOut, canCheckOut) ||
                other.canCheckOut == canCheckOut));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, todayInfo, stats,
      scheduleToday, attendanceToday, canCheckIn, canCheckOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      __$$DashboardStatsImplCopyWithImpl<_$DashboardStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsImplToJson(
      this,
    );
  }
}

abstract class _DashboardStats implements DashboardStats {
  const factory _DashboardStats(
      {required final DashboardUser user,
      @JsonKey(name: 'today_info') required final TodayInfo todayInfo,
      required final DashboardStatsData stats,
      @JsonKey(name: 'schedule_today') final ScheduleToday? scheduleToday,
      @JsonKey(name: 'attendance_today') final AttendanceToday? attendanceToday,
      @JsonKey(name: 'can_check_in') final bool canCheckIn,
      @JsonKey(name: 'can_check_out')
      final bool canCheckOut}) = _$DashboardStatsImpl;

  factory _DashboardStats.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsImpl.fromJson;

  @override
  DashboardUser get user;
  @override
  @JsonKey(name: 'today_info')
  TodayInfo get todayInfo;
  @override
  DashboardStatsData get stats;
  @override
  @JsonKey(name: 'schedule_today')
  ScheduleToday? get scheduleToday;
  @override
  @JsonKey(name: 'attendance_today')
  AttendanceToday? get attendanceToday;
  @override
  @JsonKey(name: 'can_check_in')
  bool get canCheckIn;
  @override
  @JsonKey(name: 'can_check_out')
  bool get canCheckOut;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardUser _$DashboardUserFromJson(Map<String, dynamic> json) {
  return _DashboardUser.fromJson(json);
}

/// @nodoc
mixin _$DashboardUser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'join_date')
  String? get joinDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardUserCopyWith<DashboardUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardUserCopyWith<$Res> {
  factory $DashboardUserCopyWith(
          DashboardUser value, $Res Function(DashboardUser) then) =
      _$DashboardUserCopyWithImpl<$Res, DashboardUser>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? position,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'join_date') String? joinDate});
}

/// @nodoc
class _$DashboardUserCopyWithImpl<$Res, $Val extends DashboardUser>
    implements $DashboardUserCopyWith<$Res> {
  _$DashboardUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? position = freezed,
    Object? avatarUrl = freezed,
    Object? joinDate = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardUserImplCopyWith<$Res>
    implements $DashboardUserCopyWith<$Res> {
  factory _$$DashboardUserImplCopyWith(
          _$DashboardUserImpl value, $Res Function(_$DashboardUserImpl) then) =
      __$$DashboardUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? position,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'join_date') String? joinDate});
}

/// @nodoc
class __$$DashboardUserImplCopyWithImpl<$Res>
    extends _$DashboardUserCopyWithImpl<$Res, _$DashboardUserImpl>
    implements _$$DashboardUserImplCopyWith<$Res> {
  __$$DashboardUserImplCopyWithImpl(
      _$DashboardUserImpl _value, $Res Function(_$DashboardUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? position = freezed,
    Object? avatarUrl = freezed,
    Object? joinDate = freezed,
  }) {
    return _then(_$DashboardUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardUserImpl implements _DashboardUser {
  const _$DashboardUserImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.position,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'join_date') this.joinDate});

  factory _$DashboardUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardUserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? position;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'join_date')
  final String? joinDate;

  @override
  String toString() {
    return 'DashboardUser(id: $id, name: $name, email: $email, position: $position, avatarUrl: $avatarUrl, joinDate: $joinDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, position, avatarUrl, joinDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardUserImplCopyWith<_$DashboardUserImpl> get copyWith =>
      __$$DashboardUserImplCopyWithImpl<_$DashboardUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardUserImplToJson(
      this,
    );
  }
}

abstract class _DashboardUser implements DashboardUser {
  const factory _DashboardUser(
          {required final int id,
          required final String name,
          required final String email,
          final String? position,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          @JsonKey(name: 'join_date') final String? joinDate}) =
      _$DashboardUserImpl;

  factory _DashboardUser.fromJson(Map<String, dynamic> json) =
      _$DashboardUserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get position;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'join_date')
  String? get joinDate;
  @override
  @JsonKey(ignore: true)
  _$$DashboardUserImplCopyWith<_$DashboardUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodayInfo _$TodayInfoFromJson(Map<String, dynamic> json) {
  return _TodayInfo.fromJson(json);
}

/// @nodoc
mixin _$TodayInfo {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_name')
  String get dayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_working_day')
  bool get isWorkingDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_schedule')
  bool get hasSchedule => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_banned')
  bool get isBanned => throw _privateConstructorUsedError;
  @JsonKey(name: 'banned_reason')
  String? get bannedReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodayInfoCopyWith<TodayInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayInfoCopyWith<$Res> {
  factory $TodayInfoCopyWith(TodayInfo value, $Res Function(TodayInfo) then) =
      _$TodayInfoCopyWithImpl<$Res, TodayInfo>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'day_name') String dayName,
      @JsonKey(name: 'is_working_day') bool isWorkingDay,
      @JsonKey(name: 'has_schedule') bool hasSchedule,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason});
}

/// @nodoc
class _$TodayInfoCopyWithImpl<$Res, $Val extends TodayInfo>
    implements $TodayInfoCopyWith<$Res> {
  _$TodayInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayName = null,
    Object? isWorkingDay = null,
    Object? hasSchedule = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dayName: null == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String,
      isWorkingDay: null == isWorkingDay
          ? _value.isWorkingDay
          : isWorkingDay // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSchedule: null == hasSchedule
          ? _value.hasSchedule
          : hasSchedule // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TodayInfoImplCopyWith<$Res>
    implements $TodayInfoCopyWith<$Res> {
  factory _$$TodayInfoImplCopyWith(
          _$TodayInfoImpl value, $Res Function(_$TodayInfoImpl) then) =
      __$$TodayInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'day_name') String dayName,
      @JsonKey(name: 'is_working_day') bool isWorkingDay,
      @JsonKey(name: 'has_schedule') bool hasSchedule,
      @JsonKey(name: 'is_banned') bool isBanned,
      @JsonKey(name: 'banned_reason') String? bannedReason});
}

/// @nodoc
class __$$TodayInfoImplCopyWithImpl<$Res>
    extends _$TodayInfoCopyWithImpl<$Res, _$TodayInfoImpl>
    implements _$$TodayInfoImplCopyWith<$Res> {
  __$$TodayInfoImplCopyWithImpl(
      _$TodayInfoImpl _value, $Res Function(_$TodayInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayName = null,
    Object? isWorkingDay = null,
    Object? hasSchedule = null,
    Object? isBanned = null,
    Object? bannedReason = freezed,
  }) {
    return _then(_$TodayInfoImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      dayName: null == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String,
      isWorkingDay: null == isWorkingDay
          ? _value.isWorkingDay
          : isWorkingDay // ignore: cast_nullable_to_non_nullable
              as bool,
      hasSchedule: null == hasSchedule
          ? _value.hasSchedule
          : hasSchedule // ignore: cast_nullable_to_non_nullable
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
class _$TodayInfoImpl implements _TodayInfo {
  const _$TodayInfoImpl(
      {required this.date,
      @JsonKey(name: 'day_name') required this.dayName,
      @JsonKey(name: 'is_working_day') this.isWorkingDay = false,
      @JsonKey(name: 'has_schedule') this.hasSchedule = false,
      @JsonKey(name: 'is_banned') this.isBanned = false,
      @JsonKey(name: 'banned_reason') this.bannedReason});

  factory _$TodayInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayInfoImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'day_name')
  final String dayName;
  @override
  @JsonKey(name: 'is_working_day')
  final bool isWorkingDay;
  @override
  @JsonKey(name: 'has_schedule')
  final bool hasSchedule;
  @override
  @JsonKey(name: 'is_banned')
  final bool isBanned;
  @override
  @JsonKey(name: 'banned_reason')
  final String? bannedReason;

  @override
  String toString() {
    return 'TodayInfo(date: $date, dayName: $dayName, isWorkingDay: $isWorkingDay, hasSchedule: $hasSchedule, isBanned: $isBanned, bannedReason: $bannedReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayInfoImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.isWorkingDay, isWorkingDay) ||
                other.isWorkingDay == isWorkingDay) &&
            (identical(other.hasSchedule, hasSchedule) ||
                other.hasSchedule == hasSchedule) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.bannedReason, bannedReason) ||
                other.bannedReason == bannedReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, dayName, isWorkingDay,
      hasSchedule, isBanned, bannedReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayInfoImplCopyWith<_$TodayInfoImpl> get copyWith =>
      __$$TodayInfoImplCopyWithImpl<_$TodayInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayInfoImplToJson(
      this,
    );
  }
}

abstract class _TodayInfo implements TodayInfo {
  const factory _TodayInfo(
          {required final String date,
          @JsonKey(name: 'day_name') required final String dayName,
          @JsonKey(name: 'is_working_day') final bool isWorkingDay,
          @JsonKey(name: 'has_schedule') final bool hasSchedule,
          @JsonKey(name: 'is_banned') final bool isBanned,
          @JsonKey(name: 'banned_reason') final String? bannedReason}) =
      _$TodayInfoImpl;

  factory _TodayInfo.fromJson(Map<String, dynamic> json) =
      _$TodayInfoImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'day_name')
  String get dayName;
  @override
  @JsonKey(name: 'is_working_day')
  bool get isWorkingDay;
  @override
  @JsonKey(name: 'has_schedule')
  bool get hasSchedule;
  @override
  @JsonKey(name: 'is_banned')
  bool get isBanned;
  @override
  @JsonKey(name: 'banned_reason')
  String? get bannedReason;
  @override
  @JsonKey(ignore: true)
  _$$TodayInfoImplCopyWith<_$TodayInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardStatsData _$DashboardStatsDataFromJson(Map<String, dynamic> json) {
  return _DashboardStatsData.fromJson(json);
}

/// @nodoc
mixin _$DashboardStatsData {
  @JsonKey(name: 'hadir_bulan_ini')
  int get hadirBulanIni => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_hari_kerja')
  int get totalHariKerja => throw _privateConstructorUsedError;
  @JsonKey(name: 'persentase_kehadiran')
  double get persentaseKehadiran => throw _privateConstructorUsedError;
  @JsonKey(name: 'sisa_cuti')
  int get sisaCuti => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cuti')
  int get totalCuti => throw _privateConstructorUsedError;
  @JsonKey(name: 'terlambat_bulan_ini')
  int get terlambatBulanIni => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_izin_pending')
  int get totalIzinPending => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cuti_pending')
  int get totalCutiPending => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardStatsDataCopyWith<DashboardStatsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsDataCopyWith<$Res> {
  factory $DashboardStatsDataCopyWith(
          DashboardStatsData value, $Res Function(DashboardStatsData) then) =
      _$DashboardStatsDataCopyWithImpl<$Res, DashboardStatsData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'hadir_bulan_ini') int hadirBulanIni,
      @JsonKey(name: 'total_hari_kerja') int totalHariKerja,
      @JsonKey(name: 'persentase_kehadiran') double persentaseKehadiran,
      @JsonKey(name: 'sisa_cuti') int sisaCuti,
      @JsonKey(name: 'total_cuti') int totalCuti,
      @JsonKey(name: 'terlambat_bulan_ini') int terlambatBulanIni,
      @JsonKey(name: 'total_izin_pending') int totalIzinPending,
      @JsonKey(name: 'total_cuti_pending') int totalCutiPending});
}

/// @nodoc
class _$DashboardStatsDataCopyWithImpl<$Res, $Val extends DashboardStatsData>
    implements $DashboardStatsDataCopyWith<$Res> {
  _$DashboardStatsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hadirBulanIni = null,
    Object? totalHariKerja = null,
    Object? persentaseKehadiran = null,
    Object? sisaCuti = null,
    Object? totalCuti = null,
    Object? terlambatBulanIni = null,
    Object? totalIzinPending = null,
    Object? totalCutiPending = null,
  }) {
    return _then(_value.copyWith(
      hadirBulanIni: null == hadirBulanIni
          ? _value.hadirBulanIni
          : hadirBulanIni // ignore: cast_nullable_to_non_nullable
              as int,
      totalHariKerja: null == totalHariKerja
          ? _value.totalHariKerja
          : totalHariKerja // ignore: cast_nullable_to_non_nullable
              as int,
      persentaseKehadiran: null == persentaseKehadiran
          ? _value.persentaseKehadiran
          : persentaseKehadiran // ignore: cast_nullable_to_non_nullable
              as double,
      sisaCuti: null == sisaCuti
          ? _value.sisaCuti
          : sisaCuti // ignore: cast_nullable_to_non_nullable
              as int,
      totalCuti: null == totalCuti
          ? _value.totalCuti
          : totalCuti // ignore: cast_nullable_to_non_nullable
              as int,
      terlambatBulanIni: null == terlambatBulanIni
          ? _value.terlambatBulanIni
          : terlambatBulanIni // ignore: cast_nullable_to_non_nullable
              as int,
      totalIzinPending: null == totalIzinPending
          ? _value.totalIzinPending
          : totalIzinPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalCutiPending: null == totalCutiPending
          ? _value.totalCutiPending
          : totalCutiPending // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStatsDataImplCopyWith<$Res>
    implements $DashboardStatsDataCopyWith<$Res> {
  factory _$$DashboardStatsDataImplCopyWith(_$DashboardStatsDataImpl value,
          $Res Function(_$DashboardStatsDataImpl) then) =
      __$$DashboardStatsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'hadir_bulan_ini') int hadirBulanIni,
      @JsonKey(name: 'total_hari_kerja') int totalHariKerja,
      @JsonKey(name: 'persentase_kehadiran') double persentaseKehadiran,
      @JsonKey(name: 'sisa_cuti') int sisaCuti,
      @JsonKey(name: 'total_cuti') int totalCuti,
      @JsonKey(name: 'terlambat_bulan_ini') int terlambatBulanIni,
      @JsonKey(name: 'total_izin_pending') int totalIzinPending,
      @JsonKey(name: 'total_cuti_pending') int totalCutiPending});
}

/// @nodoc
class __$$DashboardStatsDataImplCopyWithImpl<$Res>
    extends _$DashboardStatsDataCopyWithImpl<$Res, _$DashboardStatsDataImpl>
    implements _$$DashboardStatsDataImplCopyWith<$Res> {
  __$$DashboardStatsDataImplCopyWithImpl(_$DashboardStatsDataImpl _value,
      $Res Function(_$DashboardStatsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hadirBulanIni = null,
    Object? totalHariKerja = null,
    Object? persentaseKehadiran = null,
    Object? sisaCuti = null,
    Object? totalCuti = null,
    Object? terlambatBulanIni = null,
    Object? totalIzinPending = null,
    Object? totalCutiPending = null,
  }) {
    return _then(_$DashboardStatsDataImpl(
      hadirBulanIni: null == hadirBulanIni
          ? _value.hadirBulanIni
          : hadirBulanIni // ignore: cast_nullable_to_non_nullable
              as int,
      totalHariKerja: null == totalHariKerja
          ? _value.totalHariKerja
          : totalHariKerja // ignore: cast_nullable_to_non_nullable
              as int,
      persentaseKehadiran: null == persentaseKehadiran
          ? _value.persentaseKehadiran
          : persentaseKehadiran // ignore: cast_nullable_to_non_nullable
              as double,
      sisaCuti: null == sisaCuti
          ? _value.sisaCuti
          : sisaCuti // ignore: cast_nullable_to_non_nullable
              as int,
      totalCuti: null == totalCuti
          ? _value.totalCuti
          : totalCuti // ignore: cast_nullable_to_non_nullable
              as int,
      terlambatBulanIni: null == terlambatBulanIni
          ? _value.terlambatBulanIni
          : terlambatBulanIni // ignore: cast_nullable_to_non_nullable
              as int,
      totalIzinPending: null == totalIzinPending
          ? _value.totalIzinPending
          : totalIzinPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalCutiPending: null == totalCutiPending
          ? _value.totalCutiPending
          : totalCutiPending // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsDataImpl implements _DashboardStatsData {
  const _$DashboardStatsDataImpl(
      {@JsonKey(name: 'hadir_bulan_ini') this.hadirBulanIni = 0,
      @JsonKey(name: 'total_hari_kerja') this.totalHariKerja = 0,
      @JsonKey(name: 'persentase_kehadiran') this.persentaseKehadiran = 0.0,
      @JsonKey(name: 'sisa_cuti') this.sisaCuti = 0,
      @JsonKey(name: 'total_cuti') this.totalCuti = 12,
      @JsonKey(name: 'terlambat_bulan_ini') this.terlambatBulanIni = 0,
      @JsonKey(name: 'total_izin_pending') this.totalIzinPending = 0,
      @JsonKey(name: 'total_cuti_pending') this.totalCutiPending = 0});

  factory _$DashboardStatsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsDataImplFromJson(json);

  @override
  @JsonKey(name: 'hadir_bulan_ini')
  final int hadirBulanIni;
  @override
  @JsonKey(name: 'total_hari_kerja')
  final int totalHariKerja;
  @override
  @JsonKey(name: 'persentase_kehadiran')
  final double persentaseKehadiran;
  @override
  @JsonKey(name: 'sisa_cuti')
  final int sisaCuti;
  @override
  @JsonKey(name: 'total_cuti')
  final int totalCuti;
  @override
  @JsonKey(name: 'terlambat_bulan_ini')
  final int terlambatBulanIni;
  @override
  @JsonKey(name: 'total_izin_pending')
  final int totalIzinPending;
  @override
  @JsonKey(name: 'total_cuti_pending')
  final int totalCutiPending;

  @override
  String toString() {
    return 'DashboardStatsData(hadirBulanIni: $hadirBulanIni, totalHariKerja: $totalHariKerja, persentaseKehadiran: $persentaseKehadiran, sisaCuti: $sisaCuti, totalCuti: $totalCuti, terlambatBulanIni: $terlambatBulanIni, totalIzinPending: $totalIzinPending, totalCutiPending: $totalCutiPending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsDataImpl &&
            (identical(other.hadirBulanIni, hadirBulanIni) ||
                other.hadirBulanIni == hadirBulanIni) &&
            (identical(other.totalHariKerja, totalHariKerja) ||
                other.totalHariKerja == totalHariKerja) &&
            (identical(other.persentaseKehadiran, persentaseKehadiran) ||
                other.persentaseKehadiran == persentaseKehadiran) &&
            (identical(other.sisaCuti, sisaCuti) ||
                other.sisaCuti == sisaCuti) &&
            (identical(other.totalCuti, totalCuti) ||
                other.totalCuti == totalCuti) &&
            (identical(other.terlambatBulanIni, terlambatBulanIni) ||
                other.terlambatBulanIni == terlambatBulanIni) &&
            (identical(other.totalIzinPending, totalIzinPending) ||
                other.totalIzinPending == totalIzinPending) &&
            (identical(other.totalCutiPending, totalCutiPending) ||
                other.totalCutiPending == totalCutiPending));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      hadirBulanIni,
      totalHariKerja,
      persentaseKehadiran,
      sisaCuti,
      totalCuti,
      terlambatBulanIni,
      totalIzinPending,
      totalCutiPending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsDataImplCopyWith<_$DashboardStatsDataImpl> get copyWith =>
      __$$DashboardStatsDataImplCopyWithImpl<_$DashboardStatsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardStatsData implements DashboardStatsData {
  const factory _DashboardStatsData(
      {@JsonKey(name: 'hadir_bulan_ini') final int hadirBulanIni,
      @JsonKey(name: 'total_hari_kerja') final int totalHariKerja,
      @JsonKey(name: 'persentase_kehadiran') final double persentaseKehadiran,
      @JsonKey(name: 'sisa_cuti') final int sisaCuti,
      @JsonKey(name: 'total_cuti') final int totalCuti,
      @JsonKey(name: 'terlambat_bulan_ini') final int terlambatBulanIni,
      @JsonKey(name: 'total_izin_pending') final int totalIzinPending,
      @JsonKey(name: 'total_cuti_pending')
      final int totalCutiPending}) = _$DashboardStatsDataImpl;

  factory _DashboardStatsData.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsDataImpl.fromJson;

  @override
  @JsonKey(name: 'hadir_bulan_ini')
  int get hadirBulanIni;
  @override
  @JsonKey(name: 'total_hari_kerja')
  int get totalHariKerja;
  @override
  @JsonKey(name: 'persentase_kehadiran')
  double get persentaseKehadiran;
  @override
  @JsonKey(name: 'sisa_cuti')
  int get sisaCuti;
  @override
  @JsonKey(name: 'total_cuti')
  int get totalCuti;
  @override
  @JsonKey(name: 'terlambat_bulan_ini')
  int get terlambatBulanIni;
  @override
  @JsonKey(name: 'total_izin_pending')
  int get totalIzinPending;
  @override
  @JsonKey(name: 'total_cuti_pending')
  int get totalCutiPending;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStatsDataImplCopyWith<_$DashboardStatsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduleToday _$ScheduleTodayFromJson(Map<String, dynamic> json) {
  return _ScheduleToday.fromJson(json);
}

/// @nodoc
mixin _$ScheduleToday {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift_name')
  String? get shiftName => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_name')
  String? get officeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_latitude')
  double? get officeLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_longitude')
  double? get officeLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_wfa')
  bool get isWfa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleTodayCopyWith<ScheduleToday> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleTodayCopyWith<$Res> {
  factory $ScheduleTodayCopyWith(
          ScheduleToday value, $Res Function(ScheduleToday) then) =
      _$ScheduleTodayCopyWithImpl<$Res, ScheduleToday>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'shift_name') String? shiftName,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'office_name') String? officeName,
      @JsonKey(name: 'office_latitude') double? officeLatitude,
      @JsonKey(name: 'office_longitude') double? officeLongitude,
      @JsonKey(name: 'is_wfa') bool isWfa});
}

/// @nodoc
class _$ScheduleTodayCopyWithImpl<$Res, $Val extends ScheduleToday>
    implements $ScheduleTodayCopyWith<$Res> {
  _$ScheduleTodayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shiftName = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? officeName = freezed,
    Object? officeLatitude = freezed,
    Object? officeLongitude = freezed,
    Object? isWfa = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shiftName: freezed == shiftName
          ? _value.shiftName
          : shiftName // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      officeName: freezed == officeName
          ? _value.officeName
          : officeName // ignore: cast_nullable_to_non_nullable
              as String?,
      officeLatitude: freezed == officeLatitude
          ? _value.officeLatitude
          : officeLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      officeLongitude: freezed == officeLongitude
          ? _value.officeLongitude
          : officeLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleTodayImplCopyWith<$Res>
    implements $ScheduleTodayCopyWith<$Res> {
  factory _$$ScheduleTodayImplCopyWith(
          _$ScheduleTodayImpl value, $Res Function(_$ScheduleTodayImpl) then) =
      __$$ScheduleTodayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'shift_name') String? shiftName,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'office_name') String? officeName,
      @JsonKey(name: 'office_latitude') double? officeLatitude,
      @JsonKey(name: 'office_longitude') double? officeLongitude,
      @JsonKey(name: 'is_wfa') bool isWfa});
}

/// @nodoc
class __$$ScheduleTodayImplCopyWithImpl<$Res>
    extends _$ScheduleTodayCopyWithImpl<$Res, _$ScheduleTodayImpl>
    implements _$$ScheduleTodayImplCopyWith<$Res> {
  __$$ScheduleTodayImplCopyWithImpl(
      _$ScheduleTodayImpl _value, $Res Function(_$ScheduleTodayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shiftName = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? officeName = freezed,
    Object? officeLatitude = freezed,
    Object? officeLongitude = freezed,
    Object? isWfa = null,
  }) {
    return _then(_$ScheduleTodayImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shiftName: freezed == shiftName
          ? _value.shiftName
          : shiftName // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      officeName: freezed == officeName
          ? _value.officeName
          : officeName // ignore: cast_nullable_to_non_nullable
              as String?,
      officeLatitude: freezed == officeLatitude
          ? _value.officeLatitude
          : officeLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      officeLongitude: freezed == officeLongitude
          ? _value.officeLongitude
          : officeLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isWfa: null == isWfa
          ? _value.isWfa
          : isWfa // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleTodayImpl implements _ScheduleToday {
  const _$ScheduleTodayImpl(
      {required this.id,
      @JsonKey(name: 'shift_name') this.shiftName,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'office_name') this.officeName,
      @JsonKey(name: 'office_latitude') this.officeLatitude,
      @JsonKey(name: 'office_longitude') this.officeLongitude,
      @JsonKey(name: 'is_wfa') this.isWfa = false});

  factory _$ScheduleTodayImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleTodayImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'shift_name')
  final String? shiftName;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'office_name')
  final String? officeName;
  @override
  @JsonKey(name: 'office_latitude')
  final double? officeLatitude;
  @override
  @JsonKey(name: 'office_longitude')
  final double? officeLongitude;
  @override
  @JsonKey(name: 'is_wfa')
  final bool isWfa;

  @override
  String toString() {
    return 'ScheduleToday(id: $id, shiftName: $shiftName, startTime: $startTime, endTime: $endTime, officeName: $officeName, officeLatitude: $officeLatitude, officeLongitude: $officeLongitude, isWfa: $isWfa)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleTodayImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shiftName, shiftName) ||
                other.shiftName == shiftName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.officeName, officeName) ||
                other.officeName == officeName) &&
            (identical(other.officeLatitude, officeLatitude) ||
                other.officeLatitude == officeLatitude) &&
            (identical(other.officeLongitude, officeLongitude) ||
                other.officeLongitude == officeLongitude) &&
            (identical(other.isWfa, isWfa) || other.isWfa == isWfa));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, shiftName, startTime,
      endTime, officeName, officeLatitude, officeLongitude, isWfa);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleTodayImplCopyWith<_$ScheduleTodayImpl> get copyWith =>
      __$$ScheduleTodayImplCopyWithImpl<_$ScheduleTodayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleTodayImplToJson(
      this,
    );
  }
}

abstract class _ScheduleToday implements ScheduleToday {
  const factory _ScheduleToday(
      {required final int id,
      @JsonKey(name: 'shift_name') final String? shiftName,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      @JsonKey(name: 'office_name') final String? officeName,
      @JsonKey(name: 'office_latitude') final double? officeLatitude,
      @JsonKey(name: 'office_longitude') final double? officeLongitude,
      @JsonKey(name: 'is_wfa') final bool isWfa}) = _$ScheduleTodayImpl;

  factory _ScheduleToday.fromJson(Map<String, dynamic> json) =
      _$ScheduleTodayImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'shift_name')
  String? get shiftName;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'office_name')
  String? get officeName;
  @override
  @JsonKey(name: 'office_latitude')
  double? get officeLatitude;
  @override
  @JsonKey(name: 'office_longitude')
  double? get officeLongitude;
  @override
  @JsonKey(name: 'is_wfa')
  bool get isWfa;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleTodayImplCopyWith<_$ScheduleTodayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttendanceToday _$AttendanceTodayFromJson(Map<String, dynamic> json) {
  return _AttendanceToday.fromJson(json);
}

/// @nodoc
mixin _$AttendanceToday {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_late')
  bool get isLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_duration')
  String? get workDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'lunch_money')
  String? get lunchMoney => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_checked_out')
  bool get hasCheckedOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'permission_type')
  String? get permissionType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceTodayCopyWith<AttendanceToday> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceTodayCopyWith<$Res> {
  factory $AttendanceTodayCopyWith(
          AttendanceToday value, $Res Function(AttendanceToday) then) =
      _$AttendanceTodayCopyWithImpl<$Res, AttendanceToday>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'is_late') bool isLate,
      @JsonKey(name: 'work_duration') String? workDuration,
      @JsonKey(name: 'lunch_money') String? lunchMoney,
      @JsonKey(name: 'has_checked_out') bool hasCheckedOut,
      @JsonKey(name: 'permission_type') String? permissionType});
}

/// @nodoc
class _$AttendanceTodayCopyWithImpl<$Res, $Val extends AttendanceToday>
    implements $AttendanceTodayCopyWith<$Res> {
  _$AttendanceTodayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isLate = null,
    Object? workDuration = freezed,
    Object? lunchMoney = freezed,
    Object? hasCheckedOut = null,
    Object? permissionType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: null == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool,
      workDuration: freezed == workDuration
          ? _value.workDuration
          : workDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      lunchMoney: freezed == lunchMoney
          ? _value.lunchMoney
          : lunchMoney // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCheckedOut: null == hasCheckedOut
          ? _value.hasCheckedOut
          : hasCheckedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionType: freezed == permissionType
          ? _value.permissionType
          : permissionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceTodayImplCopyWith<$Res>
    implements $AttendanceTodayCopyWith<$Res> {
  factory _$$AttendanceTodayImplCopyWith(_$AttendanceTodayImpl value,
          $Res Function(_$AttendanceTodayImpl) then) =
      __$$AttendanceTodayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      @JsonKey(name: 'is_late') bool isLate,
      @JsonKey(name: 'work_duration') String? workDuration,
      @JsonKey(name: 'lunch_money') String? lunchMoney,
      @JsonKey(name: 'has_checked_out') bool hasCheckedOut,
      @JsonKey(name: 'permission_type') String? permissionType});
}

/// @nodoc
class __$$AttendanceTodayImplCopyWithImpl<$Res>
    extends _$AttendanceTodayCopyWithImpl<$Res, _$AttendanceTodayImpl>
    implements _$$AttendanceTodayImplCopyWith<$Res> {
  __$$AttendanceTodayImplCopyWithImpl(
      _$AttendanceTodayImpl _value, $Res Function(_$AttendanceTodayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isLate = null,
    Object? workDuration = freezed,
    Object? lunchMoney = freezed,
    Object? hasCheckedOut = null,
    Object? permissionType = freezed,
  }) {
    return _then(_$AttendanceTodayImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isLate: null == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool,
      workDuration: freezed == workDuration
          ? _value.workDuration
          : workDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      lunchMoney: freezed == lunchMoney
          ? _value.lunchMoney
          : lunchMoney // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCheckedOut: null == hasCheckedOut
          ? _value.hasCheckedOut
          : hasCheckedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionType: freezed == permissionType
          ? _value.permissionType
          : permissionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceTodayImpl implements _AttendanceToday {
  const _$AttendanceTodayImpl(
      {required this.id,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'is_late') this.isLate = false,
      @JsonKey(name: 'work_duration') this.workDuration,
      @JsonKey(name: 'lunch_money') this.lunchMoney,
      @JsonKey(name: 'has_checked_out') this.hasCheckedOut = false,
      @JsonKey(name: 'permission_type') this.permissionType});

  factory _$AttendanceTodayImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceTodayImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'is_late')
  final bool isLate;
  @override
  @JsonKey(name: 'work_duration')
  final String? workDuration;
  @override
  @JsonKey(name: 'lunch_money')
  final String? lunchMoney;
  @override
  @JsonKey(name: 'has_checked_out')
  final bool hasCheckedOut;
  @override
  @JsonKey(name: 'permission_type')
  final String? permissionType;

  @override
  String toString() {
    return 'AttendanceToday(id: $id, startTime: $startTime, endTime: $endTime, isLate: $isLate, workDuration: $workDuration, lunchMoney: $lunchMoney, hasCheckedOut: $hasCheckedOut, permissionType: $permissionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceTodayImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isLate, isLate) || other.isLate == isLate) &&
            (identical(other.workDuration, workDuration) ||
                other.workDuration == workDuration) &&
            (identical(other.lunchMoney, lunchMoney) ||
                other.lunchMoney == lunchMoney) &&
            (identical(other.hasCheckedOut, hasCheckedOut) ||
                other.hasCheckedOut == hasCheckedOut) &&
            (identical(other.permissionType, permissionType) ||
                other.permissionType == permissionType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startTime, endTime, isLate,
      workDuration, lunchMoney, hasCheckedOut, permissionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceTodayImplCopyWith<_$AttendanceTodayImpl> get copyWith =>
      __$$AttendanceTodayImplCopyWithImpl<_$AttendanceTodayImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceTodayImplToJson(
      this,
    );
  }
}

abstract class _AttendanceToday implements AttendanceToday {
  const factory _AttendanceToday(
          {required final int id,
          @JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime,
          @JsonKey(name: 'is_late') final bool isLate,
          @JsonKey(name: 'work_duration') final String? workDuration,
          @JsonKey(name: 'lunch_money') final String? lunchMoney,
          @JsonKey(name: 'has_checked_out') final bool hasCheckedOut,
          @JsonKey(name: 'permission_type') final String? permissionType}) =
      _$AttendanceTodayImpl;

  factory _AttendanceToday.fromJson(Map<String, dynamic> json) =
      _$AttendanceTodayImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'is_late')
  bool get isLate;
  @override
  @JsonKey(name: 'work_duration')
  String? get workDuration;
  @override
  @JsonKey(name: 'lunch_money')
  String? get lunchMoney;
  @override
  @JsonKey(name: 'has_checked_out')
  bool get hasCheckedOut;
  @override
  @JsonKey(name: 'permission_type')
  String? get permissionType;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceTodayImplCopyWith<_$AttendanceTodayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlySummary _$MonthlySummaryFromJson(Map<String, dynamic> json) {
  return _MonthlySummary.fromJson(json);
}

/// @nodoc
mixin _$MonthlySummary {
  int get month => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month_name')
  String? get monthName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_working_days')
  int get totalWorkingDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'present_days')
  int get presentDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'late_days')
  int get lateDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'absent_days')
  int get absentDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_rate')
  double get attendanceRate => throw _privateConstructorUsedError;
  List<CalendarDay>? get calendar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlySummaryCopyWith<MonthlySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySummaryCopyWith<$Res> {
  factory $MonthlySummaryCopyWith(
          MonthlySummary value, $Res Function(MonthlySummary) then) =
      _$MonthlySummaryCopyWithImpl<$Res, MonthlySummary>;
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'month_name') String? monthName,
      @JsonKey(name: 'total_working_days') int totalWorkingDays,
      @JsonKey(name: 'present_days') int presentDays,
      @JsonKey(name: 'late_days') int lateDays,
      @JsonKey(name: 'absent_days') int absentDays,
      @JsonKey(name: 'attendance_rate') double attendanceRate,
      List<CalendarDay>? calendar});
}

/// @nodoc
class _$MonthlySummaryCopyWithImpl<$Res, $Val extends MonthlySummary>
    implements $MonthlySummaryCopyWith<$Res> {
  _$MonthlySummaryCopyWithImpl(this._value, this._then);

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
    Object? totalWorkingDays = null,
    Object? presentDays = null,
    Object? lateDays = null,
    Object? absentDays = null,
    Object? attendanceRate = null,
    Object? calendar = freezed,
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
      totalWorkingDays: null == totalWorkingDays
          ? _value.totalWorkingDays
          : totalWorkingDays // ignore: cast_nullable_to_non_nullable
              as int,
      presentDays: null == presentDays
          ? _value.presentDays
          : presentDays // ignore: cast_nullable_to_non_nullable
              as int,
      lateDays: null == lateDays
          ? _value.lateDays
          : lateDays // ignore: cast_nullable_to_non_nullable
              as int,
      absentDays: null == absentDays
          ? _value.absentDays
          : absentDays // ignore: cast_nullable_to_non_nullable
              as int,
      attendanceRate: null == attendanceRate
          ? _value.attendanceRate
          : attendanceRate // ignore: cast_nullable_to_non_nullable
              as double,
      calendar: freezed == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as List<CalendarDay>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySummaryImplCopyWith<$Res>
    implements $MonthlySummaryCopyWith<$Res> {
  factory _$$MonthlySummaryImplCopyWith(_$MonthlySummaryImpl value,
          $Res Function(_$MonthlySummaryImpl) then) =
      __$$MonthlySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int month,
      int year,
      @JsonKey(name: 'month_name') String? monthName,
      @JsonKey(name: 'total_working_days') int totalWorkingDays,
      @JsonKey(name: 'present_days') int presentDays,
      @JsonKey(name: 'late_days') int lateDays,
      @JsonKey(name: 'absent_days') int absentDays,
      @JsonKey(name: 'attendance_rate') double attendanceRate,
      List<CalendarDay>? calendar});
}

/// @nodoc
class __$$MonthlySummaryImplCopyWithImpl<$Res>
    extends _$MonthlySummaryCopyWithImpl<$Res, _$MonthlySummaryImpl>
    implements _$$MonthlySummaryImplCopyWith<$Res> {
  __$$MonthlySummaryImplCopyWithImpl(
      _$MonthlySummaryImpl _value, $Res Function(_$MonthlySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
    Object? monthName = freezed,
    Object? totalWorkingDays = null,
    Object? presentDays = null,
    Object? lateDays = null,
    Object? absentDays = null,
    Object? attendanceRate = null,
    Object? calendar = freezed,
  }) {
    return _then(_$MonthlySummaryImpl(
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
      totalWorkingDays: null == totalWorkingDays
          ? _value.totalWorkingDays
          : totalWorkingDays // ignore: cast_nullable_to_non_nullable
              as int,
      presentDays: null == presentDays
          ? _value.presentDays
          : presentDays // ignore: cast_nullable_to_non_nullable
              as int,
      lateDays: null == lateDays
          ? _value.lateDays
          : lateDays // ignore: cast_nullable_to_non_nullable
              as int,
      absentDays: null == absentDays
          ? _value.absentDays
          : absentDays // ignore: cast_nullable_to_non_nullable
              as int,
      attendanceRate: null == attendanceRate
          ? _value.attendanceRate
          : attendanceRate // ignore: cast_nullable_to_non_nullable
              as double,
      calendar: freezed == calendar
          ? _value._calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as List<CalendarDay>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlySummaryImpl implements _MonthlySummary {
  const _$MonthlySummaryImpl(
      {required this.month,
      required this.year,
      @JsonKey(name: 'month_name') this.monthName,
      @JsonKey(name: 'total_working_days') this.totalWorkingDays = 0,
      @JsonKey(name: 'present_days') this.presentDays = 0,
      @JsonKey(name: 'late_days') this.lateDays = 0,
      @JsonKey(name: 'absent_days') this.absentDays = 0,
      @JsonKey(name: 'attendance_rate') this.attendanceRate = 0.0,
      final List<CalendarDay>? calendar})
      : _calendar = calendar;

  factory _$MonthlySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlySummaryImplFromJson(json);

  @override
  final int month;
  @override
  final int year;
  @override
  @JsonKey(name: 'month_name')
  final String? monthName;
  @override
  @JsonKey(name: 'total_working_days')
  final int totalWorkingDays;
  @override
  @JsonKey(name: 'present_days')
  final int presentDays;
  @override
  @JsonKey(name: 'late_days')
  final int lateDays;
  @override
  @JsonKey(name: 'absent_days')
  final int absentDays;
  @override
  @JsonKey(name: 'attendance_rate')
  final double attendanceRate;
  final List<CalendarDay>? _calendar;
  @override
  List<CalendarDay>? get calendar {
    final value = _calendar;
    if (value == null) return null;
    if (_calendar is EqualUnmodifiableListView) return _calendar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MonthlySummary(month: $month, year: $year, monthName: $monthName, totalWorkingDays: $totalWorkingDays, presentDays: $presentDays, lateDays: $lateDays, absentDays: $absentDays, attendanceRate: $attendanceRate, calendar: $calendar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySummaryImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.monthName, monthName) ||
                other.monthName == monthName) &&
            (identical(other.totalWorkingDays, totalWorkingDays) ||
                other.totalWorkingDays == totalWorkingDays) &&
            (identical(other.presentDays, presentDays) ||
                other.presentDays == presentDays) &&
            (identical(other.lateDays, lateDays) ||
                other.lateDays == lateDays) &&
            (identical(other.absentDays, absentDays) ||
                other.absentDays == absentDays) &&
            (identical(other.attendanceRate, attendanceRate) ||
                other.attendanceRate == attendanceRate) &&
            const DeepCollectionEquality().equals(other._calendar, _calendar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      month,
      year,
      monthName,
      totalWorkingDays,
      presentDays,
      lateDays,
      absentDays,
      attendanceRate,
      const DeepCollectionEquality().hash(_calendar));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySummaryImplCopyWith<_$MonthlySummaryImpl> get copyWith =>
      __$$MonthlySummaryImplCopyWithImpl<_$MonthlySummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlySummaryImplToJson(
      this,
    );
  }
}

abstract class _MonthlySummary implements MonthlySummary {
  const factory _MonthlySummary(
      {required final int month,
      required final int year,
      @JsonKey(name: 'month_name') final String? monthName,
      @JsonKey(name: 'total_working_days') final int totalWorkingDays,
      @JsonKey(name: 'present_days') final int presentDays,
      @JsonKey(name: 'late_days') final int lateDays,
      @JsonKey(name: 'absent_days') final int absentDays,
      @JsonKey(name: 'attendance_rate') final double attendanceRate,
      final List<CalendarDay>? calendar}) = _$MonthlySummaryImpl;

  factory _MonthlySummary.fromJson(Map<String, dynamic> json) =
      _$MonthlySummaryImpl.fromJson;

  @override
  int get month;
  @override
  int get year;
  @override
  @JsonKey(name: 'month_name')
  String? get monthName;
  @override
  @JsonKey(name: 'total_working_days')
  int get totalWorkingDays;
  @override
  @JsonKey(name: 'present_days')
  int get presentDays;
  @override
  @JsonKey(name: 'late_days')
  int get lateDays;
  @override
  @JsonKey(name: 'absent_days')
  int get absentDays;
  @override
  @JsonKey(name: 'attendance_rate')
  double get attendanceRate;
  @override
  List<CalendarDay>? get calendar;
  @override
  @JsonKey(ignore: true)
  _$$MonthlySummaryImplCopyWith<_$MonthlySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CalendarDay _$CalendarDayFromJson(Map<String, dynamic> json) {
  return _CalendarDay.fromJson(json);
}

/// @nodoc
mixin _$CalendarDay {
  String get date => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_name')
  String? get dayName => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // present, absent, holiday
  @JsonKey(name: 'is_late')
  bool get isLate => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in')
  String? get checkIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_out')
  String? get checkOut => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalendarDayCopyWith<CalendarDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarDayCopyWith<$Res> {
  factory $CalendarDayCopyWith(
          CalendarDay value, $Res Function(CalendarDay) then) =
      _$CalendarDayCopyWithImpl<$Res, CalendarDay>;
  @useResult
  $Res call(
      {String date,
      String day,
      @JsonKey(name: 'day_name') String? dayName,
      String status,
      @JsonKey(name: 'is_late') bool isLate,
      @JsonKey(name: 'check_in') String? checkIn,
      @JsonKey(name: 'check_out') String? checkOut});
}

/// @nodoc
class _$CalendarDayCopyWithImpl<$Res, $Val extends CalendarDay>
    implements $CalendarDayCopyWith<$Res> {
  _$CalendarDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? day = null,
    Object? dayName = freezed,
    Object? status = null,
    Object? isLate = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      dayName: freezed == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isLate: null == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarDayImplCopyWith<$Res>
    implements $CalendarDayCopyWith<$Res> {
  factory _$$CalendarDayImplCopyWith(
          _$CalendarDayImpl value, $Res Function(_$CalendarDayImpl) then) =
      __$$CalendarDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      String day,
      @JsonKey(name: 'day_name') String? dayName,
      String status,
      @JsonKey(name: 'is_late') bool isLate,
      @JsonKey(name: 'check_in') String? checkIn,
      @JsonKey(name: 'check_out') String? checkOut});
}

/// @nodoc
class __$$CalendarDayImplCopyWithImpl<$Res>
    extends _$CalendarDayCopyWithImpl<$Res, _$CalendarDayImpl>
    implements _$$CalendarDayImplCopyWith<$Res> {
  __$$CalendarDayImplCopyWithImpl(
      _$CalendarDayImpl _value, $Res Function(_$CalendarDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? day = null,
    Object? dayName = freezed,
    Object? status = null,
    Object? isLate = null,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
  }) {
    return _then(_$CalendarDayImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      dayName: freezed == dayName
          ? _value.dayName
          : dayName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isLate: null == isLate
          ? _value.isLate
          : isLate // ignore: cast_nullable_to_non_nullable
              as bool,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalendarDayImpl implements _CalendarDay {
  const _$CalendarDayImpl(
      {required this.date,
      required this.day,
      @JsonKey(name: 'day_name') this.dayName,
      required this.status,
      @JsonKey(name: 'is_late') this.isLate = false,
      @JsonKey(name: 'check_in') this.checkIn,
      @JsonKey(name: 'check_out') this.checkOut});

  factory _$CalendarDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarDayImplFromJson(json);

  @override
  final String date;
  @override
  final String day;
  @override
  @JsonKey(name: 'day_name')
  final String? dayName;
  @override
  final String status;
// present, absent, holiday
  @override
  @JsonKey(name: 'is_late')
  final bool isLate;
  @override
  @JsonKey(name: 'check_in')
  final String? checkIn;
  @override
  @JsonKey(name: 'check_out')
  final String? checkOut;

  @override
  String toString() {
    return 'CalendarDay(date: $date, day: $day, dayName: $dayName, status: $status, isLate: $isLate, checkIn: $checkIn, checkOut: $checkOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarDayImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.dayName, dayName) || other.dayName == dayName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isLate, isLate) || other.isLate == isLate) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, day, dayName, status, isLate, checkIn, checkOut);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarDayImplCopyWith<_$CalendarDayImpl> get copyWith =>
      __$$CalendarDayImplCopyWithImpl<_$CalendarDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarDayImplToJson(
      this,
    );
  }
}

abstract class _CalendarDay implements CalendarDay {
  const factory _CalendarDay(
      {required final String date,
      required final String day,
      @JsonKey(name: 'day_name') final String? dayName,
      required final String status,
      @JsonKey(name: 'is_late') final bool isLate,
      @JsonKey(name: 'check_in') final String? checkIn,
      @JsonKey(name: 'check_out') final String? checkOut}) = _$CalendarDayImpl;

  factory _CalendarDay.fromJson(Map<String, dynamic> json) =
      _$CalendarDayImpl.fromJson;

  @override
  String get date;
  @override
  String get day;
  @override
  @JsonKey(name: 'day_name')
  String? get dayName;
  @override
  String get status;
  @override // present, absent, holiday
  @JsonKey(name: 'is_late')
  bool get isLate;
  @override
  @JsonKey(name: 'check_in')
  String? get checkIn;
  @override
  @JsonKey(name: 'check_out')
  String? get checkOut;
  @override
  @JsonKey(ignore: true)
  _$$CalendarDayImplCopyWith<_$CalendarDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentActivity _$RecentActivityFromJson(Map<String, dynamic> json) {
  return _RecentActivity.fromJson(json);
}

/// @nodoc
mixin _$RecentActivity {
  String get type =>
      throw _privateConstructorUsedError; // attendance, leave, permission
  String get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentActivityCopyWith<RecentActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentActivityCopyWith<$Res> {
  factory $RecentActivityCopyWith(
          RecentActivity value, $Res Function(RecentActivity) then) =
      _$RecentActivityCopyWithImpl<$Res, RecentActivity>;
  @useResult
  $Res call(
      {String type,
      String date,
      String? time,
      String status,
      String icon,
      String message,
      int? duration});
}

/// @nodoc
class _$RecentActivityCopyWithImpl<$Res, $Val extends RecentActivity>
    implements $RecentActivityCopyWith<$Res> {
  _$RecentActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? date = null,
    Object? time = freezed,
    Object? status = null,
    Object? icon = null,
    Object? message = null,
    Object? duration = freezed,
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
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentActivityImplCopyWith<$Res>
    implements $RecentActivityCopyWith<$Res> {
  factory _$$RecentActivityImplCopyWith(_$RecentActivityImpl value,
          $Res Function(_$RecentActivityImpl) then) =
      __$$RecentActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String date,
      String? time,
      String status,
      String icon,
      String message,
      int? duration});
}

/// @nodoc
class __$$RecentActivityImplCopyWithImpl<$Res>
    extends _$RecentActivityCopyWithImpl<$Res, _$RecentActivityImpl>
    implements _$$RecentActivityImplCopyWith<$Res> {
  __$$RecentActivityImplCopyWithImpl(
      _$RecentActivityImpl _value, $Res Function(_$RecentActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? date = null,
    Object? time = freezed,
    Object? status = null,
    Object? icon = null,
    Object? message = null,
    Object? duration = freezed,
  }) {
    return _then(_$RecentActivityImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentActivityImpl implements _RecentActivity {
  const _$RecentActivityImpl(
      {required this.type,
      required this.date,
      this.time,
      required this.status,
      required this.icon,
      required this.message,
      this.duration});

  factory _$RecentActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentActivityImplFromJson(json);

  @override
  final String type;
// attendance, leave, permission
  @override
  final String date;
  @override
  final String? time;
  @override
  final String status;
  @override
  final String icon;
  @override
  final String message;
  @override
  final int? duration;

  @override
  String toString() {
    return 'RecentActivity(type: $type, date: $date, time: $time, status: $status, icon: $icon, message: $message, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentActivityImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, date, time, status, icon, message, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentActivityImplCopyWith<_$RecentActivityImpl> get copyWith =>
      __$$RecentActivityImplCopyWithImpl<_$RecentActivityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentActivityImplToJson(
      this,
    );
  }
}

abstract class _RecentActivity implements RecentActivity {
  const factory _RecentActivity(
      {required final String type,
      required final String date,
      final String? time,
      required final String status,
      required final String icon,
      required final String message,
      final int? duration}) = _$RecentActivityImpl;

  factory _RecentActivity.fromJson(Map<String, dynamic> json) =
      _$RecentActivityImpl.fromJson;

  @override
  String get type;
  @override // attendance, leave, permission
  String get date;
  @override
  String? get time;
  @override
  String get status;
  @override
  String get icon;
  @override
  String get message;
  @override
  int? get duration;
  @override
  @JsonKey(ignore: true)
  _$$RecentActivityImplCopyWith<_$RecentActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
