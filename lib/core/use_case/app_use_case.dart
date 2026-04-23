// core/use_case/app_use_case.dart

/// Parameter kosong untuk use case yang tidak membutuhkan input.
class NoParams {
  const NoParams();
}

/// Base use case yang mengembalikan [Future] dengan [T].
/// [P] adalah tipe parameter.
abstract class AppUseCase<T, P> {
  Future<T> call(P params);
}

/// Use case yang tidak mengembalikan nilai (void).
/// [P] adalah tipe parameter.
abstract class AppUseCaseVoid<P> {
  Future<void> call(P params);
}

/// Use case yang mengembalikan [Stream] (misalnya untuk real-time data).
/// [T] adalah tipe data yang di-stream.
/// [P] adalah tipe parameter.
abstract class AppUseCaseStream<T, P> {
  Stream<T> call(P params);
}

/// Extension untuk kemudahan pemanggilan use case dengan NoParams.
extension UseCaseExtension<T> on AppUseCase<T, NoParams> {
  Future<T> callNoParams() => call(const NoParams());
}

/// Extension untuk use case void dengan NoParams.
extension UseCaseVoidExtension on AppUseCaseVoid<NoParams> {
  Future<void> callNoParams() => call(const NoParams());
}
