import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
sealed class Auth with _$Auth {
  factory Auth.model({
    @JsonKey(name: 'access_token') @Default('') String accessToken,
    @JsonKey(name: 'token_type') @Default('') String tokenType,
    UserModel? user, // Ubah jadi nullable agar aman jika data user gagal load
  }) = AuthModel;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}

@freezed
sealed class User with _$User {
  factory User.model({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String email,
    @JsonKey(name: 'image') String? image,
    PositionModel? position, // Menggunakan objek Position nullable
    @JsonKey(name: 'join_date') @Default('') String joinDate,
    @JsonKey(name: 'leave_quota') @Default(0) int leaveQuota,
    @JsonKey(name: 'cashable_leave') @Default(0) int cashableLeave,
  }) = UserModel;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
class Position with _$Position {
  factory Position.model({
    @Default(0) int id,
    @Default('Anggota IBM') String name, // Kasih default name
  }) = PositionModel;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}
