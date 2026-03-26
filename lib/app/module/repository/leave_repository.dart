import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class LeaveRepository {
  Future<DataState> send(LeaveParamEntity param);
}
