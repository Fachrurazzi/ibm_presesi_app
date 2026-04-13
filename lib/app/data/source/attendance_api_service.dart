import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:retrofit/retrofit.dart';

part 'attendance_api_service.g.dart';

@RestApi() // BaseURL sudah dihandle secara global di Dependency Injection (Dio)
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio, {String baseUrl}) =
      _AttendanceApiService;

  /// Mengambil data presensi hari ini & ringkasan bulan berjalan
  @GET('/attendance/today') // Pastikan endpoint sesuai dengan API Laravel kamu
  Future<HttpResponse<dynamic>> getAttendanceToday();

  /// Mengirim data presensi (Check-in/Check-out)
  /// Menggunakan Map agar fleksibel mengirim koordinat GPS & Image Base64
  @POST('/attendance/store')
  Future<HttpResponse<dynamic>> sendAttendance({
    @Body() required Map<String, dynamic> body,
  });

  /// Mengambil riwayat presensi berdasarkan bulan dan tahun
  @GET('/attendance/history/{month}/{year}')
  Future<HttpResponse<dynamic>> getAttendanceByMonthYear({
    @Path('month') required String month,
    @Path('year') required String year,
  });
}
