import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class ProfileRepository {
  /// Memperbarui data profil karyawan (Nama, File Foto, dan Password Baru).
  /// Mengembalikan [ProfileEntity] terbaru setelah berhasil diupdate di Laravel.
  Future<DataState<ProfileEntity>> updateProfile(ProfileParamUpdate param);

  /// Mengambil URL foto profil terbaru secara terpisah.
  /// Sangat berguna untuk sinkronisasi foto di Dashboard tanpa reload seluruh data.
  Future<DataState<String>> getProfilePhoto();
}
