import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class AuthRepository {
  Future<DataState> login(AuthEntity param);
}
