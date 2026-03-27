abstract class AppUseCase<T, P> {
  // Gunakan Future agar semua UseCase bisa melakukan operasi Network/Async
  Future<T> call({required P param});
}
