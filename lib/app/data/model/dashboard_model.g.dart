// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStatsResponseImpl _$$DashboardStatsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardStatsResponseImpl(
      data: DashboardStats.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardStatsResponseImplToJson(
        _$DashboardStatsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$MonthlySummaryResponseImpl _$$MonthlySummaryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlySummaryResponseImpl(
      data: MonthlySummary.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MonthlySummaryResponseImplToJson(
        _$MonthlySummaryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$RecentActivitiesResponseImpl _$$RecentActivitiesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentActivitiesResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => RecentActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecentActivitiesResponseImplToJson(
        _$RecentActivitiesResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
