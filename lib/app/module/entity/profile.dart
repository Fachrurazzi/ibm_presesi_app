import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile.entity({
    @Default(0) int id,
    @Default("") String name,
    @Default("") String email,
    @JsonKey(name: 'image') String? image,

    // TAMBAHKAN INI: Agar join_date dari Laravel bisa terbaca
    @JsonKey(name: 'join_date') String? joinDate,

    // Gunakan Map agar extension bisa baca key 'name' (seperti Admin/HRD)
    Map<String, dynamic>? position,
  }) = ProfileEntity;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

// Params untuk UseCase (tetap sama)
class ProfileParamUpdate {
  final String name;
  final File? image;
  final String? oldPassword;
  final String? newPassword;

  ProfileParamUpdate({
    required this.name,
    this.image,
    this.oldPassword,
    this.newPassword,
  });
}

// Extension Sakti untuk ambil Jabatan
extension ProfileX on ProfileEntity {
  String get positionName {
    if (position != null && position is Map) {
      return position!['name']?.toString() ?? 'Karyawan';
    }
    return 'Karyawan';
  }
}
