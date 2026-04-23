import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';
part 'position.g.dart';

// ========== POSITION ENTITY ==========
@freezed
class PositionEntity with _$PositionEntity {
  const factory PositionEntity({
    required int id,
    required String name,
    @JsonKey(name: 'user_count') @Default(0) int userCount,
  }) = _PositionEntity;

  factory PositionEntity.fromJson(Map<String, dynamic> json) =>
      _$PositionEntityFromJson(json);
}

// ========== EXTENSIONS ==========
extension PositionEntityX on PositionEntity {
  String get displayName => name;
  String get userCountDisplay => '$userCount karyawan';
  bool get hasUsers => userCount > 0;
}
