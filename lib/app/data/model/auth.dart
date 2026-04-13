import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
    UserModel? user,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    // Gunakan int? atau default yang masuk akal, jangan 0 jika id itu penting
    int? id,

    // Jangan beri default kosong jika kita ingin validasi data dari server
    String? name,
    String? email,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'image_url') String? imageUrl,

    // Relasi Objek Position
    PositionModel? position,

    // Backup field position_name
    @JsonKey(name: 'position_name') String? positionName,
    @JsonKey(name: 'join_date') String? joinDate,
    @JsonKey(name: 'leave_quota') int? leaveQuota,
    @JsonKey(name: 'cashable_leave') int? cashableLeave,

    // --- ONBOARDING STATUS PT IBM ---
    @JsonKey(name: 'is_default_password')
    @Default(false)
    bool isDefaultPassword,
    @JsonKey(name: 'is_face_registered') @Default(false) bool isFaceRegistered,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class PositionModel with _$PositionModel {
  const factory PositionModel({
    int? id,
    // Default 'Karyawan IBM' boleh tetap ada sebagai fallback UI
    @Default('Karyawan IBM') String name,
  }) = _PositionModel;

  factory PositionModel.fromJson(Map<String, dynamic> json) =>
      _$PositionModelFromJson(json);
}
