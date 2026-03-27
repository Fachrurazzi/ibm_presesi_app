import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class AuthRepository {
  // TIPS: Tambahkan tipe kembalian AuthModel (atau AuthEntity)
  // agar data Token dan User bisa langsung diproses setelah login sukses.
  Future<DataState<Auth>> login(AuthEntity param);
}
