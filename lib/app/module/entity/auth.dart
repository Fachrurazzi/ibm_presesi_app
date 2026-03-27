import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.g.dart';
part 'auth.freezed.dart';

@freezed
sealed class Auth with _$Auth {
  // Entity untuk menampung input dari Form Login
  factory Auth.entity({
    required String? email,
    required String? password,
  }) = AuthEntity;

  // Boilerplate untuk konversi ke JSON agar bisa dikirim via Dio
  factory Auth.fromJson(Map<String, Object?> json) => _$AuthFromJson(json);
}
