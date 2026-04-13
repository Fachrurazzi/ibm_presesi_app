import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk mengirimkan formulir pengajuan cuti/izin/sakit.
/// Mengolah parameter input menjadi status berhasil atau gagal di server.
class LeaveSendUseCase extends AppUseCase<DataState<bool>, LeaveParamEntity> {
  final LeaveRepository _leaveRepository;

  LeaveSendUseCase(this._leaveRepository);

  @override
  Future<DataState<bool>> call({required LeaveParamEntity param}) {
    // Meminta repository untuk melakukan POST data ke server Laravel
    return _leaveRepository.send(param);
  }
}
