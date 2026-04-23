import 'package:ibm_presensi_app/app/module/entity/shift.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class ShiftRepository {
  /// GET /shifts - Get all shifts
  Future<DataState<List<ShiftEntity>>> getList();

  /// GET /shifts/{id} - Get shift detail
  Future<DataState<ShiftEntity>> getDetail(int id);

  /// POST /shifts - Create shift (Admin only)
  Future<DataState<ShiftEntity>> create(ShiftEntity shift);

  /// PUT /shifts/{id} - Update shift (Admin only)
  Future<DataState<ShiftEntity>> update(ShiftEntity shift);

  /// DELETE /shifts/{id} - Delete shift (Admin only)
  Future<DataState<bool>> delete(int id);
}
