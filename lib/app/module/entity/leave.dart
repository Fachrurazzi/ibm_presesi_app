import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave.g.dart';
part 'leave.freezed.dart';

@freezed
sealed class Leave with _$Leave {
  const factory Leave.paramEntity({
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required String reason,
  }) = LeaveParamEntity;

  // Tambahkan Entity untuk list cuti jika diperlukan
  const factory Leave.entity({
    required int id,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required String reason,
    required String status, // pending, approved, rejected
  }) = LeaveEntity;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);
}