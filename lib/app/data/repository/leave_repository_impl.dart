import 'dart:convert';
import 'package:ibm_presensi_app/app/data/model/leave_model.dart';
import 'package:ibm_presensi_app/app/data/source/leave_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/leave.dart';
import 'package:ibm_presensi_app/app/module/repository/leave_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  final LeaveApiService _apiService;

  LeaveRepositoryImpl(this._apiService);

  @override
  Future<DataState<PaginatedLeave>> getList(LeaveListParams param) {
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
        return PaginatedLeave.fromJson(json as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<List<LeaveType>>> getTypes() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getTypes();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data
            .map((e) => LeaveType.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<DataState<LeaveQuota>> getQuota() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getQuota();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return LeaveQuota.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<LeaveEntity>> getDetail(int id) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getDetail(id);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return LeaveEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<LeaveEntity>> create(LeaveCreateParams param) {
    final request = LeaveRequest(
      startDate: param.startDate,
      endDate: param.endDate,
      reason: param.reason,
      category: param.category,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.create(body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return LeaveEntity.fromJson(data as Map<String, dynamic>);
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
  Future<DataState<bool>> updateStatus(LeaveUpdateStatusParams param) {
    final request = LeaveUpdateStatusRequest(
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
