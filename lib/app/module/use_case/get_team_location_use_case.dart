import 'package:ibm_presensi_app/app/module/entity/user_location.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class GetTeamLocationsUseCase
    extends AppUseCase<DataState<List<UserLocation>>, NoParams> {
  final UserRepository _repository;
  GetTeamLocationsUseCase(this._repository);

  @override
  Future<DataState<List<UserLocation>>> call(NoParams params) {
    return _repository.getTeamLocations();
  }
}
