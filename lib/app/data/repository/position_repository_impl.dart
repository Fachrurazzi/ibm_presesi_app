import 'dart:convert';
import 'package:ibm_presensi_app/app/data/model/position_model.dart';
import 'package:ibm_presensi_app/app/data/source/position_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/position.dart';
import 'package:ibm_presensi_app/app/module/repository/position_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class PositionRepositoryImpl implements PositionRepository {
  final PositionApiService _apiService;

  PositionRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<PositionEntity>>> getList() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getList();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data
            .map((e) => PositionEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<DataState<PositionEntity>> create(PositionEntity position) {
    final request = PositionRequest(name: position.name);

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.create(body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return PositionEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<PositionEntity>> update(PositionEntity position) {
    final request = PositionRequest(name: position.name);

    return handleResponse(
      apiCall: () async {
        final jsonString =
            await _apiService.update(id: position.id, body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return PositionEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<bool>> delete(int id) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.delete(id);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) => true,
    );
  }
}
