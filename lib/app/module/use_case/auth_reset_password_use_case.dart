import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AuthResetPasswordUseCase
    extends AppUseCase<DataState<bool>, AuthResetPasswordParam> {
  final AuthRepository _authRepository;

  AuthResetPasswordUseCase(this._authRepository);

  @override
  Future<DataState<bool>> call(AuthResetPasswordParam param) {
    if (param.newPassword.length < 8) {
      return Future.value(
        const ErrorState(message: "Password minimal 8 karakter."),
      );
    }
    return _authRepository.resetPassword(param);
  }
}
