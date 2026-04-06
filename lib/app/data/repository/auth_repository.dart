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
        final authModel = AuthModel.fromJson(json);

        // 1. Simpan Token
        await SharedPreferencesHelper.setString(
            AppPreferences.AUTH_TOKEN, authModel.accessToken);

        final user = authModel.user;

        if (user != null) {
          await SharedPreferencesHelper.setInt(AppPreferences.USER_ID, user.id);
          await SharedPreferencesHelper.setString(
              AppPreferences.USER_NAME, user.name);
          await SharedPreferencesHelper.setString(
              AppPreferences.USER_EMAIL, user.email);

          // Data Kepegawaian
          await SharedPreferencesHelper.setString(
              AppPreferences.JOIN_DATE, user.joinDate);
          await SharedPreferencesHelper.setInt(
              AppPreferences.LEAVE_QUOTA, user.leaveQuota);
          await SharedPreferencesHelper.setInt(
              AppPreferences.CASHABLE_LEAVE, user.cashableLeave);

          // 2. FIX POSISI: Ambil dari objek position.name
          final String positionName = user.position?.name ?? "Karyawan";
          await SharedPreferencesHelper.setString(
              AppPreferences.POSITION_NAME, positionName);

          // 3. FIX FOTO (KRUSIAL!): Gabungkan dengan BASE_URL agar menjadi URL Lengkap
          String fullPhotoUrl = "";
          if (user.image != null && user.image!.isNotEmpty) {
            // Jika path sudah diawali http, gunakan langsung. Jika tidak, tambah IP Server.
            fullPhotoUrl = user.image!.startsWith('http')
                ? user.image!
                : "${AppConfig.STORAGE_URL}/${user.image}";
          }

          print("DEBUG_LOGIN: Menyimpan Image URL -> $fullPhotoUrl");
          await SharedPreferencesHelper.setString(
              AppPreferences.IMAGE_URL, fullPhotoUrl);
        }

        return Auth.entity(
          email: user?.email ?? '',
          password: null,
        );
      },
    );
  }
}
