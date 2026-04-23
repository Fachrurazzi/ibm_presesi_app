import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class LeaveGetListUseCase
    extends AppUseCase<DataState<PaginatedLeave>, LeaveListParams> {
  final LeaveRepository _repository;

  LeaveGetListUseCase(this._repository);

  @override
  Future<DataState<PaginatedLeave>> call(LeaveListParams param) {
    return _repository.getList(param);
  }
}
