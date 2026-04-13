import 'package:ibm_presensi_app/app/data/source/leave_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class LeaveRepositoryImpl extends LeaveRepository {
  final LeaveApiService _leaveApiService;

  LeaveRepositoryImpl(this._leaveApiService);

  @override
  Future<DataState<bool>> send(LeaveParamEntity param) {
    return handleResponse(
      apiCall: () => _leaveApiService.send(body: param.toJson()),
      mapDataSuccess: (json) => true,
    );
  }

  @override
  Future<DataState<List<LeaveEntity>>> getHistory() {
    return handleResponse(
      apiCall: () => _leaveApiService.getHistory(),
      mapDataSuccess: (json) {
        // Proteksi: Pastikan json adalah List. Jika Laravel membungkusnya dalam 'data',
        // helper handleResponse kita sudah mengekstraknya, jadi 'json' di sini sudah bersih.
        if (json is! List) return [];

        return json
            .map((item) => LeaveEntity.fromJson(item as Map<String, dynamic>))
            .toList();
      },
    );
  }
}