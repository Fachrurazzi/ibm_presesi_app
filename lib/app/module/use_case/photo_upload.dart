import 'dart:async';
import 'dart:io';
import 'package:ibm_presensi_app/app/module/repository/photo_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Gunakan tipe data String (URL hasil upload) sebagai return T,
// dan hilangkan Future di dalam kurung siku < >.
class PhotoUploadUseCase extends AppUseCase<DataState<String>, File> {
  final PhotoRepository _photoRepository;

  PhotoUploadUseCase(this._photoRepository);

  @override
  Future<DataState<String>> call({required File param}) {
    // Menghilangkan '!' dengan menggunakan 'required' pada parameter
    return _photoRepository.upload(param);
  }
}
