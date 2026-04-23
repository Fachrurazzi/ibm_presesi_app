import 'dart:convert';
import 'package:ibm_presensi_app/app/data/model/shift_model.dart';
import 'package:ibm_presensi_app/app/data/source/shift_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/shift.dart';
import 'package:ibm_presensi_app/app/module/repository/shift_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class ShiftRepositoryImpl implements ShiftRepository {
  final ShiftApiService _apiService;

  ShiftRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<ShiftEntity>>> getList() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getList();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data
            .map((e) => ShiftEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<DataState<ShiftEntity>> getDetail(int id) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getDetail(id);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return ShiftEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<ShiftEntity>> create(ShiftEntity shift) {
    final request = ShiftRequest(
      name: shift.name,
      startTime: shift.startTime ?? '08:30',
      endTime: shift.endTime ?? '17:30',
      description: shift.description,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.create(body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return ShiftEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<ShiftEntity>> update(ShiftEntity shift) {
    final request = ShiftRequest(
      name: shift.name,
      startTime: shift.startTime ?? '08:30',
      endTime: shift.endTime ?? '17:30',
      description: shift.description,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString =
            await _apiService.update(id: shift.id, body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return ShiftEntity.fromJson(data as Map<String, dynamic>);
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
