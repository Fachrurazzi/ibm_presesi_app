import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class ScheduleRepository {
  // 1. Mengambil jadwal kerja aktif (Bisa null jika tidak ada jadwal)
  Future<DataState<ScheduleEntity?>> get();

  // 2. Fungsi untuk menangani status 'banned' atau pemblokiran akses
  // TIPS: Tambahkan tipe kembalian (misal bool) agar Notifier bisa memberikan
  // respon UI yang jelas jika proses blokir/cek status banned berhasil.
  Future<DataState<bool>> banned();
}
