import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_screen.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_screen.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  HomeScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final homeProv = context.watch<HomeNotifier>();
    final theme = Theme.of(context);

    if (homeProv.isEmulator) return _buildEmulatorBlocked(theme);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return RefreshIndicator(
                onRefresh: () => homeProv.refreshData(),
                color: theme.primaryColor,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    // --- 1. HEADER ---
                    SliverToBoxAdapter(child: _buildHeader(context, homeProv)),

                    // --- 2. PRESENCE CARD ---
                    SliverToBoxAdapter(
                        child: _buildPresenceCard(context, homeProv)),

                    // --- 3. SUMMARY SECTION (Grid 2x2) ---
                    SliverToBoxAdapter(
                        child: _buildSummarySection(context, homeProv)),

                    // --- 4. HISTORY HEADER ---
                    SliverToBoxAdapter(child: _buildHistoryHeader(context)),

                    // --- 5. HISTORY LIST ---
                    _buildHistoryList(context, homeProv),

                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, HomeNotifier prov) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 16, 10),
      child: Row(
        children: [
          Hero(
            tag: 'profile_photo_main',
            child: GestureDetector(
              onTap: () => _onPressProfile(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: (prov.photoUrl != null && prov.photoUrl!.isNotEmpty)
                    ? CachedNetworkImage(
                        imageUrl: prov.photoUrl!,
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            _buildAvatarPlaceholder(),
                        errorWidget: (context, url, error) =>
                            _buildAvatarError(),
                      )
                    : _buildAvatarError(),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(DateTimeHelper.greeting(),
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
                Text(
                  prov.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      letterSpacing: -0.5),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  prov.positionName,
                  style: TextStyle(
                      fontSize: 11,
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _showMenuBottomSheet(context),
            icon: Icon(Icons.settings_suggest_rounded,
                color: Colors.grey.shade700, size: 24),
          )
        ],
      ),
    );
  }

  Widget _buildPresenceCard(BuildContext context, HomeNotifier prov) {
    final theme = Theme.of(context);
    final String start = prov.attendanceToday?.startTime ?? '--:--';
    final String end = prov.attendanceToday?.endTime ?? '--:--';
    bool isDone = end != "--:--";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [theme.primaryColor, theme.primaryColor.withBlue(220)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
              color: theme.primaryColor.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8))
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: _buildChip(
                      DateFormat('EEEE, dd MMM').format(DateTime.now()))),
              const SizedBox(width: 8),
              Flexible(child: _buildChip(prov.officeName)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _buildTimeItem("Clock In", start)),
              Container(width: 1, height: 35, color: Colors.white24),
              Expanded(child: _buildTimeItem("Clock Out", end)),
            ],
          ),
          const SizedBox(height: 24),
          _buildPresenceButton(context, prov, isDone),
        ],
      ),
    );
  }

  Widget _buildSummarySection(BuildContext context, HomeNotifier prov) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Ringkasan Bulan Ini",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black87)),
          const SizedBox(height: 16),
          // Menggunakan GridView dengan AspectRatio yang dinamis
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.5, // Disesuaikan agar pas di layar kecil
            children: [
              _buildSummaryCard(context,
                  title: "Hadir",
                  value: "${prov.listAttendanceThisMonth.length} Hari",
                  icon: Icons.calendar_today_rounded,
                  color: Colors.green),
              _buildSummaryCard(context,
                  title: "Sisa Cuti",
                  value: "${prov.leaveQuota} Hari",
                  icon: Icons.beach_access_rounded,
                  color: Colors.orange,
                  onTap: () => _onPressLeave(context)),
              _buildSummaryCard(context,
                  title: "Durasi Kerja",
                  value: prov.workingDuration,
                  icon: Icons.timer_outlined,
                  color: Colors.blue),
              _buildSummaryCard(context,
                  title: "Terlambat",
                  value:
                      "${prov.listAttendanceThisMonth.where((a) => a.isLate == true).length}x",
                  icon: Icons.warning_amber_rounded,
                  color: Colors.redAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context,
      {required String title,
      required String value,
      required IconData icon,
      required Color color,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 14),
                const SizedBox(width: 6),
                Expanded(
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis)),
              ],
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(value,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      // Kurangi sedikit padding kanan agar ada ruang lebih
      padding: const EdgeInsets.fromLTRB(24, 8, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Gunakan Expanded agar teks judul mengalah jika layar sempit
          const Expanded(
            child: Text(
              "Riwayat Aktivitas",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow
                  .ellipsis, // Tambahkan titik-titik jika kepanjangan
            ),
          ),
          const SizedBox(width: 8), // Beri jarak antara teks dan tombol
          GestureDetector(
            onTap: () => _onPressSeeAll(context),
            child: Text(
              "Lihat Semua",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context, HomeNotifier prov) {
    if (prov.listAttendanceThisMonth.isEmpty) {
      return _buildEmptyHistory(context);
    }
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = prov.listAttendanceThisMonth[index];
          final isLate = item.isLate ?? false;
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade100)),
            child: Row(
              children: [
                _buildDateBox(context, item.date ?? ""),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${item.startTime ?? '--:--'} - ${item.endTime ?? '--:--'}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 14)),
                      const SizedBox(height: 2),
                      Text(isLate ? "Terlambat" : "Tepat Waktu",
                          style: TextStyle(
                              fontSize: 10,
                              color: isLate ? Colors.red : Colors.green,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Icon(
                    isLate
                        ? Icons.error_outline_rounded
                        : Icons.check_circle_outline_rounded,
                    color: isLate ? Colors.orange : Colors.green,
                    size: 20),
              ],
            ),
          );
        },
            childCount: prov.listAttendanceThisMonth.length > 5
                ? 5
                : prov.listAttendanceThisMonth.length),
      ),
    );
  }

  // --- REUSABLE HELPERS ---
  Widget _buildAvatarPlaceholder() => Container(
      width: 52,
      height: 52,
      color: Colors.grey.shade100,
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)));
  Widget _buildAvatarError() => const CircleAvatar(
      radius: 26,
      backgroundColor: Colors.blueGrey,
      child: Icon(Icons.person_rounded, color: Colors.white));

  Widget _buildTimeItem(String label, String time) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
              child: Text(time,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900))),
          Text(label,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.w500)),
        ],
      );

  Widget _buildChip(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10)),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
      );

  Widget _buildDateBox(BuildContext context, String date) {
    final theme = Theme.of(context);
    return Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
                DateTimeHelper.formatString(
                    dateTimeString: date, format: 'dd\nMMM'),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    color: theme.primaryColor,
                    height: 1.1))));
  }

  Widget _buildPresenceButton(
      BuildContext context, HomeNotifier prov, bool isDone) {
    if (prov.isLeaves) return _buildLeaveInfo();
    return InkWell(
      onTap: isDone ? null : () => _onPressPresence(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                isDone
                    ? Icons.verified_user_rounded
                    : Icons.fingerprint_rounded,
                color: Colors.white,
                size: 18),
            const SizedBox(width: 10),
            Text(isDone ? "ABSENSI SELESAI" : "TAP UNTUK ABSEN",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    letterSpacing: 0.8)),
          ],
        ),
      ),
    );
  }

  void _showMenuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (_) => Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 24),
            ListTile(
                leading: const Icon(Icons.notifications_active_rounded,
                    color: Colors.blue),
                title: const Text("Notifikasi",
                    style: TextStyle(fontWeight: FontWeight.w800)),
                onTap: () {
                  Navigator.pop(context);
                  _onPressEditNotification(context);
                }),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.power_settings_new_rounded,
                    color: Colors.red),
                title: const Text("Keluar",
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  notifier.logout(context);
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildEmulatorBlocked(ThemeData theme) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.security_rounded, size: 80, color: Colors.red),
              const SizedBox(height: 20),
              const Text("Device Tidak Aman",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
              const SizedBox(height: 8),
              Text("Emulator atau Root terdeteksi.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyHistory(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text("Belum ada riwayat",
            style: TextStyle(color: Colors.grey.shade400)),
      ),
    );
  }

  Widget _buildLeaveInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.beach_access_rounded, color: Colors.orange, size: 20),
          SizedBox(width: 10),
          Text("SEDANG CUTI",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w900,
                  fontSize: 12)),
        ],
      ),
    );
  }

  // --- ACTIONS ---
  void _onPressPresence(BuildContext context) =>
      Navigator.pushNamed(context, '/face-recognition');
  void _onPressProfile(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => ProfileScreen()));
  void _onPressLeave(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => LeaveScreen()));
  void _onPressSeeAll(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => DetailAttendanceScreen()));

  void _onPressEditNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: const Text("Pengingat Absen",
            style: TextStyle(fontWeight: FontWeight.w900)),
        content: DropdownButtonFormField<int>(
          value: notifier.timeNotification,
          items: notifier.listEditNotification
              .map(
                  (e) => DropdownMenuItem(value: e.value, child: Text(e.label)))
              .toList(),
          onChanged: (val) {
            if (val != null) {
              notifier.saveNotificationSetting(val);
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.isRefreshSuccess) {
      notifier.isRefreshSuccess = false;
      HapticFeedback.lightImpact();
    }
    if (notifier.homeError.isNotEmpty) {
      final msg = notifier.homeError;
      notifier.homeError = "";
      ElegantNotification.error(
        width: MediaQuery.of(context).size.width * 0.9,
        position: Alignment.topCenter,
        animation: AnimationType.fromTop,
        title:
            const Text("Gagal", style: TextStyle(fontWeight: FontWeight.bold)),
        description: Text(msg),
        showProgressIndicator: false,
      ).show(context);
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}
}
