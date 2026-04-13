/// Kontrak Standar untuk Use Case PT Intiboga Mandiri.
/// [T] adalah tipe data return (biasanya Entity atau BaseResponse).
/// [P] adalah tipe data Parameter (Param Entity).
abstract class AppUseCase<T, P> {
  /// Setiap UseCase wajib memiliki fungsi [call] untuk menjalankan logika bisnis.
  /// Kita menggunakan Future karena hampir semua proses melibatkan Network API.
  Future<T> call({required P param});
}

/// Tambahkan ini jika ada Use Case yang TIDAK membutuhkan parameter.
/// Contoh: GetProfile yang hanya butuh Token dari SharedPreferences.
class NoParam {
  const NoParam();
}
