import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class LeaveCancelUseCase extends AppUseCase<DataState<bool>, int> {
  final LeaveRepository _repository;

  LeaveCancelUseCase(this._repository);

  @override
  Future<DataState<bool>> call(int id) {
    if (id <= 0) {
      return Future.value(
        const ErrorState(message: "ID cuti tidak valid"),
      );
    }
    return _repository.cancel(id);
  }
}
