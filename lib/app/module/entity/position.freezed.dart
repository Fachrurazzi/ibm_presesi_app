// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionEntity _$PositionEntityFromJson(Map<String, dynamic> json) {
  return _PositionEntity.fromJson(json);
}

/// @nodoc
mixin _$PositionEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_count')
  int get userCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionEntityCopyWith<PositionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionEntityCopyWith<$Res> {
  factory $PositionEntityCopyWith(
          PositionEntity value, $Res Function(PositionEntity) then) =
      _$PositionEntityCopyWithImpl<$Res, PositionEntity>;
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'user_count') int userCount});
}

/// @nodoc
class _$PositionEntityCopyWithImpl<$Res, $Val extends PositionEntity>
    implements $PositionEntityCopyWith<$Res> {
  _$PositionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userCount = null,
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
      userCount: null == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionEntityImplCopyWith<$Res>
    implements $PositionEntityCopyWith<$Res> {
  factory _$$PositionEntityImplCopyWith(_$PositionEntityImpl value,
          $Res Function(_$PositionEntityImpl) then) =
      __$$PositionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'user_count') int userCount});
}

/// @nodoc
class __$$PositionEntityImplCopyWithImpl<$Res>
    extends _$PositionEntityCopyWithImpl<$Res, _$PositionEntityImpl>
    implements _$$PositionEntityImplCopyWith<$Res> {
  __$$PositionEntityImplCopyWithImpl(
      _$PositionEntityImpl _value, $Res Function(_$PositionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userCount = null,
  }) {
    return _then(_$PositionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userCount: null == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionEntityImpl implements _PositionEntity {
  const _$PositionEntityImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'user_count') this.userCount = 0});

  factory _$PositionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'user_count')
  final int userCount;

  @override
  String toString() {
    return 'PositionEntity(id: $id, name: $name, userCount: $userCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, userCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      __$$PositionEntityImplCopyWithImpl<_$PositionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionEntityImplToJson(
      this,
    );
  }
}

abstract class _PositionEntity implements PositionEntity {
  const factory _PositionEntity(
      {required final int id,
      required final String name,
      @JsonKey(name: 'user_count') final int userCount}) = _$PositionEntityImpl;

  factory _PositionEntity.fromJson(Map<String, dynamic> json) =
      _$PositionEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'user_count')
  int get userCount;
  @override
  @JsonKey(ignore: true)
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
