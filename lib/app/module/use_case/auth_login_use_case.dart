import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AuthLoginUseCase
    extends AppUseCase<DataState<AuthEntity>, AuthLoginParam> {
  final AuthRepository _authRepository;

  AuthLoginUseCase(this._authRepository);

  @override
  Future<DataState<AuthEntity>> call(AuthLoginParam param) {
    // Basic validation
    if (!param.isValid) {
      return Future.value(
        const ErrorState(message: "Email dan password harus diisi."),
      );
    }
    if (!param.isEmailValid) {
      return Future.value(
        const ErrorState(message: "Format email tidak valid."),
      );
    }
    return _authRepository.login(param);
  }
}
