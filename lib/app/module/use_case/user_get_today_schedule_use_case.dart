import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserGetTodayScheduleUseCase
    extends AppUseCase<DataState<TodaySchedule>, NoParams> {
  final UserRepository _repository;

  UserGetTodayScheduleUseCase(this._repository);

  @override
  Future<DataState<TodaySchedule>> call(NoParams params) {
    return _repository.getTodaySchedule();
  }
}
