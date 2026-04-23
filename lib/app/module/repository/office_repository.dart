import 'package:ibm_presensi_app/app/module/entity/office.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

abstract class OfficeRepository {
  /// GET /offices - Get all offices
  Future<DataState<List<OfficeEntity>>> getList();

  /// GET /offices/{id} - Get office detail
  Future<DataState<OfficeEntity>> getDetail(int id);

  /// GET /offices/nearest - Get nearest offices
  Future<DataState<List<OfficeWithDistance>>> getNearest(
      NearestOfficeParams param);

  /// POST /offices - Create office (Admin only)
  Future<DataState<OfficeEntity>> create(OfficeEntity office);

  /// PUT /offices/{id} - Update office (Admin only)
  Future<DataState<OfficeEntity>> update(OfficeEntity office);

  /// DELETE /offices/{id} - Delete office (Admin only)
  Future<DataState<bool>> delete(int id);

  /// POST /offices/check-radius - Check if within office radius
  Future<DataState<OfficeWithDistance>> checkRadius(CheckRadiusParams param);
}
