import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/app/module/repository/auth_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class AuthRegisterFaceUseCase
    extends AppUseCase<DataState<bool>, RegisterFaceParam> {
  final AuthRepository _authRepository;

  AuthRegisterFaceUseCase(this._authRepository);

  @override
  Future<DataState<bool>> call(RegisterFaceParam param) {
    if (param.faceModel.isEmpty) {
      return Future.value(
        const ErrorState(message: "Face model tidak boleh kosong."),
      );
    }
    if (param.imagePath.isEmpty) {
      return Future.value(
        const ErrorState(message: "Foto wajah harus diupload."),
      );
    }
    return _authRepository.registerFace(param);
  }
}
