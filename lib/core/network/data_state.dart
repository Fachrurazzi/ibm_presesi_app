import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

// --- DATA STATE (Pola Result/Either untuk UI) ---
abstract class DataState<T> {
  final bool success;
  final String message;
  final T? data;

  DataState({required this.success, required this.message, this.data});
}

class SuccessState<T> extends DataState<T> {
  SuccessState({super.data, super.message = 'Success'}) : super(success: true);
}

class ErrorState<T> extends DataState<T> {
  ErrorState({required super.message}) : super(success: false);
}

// --- HANDLE RESPONSE (Fungsi Sakti Penengah API & Repo) ---
Future<DataState<T>> handleResponse<T>({
  required Future<HttpResponse<dynamic>> Function() apiCall,
  required FutureOr<T> Function(dynamic json) mapDataSuccess,
}) async {
  try {
    final httpResponse = await apiCall();
    final statusCode = httpResponse.response.statusCode ?? 0;

    // 1. Validasi HTTP Range 200-299
    if (statusCode >= 200 && statusCode < 300) {
      final dynamic responseBody = httpResponse.data;

      // Default values
      bool isSuccess = true;
      String serverMessage = 'Berhasil';
      dynamic rawData = responseBody;

      // 2. Ekstraksi JSON dari Laravel PT IBM
      if (responseBody is Map<String, dynamic>) {
        isSuccess = responseBody['success'] ?? true;
        serverMessage =
            responseBody['message'] ?? responseBody['msg'] ?? 'Berhasil';
        rawData = responseBody['data'] ?? responseBody;
      }

      if (isSuccess) {
        // 3. Mapping data ke Entity (Clean Architecture)
        final T mappedData = await mapDataSuccess(rawData);
        return SuccessState(message: serverMessage, data: mappedData);
      } else {
        return ErrorState(message: serverMessage);
      }
    } else {
      // Jika status code di luar 2xx (401, 404, 500)
      return ErrorState(message: _parseResponseError(httpResponse.response));
    }
  } on DioException catch (e) {
    return ErrorState(message: _parseDioError(e));
  } catch (e) {
    debugPrint("🚨 CLIENT_LOGIC_ERROR: $e");
    return ErrorState(message: "Terjadi kesalahan sistem internal.");
  }
}

// --- HELPER PARSING ERROR ---

String _parseResponseError(Response response) {
  final dynamic data = response.data;
  if (data is Map<String, dynamic>) {
    return data['message'] ??
        data['msg'] ??
        "Gagal memproses permintaan (Code: ${response.statusCode})";
  }
  return "Server error (Code: ${response.statusCode})";
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
      final dynamic errorBody = e.response?.data;
      if (errorBody is Map<String, dynamic>) {
        return errorBody['message'] ??
            errorBody['msg'] ??
            "Terjadi kesalahan pada server.";
      }
      return "Server memberikan respon yang salah (Code: ${e.response?.statusCode})";
    case DioExceptionType.connectionError:
      return "Tidak ada koneksi internet. Periksa paket data atau Wi-Fi Anda.";
    default:
      return "Gagal terhubung ke server (Network Error).";
  }
}
