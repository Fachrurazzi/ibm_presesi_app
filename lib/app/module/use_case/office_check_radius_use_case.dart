import 'package:ibm_presensi_app/app/module/entity/office.dart';
import 'package:ibm_presensi_app/app/module/repository/office_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class OfficeCheckRadiusUseCase
    extends AppUseCase<DataState<OfficeWithDistance>, CheckRadiusParams> {
  final OfficeRepository _repository;

  OfficeCheckRadiusUseCase(this._repository);

  @override
  Future<DataState<OfficeWithDistance>> call(CheckRadiusParams param) {
    if (param.officeId <= 0) {
      return Future.value(
        const ErrorState(message: "ID office tidak valid"),
      );
    }
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
    return _repository.checkRadius(param);
  }
}
