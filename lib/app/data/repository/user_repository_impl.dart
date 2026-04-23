import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/data/model/user_model.dart';
import 'package:ibm_presensi_app/app/data/source/user_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/user.dart';
import 'package:ibm_presensi_app/app/module/entity/user_location.dart';
import 'package:ibm_presensi_app/app/module/repository/user_repository.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _apiService;

  UserRepositoryImpl(this._apiService);

  // ========== EXISTING METHODS ==========

  @override
  Future<DataState<UserEntity>> getProfile() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getProfile();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return UserEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<UserEntity>> updateProfile(UserUpdateParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.updateProfile(
          name: param.name,
          image: param.imagePath != null ? File(param.imagePath!) : null,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        debugPrint('✅ Profile updated: ${param.name}'); // 🆕
        return UserEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<String>> getPhoto() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getPhoto();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as Map<String, dynamic>?;
        return data?['full_url'] ?? '';
      },
    );
  }

  @override
  Future<DataState<bool>> deletePhoto() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.deletePhoto();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) => true,
    );
  }

  @override
  Future<DataState<PaginatedUserSchedule>> getSchedule(
      UserScheduleParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getSchedule(
          month: param.month,
          year: param.year,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return PaginatedUserSchedule.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<TodaySchedule>> getTodaySchedule() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getTodaySchedule();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return TodaySchedule.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<LeaveSummary>> getLeaveSummary(LeaveSummaryParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getLeaveSummary(year: param.year);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return LeaveSummary.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<bool>> updateFcmToken(FcmTokenParams param) {
    final request = FcmTokenRequest(fcmToken: param.fcmToken);
    return handleResponse(
      apiCall: () async {
        final jsonString =
            await _apiService.updateFcmToken(body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) => true,
    );
  }

  @override
  Future<DataState<bool>> updateLocation(LocationUpdateParams param) {
    final request = LocationUpdateRequest(
      latitude: param.latitude,
      longitude: param.longitude,
    );
    return handleResponse(
      apiCall: () async {
        final jsonString =
            await _apiService.updateLocation(body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (_) => true,
    );
  }

  // ========== 🆕 USER LOCATION TRACKING ==========

  @override
  Future<DataState<List<UserLocation>>> getAllUserLocations() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getAllUserLocations();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data
            .map((e) => UserLocation.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<DataState<List<UserLocation>>> getTeamLocations() {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getTeamLocations();
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data
            .map((e) => UserLocation.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<DataState<UserLocation>> getUserLocation(int userId) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getUserLocation(userId);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return UserLocation.fromJson(data as Map<String, dynamic>);
      },
    );
  }
}
