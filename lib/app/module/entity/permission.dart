import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'permission.freezed.dart';
part 'permission.g.dart';

// ========== PERMISSION ENTITY ==========
@freezed
class PermissionEntity with _$PermissionEntity {
  const factory PermissionEntity({
    required int id,
    required String type,
    @JsonKey(name: 'type_label') String? typeLabel,
    required String date,
    required String reason,
    @JsonKey(name: 'image_proof_url') String? imageProofUrl,
    @Default('PENDING') String status,
    @JsonKey(name: 'status_label') String? statusLabel,
    String? note,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _PermissionEntity;

  factory PermissionEntity.fromJson(Map<String, dynamic> json) =>
      _$PermissionEntityFromJson(json);
}

// ========== PERMISSION TYPE ENTITY ==========
@freezed
class PermissionType with _$PermissionType {
  const factory PermissionType({
    required String value,
    required String label,
    String? description,
  }) = _PermissionType;

  factory PermissionType.fromJson(Map<String, dynamic> json) =>
      _$PermissionTypeFromJson(json);
}

// ========== PERMISSION CHECK RESULT ==========
@freezed
class PermissionCheckResult with _$PermissionCheckResult {
  const factory PermissionCheckResult({
    required String date,
    @JsonKey(name: 'has_permission') @Default(false) bool hasPermission,
    PermissionEntity? permission,
  }) = _PermissionCheckResult;

  factory PermissionCheckResult.fromJson(Map<String, dynamic> json) =>
      _$PermissionCheckResultFromJson(json);
}

// ========== PAGINATED PERMISSION RESPONSE ==========
@freezed
class PaginatedPermission with _$PaginatedPermission {
  const factory PaginatedPermission({
    required List<PermissionEntity> data,
    required PermissionPaginationMeta meta,
  }) = _PaginatedPermission;

  factory PaginatedPermission.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPermissionFromJson(json);
}

@freezed
class PermissionPaginationMeta with _$PermissionPaginationMeta {
  const factory PermissionPaginationMeta({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'per_page') @Default(10) int perPage,
    @Default(0) int total,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
  }) = _PermissionPaginationMeta;

  factory PermissionPaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PermissionPaginationMetaFromJson(json);
}

// ========== PARAMETER CLASSES ==========

/// Parameter untuk membuat pengajuan izin
class PermissionCreateParams {
  final String type; // LATE, EARLY_LEAVE, BUSINESS_TRIP, SICK_WITH_CERT
  final String date;
  final String reason;
  final String? imagePath; // local file path untuk upload

  const PermissionCreateParams({
    required this.type,
    required this.date,
    required this.reason,
    this.imagePath,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'date': date,
        'reason': reason,
      };

  bool get hasImage => imagePath != null && imagePath!.isNotEmpty;
}

/// Parameter untuk list permission dengan filter
class PermissionListParams {
  final int page;
  final int perPage;
  final String? status; // PENDING, APPROVED, REJECTED

  const PermissionListParams({
    this.page = 1,
    this.perPage = 10,
    this.status,
  });

  Map<String, dynamic> toQueryParams() {
    final params = <String, String>{
      'page': page.toString(),
      'per_page': perPage.toString(),
    };
    if (status != null && status!.isNotEmpty) {
      params['status'] = status!;
    }
    return params;
  }
}

/// Parameter untuk cek permission di tanggal tertentu
class PermissionCheckParams {
  final String date;

  const PermissionCheckParams({required this.date});

  Map<String, dynamic> toQueryParams() => {'date': date};
}

/// Parameter untuk update status permission (Admin only)
class PermissionUpdateStatusParams {
  final int id;
  final String status; // APPROVED atau REJECTED
  final String? note;

  const PermissionUpdateStatusParams({
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
extension PermissionEntityX on PermissionEntity {
  bool get isPending => status.toUpperCase() == 'PENDING';
  bool get isApproved => status.toUpperCase() == 'APPROVED';
  bool get isRejected => status.toUpperCase() == 'REJECTED';
  bool get canCancel => isPending;
  bool get hasImage => imageProofUrl != null && imageProofUrl!.isNotEmpty;

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

  String get typeDisplay => typeLabel ?? _defaultTypeLabel;
  String get _defaultTypeLabel {
    switch (type) {
      case 'LATE':
        return 'Izin Terlambat';
      case 'EARLY_LEAVE':
        return 'Izin Pulang Cepat';
      case 'BUSINESS_TRIP':
        return 'Dinas Luar Kota';
      case 'SICK_WITH_CERT':
        return 'Sakit (Surat Dokter)';
      default:
        return 'Izin Lainnya';
    }
  }

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

  IconData get typeIcon {
    switch (type) {
      case 'LATE':
        return Icons.access_time_rounded;
      case 'EARLY_LEAVE':
        return Icons.exit_to_app_rounded;
      case 'BUSINESS_TRIP':
        return Icons.flight_rounded;
      case 'SICK_WITH_CERT':
        return Icons.medical_services_rounded;
      default:
        return Icons.note_alt_rounded;
    }
  }
}
