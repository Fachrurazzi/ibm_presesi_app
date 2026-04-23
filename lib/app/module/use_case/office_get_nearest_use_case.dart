// office_get_nearest_use_case.dart
import 'package:ibm_presensi_app/app/module/entity/office.dart';
import 'package:ibm_presensi_app/app/module/repository/office_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class OfficeGetNearestUseCase extends AppUseCase<
    DataState<List<OfficeWithDistance>>, NearestOfficeParams> {
  final OfficeRepository _repository;
  OfficeGetNearestUseCase(this._repository);

  @override
  Future<DataState<List<OfficeWithDistance>>> call(NearestOfficeParams param) {
    if (param.latitude < -90 || param.latitude > 90) {
      return Future.value(const ErrorState(message: "Latitude tidak valid"));
    }
    if (param.longitude < -180 || param.longitude > 180) {
      return Future.value(const ErrorState(message: "Longitude tidak valid"));
    }
    return _repository.getNearest(param);
  }
}
