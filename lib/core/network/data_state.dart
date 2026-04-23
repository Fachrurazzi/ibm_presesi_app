import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

// --- DATA STATE ---
sealed class DataState<T> {
  final String message;
  final T? data;

  const DataState({required this.message, this.data});
}

class SuccessState<T> extends DataState<T> {
  final Map<String, dynamic>? meta;

  const SuccessState({
    super.data,
    super.message = 'Success',
    this.meta,
  });

  @override
  String toString() =>
      'SuccessState(message: $message, data: $data, meta: $meta)';
}

class ErrorState<T> extends DataState<T> {
  final Map<String, dynamic>? errors;
  final int? statusCode;

  const ErrorState({
    required super.message,
    this.errors,
    this.statusCode,
  }) : super(data: null);

  String? get firstError {
    if (errors == null || errors!.isEmpty) return null;
    final first = errors!.values.first;
    return first is List ? first.first?.toString() : first.toString();
  }

  @override
  String toString() =>
      'ErrorState(message: $message, errors: $errors, statusCode: $statusCode)';
}

// --- EXTENSION ---
extension DataStateExtension<T> on DataState<T> {
  bool get isSuccess => this is SuccessState<T>;
  bool get isError => this is ErrorState<T>;
  T? get dataOrNull => isSuccess ? data : null;
  String get errorMessage => isError ? message : '';
  Map<String, dynamic>? get meta =>
      isSuccess ? (this as SuccessState<T>).meta : null;
}

// ============================================================================
// VERSION 1: Handle HttpResponse (Legacy)
// ============================================================================
Future<DataState<T>> handleHttpResponse<T>({
  required Future<HttpResponse<dynamic>> Function() apiCall,
  required FutureOr<T> Function(dynamic json) mapDataSuccess,
  String successMessage = 'Berhasil',
}) async {
  try {
    final httpResponse = await apiCall();
    final statusCode = httpResponse.response.statusCode ?? 0;

    if (statusCode >= 200 && statusCode < 300) {
      final responseBody = httpResponse.data;

      if (responseBody is! Map<String, dynamic>) {
        final mappedData = await mapDataSuccess(responseBody);
        return SuccessState(message: successMessage, data: mappedData);
      }

      final isSuccess = responseBody['success'] ?? true;
      final serverMessage = responseBody['message'] ?? successMessage;
      final rawData = responseBody['data'] ?? responseBody;
      final meta = responseBody['meta'] as Map<String, dynamic>?;

      if (isSuccess) {
        final mappedData = await mapDataSuccess(rawData);
        return SuccessState(
          message: serverMessage,
          data: mappedData,
          meta: meta,
        );
      } else {
        return ErrorState(
          message: serverMessage,
          errors: responseBody['errors'] as Map<String, dynamic>?,
          statusCode: statusCode,
        );
      }
    } else {
      return ErrorState(
        message: _parseResponseError(httpResponse.response),
        statusCode: statusCode,
      );
    }
  } on DioException catch (e) {
    return ErrorState(
      message: _parseDioError(e),
      statusCode: e.response?.statusCode,
    );
  } catch (e) {
    debugPrint("🚨 CLIENT_LOGIC_ERROR: $e");
    return const ErrorState(message: "Terjadi kesalahan sistem internal.");
  }
}

// ============================================================================
// VERSION 2: Handle Map<String, dynamic> (RECOMMENDED)
// ============================================================================
Future<DataState<T>> handleResponse<T>({
  required Future<Map<String, dynamic>> Function() apiCall,
  required FutureOr<T> Function(dynamic json) mapDataSuccess,
  String successMessage = 'Berhasil',
}) async {
  try {
    final responseBody = await apiCall();

    final isSuccess = responseBody['success'] ?? true;
    final serverMessage = responseBody['message'] ?? successMessage;
    final rawData = responseBody['data'] ?? responseBody;
    final meta = responseBody['meta'] as Map<String, dynamic>?;
    final errors = responseBody['errors'] as Map<String, dynamic>?;

    if (isSuccess) {
      final mappedData = await mapDataSuccess(rawData);
      return SuccessState(
        message: serverMessage,
        data: mappedData,
        meta: meta,
      );
    } else {
      return ErrorState(
        message: serverMessage,
        errors: errors,
      );
    }
  } on DioException catch (e) {
    return ErrorState(
      message: _parseDioError(e),
      statusCode: e.response?.statusCode,
    );
  } catch (e) {
    debugPrint("🚨 CLIENT_LOGIC_ERROR: $e");
    return const ErrorState(message: "Terjadi kesalahan sistem internal.");
  }
}

// ============================================================================
// VERSION 3: Handle String Response (Untuk API Service return String)
// ============================================================================
Future<DataState<T>> handleStringResponse<T>({
  required Future<String> Function() apiCall,
  required FutureOr<T> Function(dynamic json) mapDataSuccess,
  String successMessage = 'Berhasil',
}) async {
  try {
    final jsonString = await apiCall();
    final responseBody = jsonDecode(jsonString) as Map<String, dynamic>;

    final isSuccess = responseBody['success'] ?? true;
    final serverMessage = responseBody['message'] ?? successMessage;
    final rawData = responseBody['data'] ?? responseBody;
    final meta = responseBody['meta'] as Map<String, dynamic>?;
    final errors = responseBody['errors'] as Map<String, dynamic>?;

    if (isSuccess) {
      final mappedData = await mapDataSuccess(rawData);
      return SuccessState(
        message: serverMessage,
        data: mappedData,
        meta: meta,
      );
    } else {
      return ErrorState(
        message: serverMessage,
        errors: errors,
      );
    }
  } on DioException catch (e) {
    return ErrorState(
      message: _parseDioError(e),
      statusCode: e.response?.statusCode,
    );
  } catch (e) {
    debugPrint("🚨 CLIENT_LOGIC_ERROR: $e");
    return const ErrorState(message: "Terjadi kesalahan sistem internal.");
  }
}

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================
String _parseResponseError(Response<dynamic> response) {
  final data = response.data;
  if (data is Map<String, dynamic>) {
    if (data['errors'] is Map<String, dynamic>) {
      final errors = data['errors'] as Map<String, dynamic>;
      final firstError = errors.values.first;
      if (firstError is List && firstError.isNotEmpty) {
        return firstError.first.toString();
      }
      return firstError.toString();
    }
    return data['message']?.toString() ??
        data['msg']?.toString() ??
        "Gagal memproses permintaan (${response.statusCode})";
  }
  return "Server error (${response.statusCode})";
}

String _parseDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return "Koneksi terputus. Pastikan internet Anda stabil.";
    case DioExceptionType.sendTimeout:
      return "Gagal mengirim data ke server. Silakan coba lagi.";
    case DioExceptionType.receiveTimeout:
      return "Server terlalu lama merespon. Silakan coba lagi.";
    case DioExceptionType.cancel:
      return "Permintaan dibatalkan.";
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      final errorBody = e.response?.data;

      if (statusCode == 401) {
        return "Sesi berakhir, silakan login ulang.";
      } else if (statusCode == 403) {
        return "Anda tidak memiliki akses ke fitur ini.";
      } else if (statusCode == 404) {
        return "Data tidak ditemukan.";
      } else if (statusCode == 422) {
        if (errorBody is Map<String, dynamic>) {
          if (errorBody['errors'] is Map) {
            final errors = errorBody['errors'] as Map;
            final first = errors.values.first;
            return first is List ? first.first.toString() : first.toString();
          }
          return errorBody['message']?.toString() ?? "Validasi gagal.";
        }
        return "Validasi gagal.";
      } else if (statusCode == 429) {
        return "Terlalu banyak permintaan. Silakan tunggu sebentar.";
      } else if (statusCode == 500) {
        return "Terjadi kesalahan pada server.";
      }

      if (errorBody is Map<String, dynamic>) {
        return errorBody['message']?.toString() ??
            errorBody['msg']?.toString() ??
            "Terjadi kesalahan pada server.";
      }
      return "Server memberikan respon yang salah (${e.response?.statusCode})";
    case DioExceptionType.connectionError:
      return "Tidak ada koneksi internet. Periksa paket data atau Wi-Fi Anda.";
    default:
      return "Gagal terhubung ke server (Network Error).";
  }
}

// ============================================================================
// EXTENSION
// ============================================================================
extension RetrofitResponseHandler<T> on Future<HttpResponse<T>> {
  Future<DataState<T>> toDataState() async {
    try {
      final response = await this;
      if (response.response.statusCode! >= 200 &&
          response.response.statusCode! < 300) {
        return SuccessState(data: response.data);
      } else {
        return ErrorState(message: "Error ${response.response.statusCode}");
      }
    } on DioException catch (e) {
      return ErrorState(message: _parseDioError(e));
    } catch (e) {
      return const ErrorState(message: "Terjadi kesalahan sistem internal.");
    }
  }
}
