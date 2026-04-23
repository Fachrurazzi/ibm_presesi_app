// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveEntity _$LeaveEntityFromJson(Map<String, dynamic> json) {
  return _LeaveEntity.fromJson(json);
}

/// @nodoc
mixin _$LeaveEntity {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  int get duration => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_label')
  String? get categoryLabel => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_label')
  String? get statusLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveEntityCopyWith<LeaveEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveEntityCopyWith<$Res> {
  factory $LeaveEntityCopyWith(
          LeaveEntity value, $Res Function(LeaveEntity) then) =
      _$LeaveEntityCopyWithImpl<$Res, LeaveEntity>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'duration') int duration,
      String reason,
      String category,
      @JsonKey(name: 'category_label') String? categoryLabel,
      String status,
      @JsonKey(name: 'status_label') String? statusLabel,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$LeaveEntityCopyWithImpl<$Res, $Val extends LeaveEntity>
    implements $LeaveEntityCopyWith<$Res> {
  _$LeaveEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? duration = null,
    Object? reason = null,
    Object? category = null,
    Object? categoryLabel = freezed,
    Object? status = null,
    Object? statusLabel = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      categoryLabel: freezed == categoryLabel
          ? _value.categoryLabel
          : categoryLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: freezed == statusLabel
          ? _value.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveEntityImplCopyWith<$Res>
    implements $LeaveEntityCopyWith<$Res> {
  factory _$$LeaveEntityImplCopyWith(
          _$LeaveEntityImpl value, $Res Function(_$LeaveEntityImpl) then) =
      __$$LeaveEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'duration') int duration,
      String reason,
      String category,
      @JsonKey(name: 'category_label') String? categoryLabel,
      String status,
      @JsonKey(name: 'status_label') String? statusLabel,
      @JsonKey(name: 'note') String? note,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$LeaveEntityImplCopyWithImpl<$Res>
    extends _$LeaveEntityCopyWithImpl<$Res, _$LeaveEntityImpl>
    implements _$$LeaveEntityImplCopyWith<$Res> {
  __$$LeaveEntityImplCopyWithImpl(
      _$LeaveEntityImpl _value, $Res Function(_$LeaveEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? duration = null,
    Object? reason = null,
    Object? category = null,
    Object? categoryLabel = freezed,
    Object? status = null,
    Object? statusLabel = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$LeaveEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      categoryLabel: freezed == categoryLabel
          ? _value.categoryLabel
          : categoryLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: freezed == statusLabel
          ? _value.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveEntityImpl implements _LeaveEntity {
  const _$LeaveEntityImpl(
      {required this.id,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'duration') this.duration = 1,
      required this.reason,
      this.category = 'annual',
      @JsonKey(name: 'category_label') this.categoryLabel,
      this.status = 'PENDING',
      @JsonKey(name: 'status_label') this.statusLabel,
      @JsonKey(name: 'note') this.note,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$LeaveEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveEntityImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  @JsonKey(name: 'duration')
  final int duration;
  @override
  final String reason;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey(name: 'category_label')
  final String? categoryLabel;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'status_label')
  final String? statusLabel;
  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'LeaveEntity(id: $id, startDate: $startDate, endDate: $endDate, duration: $duration, reason: $reason, category: $category, categoryLabel: $categoryLabel, status: $status, statusLabel: $statusLabel, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.categoryLabel, categoryLabel) ||
                other.categoryLabel == categoryLabel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, startDate, endDate, duration,
      reason, category, categoryLabel, status, statusLabel, note, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveEntityImplCopyWith<_$LeaveEntityImpl> get copyWith =>
      __$$LeaveEntityImplCopyWithImpl<_$LeaveEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveEntityImplToJson(
      this,
    );
  }
}

abstract class _LeaveEntity implements LeaveEntity {
  const factory _LeaveEntity(
          {required final int id,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') required final String endDate,
          @JsonKey(name: 'duration') final int duration,
          required final String reason,
          final String category,
          @JsonKey(name: 'category_label') final String? categoryLabel,
          final String status,
          @JsonKey(name: 'status_label') final String? statusLabel,
          @JsonKey(name: 'note') final String? note,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$LeaveEntityImpl;

  factory _LeaveEntity.fromJson(Map<String, dynamic> json) =
      _$LeaveEntityImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  @JsonKey(name: 'duration')
  int get duration;
  @override
  String get reason;
  @override
  String get category;
  @override
  @JsonKey(name: 'category_label')
  String? get categoryLabel;
  @override
  String get status;
  @override
  @JsonKey(name: 'status_label')
  String? get statusLabel;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$LeaveEntityImplCopyWith<_$LeaveEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveType _$LeaveTypeFromJson(Map<String, dynamic> json) {
  return _LeaveType.fromJson(json);
}

/// @nodoc
mixin _$LeaveType {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveTypeCopyWith<LeaveType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveTypeCopyWith<$Res> {
  factory $LeaveTypeCopyWith(LeaveType value, $Res Function(LeaveType) then) =
      _$LeaveTypeCopyWithImpl<$Res, LeaveType>;
  @useResult
  $Res call({String value, String label, String? description});
}

/// @nodoc
class _$LeaveTypeCopyWithImpl<$Res, $Val extends LeaveType>
    implements $LeaveTypeCopyWith<$Res> {
  _$LeaveTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveTypeImplCopyWith<$Res>
    implements $LeaveTypeCopyWith<$Res> {
  factory _$$LeaveTypeImplCopyWith(
          _$LeaveTypeImpl value, $Res Function(_$LeaveTypeImpl) then) =
      __$$LeaveTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label, String? description});
}

/// @nodoc
class __$$LeaveTypeImplCopyWithImpl<$Res>
    extends _$LeaveTypeCopyWithImpl<$Res, _$LeaveTypeImpl>
    implements _$$LeaveTypeImplCopyWith<$Res> {
  __$$LeaveTypeImplCopyWithImpl(
      _$LeaveTypeImpl _value, $Res Function(_$LeaveTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? description = freezed,
  }) {
    return _then(_$LeaveTypeImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
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
class _$LeaveTypeImpl implements _LeaveType {
  const _$LeaveTypeImpl(
      {required this.value, required this.label, this.description});

  factory _$LeaveTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveTypeImplFromJson(json);

  @override
  final String value;
  @override
  final String label;
  @override
  final String? description;

  @override
  String toString() {
    return 'LeaveType(value: $value, label: $label, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveTypeImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, label, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveTypeImplCopyWith<_$LeaveTypeImpl> get copyWith =>
      __$$LeaveTypeImplCopyWithImpl<_$LeaveTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveTypeImplToJson(
      this,
    );
  }
}

abstract class _LeaveType implements LeaveType {
  const factory _LeaveType(
      {required final String value,
      required final String label,
      final String? description}) = _$LeaveTypeImpl;

  factory _LeaveType.fromJson(Map<String, dynamic> json) =
      _$LeaveTypeImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$LeaveTypeImplCopyWith<_$LeaveTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveQuota _$LeaveQuotaFromJson(Map<String, dynamic> json) {
  return _LeaveQuota.fromJson(json);
}

/// @nodoc
mixin _$LeaveQuota {
  @JsonKey(name: 'total_quota')
  int get totalQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_this_year')
  int get usedThisYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_quota')
  int get remainingQuota => throw _privateConstructorUsedError;
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveQuotaCopyWith<LeaveQuota> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveQuotaCopyWith<$Res> {
  factory $LeaveQuotaCopyWith(
          LeaveQuota value, $Res Function(LeaveQuota) then) =
      _$LeaveQuotaCopyWithImpl<$Res, LeaveQuota>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_quota') int totalQuota,
      @JsonKey(name: 'used_this_year') int usedThisYear,
      @JsonKey(name: 'remaining_quota') int remainingQuota,
      @JsonKey(name: 'cashable_leave') int cashableLeave});
}

/// @nodoc
class _$LeaveQuotaCopyWithImpl<$Res, $Val extends LeaveQuota>
    implements $LeaveQuotaCopyWith<$Res> {
  _$LeaveQuotaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuota = null,
    Object? usedThisYear = null,
    Object? remainingQuota = null,
    Object? cashableLeave = null,
  }) {
    return _then(_value.copyWith(
      totalQuota: null == totalQuota
          ? _value.totalQuota
          : totalQuota // ignore: cast_nullable_to_non_nullable
              as int,
      usedThisYear: null == usedThisYear
          ? _value.usedThisYear
          : usedThisYear // ignore: cast_nullable_to_non_nullable
              as int,
      remainingQuota: null == remainingQuota
          ? _value.remainingQuota
          : remainingQuota // ignore: cast_nullable_to_non_nullable
              as int,
      cashableLeave: null == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveQuotaImplCopyWith<$Res>
    implements $LeaveQuotaCopyWith<$Res> {
  factory _$$LeaveQuotaImplCopyWith(
          _$LeaveQuotaImpl value, $Res Function(_$LeaveQuotaImpl) then) =
      __$$LeaveQuotaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_quota') int totalQuota,
      @JsonKey(name: 'used_this_year') int usedThisYear,
      @JsonKey(name: 'remaining_quota') int remainingQuota,
      @JsonKey(name: 'cashable_leave') int cashableLeave});
}

/// @nodoc
class __$$LeaveQuotaImplCopyWithImpl<$Res>
    extends _$LeaveQuotaCopyWithImpl<$Res, _$LeaveQuotaImpl>
    implements _$$LeaveQuotaImplCopyWith<$Res> {
  __$$LeaveQuotaImplCopyWithImpl(
      _$LeaveQuotaImpl _value, $Res Function(_$LeaveQuotaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuota = null,
    Object? usedThisYear = null,
    Object? remainingQuota = null,
    Object? cashableLeave = null,
  }) {
    return _then(_$LeaveQuotaImpl(
      totalQuota: null == totalQuota
          ? _value.totalQuota
          : totalQuota // ignore: cast_nullable_to_non_nullable
              as int,
      usedThisYear: null == usedThisYear
          ? _value.usedThisYear
          : usedThisYear // ignore: cast_nullable_to_non_nullable
              as int,
      remainingQuota: null == remainingQuota
          ? _value.remainingQuota
          : remainingQuota // ignore: cast_nullable_to_non_nullable
              as int,
      cashableLeave: null == cashableLeave
          ? _value.cashableLeave
          : cashableLeave // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveQuotaImpl implements _LeaveQuota {
  const _$LeaveQuotaImpl(
      {@JsonKey(name: 'total_quota') this.totalQuota = 12,
      @JsonKey(name: 'used_this_year') this.usedThisYear = 0,
      @JsonKey(name: 'remaining_quota') this.remainingQuota = 12,
      @JsonKey(name: 'cashable_leave') this.cashableLeave = 0});

  factory _$LeaveQuotaImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveQuotaImplFromJson(json);

  @override
  @JsonKey(name: 'total_quota')
  final int totalQuota;
  @override
  @JsonKey(name: 'used_this_year')
  final int usedThisYear;
  @override
  @JsonKey(name: 'remaining_quota')
  final int remainingQuota;
  @override
  @JsonKey(name: 'cashable_leave')
  final int cashableLeave;

  @override
  String toString() {
    return 'LeaveQuota(totalQuota: $totalQuota, usedThisYear: $usedThisYear, remainingQuota: $remainingQuota, cashableLeave: $cashableLeave)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveQuotaImpl &&
            (identical(other.totalQuota, totalQuota) ||
                other.totalQuota == totalQuota) &&
            (identical(other.usedThisYear, usedThisYear) ||
                other.usedThisYear == usedThisYear) &&
            (identical(other.remainingQuota, remainingQuota) ||
                other.remainingQuota == remainingQuota) &&
            (identical(other.cashableLeave, cashableLeave) ||
                other.cashableLeave == cashableLeave));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalQuota, usedThisYear, remainingQuota, cashableLeave);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveQuotaImplCopyWith<_$LeaveQuotaImpl> get copyWith =>
      __$$LeaveQuotaImplCopyWithImpl<_$LeaveQuotaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveQuotaImplToJson(
      this,
    );
  }
}

abstract class _LeaveQuota implements LeaveQuota {
  const factory _LeaveQuota(
          {@JsonKey(name: 'total_quota') final int totalQuota,
          @JsonKey(name: 'used_this_year') final int usedThisYear,
          @JsonKey(name: 'remaining_quota') final int remainingQuota,
          @JsonKey(name: 'cashable_leave') final int cashableLeave}) =
      _$LeaveQuotaImpl;

  factory _LeaveQuota.fromJson(Map<String, dynamic> json) =
      _$LeaveQuotaImpl.fromJson;

  @override
  @JsonKey(name: 'total_quota')
  int get totalQuota;
  @override
  @JsonKey(name: 'used_this_year')
  int get usedThisYear;
  @override
  @JsonKey(name: 'remaining_quota')
  int get remainingQuota;
  @override
  @JsonKey(name: 'cashable_leave')
  int get cashableLeave;
  @override
  @JsonKey(ignore: true)
  _$$LeaveQuotaImplCopyWith<_$LeaveQuotaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedLeave _$PaginatedLeaveFromJson(Map<String, dynamic> json) {
  return _PaginatedLeave.fromJson(json);
}

/// @nodoc
mixin _$PaginatedLeave {
  List<LeaveEntity> get data => throw _privateConstructorUsedError;
  LeavePaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedLeaveCopyWith<PaginatedLeave> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedLeaveCopyWith<$Res> {
  factory $PaginatedLeaveCopyWith(
          PaginatedLeave value, $Res Function(PaginatedLeave) then) =
      _$PaginatedLeaveCopyWithImpl<$Res, PaginatedLeave>;
  @useResult
  $Res call({List<LeaveEntity> data, LeavePaginationMeta meta});

  $LeavePaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedLeaveCopyWithImpl<$Res, $Val extends PaginatedLeave>
    implements $PaginatedLeaveCopyWith<$Res> {
  _$PaginatedLeaveCopyWithImpl(this._value, this._then);

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
abstract class _$$PaginatedLeaveImplCopyWith<$Res>
    implements $PaginatedLeaveCopyWith<$Res> {
  factory _$$PaginatedLeaveImplCopyWith(_$PaginatedLeaveImpl value,
          $Res Function(_$PaginatedLeaveImpl) then) =
      __$$PaginatedLeaveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LeaveEntity> data, LeavePaginationMeta meta});

  @override
  $LeavePaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedLeaveImplCopyWithImpl<$Res>
    extends _$PaginatedLeaveCopyWithImpl<$Res, _$PaginatedLeaveImpl>
    implements _$$PaginatedLeaveImplCopyWith<$Res> {
  __$$PaginatedLeaveImplCopyWithImpl(
      _$PaginatedLeaveImpl _value, $Res Function(_$PaginatedLeaveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedLeaveImpl(
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
class _$PaginatedLeaveImpl implements _PaginatedLeave {
  const _$PaginatedLeaveImpl(
      {required final List<LeaveEntity> data, required this.meta})
      : _data = data;

  factory _$PaginatedLeaveImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedLeaveImplFromJson(json);

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
    return 'PaginatedLeave(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedLeaveImpl &&
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
  _$$PaginatedLeaveImplCopyWith<_$PaginatedLeaveImpl> get copyWith =>
      __$$PaginatedLeaveImplCopyWithImpl<_$PaginatedLeaveImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedLeaveImplToJson(
      this,
    );
  }
}

abstract class _PaginatedLeave implements PaginatedLeave {
  const factory _PaginatedLeave(
      {required final List<LeaveEntity> data,
      required final LeavePaginationMeta meta}) = _$PaginatedLeaveImpl;

  factory _PaginatedLeave.fromJson(Map<String, dynamic> json) =
      _$PaginatedLeaveImpl.fromJson;

  @override
  List<LeaveEntity> get data;
  @override
  LeavePaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedLeaveImplCopyWith<_$PaginatedLeaveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeavePaginationMeta _$LeavePaginationMetaFromJson(Map<String, dynamic> json) {
  return _LeavePaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$LeavePaginationMeta {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeavePaginationMetaCopyWith<LeavePaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeavePaginationMetaCopyWith<$Res> {
  factory $LeavePaginationMetaCopyWith(
          LeavePaginationMeta value, $Res Function(LeavePaginationMeta) then) =
      _$LeavePaginationMetaCopyWithImpl<$Res, LeavePaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class _$LeavePaginationMetaCopyWithImpl<$Res, $Val extends LeavePaginationMeta>
    implements $LeavePaginationMetaCopyWith<$Res> {
  _$LeavePaginationMetaCopyWithImpl(this._value, this._then);

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
abstract class _$$LeavePaginationMetaImplCopyWith<$Res>
    implements $LeavePaginationMetaCopyWith<$Res> {
  factory _$$LeavePaginationMetaImplCopyWith(_$LeavePaginationMetaImpl value,
          $Res Function(_$LeavePaginationMetaImpl) then) =
      __$$LeavePaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class __$$LeavePaginationMetaImplCopyWithImpl<$Res>
    extends _$LeavePaginationMetaCopyWithImpl<$Res, _$LeavePaginationMetaImpl>
    implements _$$LeavePaginationMetaImplCopyWith<$Res> {
  __$$LeavePaginationMetaImplCopyWithImpl(_$LeavePaginationMetaImpl _value,
      $Res Function(_$LeavePaginationMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? lastPage = null,
  }) {
    return _then(_$LeavePaginationMetaImpl(
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
class _$LeavePaginationMetaImpl implements _LeavePaginationMeta {
  const _$LeavePaginationMetaImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 10,
      this.total = 0,
      @JsonKey(name: 'last_page') this.lastPage = 1});

  factory _$LeavePaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeavePaginationMetaImplFromJson(json);

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
    return 'LeavePaginationMeta(currentPage: $currentPage, perPage: $perPage, total: $total, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeavePaginationMetaImpl &&
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
  _$$LeavePaginationMetaImplCopyWith<_$LeavePaginationMetaImpl> get copyWith =>
      __$$LeavePaginationMetaImplCopyWithImpl<_$LeavePaginationMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeavePaginationMetaImplToJson(
      this,
    );
  }
}

abstract class _LeavePaginationMeta implements LeavePaginationMeta {
  const factory _LeavePaginationMeta(
          {@JsonKey(name: 'current_page') final int currentPage,
          @JsonKey(name: 'per_page') final int perPage,
          final int total,
          @JsonKey(name: 'last_page') final int lastPage}) =
      _$LeavePaginationMetaImpl;

  factory _LeavePaginationMeta.fromJson(Map<String, dynamic> json) =
      _$LeavePaginationMetaImpl.fromJson;

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
  _$$LeavePaginationMetaImplCopyWith<_$LeavePaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
