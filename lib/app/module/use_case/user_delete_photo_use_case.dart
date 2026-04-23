import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserDeletePhotoUseCase extends AppUseCase<DataState<bool>, NoParams> {
  final UserRepository _repository;

  UserDeletePhotoUseCase(this._repository);

  @override
  Future<DataState<bool>> call(NoParams params) {
    return _repository.deletePhoto();
  }
}
