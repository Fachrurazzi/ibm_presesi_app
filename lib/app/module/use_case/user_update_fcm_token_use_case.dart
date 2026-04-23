import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserUpdateFcmTokenUseCase
    extends AppUseCase<DataState<bool>, FcmTokenParams> {
  final UserRepository _repository;

  UserUpdateFcmTokenUseCase(this._repository);

  @override
  Future<DataState<bool>> call(FcmTokenParams param) {
    if (param.fcmToken.isEmpty) {
      return Future.value(
        const ErrorState(message: "FCM token tidak boleh kosong"),
      );
    }
    return _repository.updateFcmToken(param);
  }
}
