import 'package:dio/dio.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'leave_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class LeaveApiService {
  factory LeaveApiService(Dio dio) {
    return _LeaveApiService(dio);
  }

  @POST('/leaves')
  Future<HttpResponse<DataState>> send({@Body() required Map<String, dynamic> body});
}
