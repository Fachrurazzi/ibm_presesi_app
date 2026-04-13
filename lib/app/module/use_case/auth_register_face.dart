import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Parameter pembungkus untuk pendaftaran wajah master
class RegisterFaceParam {
  final String faceModel;
  final String imagePath;

  RegisterFaceParam({required this.faceModel, required this.imagePath});
}

/// Use Case untuk mendaftarkan data biometrik wajah karyawan ke server.
/// Digunakan pada tahap onboarding setelah login pertama kali.
class AuthRegisterFaceUseCase
    extends AppUseCase<DataState<bool>, RegisterFaceParam> {
  final AuthRepository _authRepository;

  AuthRegisterFaceUseCase(this._authRepository);

  @override
  Future<DataState<bool>> call({required RegisterFaceParam param}) {
    // Meneruskan data ke repository untuk diupload ke Laravel
    return _authRepository.registerFace(
      faceModel: param.faceModel,
      imagePath: param.imagePath,
    );
  }
}
