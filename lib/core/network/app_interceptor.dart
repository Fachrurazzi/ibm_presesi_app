import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['accept'] = 'application/json';

    // CATATAN: Pastikan PREF_AUTH sesuai dengan yang ada di constant.dart
    // Jika kamu sudah mengubahnya ke AppPreferences.AUTH_TOKEN, sesuaikan di sini.
    final authToken =
        await SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);

    if (authToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    // LOGIKA SUDAH BENAR: Menerima 200 dan 201
    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      // Mengarahkan response "error" agar tetap bisa dibaca oleh handleResponse
      return handler.resolve(
        Response(
          data: response.data,
          requestOptions: response.requestOptions,
          statusCode:
              response.statusCode, // Penting untuk debugging di handleResponse
        ),
      );
    }
    super.onResponse(response, handler);
  }

  // Tips: Tambahkan onError untuk handle jika token expired (401)
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Di sini kamu bisa tambahkan logika Logout otomatis
      // atau redirect ke login jika token sudah tidak valid
      print("Token Expired atau Tidak Valid");
    }
    super.onError(err, handler);
  }
}
