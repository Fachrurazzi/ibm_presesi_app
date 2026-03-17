import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class ScheduleRepository {
  Future<DataState<ScheduleEntity>> get();
}