import 'package:ibm_presensi_app/app/data/source/schedule_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ScheduleApiService _scheduleApiService;

  ScheduleRepositoryImpl(this._scheduleApiService);

  @override
  Future<DataState<ScheduleEntity?>> get() {
    return handleResponse(
      () => _scheduleApiService.get(),
      (json) async {
        // Tambahkan async jika SharedPreferences butuh waktu
        if (json != null) {
          // 1. Parsing data dari API Laravel
          final data = ScheduleEntity.fromJson(json);

          // 2. Simpan ke Local Storage untuk akses cepat di UI/Logic
          await SharedPreferencesHelper.setString(
              AppPreferences.START_SHIFT, data.shift.startTime);
          await SharedPreferencesHelper.setString(
              AppPreferences.END_SHIFT, data.shift.endTime);

          return data;
        }
        return null;
      },
    );
  }

  @override
  Future<DataState<bool>> banned() {
    return handleResponse(
      () => _scheduleApiService.banned(),
      (json) {
        // TIPS: Kembalikan true jika proses pelaporan banned sukses.
        // Ini membantu Notifier untuk memutuskan apakah harus logout paksa atau tidak.
        return true;
      },
    );
  }
}
