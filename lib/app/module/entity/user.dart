import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    int? id,
    String? name,
    String? email,
    
    // LOG API: Laravel mengirim 'image' berisi path file
    String? image,

    @JsonKey(name: 'leave_quota') int? leaveQuota,
    
    // LOG API: Laravel mengirim 'join_date' (tadi di log muncul sebagai ISO String)
    @JsonKey(name: 'join_date') String? joinDate,

    // TAMBAHAN PENTING: Sesuai log API kamu tadi
    @JsonKey(name: 'is_face_registered') bool? isFaceRegistered,
    @JsonKey(name: 'position_id') int? positionId,

    // Relasi ke Jabatan (Nested Object)
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