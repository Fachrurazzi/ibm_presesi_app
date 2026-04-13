/// Kontrak Standar Response API PT Intiboga Mandiri.
/// [T] adalah tipe data 'data' yang dikembalikan oleh Laravel.
class BaseResponse<T> {
  final bool _success;
  final String _message;
  final T? _data; // Menambahkan Generic Data

  // Getters
  bool get success => _success;
  String get message => _message;
  T? get data => _data;

  BaseResponse({
    required bool success,
    required String message,
    T? data,
  })  : _success = success,
        _message = message,
        _data = data;

  /// Factory untuk memudahkan parsing JSON secara global
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json)? fromJsonT,
  ) {
    return BaseResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      // Jika ada fungsi parser (fromJsonT), jalankan pada field 'data'
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : null,
    );
  }
}
