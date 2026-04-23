import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';
import 'package:ibm_presensi_app/core/use_case/app_use_case.dart';

class LeaveCreateUseCase
    extends AppUseCase<DataState<LeaveEntity>, LeaveCreateParams> {
  final LeaveRepository _repository;

  LeaveCreateUseCase(this._repository);

  @override
  Future<DataState<LeaveEntity>> call(LeaveCreateParams param) {
    // Validasi
    if (param.startDate.isEmpty || param.endDate.isEmpty) {
      return Future.value(
        const ErrorState(message: "Tanggal mulai dan selesai harus diisi"),
      );
    }
    if (param.reason.length < 10) {
      return Future.value(
        const ErrorState(message: "Alasan minimal 10 karakter"),
      );
    }

    // Validasi tanggal
    try {
      final start = DateTime.parse(param.startDate);
      final end = DateTime.parse(param.endDate);

      if (end.isBefore(start)) {
        return Future.value(
          const ErrorState(
              message: "Tanggal selesai tidak boleh sebelum tanggal mulai"),
        );
      }

      final today = DateTime.now();
      if (start.isBefore(today.subtract(const Duration(days: 1)))) {
        return Future.value(
          const ErrorState(message: "Tanggal mulai minimal hari ini"),
        );
      }
    } catch (e) {
      return Future.value(
        const ErrorState(message: "Format tanggal tidak valid"),
      );
    }

    return _repository.create(param);
  }
}
