import 'package:flutter/foundation.dart';
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
      apiCall: () => _profileApiService.updateProfile(
        name: param.name,
        image: param.image,
        oldPassword: param.oldPassword,
        newPassword: param.newPassword,
      ),
      mapDataSuccess: (json) {
        // Mapping langsung ke Entity agar UI mendapatkan data terbaru
        return ProfileEntity.fromJson(json);
      },
    );
  }

  @override
  Future<DataState<String>> getProfilePhoto() {
    return handleResponse(
      apiCall: () => _profileApiService.getProfilePhoto(),
      mapDataSuccess: (json) {
        // Laravel biasanya membungkus URL di dalam field 'data'
        final String? url = json is Map ? json['data'] : json.toString();

        if (url == null || url.isEmpty) {
          if (kDebugMode) debugPrint("PROFILE_REPO: URL Foto Kosong/Null");
          return ""; // Kembalikan string kosong agar UI menampilkan placeholder
        }

        return url;
      },
    );
  }
}