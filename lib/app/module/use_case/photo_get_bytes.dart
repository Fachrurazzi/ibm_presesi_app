import 'dart:async';
import 'dart:typed_data'; // Tambahkan untuk Uint8List
import 'package:ibm_presensi_app/app/module/repository/photo_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Gunakan Uint8List agar UI bisa langsung menampilkan gambar
// dan hilangkan Future di dalam kurung siku < >.
class PhotoGetBytesUseCase extends AppUseCase<DataState<Uint8List>, void> {
  final PhotoRepository _photoRepository;

  PhotoGetBytesUseCase(this._photoRepository);

  @override
  Future<DataState<Uint8List>> call({void param}) async {
    // 1. Ambil URL foto profil dari server
    final responseUrl = await _photoRepository.get();

    if (responseUrl is SuccessState && responseUrl.data != null) {
      // 2. Jika URL didapat, ambil data Bytes-nya
      return await _photoRepository.getBytes(responseUrl.data!);
    } else {
      // 3. Jika gagal ambil URL, kembalikan ErrorState dari response pertama
      return ErrorState(message: responseUrl.message);
    }
  }
}
