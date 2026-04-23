import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift.freezed.dart';
part 'shift.g.dart';

// ========== SHIFT ENTITY ==========
@freezed
class ShiftEntity with _$ShiftEntity {
  const factory ShiftEntity({
    required int id,
    required String name,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'start_time_display') String? startTimeDisplay,
    @JsonKey(name: 'end_time_display') String? endTimeDisplay,
    @JsonKey(name: 'duration_hours') @Default(0.0) double durationHours,
    @JsonKey(name: 'is_overnight') @Default(false) bool isOvernight,
    String? description,
  }) = _ShiftEntity;

  factory ShiftEntity.fromJson(Map<String, dynamic> json) =>
      _$ShiftEntityFromJson(json);
}

// ========== EXTENSIONS ==========
extension ShiftEntityX on ShiftEntity {
  String get timeDisplay {
    final start = startTimeDisplay ?? startTime ?? '--:--';
    final end = endTimeDisplay ?? endTime ?? '--:--';
    return '$start - $end';
  }

  String get durationDisplay {
    if (durationHours == 0) return '-';
    final hours = durationHours.floor();
    final minutes = ((durationHours - hours) * 60).round();
    if (minutes > 0) {
      return '$hours jam $minutes menit';
    }
    return '$hours jam';
  }

  String get typeDisplay => isOvernight ? 'Shift Malam' : 'Shift Reguler';

  bool get hasValidTimes => startTime != null && endTime != null;
}
