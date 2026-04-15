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
      apiCall: () => _scheduleApiService.get(),
      mapDataSuccess: (json) async {
        if (json == null) return null;

        // 1. Parsing data ke Entity
        // Field 'is_banned' di JSON Laravel akan otomatis masuk ke data.isBanned
        final data = ScheduleEntity.fromJson(json as Map<String, dynamic>);

        // 2. Simpan secara Paralel agar Cepat (WITA Standard)
        // REVISI: Tambahkan penyimpanan status Banned ke lokal agar persistensi lebih kuat
        await Future.wait([
          SharedPreferencesHelper.setString(
              AppPreferences.START_SHIFT, data.shift.startTime),
          SharedPreferencesHelper.setString(
              AppPreferences.END_SHIFT, data.shift.endTime),
          // Simpan status banned ke preference jika diperlukan pengecekan cepat saat app baru buka
          SharedPreferencesHelper.setBool('user_banned_status', data.isBanned),
        ]);

        return data;
      },
    );
  }

  @override
  Future<DataState<bool>> banned() {
    return handleResponse(
      apiCall: () => _scheduleApiService.banned(),
      mapDataSuccess: (json) {
        // Jika Use Case banned dipanggil (misal terdeteksi emulator),
        // kita tandai di lokal juga bahwa user ini sudah kena flag banned.
        SharedPreferencesHelper.setBool('user_banned_status', true);
        return true;
      },
    );
  }
}
