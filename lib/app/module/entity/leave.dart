import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave.freezed.dart';
part 'leave.g.dart';

// ========== LEAVE ENTITY (Response) ==========
@freezed
class LeaveEntity with _$LeaveEntity {
  const factory LeaveEntity({
    required int id,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'duration') @Default(1) int duration,
    required String reason,
    @Default('annual') String category,
    @JsonKey(name: 'category_label') String? categoryLabel,
    @Default('PENDING') String status,
    @JsonKey(name: 'status_label') String? statusLabel,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _LeaveEntity;

  factory LeaveEntity.fromJson(Map<String, dynamic> json) =>
      _$LeaveEntityFromJson(json);
}

// ========== LEAVE TYPE ENTITY ==========
@freezed
class LeaveType with _$LeaveType {
  const factory LeaveType({
    required String value,
    required String label,
    String? description,
  }) = _LeaveType;

  factory LeaveType.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeFromJson(json);
}

// ========== LEAVE QUOTA ENTITY ==========
@freezed
class LeaveQuota with _$LeaveQuota {
  const factory LeaveQuota({
    @JsonKey(name: 'total_quota') @Default(12) int totalQuota,
    @JsonKey(name: 'used_this_year') @Default(0) int usedThisYear,
    @JsonKey(name: 'remaining_quota') @Default(12) int remainingQuota,
    @JsonKey(name: 'cashable_leave') @Default(0) int cashableLeave,
  }) = _LeaveQuota;

  factory LeaveQuota.fromJson(Map<String, dynamic> json) =>
      _$LeaveQuotaFromJson(json);
}

// ========== PAGINATED LEAVE RESPONSE ==========
@freezed
class PaginatedLeave with _$PaginatedLeave {
  const factory PaginatedLeave({
    required List<LeaveEntity> data,
    required LeavePaginationMeta meta,
  }) = _PaginatedLeave;

  factory PaginatedLeave.fromJson(Map<String, dynamic> json) =>
      _$PaginatedLeaveFromJson(json);
}

@freezed
class LeavePaginationMeta with _$LeavePaginationMeta {
  const factory LeavePaginationMeta({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'per_page') @Default(10) int perPage,
    @Default(0) int total,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
  }) = _LeavePaginationMeta;

  factory LeavePaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$LeavePaginationMetaFromJson(json);
}

// ========== PARAMETER CLASSES ==========

/// Parameter untuk membuat pengajuan cuti
class LeaveCreateParams {
  final String startDate;
  final String endDate;
  final String reason;
  final String category;

  const LeaveCreateParams({
    required this.startDate,
    required this.endDate,
    required this.reason,
    this.category = 'annual',
  });

  Map<String, dynamic> toJson() => {
        'start_date': startDate,
        'end_date': endDate,
        'reason': reason,
        'category': category,
      };
}

/// Parameter untuk list cuti dengan filter
class LeaveListParams {
  final int page;
  final int perPage;
  final String? status; // PENDING, APPROVED, REJECTED

  const LeaveListParams({
    this.page = 1,
    this.perPage = 10,
    this.status,
  });

  Map<String, dynamic> toQueryParams() {
    final params = <String, String>{
      'page': page.toString(),
      'per_page': perPage.toString(),
    };
    if (status != null) params['status'] = status!;
    return params;
  }
}

/// Parameter untuk update status cuti (Admin only)
class LeaveUpdateStatusParams {
  final int id;
  final String status; // APPROVED atau REJECTED
  final String? note;

  const LeaveUpdateStatusParams({
    required this.id,
    required this.status,
    this.note,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{'status': status.toUpperCase()};
    if (note != null) json['note'] = note;
    return json;
  }
}

// ========== EXTENSIONS ==========
extension LeaveEntityX on LeaveEntity {
  bool get isPending => status.toUpperCase() == 'PENDING';
  bool get isApproved => status.toUpperCase() == 'APPROVED';
  bool get isRejected => status.toUpperCase() == 'REJECTED';
  bool get canCancel => isPending;

  String get statusDisplay => statusLabel ?? _defaultStatusLabel;
  String get _defaultStatusLabel {
    switch (status.toUpperCase()) {
      case 'APPROVED':
        return 'Disetujui';
      case 'REJECTED':
        return 'Ditolak';
      default:
        return 'Menunggu';
    }
  }

  String get categoryDisplay => categoryLabel ?? _defaultCategoryLabel;
  String get _defaultCategoryLabel {
    switch (category) {
      case 'annual':
        return 'Cuti Tahunan';
      case 'sick':
        return 'Cuti Sakit';
      case 'emergency':
        return 'Cuti Darurat';
      case 'maternity':
        return 'Cuti Melahirkan';
      case 'important':
        return 'Cuti Penting';
      default:
        return 'Cuti Lainnya';
    }
  }

  String get dateRange => '$startDate - $endDate';
  String get durationDisplay => '$duration hari';

  Color get statusColor {
    switch (status.toUpperCase()) {
      case 'APPROVED':
        return const Color(0xFF4CAF50); // Green
      case 'REJECTED':
        return const Color(0xFFF44336); // Red
      default:
        return const Color(0xFFFF9800); // Orange
    }
  }

  IconData get statusIcon {
    switch (status.toUpperCase()) {
      case 'APPROVED':
        return Icons.check_circle_rounded;
      case 'REJECTED':
        return Icons.cancel_rounded;
      default:
        return Icons.pending_rounded;
    }
  }
}

extension LeaveQuotaX on LeaveQuota {
  double get usagePercentage {
    if (totalQuota == 0) return 0;
    return (usedThisYear / totalQuota) * 100;
  }

  String get usageDisplay => '$usedThisYear/$totalQuota hari';
  String get remainingDisplay => '$remainingQuota hari tersisa';

  bool get hasQuota => remainingQuota > 0;
  bool get isLow => remainingQuota <= 3;
}
