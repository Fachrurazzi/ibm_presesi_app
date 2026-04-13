import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class ScheduleRepository {
  /// Mengambil jadwal kerja aktif (Shift jam masuk/pulang & Lokasi Kantor).
  /// Mengembalikan null jika karyawan tidak memiliki jadwal pada hari tersebut.
  Future<DataState<ScheduleEntity?>> get();

  /// Melaporkan atau mengecek status pemblokiran (banned) perangkat.
  /// Mengembalikan [DataSuccess(true)] jika proses validasi status banned berhasil dilakukan.
  Future<DataState<bool>> banned();
}
