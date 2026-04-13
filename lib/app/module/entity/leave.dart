import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave.g.dart';
part 'leave.freezed.dart';

@freezed
class Leave with _$Leave {
  // 1. ParamEntity: Untuk submit data ke server Laravel PT IBM
  const factory Leave.paramEntity({
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required String reason,
    @Default('Cuti') String type, // Tambahkan tipe: Cuti, Izin, atau Sakit
  }) = LeaveParamEntity;

  // 2. Entity: Untuk merender riwayat di UI Dashboard/Leave History
  const factory Leave.entity({
    required int id,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required String reason,

    /// Status pengajuan: 'pending', 'approved', 'rejected'
    @Default('pending') String status,

    /// Nama Admin yang menyetujui (Opsional)
    @JsonKey(name: 'approved_by') String? approvedBy,
  }) = LeaveEntity;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);
}
