import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // 1. Setup Headers standar
    options.headers['Accept'] = 'application/json';
    options.connectTimeout =
        const Duration(seconds: 15); // Tambahkan timeout biar gak hang
    options.receiveTimeout = const Duration(seconds: 15);

    // 2. Ambil Token secara INSTAN (Tanpa await karena sudah init di main)
    final authToken =
        SharedPreferencesHelper.getString(AppPreferences.AUTH_TOKEN);

    if (authToken != null && authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
      // debugPrint("NETWORK_LOG: Sending request with token...");
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    // Memastikan status code 200 dan 201 dianggap sukses
    final successCodes = [HttpStatus.ok, HttpStatus.created];

    if (!successCodes.contains(response.statusCode)) {
      // Jika error, kita resolve agar tidak melempar Exception yang bikin crash
      return handler.resolve(response);
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;

    // 3. AUTO-LOGOUT jika Token Expired (401)
    if (statusCode == 401) {
      debugPrint("🚨 SESSION_EXPIRED: Token tidak valid, membersihkan sesi...");

      // Bersihkan data lokal
      SharedPreferencesHelper.logout();

      // Tips: Kamu bisa gunakan event bus atau stream untuk mentrigger
      // redirect ke LoginScreen dari sini jika diperlukan.
    }

    // Logging error sederhana agar gampang debug di terminal
    debugPrint(
        "🚨 NETWORK_ERROR [${err.requestOptions.path}]: $statusCode - ${err.message}");

    super.onError(err, handler);
  }
}
