import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ScheduleBanUseCase
    extends AppUseCase<DataState<ScheduleEntity>, BanScheduleParams> {
  final ScheduleRepository _repository;
  ScheduleBanUseCase(this._repository);

  @override
  Future<DataState<ScheduleEntity>> call(BanScheduleParams param) {
    if (param.id <= 0) {
      return Future.value(const ErrorState(message: "ID schedule tidak valid"));
    }
    if (param.reason.isEmpty) {
      return Future.value(const ErrorState(message: "Alasan ban harus diisi"));
    }
    return _repository.ban(param);
  }
}
