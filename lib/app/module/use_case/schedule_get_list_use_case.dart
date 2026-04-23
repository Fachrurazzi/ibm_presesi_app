// schedule_get_list_use_case.dart (Admin only)
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ScheduleGetListUseCase
    extends AppUseCase<DataState<PaginatedSchedule>, ScheduleListParams> {
  final ScheduleRepository _repository;
  ScheduleGetListUseCase(this._repository);

  @override
  Future<DataState<PaginatedSchedule>> call(ScheduleListParams param) {
    return _repository.getList(param);
  }
}
