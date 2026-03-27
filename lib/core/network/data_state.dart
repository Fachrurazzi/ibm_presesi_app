import 'dart:async'; // Untuk FutureOr
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// --- BASE RESPONSE (Jika kamu punya file sendiri, pastikan isinya sinkron) ---
abstract class BaseResponse {
  final bool success;
  final String message;

  BaseResponse({required this.success, required this.message});
}

// --- DATA STATE ---
// Class utama untuk membungkus hasil dari Repository ke UseCase/UI
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

// --- HANDLE RESPONSE FUNCTION ---
// Fungsi sakti yang menghubungkan ApiService (dynamic) dengan Repository
Future<DataState<T>> handleResponse<T>(
  // Menggunakan dynamic agar cocok dengan ApiService yang sudah kita revisi
  Future<HttpResponse<dynamic>> Function() apiCall,
  FutureOr<T> Function(dynamic json) mapDataSuccess,
) async {
  try {
    final HttpResponse<dynamic> httpResponse = await apiCall();
    final int statusCode = httpResponse.response.statusCode ?? 0;

    // 1. Cek Status Code HTTP (200-299)
    if (statusCode >= 200 && statusCode < 300) {
      final dynamic responseData = httpResponse.data;

      // 2. Parsing logika Success/Message dari Laravel PT INTIBOGA MANDIRI
      // Kita cek apakah responseData berbentuk Map (JSON standar)
      bool isSuccess = true;
      String serverMessage = 'Success';
      dynamic rawData = responseData;

      if (responseData is Map<String, dynamic>) {
        isSuccess = responseData['success'] ?? true;
        serverMessage = responseMapMessage(responseData);
        rawData = responseData['data'] ?? responseData;
      }

      if (isSuccess) {
        // 3. Eksekusi Mapper (Bisa asinkron jika perlu simpan SharedPreferences)
        final T mappedData = await mapDataSuccess(rawData);
        return SuccessState(message: serverMessage, data: mappedData);
      } else {
        return ErrorState(message: serverMessage);
      }
    } else {
      // Jika status code 4xx atau 5xx
      throw DioException(
        response: httpResponse.response,
        requestOptions: httpResponse.response.requestOptions,
      );
    }
  } on DioException catch (e) {
    // 4. Handle Error Network / Server
    return ErrorState(message: parseDioError(e));
  } catch (e) {
    // 5. Handle Error Parsing / Logic Client
    return ErrorState(message: "Client Error: ${e.toString()}");
  }
}

// --- HELPER UNTUK PARSING PESAN ---
String responseMapMessage(Map<String, dynamic> map) {
  if (map.containsKey('message')) return map['message'];
  if (map.containsKey('msg')) return map['msg'];
  return 'Success';
}

String parseDioError(DioException e) {
  final dynamic errorBody = e.response?.data;
  if (errorBody is Map<String, dynamic>) {
    return errorBody['message'] ?? e.message ?? "Server Error";
  }
  return e.message ?? "Connection Error";
}
