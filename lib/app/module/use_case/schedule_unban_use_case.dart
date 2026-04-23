import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ScheduleUnbanUseCase extends AppUseCase<DataState<ScheduleEntity>, int> {
  final ScheduleRepository _repository;
  ScheduleUnbanUseCase(this._repository);
  
  @override
  Future<DataState<ScheduleEntity>> call(int id) {
    if (id <= 0) {
      return Future.value(const ErrorState(message: "ID schedule tidak valid"));
    }
    return _repository.unban(id);
  }
}