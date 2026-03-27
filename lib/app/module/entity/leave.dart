import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave.g.dart';
part 'leave.freezed.dart';

@freezed
sealed class Leave with _$Leave {
  // 1. ParamEntity: Digunakan saat Form Cuti di-submit ke Server
  const factory Leave.paramEntity({
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required String reason,
    // TIPS: Tambahkan 'type' (Cuti, Izin, Sakit) jika API membutuhkannya
  }) = LeaveParamEntity;

  // 2. Entity: Digunakan untuk menampilkan Daftar Riwayat Cuti di UI
  const factory Leave.entity({
    required int id,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required String reason,
    required String status, // 'pending', 'approved', 'rejected'
  }) = LeaveEntity;

  factory Leave.fromJson(Map<String, dynamic> json) => _$LeaveFromJson(json);
}
