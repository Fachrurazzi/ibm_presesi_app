  import 'package:dio/dio.dart';
  import 'package:retrofit/retrofit.dart';
  import 'package:ibm_presensi_app/core/constant/constant.dart';

  part 'leave_api_service.g.dart';

  @RestApi(baseUrl: AppConfig.BASE_URL)
  abstract class LeaveApiService {
    factory LeaveApiService(Dio dio, {String baseUrl}) = _LeaveApiService;

    @GET(AppConfig.leavesList)
    Future<String> getList({
      @Query('page') int? page,
      @Query('per_page') int? perPage,
      @Query('status') String? status,
    });

    @GET(AppConfig.leavesTypes)
    Future<String> getTypes();

    @GET(AppConfig.leavesQuota)
    Future<String> getQuota();

    @GET('${AppConfig.leavesList}/{id}')
    Future<String> getDetail(@Path('id') int id);

    @POST(AppConfig.leavesList)
    Future<String> create({@Body() required Map<String, dynamic> body});

    @DELETE('${AppConfig.leavesList}/{id}')
    Future<String> cancel(@Path('id') int id);

    @PATCH('${AppConfig.leavesList}/{id}/status')
    Future<String> updateStatus({
      @Path('id') required int id,
      @Body() required Map<String, dynamic> body,
    });
  }
