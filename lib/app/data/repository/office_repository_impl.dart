import 'dart:convert';
import 'package:ibm_presensi_app/app/data/model/office_model.dart';
import 'package:ibm_presensi_app/app/data/source/office_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/office.dart';
import 'package:ibm_presensi_app/app/module/repository/office_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class OfficeRepositoryImpl implements OfficeRepository {
  final OfficeApiService _apiService;

  OfficeRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<OfficeEntity>>> getList() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getList();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data.map((e) => OfficeEntity.fromJson(e as Map<String, dynamic>)).toList();
      },
    );
  }

  @override
  Future<DataState<OfficeEntity>> getDetail(int id) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getDetail(id);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return OfficeEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<List<OfficeWithDistance>>> getNearest(NearestOfficeParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getNearest(
          latitude: param.latitude,
          longitude: param.longitude,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data.map((e) => OfficeWithDistance.fromJson(e as Map<String, dynamic>)).toList();
      },
    );
  }

  @override
  Future<DataState<OfficeEntity>> create(OfficeEntity office) {
    final request = OfficeRequest(
      name: office.name,
      latitude: office.latitude,
      longitude: office.longitude,
      radius: office.radius,
      supervisorName: office.supervisorName,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.create(body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return OfficeEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<OfficeEntity>> update(OfficeEntity office) {
    final request = OfficeRequest(
      name: office.name,
      latitude: office.latitude,
      longitude: office.longitude,
      radius: office.radius,
      supervisorName: office.supervisorName,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.update(id: office.id, body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return OfficeEntity.fromJson(data as Map<String, dynamic>);
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

  @override
  Future<DataState<OfficeWithDistance>> checkRadius(CheckRadiusParams param) {
    final request = CheckRadiusRequest(
      officeId: param.officeId,
      latitude: param.latitude,
      longitude: param.longitude,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.checkRadius(body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return OfficeWithDistance.fromJson(data as Map<String, dynamic>);
      },
    );
  }
}