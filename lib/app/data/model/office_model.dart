import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/office.dart';

part 'office_model.freezed.dart';
part 'office_model.g.dart';

// ========== OFFICE REQUEST ==========
@freezed
class OfficeRequest with _$OfficeRequest {
  const factory OfficeRequest({
    required String name,
    double? latitude,
    double? longitude,
    int? radius,
    @JsonKey(name: 'supervisor_name') String? supervisorName,
  }) = _OfficeRequest;

  factory OfficeRequest.fromJson(Map<String, dynamic> json) =>
      _$OfficeRequestFromJson(json);
}

// ========== OFFICE RESPONSE ==========
@freezed
class OfficeResponse with _$OfficeResponse {
  const factory OfficeResponse({
    required OfficeEntity data,
  }) = _OfficeResponse;

  factory OfficeResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficeResponseFromJson(json);
}

// ========== OFFICE LIST RESPONSE ==========
@freezed
class OfficeListResponse with _$OfficeListResponse {
  const factory OfficeListResponse({
    required List<OfficeEntity> data,
  }) = _OfficeListResponse;

  factory OfficeListResponse.fromJson(Map<String, dynamic> json) =>
      _$OfficeListResponseFromJson(json);
}

// ========== CHECK RADIUS REQUEST ==========
@freezed
class CheckRadiusRequest with _$CheckRadiusRequest {
  const factory CheckRadiusRequest({
    @JsonKey(name: 'office_id') required int officeId,
    required double latitude,
    required double longitude,
  }) = _CheckRadiusRequest;

  factory CheckRadiusRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckRadiusRequestFromJson(json);
}
