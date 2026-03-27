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
      () => _leaveApiService.send(body: param.toJson()),
      (json) {
        // TIPS: Jangan kembalikan null.
        // Mengembalikan 'true' memberi tahu UseCase bahwa proses tulis ke DB Laravel sukses.
        return true;
      },
    );
  }

  @override
  Future<DataState<List<LeaveEntity>>> getHistory() {
    return handleResponse(
      () => _leaveApiService.getHistory(),
      (json) {
        // Laravel mengembalikan Array di dalam field 'data'
        final List dataList = json as List;
        return dataList
            .map((item) => LeaveEntity.fromJson(item as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
