import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk mengambil jadwal kerja aktif karyawan (Shift & Kantor).
/// Digunakan oleh Dashboard untuk memvalidasi lokasi presensi (Geofencing).
class ScheduleGetUseCase extends AppUseCase<DataState<ScheduleEntity?>, void> {
  final ScheduleRepository _scheduleRepository;

  ScheduleGetUseCase(this._scheduleRepository);

  @override
  Future<DataState<ScheduleEntity?>> call({void param}) {
    // Meminta repository mengambil data jadwal dari API Laravel
    return _scheduleRepository.get();
  }
}
