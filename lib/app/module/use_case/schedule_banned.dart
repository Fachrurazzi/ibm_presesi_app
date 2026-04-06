import 'dart:async';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Gunakan tipe data bool sebagai return T agar UI tahu status banned-nya,
// dan hilangkan Future di dalam kurung siku < >.
class ScheduleBannedUseCase extends AppUseCase<DataState<bool>, void> {
  final ScheduleRepository _scheduleRepository;

  ScheduleBannedUseCase(this._scheduleRepository);

  @override
  Future<DataState<bool>> call({void param}) {
    // Memanggil fungsi banned() dari Repository
    return _scheduleRepository.banned();
  }
}
