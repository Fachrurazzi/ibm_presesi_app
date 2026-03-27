import 'dart:async';
import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Gunakan tipe data Auth (Model) sebagai return T,
// dan hilangkan Future di dalam kurung siku < >.
class AuthLoginUseCase extends AppUseCase<DataState<Auth>, AuthEntity> {
  final AuthRepository _authRepository;

  AuthLoginUseCase(this._authRepository);

  @override
  Future<DataState<Auth>> call({required AuthEntity param}) {
    // Menghilangkan '!' dengan menggunakan 'required' pada parameter
    return _authRepository.login(param);
  }
}
