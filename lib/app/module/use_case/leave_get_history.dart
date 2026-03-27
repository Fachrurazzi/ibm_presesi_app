import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class LeaveGetHistoryUseCase {
  final LeaveRepository _repository;

  LeaveGetHistoryUseCase(this._repository);

  Future<DataState<List<LeaveEntity>>> call() {
    return _repository.getHistory();
  }
}
