import 'dart:async';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Gunakan tipe data bool sebagai return T,
// dan hilangkan Future di dalam kurung siku < >.
class LeaveSendUseCase extends AppUseCase<DataState<bool>, LeaveParamEntity> {
  final LeaveRepository _leaveRepository;

  LeaveSendUseCase(this._leaveRepository);

  @override
  Future<DataState<bool>> call({required LeaveParamEntity param}) {
    // Menghilangkan '!' dengan menggunakan 'required' pada parameter
    return _leaveRepository.send(param);
  }
}
