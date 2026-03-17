import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:retrofit/retrofit.dart';

part 'attendance_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio) {
    return _AttendanceApiService(dio);
  }

  @GET('/today')
  Future<HttpResponse<DataState>> getAttendanceToday();

  @POST('/store')
  Future<HttpResponse<DataState>> sendAttendance(
      {@Body() required Map<String, dynamic> body});

  @GET('/history/{month}/{year}')
  Future<HttpResponse<DataState>> getAttendanceByMonthYear(
      {@Path('month') required String month, @Path('year') required String year});
}
