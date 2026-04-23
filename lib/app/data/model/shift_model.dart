import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/shift.dart';

part 'shift_model.freezed.dart';
part 'shift_model.g.dart';

// ========== SHIFT REQUEST ==========
@freezed
class ShiftRequest with _$ShiftRequest {
  const factory ShiftRequest({
    required String name,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    String? description,
  }) = _ShiftRequest;

  factory ShiftRequest.fromJson(Map<String, dynamic> json) =>
      _$ShiftRequestFromJson(json);
}

// ========== SHIFT LIST RESPONSE ==========
@freezed
class ShiftListResponse with _$ShiftListResponse {
  const factory ShiftListResponse({
    required List<ShiftEntity> data,
  }) = _ShiftListResponse;

  factory ShiftListResponse.fromJson(Map<String, dynamic> json) =>
      _$ShiftListResponseFromJson(json);
}

// ========== SHIFT RESPONSE ==========
@freezed
class ShiftResponse with _$ShiftResponse {
  const factory ShiftResponse({
    required ShiftEntity data,
  }) = _ShiftResponse;

  factory ShiftResponse.fromJson(Map<String, dynamic> json) =>
      _$ShiftResponseFromJson(json);
}
