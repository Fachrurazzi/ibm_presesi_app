import 'dart:async';
import 'dart:io';

import 'package:ibm_presensi_app/app/module/repository/photo_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class PhotoUploadUseCase extends AppUseCase<Future<DataState>, File> {
  final PhotoRepository _photoRepository;

  PhotoUploadUseCase(this._photoRepository);

  @override
  Future<DataState> call({File? param}) {
    return _photoRepository.upload(param!);
  }
}
