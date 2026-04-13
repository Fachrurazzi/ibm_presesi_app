import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    int? id,
    String? name,
    String? email,
    String? image,

    // KUNCI SINKRONISASI:
    // Menghubungkan 'leave_quota' dari Laravel ke 'leaveQuota' di Flutter
    @JsonKey(name: 'leave_quota') int? leaveQuota,
    @JsonKey(name: 'join_date') String? joinDate,

    // Relasi ke Jabatan
    PositionEntity? position,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

@freezed
class PositionEntity with _$PositionEntity {
  const factory PositionEntity({
    int? id,
    String? name,
  }) = _PositionEntity;

  factory PositionEntity.fromJson(Map<String, dynamic> json) =>
      _$PositionEntityFromJson(json);
}
