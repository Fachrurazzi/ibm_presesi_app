import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class LeaveUpdateStatusUseCase
    extends AppUseCase<DataState<bool>, LeaveUpdateStatusParams> {
  final LeaveRepository _repository;

  LeaveUpdateStatusUseCase(this._repository);

  @override
  Future<DataState<bool>> call(LeaveUpdateStatusParams param) {
    if (param.id <= 0) {
      return Future.value(
        const ErrorState(message: "ID cuti tidak valid"),
      );
    }

    final status = param.status.toUpperCase();
    if (status != 'APPROVED' && status != 'REJECTED') {
      return Future.value(
        const ErrorState(message: "Status harus APPROVED atau REJECTED"),
      );
    }

    return _repository.updateStatus(param);
  }
}
