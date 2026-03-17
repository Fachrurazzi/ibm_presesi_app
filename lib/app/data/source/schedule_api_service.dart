import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'schedule_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ScheduleApiService {
  factory ScheduleApiService(Dio dio) {
    return _ScheduleApiService(dio);
  }

  @GET('/schedule')
  Future<HttpResponse<DataState>> get();
}
