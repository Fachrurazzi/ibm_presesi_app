  import 'dart:io';
  import 'package:freezed_annotation/freezed_annotation.dart';

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

      /// Menampung objek jabatan {id: 1, name: "Driver"}
      Map<String, dynamic>? position,
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
      if (position != null) {
        return position!['name']?.toString() ?? 'Anggota IBM';
      }
      return 'Anggota IBM';
    }
  }
