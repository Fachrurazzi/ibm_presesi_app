import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';
// Import file tempat PositionEntity berada (biasanya user_entity.dart atau position_entity.dart)

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile.entity({
    @Default(0) int id,
    @Default("Karyawan IBM") String name,
    @Default("") String email,
    @JsonKey(name: 'image') String? image,

    /// Format: YYYY-MM-DD dari Laravel
    @JsonKey(name: 'join_date') @Default("-") String joinDate,

    /// REVISI: Menggunakan PositionEntity agar sinkron dengan struktur JSON
    /// JSON: "position": { "id": 1, "name": "Admin" }
    PositionEntity? position,
  }) = ProfileEntity;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

/// Params untuk UseCase Update Profil
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

/// Extension untuk mempermudah akses data di UI
extension ProfileX on ProfileEntity {
  /// Mengambil nama jabatan, fallback ke 'Anggota IBM' jika null
  String get positionName {
    // Lebih bersih karena sudah menggunakan objek PositionEntity
    return position?.name ?? 'Anggota IBM';
  }
}
