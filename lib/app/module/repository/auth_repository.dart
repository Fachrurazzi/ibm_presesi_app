import 'package:ibm_presensi_app/app/module/entity/auth.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class AuthRepository {
  /// Proses login utama menggunakan Email dan Password.
  /// Mengembalikan data Auth (Token & User Info).
  Future<DataState<Auth>> login(AuthEntity param);

  /// Memperbarui password (digunakan saat onboarding jika user masih pakai password default).
  Future<DataState<bool>> updatePassword(String password);

  /// Mendaftarkan data biometrik wajah master ke server.
  /// [faceModel] berisi data koordinat wajah (biasanya JSON string dari FaceNet).
  /// [imagePath] adalah lokasi file foto fisik di storage HP.
  Future<DataState<bool>> registerFace({
    required String faceModel,
    required String imagePath,
  });
}