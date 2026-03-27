import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
sealed class Auth with _$Auth {
  // Ini adalah class yang dipanggil di Repository sebagai AuthModel
  factory Auth.model({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    required UserModel user,
  }) = AuthModel;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}

@freezed
sealed class User with _$User {
  factory User.model({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'image') String? image,
    required PositionModel? position, // Menggunakan objek Position
    @JsonKey(name: 'join_date') required String joinDate,
    @JsonKey(name: 'leave_quota') required int leaveQuota,
    @JsonKey(name: 'cashable_leave') required int cashableLeave,
  }) = UserModel;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
class Position with _$Position {
  factory Position.model({
    required int id,
    required String name,
  }) = PositionModel;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}
