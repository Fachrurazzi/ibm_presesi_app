/// Kontrak Standar Response API PT Intiboga Mandiri.
/// [T] adalah tipe data 'data' yang dikembalikan oleh Laravel.
class BaseResponse<T> {
  final bool _success;
  final String _message;
  final T? _data;
  final Map<String, dynamic>? _errors;
  final Map<String, dynamic>? _meta;

  bool get success => _success;
  String get message => _message;
  T? get data => _data;
  Map<String, dynamic>? get errors => _errors;
  Map<String, dynamic>? get meta => _meta;

  const BaseResponse({
    required bool success,
    required String message,
    T? data,
    Map<String, dynamic>? errors,
    Map<String, dynamic>? meta,
  })  : _success = success,
        _message = message,
        _data = data,
        _errors = errors,
        _meta = meta;

  /// Factory untuk single object data.
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json)? fromJsonT,
  ) {
    return BaseResponse<T>(
      success: json['success'] ?? false,
      message: json['message'] ?? 'Terjadi kesalahan sistem',
      data: (json['data'] != null && fromJsonT != null)
          ? fromJsonT(json['data'])
          : null,
      errors: json['errors'] as Map<String, dynamic>?,
      meta: json['meta'] as Map<String, dynamic>?,
    );
  }

  /// Factory untuk response dengan data berupa List.
  factory BaseResponse.fromJsonList(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    final dataList = json['data'];
    T? data;

    if (dataList is List) {
      data = dataList.map((e) => fromJsonT(e)).toList() as T;
    }

    return BaseResponse<T>(
      success: json['success'] ?? false,
      message: json['message'] ?? 'Terjadi kesalahan sistem',
      data: data,
      errors: json['errors'] as Map<String, dynamic>?,
      meta: json['meta'] as Map<String, dynamic>?,
    );
  }

  /// Cek apakah response sukses dan data tidak null
  bool get isSuccessWithData => _success && _data != null;

  /// Get error message dari validation errors
  String? get firstErrorMessage {
    if (_errors == null || _errors!.isEmpty) return null;
    final firstError = _errors!.values.first;
    if (firstError is List && firstError.isNotEmpty) {
      return firstError.first.toString();
    }
    return firstError.toString();
  }

  /// 🆕 Get meta pagination
  int get currentPage => _meta?['current_page'] ?? 1;
  int get perPage => _meta?['per_page'] ?? 10;
  int get total => _meta?['total'] ?? 0;
  int get lastPage => _meta?['last_page'] ?? 1;
  bool get hasMorePages => currentPage < lastPage;

  BaseResponse<T> copyWith({
    bool? success,
    String? message,
    T? data,
    Map<String, dynamic>? errors,
    Map<String, dynamic>? meta,
  }) {
    return BaseResponse<T>(
      success: success ?? _success,
      message: message ?? _message,
      data: data ?? _data,
      errors: errors ?? _errors,
      meta: meta ?? _meta,
    );
  }

  @override
  String toString() =>
      'BaseResponse(success: $_success, message: $_message, data: $_data, errors: $_errors)';
}
