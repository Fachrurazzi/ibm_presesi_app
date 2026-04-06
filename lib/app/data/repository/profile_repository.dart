import 'package:flutter/foundation.dart'; // Jangan lupa import ini untuk debugPrint
import 'package:ibm_presensi_app/app/data/source/profile_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/app/module/repository/profile_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApiService _profileApiService;
  ProfileRepositoryImpl(this._profileApiService);

  @override
  Future<DataState<ProfileEntity>> updateProfile(ProfileParamUpdate param) {
    return handleResponse(
      () => _profileApiService.updateProfile(
        name: param.name,
        image: param.image,
        oldPassword: param.oldPassword,
        newPassword: param.newPassword,
      ),
      (json) {
        // json sudah berupa objek profil langsung, bukan wrapper!
        return ProfileEntity.fromJson(json);
      },
    );
  }

  @override
  Future<DataState<String>> getProfilePhoto() {
    return handleResponse(
      () => _profileApiService.getProfilePhoto(),
      (json) {
        final url = json['data'];

        if (url == null || url.toString().isEmpty) {
          throw 'Foto profil tidak ditemukan.';
        }

        return url.toString();
      },
    );
  }
}
