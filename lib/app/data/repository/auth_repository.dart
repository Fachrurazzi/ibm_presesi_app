import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:ibm_presensi_app/app/data/model/auth.dart' hide Auth;
import 'package:ibm_presensi_app/app/data/source/auth_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<Auth>> login(AuthEntity param) {
    return handleResponse(
      apiCall: () => _authApiService.login(body: param.toJson()),
      mapDataSuccess: (json) async {
        final authModel = AuthModel.fromJson(json);
        final user = authModel.user;
        debugPrint("📅 RAW JOIN DATE DARI MODEL: ${user?.joinDate}");
        // --- REVISI 1: JANGAN SIMPAN DATA DI REPOSITORY ---
        // Biarkan LoginNotifier yang bertanggung jawab menyimpan data ke storage
        // agar alur data single-source (tidak balapan).
        // Kita hanya bertugas melakukan MAPPING dari Model ke Entity dengan lengkap.

        return Auth.entity(
          id: user?.id.toString(), // Konversi int ke string untuk Entity
          name: user?.name ?? 'User IBM',
          email: user?.email ?? '',
          password: '', // Jangan simpan password asli di RAM
          positionName:
              user?.positionName ?? user?.position?.name ?? "Karyawan IBM",
          imageUrl: _sanitizePhotoUrl(user?.imageUrl ?? user?.image),
          isDefaultPassword: user?.isDefaultPassword ?? false,
          isFaceRegistered: user?.isFaceRegistered ?? false,
          joinDate: user?.joinDate ?? "-",
          accessToken: authModel.accessToken,
        );
      },
    );
  }

  @override
  Future<DataState<bool>> updatePassword(String password) {
    return handleResponse(
      apiCall: () => _authApiService.updatePassword(body: {
        'password': password,
        'password_confirmation': password,
      }),
      mapDataSuccess: (json) async {
        // Update lokal agar UI tahu password sudah tidak default
        await SharedPreferencesHelper.setBool(
            AppPreferences.IS_DEFAULT_PASSWORD, false);
        return true;
      },
    );
  }

  @override
  Future<DataState<bool>> registerFace(
      {required String faceModel, required String imagePath}) {
    return handleResponse(
      apiCall: () => _authApiService.registerFace(
        faceModel: faceModel,
        image: File(imagePath),
      ),
      mapDataSuccess: (json) async {
        await SharedPreferencesHelper.setBool(
            AppPreferences.IS_FACE_REGISTERED, true);

        // Update URL foto jika server mengirimkan path foto master yang baru
        if (json is Map &&
            json['data'] != null &&
            json['data']['image_url'] != null) {
          await SharedPreferencesHelper.setString(AppPreferences.IMAGE_URL,
              _sanitizePhotoUrl(json['data']['image_url']));
        }
        return true;
      },
    );
  }

  /// Helper untuk memastikan URL foto selalu valid
  String _sanitizePhotoUrl(String? path) {
    if (path == null || path.isEmpty) return "";
    if (path.startsWith('http')) return path;

    // Pastikan base URL storage benar
    String cleanPath = path.startsWith('/') ? path.substring(1) : path;
    return "${AppConfig.STORAGE_URL}/$cleanPath";
  }
}
