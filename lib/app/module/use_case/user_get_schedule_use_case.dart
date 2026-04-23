import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class UserGetScheduleUseCase
    extends AppUseCase<DataState<PaginatedUserSchedule>, UserScheduleParams> {
  final UserRepository _repository;

  UserGetScheduleUseCase(this._repository);

  @override
  Future<DataState<PaginatedUserSchedule>> call(UserScheduleParams param) {
    if (param.month < 1 || param.month > 12) {
      return Future.value(
        const ErrorState(message: "Bulan tidak valid (1-12)"),
      );
    }
    return _repository.getSchedule(param);
  }
}
