import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserUpdateLocationUseCase
    extends AppUseCase<DataState<bool>, LocationUpdateParams> {
  final UserRepository _repository;

  UserUpdateLocationUseCase(this._repository);

  @override
  Future<DataState<bool>> call(LocationUpdateParams param) {
    if (param.latitude < -90 || param.latitude > 90) {
      return Future.value(
        const ErrorState(message: "Latitude tidak valid (-90 sampai 90)"),
      );
    }
    if (param.longitude < -180 || param.longitude > 180) {
      return Future.value(
        const ErrorState(message: "Longitude tidak valid (-180 sampai 180)"),
      );
    }
    return _repository.updateLocation(param);
  }
}
