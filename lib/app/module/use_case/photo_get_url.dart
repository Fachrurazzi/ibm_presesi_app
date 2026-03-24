import 'dart:async';

import 'package:ibm_presensi_app/app/module/repository/photo_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PhotoGetUrlUseCase extends AppUseCase<Future<DataState<String>>, void> {
  final PhotoRepository _photoRepository;

  PhotoGetUrlUseCase(this._photoRepository);

  @override
  Future<DataState<String>> call({void param}) {
    // Memanggil fungsi get() yang hanya mengembalikan URL String dari API
    return _photoRepository.get();
  }
}
