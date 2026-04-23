// schedule_create_use_case.dart (Admin only)
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ScheduleCreateUseCase
    extends AppUseCase<DataState<ScheduleEntity>, ScheduleParams> {
  final ScheduleRepository _repository;
  ScheduleCreateUseCase(this._repository);

  @override
  Future<DataState<ScheduleEntity>> call(ScheduleParams param) {
    if (param.userId <= 0) {
      return Future.value(const ErrorState(message: "User harus dipilih"));
    }
    if (param.shiftId <= 0) {
      return Future.value(const ErrorState(message: "Shift harus dipilih"));
    }
    if (param.officeId <= 0) {
      return Future.value(const ErrorState(message: "Office harus dipilih"));
    }
    if (param.startDate.isEmpty) {
      return Future.value(
          const ErrorState(message: "Tanggal mulai harus diisi"));
    }
    return _repository.create(param);
  }
}
