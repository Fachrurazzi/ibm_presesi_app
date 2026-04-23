import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

// ========== USER UPDATE REQUEST ==========
@freezed
class UserUpdateRequest with _$UserUpdateRequest {
  const factory UserUpdateRequest({
    required String name,
  }) = _UserUpdateRequest;

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestFromJson(json);
}

// ========== USER PROFILE RESPONSE ==========
@freezed
class UserProfileResponse with _$UserProfileResponse {
  const factory UserProfileResponse({
    required UserEntity data,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}

// ========== USER PHOTO RESPONSE ==========
@freezed
class UserPhotoResponse with _$UserPhotoResponse {
  const factory UserPhotoResponse({
    @JsonKey(name: 'full_url') required String fullUrl,
  }) = _UserPhotoResponse;

  factory UserPhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPhotoResponseFromJson(json);
}

// ========== USER SCHEDULE RESPONSE ==========
@freezed
class UserScheduleResponse with _$UserScheduleResponse {
  const factory UserScheduleResponse({
    required int month,
    required int year,
    @JsonKey(name: 'month_name') String? monthName,
    required List<UserSchedule> schedules,
    @Default(0) int total,
  }) = _UserScheduleResponse;

  factory UserScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserScheduleResponseFromJson(json);
}

// ========== TODAY SCHEDULE RESPONSE ==========
@freezed
class TodayScheduleResponse with _$TodayScheduleResponse {
  const factory TodayScheduleResponse({
    required TodaySchedule data,
  }) = _TodayScheduleResponse;

  factory TodayScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$TodayScheduleResponseFromJson(json);
}

// ========== LEAVE SUMMARY RESPONSE ==========
@freezed
class LeaveSummaryResponse with _$LeaveSummaryResponse {
  const factory LeaveSummaryResponse({
    required LeaveSummary data,
  }) = _LeaveSummaryResponse;

  factory LeaveSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveSummaryResponseFromJson(json);
}

// ========== FCM TOKEN REQUEST ==========
@freezed
class FcmTokenRequest with _$FcmTokenRequest {
  const factory FcmTokenRequest({
    @JsonKey(name: 'fcm_token') required String fcmToken,
  }) = _FcmTokenRequest;

  factory FcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenRequestFromJson(json);
}

// ========== LOCATION UPDATE REQUEST ==========
@freezed
class LocationUpdateRequest with _$LocationUpdateRequest {
  const factory LocationUpdateRequest({
    required double latitude,
    required double longitude,
  }) = _LocationUpdateRequest;

  factory LocationUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$LocationUpdateRequestFromJson(json);
}
