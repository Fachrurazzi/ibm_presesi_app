import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class LeaveRepository {
  // TIPS: Tambahkan tipe kembalian bool (atau LeaveEntity)
  // agar Notifier tahu dengan pasti jika pengajuan BERHASIL.
  Future<DataState<bool>> send(LeaveParamEntity param);

  // 2. Ambil Riwayat Pengajuan Cuti (PENTING: Agar list muncul di UI)
  Future<DataState<List<LeaveEntity>>> getHistory();
}
