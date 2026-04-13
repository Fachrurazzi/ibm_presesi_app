import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
class Auth with _$Auth {
  // Tambahkan private constructor agar extension bisa bekerja & helper muncul
  const Auth._();

  const factory Auth.entity({
    @JsonKey(name: 'id') String? id,
    required String? email,
    required String? password,
    String? name,
    Map<String, dynamic>? position,
    @JsonKey(name: 'position_name') String? positionName,
    @JsonKey(name: 'is_default_password')
    @Default(false)
    bool isDefaultPassword,
    @JsonKey(name: 'is_face_registered') @Default(false) bool isFaceRegistered,
    @JsonKey(name: 'image_url') @Default('') String imageUrl,
    @JsonKey(name: 'join_date') String? joinDate,
    @JsonKey(name: 'access_token') String? accessToken,
  }) = AuthEntity;

  // 1. Kembalikan factory ini ke standar Freezed agar generator mau jalan
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  // 2. Buat fungsi helper "Sakti" untuk membongkar JSON Laravel yang nested
  static Auth fromLaravelJson(Map<String, dynamic> json) {
    final Map<String, dynamic> userData = json['user'] is Map<String, dynamic>
        ? json['user'] as Map<String, dynamic>
        : {};

    final Map<String, dynamic> combinedJson = {
      ...json,
      ...userData,
    };

    return Auth.fromJson(combinedJson);
  }
}

extension AuthEntityX on AuthEntity {
  String get displayPosition {
    if (position != null && position!['name'] != null) {
      return position!['name'].toString();
    }
    return positionName ?? 'Karyawan IBM';
  }
}
