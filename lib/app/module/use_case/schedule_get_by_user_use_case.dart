// schedule_get_by_user_use_case.dart
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ScheduleGetByUserUseCase
    extends AppUseCase<DataState<List<ScheduleEntity>>, int> {
  final ScheduleRepository _repository;
  ScheduleGetByUserUseCase(this._repository);

  @override
  Future<DataState<List<ScheduleEntity>>> call(int userId) {
    if (userId <= 0) {
      return Future.value(const ErrorState(message: "ID user tidak valid"));
    }
    return _repository.getByUser(userId);
  }
}
