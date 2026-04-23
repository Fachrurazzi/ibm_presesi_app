import 'package:ibm_presensi_app/app/module/entity/position.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class PositionRepository {
  /// GET /positions - Get all positions
  Future<DataState<List<PositionEntity>>> getList();

  /// POST /positions - Create position (Admin only)
  Future<DataState<PositionEntity>> create(PositionEntity position);

  /// PUT /positions/{id} - Update position (Admin only)
  Future<DataState<PositionEntity>> update(PositionEntity position);

  /// DELETE /positions/{id} - Delete position (Admin only)
  Future<DataState<bool>> delete(int id);
}
