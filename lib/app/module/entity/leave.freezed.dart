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

Leave _$LeaveFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'paramEntity':
      return LeaveParamEntity.fromJson(json);
    case 'entity':
      return LeaveEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Leave',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Leave {
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)
        paramEntity,
    required TResult Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)?
        paramEntity,
    TResult? Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)?
        entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)?
        paramEntity,
    TResult Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)?
        entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeaveParamEntity value) paramEntity,
    required TResult Function(LeaveEntity value) entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeaveParamEntity value)? paramEntity,
    TResult? Function(LeaveEntity value)? entity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeaveParamEntity value)? paramEntity,
    TResult Function(LeaveEntity value)? entity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaveCopyWith<Leave> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveCopyWith<$Res> {
  factory $LeaveCopyWith(Leave value, $Res Function(Leave) then) =
      _$LeaveCopyWithImpl<$Res, Leave>;
  @useResult
  $Res call(
      {@JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String reason});
}

/// @nodoc
class _$LeaveCopyWithImpl<$Res, $Val extends Leave>
    implements $LeaveCopyWith<$Res> {
  _$LeaveCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveParamEntityImplCopyWith<$Res>
    implements $LeaveCopyWith<$Res> {
  factory _$$LeaveParamEntityImplCopyWith(_$LeaveParamEntityImpl value,
          $Res Function(_$LeaveParamEntityImpl) then) =
      __$$LeaveParamEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String reason,
      String type});
}

/// @nodoc
class __$$LeaveParamEntityImplCopyWithImpl<$Res>
    extends _$LeaveCopyWithImpl<$Res, _$LeaveParamEntityImpl>
    implements _$$LeaveParamEntityImplCopyWith<$Res> {
  __$$LeaveParamEntityImplCopyWithImpl(_$LeaveParamEntityImpl _value,
      $Res Function(_$LeaveParamEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = null,
    Object? type = null,
  }) {
    return _then(_$LeaveParamEntityImpl(
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveParamEntityImpl implements LeaveParamEntity {
  const _$LeaveParamEntityImpl(
      {@JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      required this.reason,
      this.type = 'Cuti',
      final String? $type})
      : $type = $type ?? 'paramEntity';

  factory _$LeaveParamEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveParamEntityImplFromJson(json);

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
  final String type;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Leave.paramEntity(startDate: $startDate, endDate: $endDate, reason: $reason, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveParamEntityImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startDate, endDate, reason, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveParamEntityImplCopyWith<_$LeaveParamEntityImpl> get copyWith =>
      __$$LeaveParamEntityImplCopyWithImpl<_$LeaveParamEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)
        paramEntity,
    required TResult Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)
        entity,
  }) {
    return paramEntity(startDate, endDate, reason, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)?
        paramEntity,
    TResult? Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)?
        entity,
  }) {
    return paramEntity?.call(startDate, endDate, reason, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)?
        paramEntity,
    TResult Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)?
        entity,
    required TResult orElse(),
  }) {
    if (paramEntity != null) {
      return paramEntity(startDate, endDate, reason, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeaveParamEntity value) paramEntity,
    required TResult Function(LeaveEntity value) entity,
  }) {
    return paramEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeaveParamEntity value)? paramEntity,
    TResult? Function(LeaveEntity value)? entity,
  }) {
    return paramEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeaveParamEntity value)? paramEntity,
    TResult Function(LeaveEntity value)? entity,
    required TResult orElse(),
  }) {
    if (paramEntity != null) {
      return paramEntity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveParamEntityImplToJson(
      this,
    );
  }
}

abstract class LeaveParamEntity implements Leave {
  const factory LeaveParamEntity(
      {@JsonKey(name: 'start_date') required final String startDate,
      @JsonKey(name: 'end_date') required final String endDate,
      required final String reason,
      final String type}) = _$LeaveParamEntityImpl;

  factory LeaveParamEntity.fromJson(Map<String, dynamic> json) =
      _$LeaveParamEntityImpl.fromJson;

  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  String get reason;
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$LeaveParamEntityImplCopyWith<_$LeaveParamEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LeaveEntityImplCopyWith<$Res>
    implements $LeaveCopyWith<$Res> {
  factory _$$LeaveEntityImplCopyWith(
          _$LeaveEntityImpl value, $Res Function(_$LeaveEntityImpl) then) =
      __$$LeaveEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      String reason,
      String status,
      @JsonKey(name: 'approved_by') String? approvedBy});
}

/// @nodoc
class __$$LeaveEntityImplCopyWithImpl<$Res>
    extends _$LeaveCopyWithImpl<$Res, _$LeaveEntityImpl>
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
    Object? reason = null,
    Object? status = null,
    Object? approvedBy = freezed,
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
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveEntityImpl implements LeaveEntity {
  const _$LeaveEntityImpl(
      {required this.id,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      required this.reason,
      this.status = 'pending',
      @JsonKey(name: 'approved_by') this.approvedBy,
      final String? $type})
      : $type = $type ?? 'entity';

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
  final String reason;

  /// Status pengajuan: 'pending', 'approved', 'rejected'
  @override
  @JsonKey()
  final String status;

  /// Nama Admin yang menyetujui (Opsional)
  @override
  @JsonKey(name: 'approved_by')
  final String? approvedBy;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Leave.entity(id: $id, startDate: $startDate, endDate: $endDate, reason: $reason, status: $status, approvedBy: $approvedBy)';
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
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startDate, endDate, reason, status, approvedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveEntityImplCopyWith<_$LeaveEntityImpl> get copyWith =>
      __$$LeaveEntityImplCopyWithImpl<_$LeaveEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)
        paramEntity,
    required TResult Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)
        entity,
  }) {
    return entity(id, startDate, endDate, reason, status, approvedBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)?
        paramEntity,
    TResult? Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)?
        entity,
  }) {
    return entity?.call(id, startDate, endDate, reason, status, approvedBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String type)?
        paramEntity,
    TResult Function(
            int id,
            @JsonKey(name: 'start_date') String startDate,
            @JsonKey(name: 'end_date') String endDate,
            String reason,
            String status,
            @JsonKey(name: 'approved_by') String? approvedBy)?
        entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(id, startDate, endDate, reason, status, approvedBy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LeaveParamEntity value) paramEntity,
    required TResult Function(LeaveEntity value) entity,
  }) {
    return entity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LeaveParamEntity value)? paramEntity,
    TResult? Function(LeaveEntity value)? entity,
  }) {
    return entity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LeaveParamEntity value)? paramEntity,
    TResult Function(LeaveEntity value)? entity,
    required TResult orElse(),
  }) {
    if (entity != null) {
      return entity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveEntityImplToJson(
      this,
    );
  }
}

abstract class LeaveEntity implements Leave {
  const factory LeaveEntity(
          {required final int id,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') required final String endDate,
          required final String reason,
          final String status,
          @JsonKey(name: 'approved_by') final String? approvedBy}) =
      _$LeaveEntityImpl;

  factory LeaveEntity.fromJson(Map<String, dynamic> json) =
      _$LeaveEntityImpl.fromJson;

  int get id;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  String get reason;

  /// Status pengajuan: 'pending', 'approved', 'rejected'
  String get status;

  /// Nama Admin yang menyetujui (Opsional)
  @JsonKey(name: 'approved_by')
  String? get approvedBy;
  @override
  @JsonKey(ignore: true)
  _$$LeaveEntityImplCopyWith<_$LeaveEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
