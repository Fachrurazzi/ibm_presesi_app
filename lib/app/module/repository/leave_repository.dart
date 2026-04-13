import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class LeaveRepository {
  /// Mengirimkan formulir pengajuan cuti/izin/sakit ke server.
  /// Mengembalikan [DataSuccess(true)] jika data berhasil masuk ke database Laravel.
  Future<DataState<bool>> send(LeaveParamEntity param);

  /// Mengambil daftar riwayat pengajuan cuti milik karyawan.
  /// Digunakan untuk menampilkan list 'Pending', 'Approved', atau 'Rejected'.
  Future<DataState<List<LeaveEntity>>> getHistory();
}
