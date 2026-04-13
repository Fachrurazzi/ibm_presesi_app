import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk menangani proses login karyawan.
/// Mengolah kredensial (Email & Password) menjadi data identitas lengkap (Auth).
class AuthLoginUseCase extends AppUseCase<DataState<Auth>, AuthEntity> {
  final AuthRepository _authRepository;

  AuthLoginUseCase(this._authRepository);

  @override
  Future<DataState<Auth>> call({required AuthEntity param}) {
    // Meminta repository melakukan login dan menyimpan sesi ke SharedPreferences
    return _authRepository.login(param);
  }
}
