import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class ProfileRepository {
  // 1. Update Profile (Nama, Foto, Password)
  Future<DataState<ProfileEntity>> updateProfile(ProfileParamUpdate param);

  // 2. Tambahkan ini: Ambil URL Foto Profil saja
  // Kita kembalikan String karena API showPhoto mengembalikan 'image_url'
  Future<DataState<String>> getProfilePhoto();
}
