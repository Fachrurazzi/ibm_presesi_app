import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/data/source/dashboard_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/module/repository/dashboard_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardApiService _apiService;

  DashboardRepositoryImpl(this._apiService);

  @override
  Future<DataState<DashboardStats>> getStats() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getStats();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        debugPrint('✅ Dashboard stats loaded');
        return DashboardStats.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<MonthlySummary>> getMonthlySummary(
      MonthlySummaryParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getMonthlySummary(
          month: param.month,
          year: param.year,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return MonthlySummary.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<List<RecentActivity>>> getRecentActivities() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getRecentActivities();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data
            .map((e) => RecentActivity.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
