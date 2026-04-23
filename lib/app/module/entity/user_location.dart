import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'user_location.freezed.dart';
part 'user_location.g.dart';

@freezed
class UserLocation with _$UserLocation {
  const factory UserLocation({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'position_name') String? positionName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'last_latitude') double? lastLatitude,
    @JsonKey(name: 'last_longitude') double? lastLongitude,
    @JsonKey(name: 'last_location_at') DateTime? lastLocationAt,
    @JsonKey(name: 'is_online') @Default(false) bool isOnline,
  }) = _UserLocation;

  factory UserLocation.fromJson(Map<String, dynamic> json) =>
      _$UserLocationFromJson(json);

  /// 🆕 Empty factory
  factory UserLocation.empty() => const UserLocation(
        id: 0,
        name: '',
        email: '',
      );
}

extension UserLocationX on UserLocation {
  bool get hasLocation => lastLatitude != null && lastLongitude != null;
  String get displayAvatar => avatarUrl ?? '';
  String get displayName => name.isNotEmpty ? name : 'Karyawan';
  String get displayPosition => positionName ?? 'Staff';

  /// 🆕 Get coordinate string
  String get coordinateDisplay {
    if (!hasLocation) return '-';
    return '${lastLatitude!.toStringAsFixed(6)}, ${lastLongitude!.toStringAsFixed(6)}';
  }

  String get lastSeenText {
    if (lastLocationAt == null) return 'Belum ada lokasi';
    final diff = DateTime.now().difference(lastLocationAt!);
    if (diff.inMinutes < 1) return 'Baru saja';
    if (diff.inMinutes < 60) return '${diff.inMinutes} menit lalu';
    if (diff.inHours < 24) return '${diff.inHours} jam lalu';
    if (diff.inDays < 7) return '${diff.inDays} hari lalu';
    // 🆕 Lebih dari 7 hari tampilkan tanggal
    return '${lastLocationAt!.day}/${lastLocationAt!.month}/${lastLocationAt!.year}';
  }

  String get lastTimeFormatted {
    if (lastLocationAt == null) return '--:--';
    return '${lastLocationAt!.hour.toString().padLeft(2, '0')}:${lastLocationAt!.minute.toString().padLeft(2, '0')}';
  }

  /// 🆕 Get full datetime formatted
  String get lastDateTimeFormatted {
    if (lastLocationAt == null) return '-';
    return '${lastLocationAt!.day}/${lastLocationAt!.month}/${lastLocationAt!.year} $lastTimeFormatted';
  }

  Color get statusColor => isOnline ? Colors.green : Colors.grey;

  /// 🆕 Get status text
  String get statusText => isOnline ? 'Online' : 'Offline';

  /// 🆕 Get initial for avatar
  String get initials {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, 1).toUpperCase();
  }
}
