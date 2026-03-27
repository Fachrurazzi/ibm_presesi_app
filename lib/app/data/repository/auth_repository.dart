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
      () => _authApiService.login(body: param.toJson()),
      (json) async {
        // 1. Parsing ke AuthModel (Data Model dari API)
        final authModel = AuthModel.fromJson(json);

        // 2. Simpan Sesi secara Lokal (Persistence)
        // Token untuk Authorization Header
        await SharedPreferencesHelper.setString(
            AppPreferences.AUTH_TOKEN, authModel.accessToken);

        // Data User Dasar
        await SharedPreferencesHelper.setInt(
            AppPreferences.USER_ID, authModel.user.id);
        await SharedPreferencesHelper.setString(
            AppPreferences.USER_NAME, authModel.user.name);
        await SharedPreferencesHelper.setString(
            AppPreferences.USER_EMAIL, authModel.user.email);

        // Data Kepegawaian Baru (PENTING untuk Home)
        await SharedPreferencesHelper.setInt(
            AppPreferences.LEAVE_QUOTA, authModel.user.leaveQuota);
        await SharedPreferencesHelper.setString(
            AppPreferences.JOIN_DATE, authModel.user.joinDate);
        await SharedPreferencesHelper.setInt(
            AppPreferences.CASHABLE_LEAVE, authModel.user.cashableLeave);
        await SharedPreferencesHelper.setString(AppPreferences.POSITION_NAME,
            authModel.user.position?.name ?? "Karyawan");

        // Simpan URL Foto jika ada
        // if (authModel.user.image != null) {
        //   await SharedPreferencesHelper.setString(
        //       AppPreferences.USER_PHOTO, authModel.user.image!);
        // }

        // 3. Konversi ke Entity (Domain Layer)
        // Kita return AuthEntity karena interface repository memintanya
        return Auth.entity(
          email: authModel.user.email,
          password: null,
        );
      },
    );
  }
}
