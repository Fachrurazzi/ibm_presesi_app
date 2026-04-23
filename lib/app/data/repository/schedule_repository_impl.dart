import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:ibm_presensi_app/app/data/model/schedule_model.dart';
import 'package:ibm_presensi_app/app/data/source/schedule_api_service.dart';
import 'package:ibm_presensi_app/app/module/entity/schedule.dart';
import 'package:ibm_presensi_app/app/module/repository/schedule_repository.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/network/data_state.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleApiService _apiService;

  ScheduleRepositoryImpl(this._apiService);

  @override
  Future<DataState<PaginatedSchedule>> getList(ScheduleListParams param) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getList(
          page: param.page,
          perPage: param.perPage,
          userId: param.userId,
          status: param.status,
        );
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        return PaginatedSchedule.fromJson(json as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<ScheduleEntity>> getDetail(int id) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getDetail(id);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return ScheduleEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<List<ScheduleEntity>>> getByUser(int userId) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.getByUser(userId);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'] as List;
        return data
            .map((e) => ScheduleEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  @override
  Future<DataState<ScheduleEntity>> create(ScheduleParams param) {
    final request = ScheduleRequest(
      userId: param.userId,
      shiftId: param.shiftId,
      officeId: param.officeId,
      startDate: param.startDate,
      endDate: param.endDate,
      isWfa: param.isWfa,
      isBanned: param.isBanned,
      bannedReason: param.bannedReason,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.create(body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return ScheduleEntity.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  @override
  Future<DataState<ScheduleEntity>> update(int id, ScheduleParams param) {
    final request = ScheduleRequest(
      userId: param.userId,
      shiftId: param.shiftId,
      officeId: param.officeId,
      startDate: param.startDate,
      endDate: param.endDate,
      isWfa: param.isWfa,
      isBanned: param.isBanned,
      bannedReason: param.bannedReason,
    );

    return handleResponse(
      apiCall: () async {
        final jsonString =
            await _apiService.update(id: id, body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) {
        final data = json['data'];
        return ScheduleEntity.fromJson(data as Map<String, dynamic>);
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
  Future<DataState<ScheduleEntity>> ban(BanScheduleParams param) {
    final request = BanScheduleRequest(bannedReason: param.reason);

    return handleResponse(
      apiCall: () async {
        final jsonString =
            await _apiService.ban(id: param.id, body: request.toJson());
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) async {
        final data = json['data'];
        final schedule = ScheduleEntity.fromJson(data as Map<String, dynamic>);

        await SharedPreferencesHelper.setBool(AppPreferences.IS_BANNED, true);
        if (schedule.bannedReason != null) {
          await SharedPreferencesHelper.setString(
            AppPreferences.BANNED_REASON,
            schedule.bannedReason!,
          );
        }

        debugPrint("🚫 Schedule ${param.id} banned: ${param.reason}");
        return schedule;
      },
    );
  }

  @override
  Future<DataState<ScheduleEntity>> unban(int id) {
    return handleResponse(
      apiCall: () async {
        final jsonString = await _apiService.unban(id);
        return jsonDecode(jsonString) as Map<String, dynamic>;
      },
      mapDataSuccess: (json) async {
        final data = json['data'];
        final schedule = ScheduleEntity.fromJson(data as Map<String, dynamic>);

        await SharedPreferencesHelper.setBool(AppPreferences.IS_BANNED, false);
        await SharedPreferencesHelper.remove(AppPreferences.BANNED_REASON);

        debugPrint("✅ Schedule $id unbanned");
        return schedule;
      },
    );
  }
}
