import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AuthLogoutUseCase extends AppUseCase<DataState<bool>, NoParams> {
  final AuthRepository _authRepository;

  AuthLogoutUseCase(this._authRepository);

  @override
  Future<DataState<bool>> call(NoParams params) {
    return _authRepository.logout();
  }
}

class AuthLogoutAllUseCase extends AppUseCase<DataState<bool>, NoParams> {
  final AuthRepository _authRepository;

  AuthLogoutAllUseCase(this._authRepository);

  @override
  Future<DataState<bool>> call(NoParams params) {
    return _authRepository.logoutAll();
  }
}
