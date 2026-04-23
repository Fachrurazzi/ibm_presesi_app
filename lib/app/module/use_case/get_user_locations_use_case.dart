import 'package:ibm_presensi_app/app/module/entity/user_location.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class GetUserLocationUseCase extends AppUseCase<DataState<UserLocation>, int> {
  final UserRepository _repository;
  GetUserLocationUseCase(this._repository);

  @override
  Future<DataState<UserLocation>> call(int userId) {
    if (userId <= 0) {
      return Future.value(const ErrorState(message: "ID user tidak valid"));
    }
    return _repository.getUserLocation(userId);
  }
}
