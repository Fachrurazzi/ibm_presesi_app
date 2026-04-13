import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk memperbarui password karyawan.
/// Digunakan saat onboarding (password default) atau fitur ganti password.
class AuthUpdatePasswordUseCase extends AppUseCase<DataState<bool>, String> {
  final AuthRepository _authRepository;

  AuthUpdatePasswordUseCase(this._authRepository);

  @override
  Future<DataState<bool>> call({required String param}) {
    // Param adalah password baru yang dikirim ke repository
    return _authRepository.updatePassword(param);
  }
}
