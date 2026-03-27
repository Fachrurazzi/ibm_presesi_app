import 'dart:io';
import 'dart:typed_data'; // WAJIB: Untuk Uint8List

import 'package:ibm_presensi_app/app/data/source/photo_api_service.dart';
import 'package:ibm_presensi_app/app/module/repository/photo_repository.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
// WAJIB: Import file tempat kamu menaruh fungsi handleResponse & DataState tadi
import 'package:ibm_presensi_app/core/network/data_state.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  // Gunakan 'implements'
  final PhotoApiService _photoApiService;

  PhotoRepositoryImpl(this._photoApiService);

  @override
  Future<DataState<String>> get() {
    return handleResponse(
      () => _photoApiService.get(),
      (json) {
        // Ambil URL dari Map yang dikembalikan handleResponse
        final String? url = json['image_url'] ?? json['data']?['image_url'];
        if (url == null) throw 'Foto profil tidak ditemukan.';
        return url;
      },
    );
  }

  @override
  Future<DataState<Uint8List>> getBytes(String url) async {
    // 1. Membersihkan URL agar tidak double domain
    final cleanPath = url.replaceAll(AppConfig.BASE_URL, '');

    try {
      final response = await _photoApiService.getBytes(path: cleanPath);

// 1. Cek status melalui response.response.statusCode
      if (response.response.statusCode == HttpStatus.ok ||
          response.response.statusCode == 200) {
        // 2. Konversi List<int> dari Dio menjadi Uint8List
        // response.data berisi List<int> karena kita pakai ResponseType.bytes
        final Uint8List imageBytes = Uint8List.fromList(response.data);
        return SuccessState(data: imageBytes);
      } else {
        return ErrorState(
          message: 'Gagal mengunduh gambar: ${response.response.statusCode}',
        );
      }
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }

  @override
  Future<DataState<String>> upload(File image) {
    return handleResponse(
      () => _photoApiService.upload(
          image: image), // Pastikan parameter sesuai ApiService
      (json) {
        // 3. Return URL baru setelah upload
        return json['image_url'] ?? json['data']?['image_url'] ?? "";
      },
    );
  }
}
