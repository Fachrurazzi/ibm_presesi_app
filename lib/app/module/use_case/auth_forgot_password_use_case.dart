import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AuthForgotPasswordUseCase
    extends AppUseCase<DataState<bool>, AuthForgotPasswordParam> {
  final AuthRepository _authRepository;

  AuthForgotPasswordUseCase(this._authRepository);

  @override
  Future<DataState<bool>> call(AuthForgotPasswordParam param) {
    if (param.email.isEmpty) {
      return Future.value(
        const ErrorState(message: "Email harus diisi."),
      );
    }
    return _authRepository.forgotPassword(param);
  }
}
