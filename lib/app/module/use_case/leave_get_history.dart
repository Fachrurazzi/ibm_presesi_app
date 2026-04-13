import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk mengambil daftar riwayat pengajuan cuti/izin karyawan.
/// Hasilnya akan ditampilkan pada list riwayat di Dashboard atau menu Izin.
class LeaveGetHistoryUseCase
    extends AppUseCase<DataState<List<LeaveEntity>>, void> {
  final LeaveRepository _repository;

  LeaveGetHistoryUseCase(this._repository);

  @override
  Future<DataState<List<LeaveEntity>>> call({void param}) {
    // Meminta repository untuk mengambil data riwayat dari API Laravel
    return _repository.getHistory();
  }
}
