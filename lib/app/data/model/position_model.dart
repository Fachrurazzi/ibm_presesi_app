import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/position.dart';

part 'position_model.freezed.dart';
part 'position_model.g.dart';

// ========== POSITION REQUEST ==========
@freezed
class PositionRequest with _$PositionRequest {
  const factory PositionRequest({
    required String name,
  }) = _PositionRequest;

  factory PositionRequest.fromJson(Map<String, dynamic> json) =>
      _$PositionRequestFromJson(json);
}

// ========== POSITION LIST RESPONSE ==========
@freezed
class PositionListResponse with _$PositionListResponse {
  const factory PositionListResponse({
    required List<PositionEntity> data,
  }) = _PositionListResponse;

  factory PositionListResponse.fromJson(Map<String, dynamic> json) =>
      _$PositionListResponseFromJson(json);
}
