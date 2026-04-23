import 'dart:convert';
import 'dart:io';
import 'package:ibm_presensi_app/app/data/model/permission_model.dart';
import 'package:ibm_presensi_app/app/data/source/permission_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/permission.dart';
import 'package:ibm_presensi_app/app/module/repository/permission_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  final PermissionApiService _apiService;

  PermissionRepositoryImpl(this._apiService);

  @override
  Future<DataState<PaginatedPermission>> getList(PermissionListParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getList(
          page: param.page,
          perPage: param.perPage,
          status: param.status,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        return PaginatedPermission.fromJson(json as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<List<PermissionType>>> getTypes() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getTypes();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data
            .map((e) => PermissionType.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<DataState<PermissionCheckResult>> check(PermissionCheckParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.check(date: param.date);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return PermissionCheckResult.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<PermissionEntity>> getDetail(int id) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getDetail(id);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return PermissionEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<PermissionEntity>> create(PermissionCreateParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.create(
          type: param.type,
          date: param.date,
          reason: param.reason,
          image: param.hasImage ? File(param.imagePath!) : null,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return PermissionEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<bool>> cancel(int id) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.cancel(id);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) => true,
    );
  }

  @override
  Future<DataState<bool>> updateStatus(PermissionUpdateStatusParams param) {
    final request = PermissionUpdateStatusRequest(
      status: param.status,
      note: param.note,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.updateStatus(
          id: param.id,
          body: request.toJson(),
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) => true,
    );
  }
}
