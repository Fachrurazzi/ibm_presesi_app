import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/app/module/repository/profile_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

/// Use Case untuk memperbarui data profil karyawan (Nama, Password, atau Foto).
class UpdateProfileUseCase
    extends AppUseCase<DataState<ProfileEntity>, ProfileParamUpdate> {
  final ProfileRepository _repository;

  UpdateProfileUseCase(this._repository);

  @override
  Future<DataState<ProfileEntity>> call({required ProfileParamUpdate param}) {
    // Meminta repository melakukan update ke API Laravel
    return _repository.updateProfile(param);
  }
}
