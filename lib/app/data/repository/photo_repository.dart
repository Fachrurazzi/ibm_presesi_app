import 'dart:io';
import 'dart:typed_data';

import 'package:ibm_presensi_app/app/data/source/photo_api_service.dart';
import 'package:ibm_presensi_app/app/module/repository/photo_repository.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoApiService _photoApiService;

  PhotoRepositoryImpl(this._photoApiService);

  @override
  Future<DataState<String>> get() {
    return handleResponse(
      () => _photoApiService.get(),
      (json) {
        if (json == null || json['image_url'] == null) {
          throw 'Foto profil belum diatur di sistem.';
        }
        return json['image_url'] as String; // Mengambil URL sebagai String
      },
    );
  }

  @override
  Future<DataState> getBytes(String url) async {
    // Menghapus BASE_URL agar Retrofit tidak menduplikasi domain
    final response =
        await _photoApiService.getBytes(path: url.replaceAll(BASE_URL, ''));

    if (response.response.statusCode == HttpStatus.ok) {
      final Uint8List imageBytes = Uint8List.fromList(response.data);
      return SuccessState(data: imageBytes);
    } else {
      return ErrorState(
          message:
              '${response.response.statusCode} : ${response.response.statusMessage}');
    }
  }

  @override
  Future<DataState> upload(File image) {
    return handleResponse(
      () => _photoApiService.upload(image),
      (json) => null,
    );
  }
}
