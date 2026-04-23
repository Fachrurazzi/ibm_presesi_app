// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionEntity _$PermissionEntityFromJson(Map<String, dynamic> json) {
  return _PermissionEntity.fromJson(json);
}

/// @nodoc
mixin _$PermissionEntity {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_label')
  String? get typeLabel => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_proof_url')
  String? get imageProofUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_label')
  String? get statusLabel => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionEntityCopyWith<PermissionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionEntityCopyWith<$Res> {
  factory $PermissionEntityCopyWith(
          PermissionEntity value, $Res Function(PermissionEntity) then) =
      _$PermissionEntityCopyWithImpl<$Res, PermissionEntity>;
  @useResult
  $Res call(
      {int id,
      String type,
      @JsonKey(name: 'type_label') String? typeLabel,
      String date,
      String reason,
      @JsonKey(name: 'image_proof_url') String? imageProofUrl,
      String status,
      @JsonKey(name: 'status_label') String? statusLabel,
      String? note,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$PermissionEntityCopyWithImpl<$Res, $Val extends PermissionEntity>
    implements $PermissionEntityCopyWith<$Res> {
  _$PermissionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? typeLabel = freezed,
    Object? date = null,
    Object? reason = null,
    Object? imageProofUrl = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      typeLabel: freezed == typeLabel
          ? _value.typeLabel
          : typeLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      imageProofUrl: freezed == imageProofUrl
          ? _value.imageProofUrl
          : imageProofUrl // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PermissionEntityImplCopyWith<$Res>
    implements $PermissionEntityCopyWith<$Res> {
  factory _$$PermissionEntityImplCopyWith(_$PermissionEntityImpl value,
          $Res Function(_$PermissionEntityImpl) then) =
      __$$PermissionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String type,
      @JsonKey(name: 'type_label') String? typeLabel,
      String date,
      String reason,
      @JsonKey(name: 'image_proof_url') String? imageProofUrl,
      String status,
      @JsonKey(name: 'status_label') String? statusLabel,
      String? note,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$PermissionEntityImplCopyWithImpl<$Res>
    extends _$PermissionEntityCopyWithImpl<$Res, _$PermissionEntityImpl>
    implements _$$PermissionEntityImplCopyWith<$Res> {
  __$$PermissionEntityImplCopyWithImpl(_$PermissionEntityImpl _value,
      $Res Function(_$PermissionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? typeLabel = freezed,
    Object? date = null,
    Object? reason = null,
    Object? imageProofUrl = freezed,
    Object? status = null,
    Object? statusLabel = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PermissionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      typeLabel: freezed == typeLabel
          ? _value.typeLabel
          : typeLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      imageProofUrl: freezed == imageProofUrl
          ? _value.imageProofUrl
          : imageProofUrl // ignore: cast_nullable_to_non_nullable
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
class _$PermissionEntityImpl implements _PermissionEntity {
  const _$PermissionEntityImpl(
      {required this.id,
      required this.type,
      @JsonKey(name: 'type_label') this.typeLabel,
      required this.date,
      required this.reason,
      @JsonKey(name: 'image_proof_url') this.imageProofUrl,
      this.status = 'PENDING',
      @JsonKey(name: 'status_label') this.statusLabel,
      this.note,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$PermissionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  @JsonKey(name: 'type_label')
  final String? typeLabel;
  @override
  final String date;
  @override
  final String reason;
  @override
  @JsonKey(name: 'image_proof_url')
  final String? imageProofUrl;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'status_label')
  final String? statusLabel;
  @override
  final String? note;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'PermissionEntity(id: $id, type: $type, typeLabel: $typeLabel, date: $date, reason: $reason, imageProofUrl: $imageProofUrl, status: $status, statusLabel: $statusLabel, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.typeLabel, typeLabel) ||
                other.typeLabel == typeLabel) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.imageProofUrl, imageProofUrl) ||
                other.imageProofUrl == imageProofUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, typeLabel, date,
      reason, imageProofUrl, status, statusLabel, note, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionEntityImplCopyWith<_$PermissionEntityImpl> get copyWith =>
      __$$PermissionEntityImplCopyWithImpl<_$PermissionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionEntityImplToJson(
      this,
    );
  }
}

abstract class _PermissionEntity implements PermissionEntity {
  const factory _PermissionEntity(
          {required final int id,
          required final String type,
          @JsonKey(name: 'type_label') final String? typeLabel,
          required final String date,
          required final String reason,
          @JsonKey(name: 'image_proof_url') final String? imageProofUrl,
          final String status,
          @JsonKey(name: 'status_label') final String? statusLabel,
          final String? note,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$PermissionEntityImpl;

  factory _PermissionEntity.fromJson(Map<String, dynamic> json) =
      _$PermissionEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  @JsonKey(name: 'type_label')
  String? get typeLabel;
  @override
  String get date;
  @override
  String get reason;
  @override
  @JsonKey(name: 'image_proof_url')
  String? get imageProofUrl;
  @override
  String get status;
  @override
  @JsonKey(name: 'status_label')
  String? get statusLabel;
  @override
  String? get note;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PermissionEntityImplCopyWith<_$PermissionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PermissionType _$PermissionTypeFromJson(Map<String, dynamic> json) {
  return _PermissionType.fromJson(json);
}

/// @nodoc
mixin _$PermissionType {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionTypeCopyWith<PermissionType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionTypeCopyWith<$Res> {
  factory $PermissionTypeCopyWith(
          PermissionType value, $Res Function(PermissionType) then) =
      _$PermissionTypeCopyWithImpl<$Res, PermissionType>;
  @useResult
  $Res call({String value, String label, String? description});
}

/// @nodoc
class _$PermissionTypeCopyWithImpl<$Res, $Val extends PermissionType>
    implements $PermissionTypeCopyWith<$Res> {
  _$PermissionTypeCopyWithImpl(this._value, this._then);

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
abstract class _$$PermissionTypeImplCopyWith<$Res>
    implements $PermissionTypeCopyWith<$Res> {
  factory _$$PermissionTypeImplCopyWith(_$PermissionTypeImpl value,
          $Res Function(_$PermissionTypeImpl) then) =
      __$$PermissionTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label, String? description});
}

/// @nodoc
class __$$PermissionTypeImplCopyWithImpl<$Res>
    extends _$PermissionTypeCopyWithImpl<$Res, _$PermissionTypeImpl>
    implements _$$PermissionTypeImplCopyWith<$Res> {
  __$$PermissionTypeImplCopyWithImpl(
      _$PermissionTypeImpl _value, $Res Function(_$PermissionTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? description = freezed,
  }) {
    return _then(_$PermissionTypeImpl(
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
class _$PermissionTypeImpl implements _PermissionType {
  const _$PermissionTypeImpl(
      {required this.value, required this.label, this.description});

  factory _$PermissionTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionTypeImplFromJson(json);

  @override
  final String value;
  @override
  final String label;
  @override
  final String? description;

  @override
  String toString() {
    return 'PermissionType(value: $value, label: $label, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionTypeImpl &&
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
  _$$PermissionTypeImplCopyWith<_$PermissionTypeImpl> get copyWith =>
      __$$PermissionTypeImplCopyWithImpl<_$PermissionTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionTypeImplToJson(
      this,
    );
  }
}

abstract class _PermissionType implements PermissionType {
  const factory _PermissionType(
      {required final String value,
      required final String label,
      final String? description}) = _$PermissionTypeImpl;

  factory _PermissionType.fromJson(Map<String, dynamic> json) =
      _$PermissionTypeImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$PermissionTypeImplCopyWith<_$PermissionTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PermissionCheckResult _$PermissionCheckResultFromJson(
    Map<String, dynamic> json) {
  return _PermissionCheckResult.fromJson(json);
}

/// @nodoc
mixin _$PermissionCheckResult {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_permission')
  bool get hasPermission => throw _privateConstructorUsedError;
  PermissionEntity? get permission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionCheckResultCopyWith<PermissionCheckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCheckResultCopyWith<$Res> {
  factory $PermissionCheckResultCopyWith(PermissionCheckResult value,
          $Res Function(PermissionCheckResult) then) =
      _$PermissionCheckResultCopyWithImpl<$Res, PermissionCheckResult>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'has_permission') bool hasPermission,
      PermissionEntity? permission});

  $PermissionEntityCopyWith<$Res>? get permission;
}

/// @nodoc
class _$PermissionCheckResultCopyWithImpl<$Res,
        $Val extends PermissionCheckResult>
    implements $PermissionCheckResultCopyWith<$Res> {
  _$PermissionCheckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? hasPermission = null,
    Object? permission = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      hasPermission: null == hasPermission
          ? _value.hasPermission
          : hasPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as PermissionEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionEntityCopyWith<$Res>? get permission {
    if (_value.permission == null) {
      return null;
    }

    return $PermissionEntityCopyWith<$Res>(_value.permission!, (value) {
      return _then(_value.copyWith(permission: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermissionCheckResultImplCopyWith<$Res>
    implements $PermissionCheckResultCopyWith<$Res> {
  factory _$$PermissionCheckResultImplCopyWith(
          _$PermissionCheckResultImpl value,
          $Res Function(_$PermissionCheckResultImpl) then) =
      __$$PermissionCheckResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'has_permission') bool hasPermission,
      PermissionEntity? permission});

  @override
  $PermissionEntityCopyWith<$Res>? get permission;
}

/// @nodoc
class __$$PermissionCheckResultImplCopyWithImpl<$Res>
    extends _$PermissionCheckResultCopyWithImpl<$Res,
        _$PermissionCheckResultImpl>
    implements _$$PermissionCheckResultImplCopyWith<$Res> {
  __$$PermissionCheckResultImplCopyWithImpl(_$PermissionCheckResultImpl _value,
      $Res Function(_$PermissionCheckResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? hasPermission = null,
    Object? permission = freezed,
  }) {
    return _then(_$PermissionCheckResultImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      hasPermission: null == hasPermission
          ? _value.hasPermission
          : hasPermission // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as PermissionEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionCheckResultImpl implements _PermissionCheckResult {
  const _$PermissionCheckResultImpl(
      {required this.date,
      @JsonKey(name: 'has_permission') this.hasPermission = false,
      this.permission});

  factory _$PermissionCheckResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionCheckResultImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'has_permission')
  final bool hasPermission;
  @override
  final PermissionEntity? permission;

  @override
  String toString() {
    return 'PermissionCheckResult(date: $date, hasPermission: $hasPermission, permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionCheckResultImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hasPermission, hasPermission) ||
                other.hasPermission == hasPermission) &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, hasPermission, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionCheckResultImplCopyWith<_$PermissionCheckResultImpl>
      get copyWith => __$$PermissionCheckResultImplCopyWithImpl<
          _$PermissionCheckResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionCheckResultImplToJson(
      this,
    );
  }
}

abstract class _PermissionCheckResult implements PermissionCheckResult {
  const factory _PermissionCheckResult(
      {required final String date,
      @JsonKey(name: 'has_permission') final bool hasPermission,
      final PermissionEntity? permission}) = _$PermissionCheckResultImpl;

  factory _PermissionCheckResult.fromJson(Map<String, dynamic> json) =
      _$PermissionCheckResultImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'has_permission')
  bool get hasPermission;
  @override
  PermissionEntity? get permission;
  @override
  @JsonKey(ignore: true)
  _$$PermissionCheckResultImplCopyWith<_$PermissionCheckResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaginatedPermission _$PaginatedPermissionFromJson(Map<String, dynamic> json) {
  return _PaginatedPermission.fromJson(json);
}

/// @nodoc
mixin _$PaginatedPermission {
  List<PermissionEntity> get data => throw _privateConstructorUsedError;
  PermissionPaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedPermissionCopyWith<PaginatedPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedPermissionCopyWith<$Res> {
  factory $PaginatedPermissionCopyWith(
          PaginatedPermission value, $Res Function(PaginatedPermission) then) =
      _$PaginatedPermissionCopyWithImpl<$Res, PaginatedPermission>;
  @useResult
  $Res call({List<PermissionEntity> data, PermissionPaginationMeta meta});

  $PermissionPaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedPermissionCopyWithImpl<$Res, $Val extends PaginatedPermission>
    implements $PaginatedPermissionCopyWith<$Res> {
  _$PaginatedPermissionCopyWithImpl(this._value, this._then);

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
              as List<PermissionEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PermissionPaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionPaginationMetaCopyWith<$Res> get meta {
    return $PermissionPaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedPermissionImplCopyWith<$Res>
    implements $PaginatedPermissionCopyWith<$Res> {
  factory _$$PaginatedPermissionImplCopyWith(_$PaginatedPermissionImpl value,
          $Res Function(_$PaginatedPermissionImpl) then) =
      __$$PaginatedPermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PermissionEntity> data, PermissionPaginationMeta meta});

  @override
  $PermissionPaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedPermissionImplCopyWithImpl<$Res>
    extends _$PaginatedPermissionCopyWithImpl<$Res, _$PaginatedPermissionImpl>
    implements _$$PaginatedPermissionImplCopyWith<$Res> {
  __$$PaginatedPermissionImplCopyWithImpl(_$PaginatedPermissionImpl _value,
      $Res Function(_$PaginatedPermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedPermissionImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PermissionEntity>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PermissionPaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedPermissionImpl implements _PaginatedPermission {
  const _$PaginatedPermissionImpl(
      {required final List<PermissionEntity> data, required this.meta})
      : _data = data;

  factory _$PaginatedPermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedPermissionImplFromJson(json);

  final List<PermissionEntity> _data;
  @override
  List<PermissionEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PermissionPaginationMeta meta;

  @override
  String toString() {
    return 'PaginatedPermission(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedPermissionImpl &&
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
  _$$PaginatedPermissionImplCopyWith<_$PaginatedPermissionImpl> get copyWith =>
      __$$PaginatedPermissionImplCopyWithImpl<_$PaginatedPermissionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedPermissionImplToJson(
      this,
    );
  }
}

abstract class _PaginatedPermission implements PaginatedPermission {
  const factory _PaginatedPermission(
          {required final List<PermissionEntity> data,
          required final PermissionPaginationMeta meta}) =
      _$PaginatedPermissionImpl;

  factory _PaginatedPermission.fromJson(Map<String, dynamic> json) =
      _$PaginatedPermissionImpl.fromJson;

  @override
  List<PermissionEntity> get data;
  @override
  PermissionPaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedPermissionImplCopyWith<_$PaginatedPermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PermissionPaginationMeta _$PermissionPaginationMetaFromJson(
    Map<String, dynamic> json) {
  return _PermissionPaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PermissionPaginationMeta {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionPaginationMetaCopyWith<PermissionPaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionPaginationMetaCopyWith<$Res> {
  factory $PermissionPaginationMetaCopyWith(PermissionPaginationMeta value,
          $Res Function(PermissionPaginationMeta) then) =
      _$PermissionPaginationMetaCopyWithImpl<$Res, PermissionPaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class _$PermissionPaginationMetaCopyWithImpl<$Res,
        $Val extends PermissionPaginationMeta>
    implements $PermissionPaginationMetaCopyWith<$Res> {
  _$PermissionPaginationMetaCopyWithImpl(this._value, this._then);

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
abstract class _$$PermissionPaginationMetaImplCopyWith<$Res>
    implements $PermissionPaginationMetaCopyWith<$Res> {
  factory _$$PermissionPaginationMetaImplCopyWith(
          _$PermissionPaginationMetaImpl value,
          $Res Function(_$PermissionPaginationMetaImpl) then) =
      __$$PermissionPaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class __$$PermissionPaginationMetaImplCopyWithImpl<$Res>
    extends _$PermissionPaginationMetaCopyWithImpl<$Res,
        _$PermissionPaginationMetaImpl>
    implements _$$PermissionPaginationMetaImplCopyWith<$Res> {
  __$$PermissionPaginationMetaImplCopyWithImpl(
      _$PermissionPaginationMetaImpl _value,
      $Res Function(_$PermissionPaginationMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? lastPage = null,
  }) {
    return _then(_$PermissionPaginationMetaImpl(
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
class _$PermissionPaginationMetaImpl implements _PermissionPaginationMeta {
  const _$PermissionPaginationMetaImpl(
      {@JsonKey(name: 'current_page') this.currentPage = 1,
      @JsonKey(name: 'per_page') this.perPage = 10,
      this.total = 0,
      @JsonKey(name: 'last_page') this.lastPage = 1});

  factory _$PermissionPaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionPaginationMetaImplFromJson(json);

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
    return 'PermissionPaginationMeta(currentPage: $currentPage, perPage: $perPage, total: $total, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionPaginationMetaImpl &&
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
  _$$PermissionPaginationMetaImplCopyWith<_$PermissionPaginationMetaImpl>
      get copyWith => __$$PermissionPaginationMetaImplCopyWithImpl<
          _$PermissionPaginationMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionPaginationMetaImplToJson(
      this,
    );
  }
}

abstract class _PermissionPaginationMeta implements PermissionPaginationMeta {
  const factory _PermissionPaginationMeta(
          {@JsonKey(name: 'current_page') final int currentPage,
          @JsonKey(name: 'per_page') final int perPage,
          final int total,
          @JsonKey(name: 'last_page') final int lastPage}) =
      _$PermissionPaginationMetaImpl;

  factory _PermissionPaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PermissionPaginationMetaImpl.fromJson;

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
  _$$PermissionPaginationMetaImplCopyWith<_$PermissionPaginationMetaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
