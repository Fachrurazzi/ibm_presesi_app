import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AuthUpdatePasswordUseCase
    extends AppUseCase<DataState<bool>, AuthUpdatePasswordParam> {
  final AuthRepository _authRepository;

  AuthUpdatePasswordUseCase(this._authRepository);

  @override
  Future<DataState<bool>> call(AuthUpdatePasswordParam param) {
    // Validasi panjang password
    if (param.newPassword.length < 8) {
      return Future.value(
        const ErrorState(message: "Password minimal harus 8 karakter."),
      );
    }

    // Cegah password yang terlalu umum
    const weakPasswords = [
      '12345678',
      'password',
      'qwerty123',
      'admin123',
      '123456789',
      'password123',
    ];
    if (weakPasswords.contains(param.newPassword.toLowerCase())) {
      return Future.value(
        const ErrorState(message: "Jangan gunakan password yang terlalu umum."),
      );
    }

    // Cek apakah password lama dan baru sama
    if (param.currentPassword == param.newPassword) {
      return Future.value(
        const ErrorState(
            message: "Password baru tidak boleh sama dengan password lama."),
      );
    }

    return _authRepository.updatePassword(param);
  }
}
