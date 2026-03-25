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
      (json) {
        if (json != null) {
          final data = ScheduleEntity.fromJson(json);
          SharedPreferencesHelper.setString(
              PREF_START_SHIFT, data.shift.startTime);
          SharedPreferencesHelper.setString(PREF_END_SHIFT, data.shift.endTime);

          // 👇 INI DIA KUNCI JAWABANNYA! KEMBALIKAN DATANYA! 👇
          return data;
        } else {
          return null;
        }
      },
    );
  }

  @override
  Future<DataState> banned() {
    return handleResponse(
      () => _scheduleApiService.banned(),
      (json) => null,
    );
  }
}
