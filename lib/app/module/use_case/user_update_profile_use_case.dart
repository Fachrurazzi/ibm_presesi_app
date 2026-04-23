import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserUpdateProfileUseCase
    extends AppUseCase<DataState<UserEntity>, UserUpdateParams> {
  final UserRepository _repository;

  UserUpdateProfileUseCase(this._repository);

  @override
  Future<DataState<UserEntity>> call(UserUpdateParams param) {
    if (param.name.isEmpty) {
      return Future.value(
        const ErrorState(message: "Nama tidak boleh kosong"),
      );
    }
    if (param.name.length < 3) {
      return Future.value(
        const ErrorState(message: "Nama minimal 3 karakter"),
      );
    }
    return _repository.updateProfile(param);
  }
}
