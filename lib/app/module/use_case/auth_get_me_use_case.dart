import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AuthGetMeUseCase extends AppUseCase<DataState<AuthEntity>, NoParams> {
  final AuthRepository _authRepository;

  AuthGetMeUseCase(this._authRepository);

  @override
  Future<DataState<AuthEntity>> call(NoParams params) {
    return _authRepository.getMe();
  }
}
