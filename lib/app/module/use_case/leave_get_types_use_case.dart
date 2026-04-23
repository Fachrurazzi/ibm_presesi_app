import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class LeaveGetTypesUseCase
    extends AppUseCase<DataState<List<LeaveType>>, NoParams> {
  final LeaveRepository _repository;

  LeaveGetTypesUseCase(this._repository);

  @override
  Future<DataState<List<LeaveType>>> call(NoParams params) {
    return _repository.getTypes();
  }
}
