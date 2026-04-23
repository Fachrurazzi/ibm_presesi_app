import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserGetPhotoUseCase extends AppUseCase<DataState<String>, NoParams> {
  final UserRepository _repository;

  UserGetPhotoUseCase(this._repository);

  @override
  Future<DataState<String>> call(NoParams params) {
    return _repository.getPhoto();
  }
}
