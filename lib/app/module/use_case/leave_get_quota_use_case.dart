import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class LeaveGetQuotaUseCase extends AppUseCase<DataState<LeaveQuota>, NoParams> {
  final LeaveRepository _repository;

  LeaveGetQuotaUseCase(this._repository);

  @override
  Future<DataState<LeaveQuota>> call(NoParams params) {
    return _repository.getQuota();
  }
}
