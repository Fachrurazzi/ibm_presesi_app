import 'dart:convert';
import 'dart:io';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/network/base_response.dart';

// --- BASE DATA STATE ---
class DataState<T> extends BaseResponse {
  final T? data;
  DataState({required super.success, required super.message, this.data});

  factory DataState.fromJson(Map<String, dynamic> json) {
    return DataState(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}

class SuccessState<T> extends DataState<T> {
  SuccessState({super.data, super.message = 'Success'}) : super(success: true);
}

class ErrorState<T> extends DataState<T> {
  ErrorState({required super.message}) : super(success: false);

  factory ErrorState.fromJson(Map<String, dynamic> json) {
    return ErrorState(message: json['message'] ?? 'Unknown Error');
  }
}

// --- HANDLE RESPONSE FUNCTION ---
Future<DataState<T>> handleResponse<T>(
  Future<HttpResponse<DataState>> Function() apiCall,
  T Function(dynamic) mapDataSuccess,
) async {
  try {
    final HttpResponse<DataState> httpResponse = await apiCall();
    final int statusCode = httpResponse.response.statusCode ?? 0;

    // MODIFIKASI: Semua status 2xx (200, 201, 204, dll) adalah SUKSES
    if (statusCode >= 200 && statusCode < 300) {
      final response = httpResponse.data;

      if (response.success) {
        return SuccessState(
          message: response.message,
          data: mapDataSuccess(response.data),
        );
      } else {
        return ErrorState(message: response.message);
      }
    } else {
      // Jika status code di luar 2xx, lempar ke DioException
      throw DioException(
        response: httpResponse.response,
        requestOptions: httpResponse.response.requestOptions,
      );
    }
  } on DioException catch (e) {
    try {
      // Parsing error message dari JSON server
      final dynamic errorBody = e.response?.data;
      String serverMessage = "";

      if (errorBody is Map<String, dynamic>) {
        serverMessage = errorBody['message'] ?? e.message;
      } else {
        serverMessage = e.message ?? "Connection Error";
      }

      return ErrorState(
        message: '${e.response?.statusCode ?? ''} $serverMessage',
      );
    } catch (e1) {
      return ErrorState(
        message:
            '${e.response?.statusCode ?? HttpStatus.badRequest} ${e.error ?? e}',
      );
    }
  } catch (e) {
    return ErrorState(message: e.toString());
  }
}
