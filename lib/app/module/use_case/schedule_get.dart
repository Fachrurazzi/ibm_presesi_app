import 'dart:async';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Hilangkan Future di dalam kurung siku < >.
// Tipe T cukup DataState<ScheduleEntity?> karena AppUseCase sudah membungkusnya dalam Future.
class ScheduleGetUseCase extends AppUseCase<DataState<ScheduleEntity?>, void> {
  final ScheduleRepository _scheduleRepository;

  ScheduleGetUseCase(this._scheduleRepository);

  @override
  Future<DataState<ScheduleEntity?>> call({void param}) {
    // Memanggil fungsi get() dari Repository untuk mengambil jadwal aktif
    return _scheduleRepository.get();
  }
}
