import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class LeaveGetDetailUseCase extends AppUseCase<DataState<LeaveEntity>, int> {
  final LeaveRepository _repository;

  LeaveGetDetailUseCase(this._repository);

  @override
  Future<DataState<LeaveEntity>> call(int id) {
    if (id <= 0) {
      return Future.value(
        const ErrorState(message: "ID cuti tidak valid"),
      );
    }
    return _repository.getDetail(id);
  }
}
