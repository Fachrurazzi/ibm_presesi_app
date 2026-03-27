import 'dart:async';
import 'package:ibm_presensi_app/app/module/repository/photo_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

// PERBAIKAN: Hilangkan Future di dalam kurung siku < >.
// Tipe T cukup DataState<String> karena AppUseCase sudah membungkusnya dalam Future.
class PhotoGetUrlUseCase extends AppUseCase<DataState<String>, void> {
  final PhotoRepository _photoRepository;

  PhotoGetUrlUseCase(this._photoRepository);

  @override
  Future<DataState<String>> call({void param}) {
    // Memanggil fungsi get() yang mengembalikan URL String dari API
    return _photoRepository.get();
  }
}
