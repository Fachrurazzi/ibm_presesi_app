import 'package:ibm_presensi_app/app/module/entity/profile.dart';
import 'package:ibm_presensi_app/app/module/repository/profile_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class UpdateProfileUseCase {
  final ProfileRepository _repository;
  UpdateProfileUseCase(this._repository);

  Future<DataState<ProfileEntity>> call(ProfileParamUpdate param) {
    return _repository.updateProfile(param);
  }
}
