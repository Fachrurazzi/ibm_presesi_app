import 'package:ibm_presensi_app/app/module/repository/profile_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class ProfileGetPhotoUseCase extends AppUseCase<DataState<String>, void> {
  final ProfileRepository _profileRepository;

  ProfileGetPhotoUseCase(this._profileRepository);

  @override
  Future<DataState<String>> call({void param}) {
    // Memanggil fungsi baru yang kita buat di RepositoryImpl tadi
    return _profileRepository.getProfilePhoto();
  }
}
