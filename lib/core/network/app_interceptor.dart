import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';

class AppInterceptor extends Interceptor {
  // 🆕 Callback untuk navigasi ke login saat 401
  static void Function()? onUnauthorized;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Headers
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';

    // Timeout khusus untuk upload
    if (options.path.contains('register-face') ||
        options.path.contains('update') ||
        options.path.contains('upload')) {
      options.connectTimeout = const Duration(seconds: 60);
      options.receiveTimeout = const Duration(seconds: 60);
    } else {
      options.connectTimeout = const Duration(seconds: 30);
      options.receiveTimeout = const Duration(seconds: 30);
    }

    // Add Authorization header
    final authToken = SharedPreferencesHelper.getString(
      AppPreferences.AUTH_TOKEN,
    );

    if (authToken != null && authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }

    // Log request di debug mode
    debugPrint('🌐 REQUEST: ${options.method} ${options.uri}');
    debugPrint('🌐 HEADERS: ${options.headers}');
    if (options.data != null) {
      debugPrint('🌐 BODY: ${options.data}');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '✅ RESPONSE [${response.statusCode}]: ${response.requestOptions.uri}');

    // Semua status 2xx dianggap sukses
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return handler.next(response);
    }

    // Selain itu, reject
    handler.reject(
      DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      ),
    );
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;

    debugPrint('❌ ERROR [$statusCode]: $path - ${err.message}');

    String friendlyMessage = "Terjadi kesalahan koneksi";

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        friendlyMessage = "Koneksi timeout. Silakan coba lagi.";
        break;
      case DioExceptionType.connectionError:
        friendlyMessage = "Tidak ada koneksi internet. Periksa jaringan Anda.";
        break;
      case DioExceptionType.badResponse:
        friendlyMessage = _handleBadResponse(err);
        break;
      case DioExceptionType.cancel:
        friendlyMessage = "Permintaan dibatalkan.";
        break;
      default:
        friendlyMessage = "Terjadi kesalahan jaringan.";
    }

    // Handle 401 Unauthorized - Auto logout
    if (statusCode == 401) {
      friendlyMessage = "Sesi berakhir, silakan login ulang.";
      // Hapus token lokal
      SharedPreferencesHelper.logout();
      // 🆕 Trigger navigasi ke login
      onUnauthorized?.call();
    }

    // Handle 403 Forbidden - Banned
    if (statusCode == 403) {
      final data = err.response?.data;
      if (data is Map && data['message'] != null) {
        friendlyMessage = data['message'];
      } else {
        friendlyMessage = "Akses ditangguhkan. Silakan hubungi HRD.";
      }
      // 🆕 Auto logout jika banned
      SharedPreferencesHelper.logout();
      onUnauthorized?.call();
    }

    final newError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: friendlyMessage,
      message: friendlyMessage,
    );
    handler.next(newError);
  }

  String _handleBadResponse(DioException err) {
    final statusCode = err.response?.statusCode;
    final data = err.response?.data;

    if (data is Map<String, dynamic>) {
      // Cek validation errors
      if (data['errors'] is Map) {
        final errors = data['errors'] as Map;
        if (errors.isNotEmpty) {
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }
          return firstError.toString();
        }
      }
      // Cek message field
      if (data['message'] != null) {
        return data['message'].toString();
      }
    }

    // Default messages by status code
    switch (statusCode) {
      case 400:
        return "Permintaan tidak valid.";
      case 401:
        return "Silakan login untuk melanjutkan.";
      case 403:
        return "Anda tidak memiliki akses.";
      case 404:
        return "Data tidak ditemukan.";
      case 422:
        return "Data yang dikirim tidak valid.";
      case 429:
        return "Terlalu banyak permintaan. Silakan tunggu.";
      case 500:
      case 502:
      case 503:
        return "Server sedang sibuk. Silakan coba lagi nanti.";
      default:
        return "Terjadi kesalahan (${statusCode ?? 'unknown'})";
    }
  }
}
