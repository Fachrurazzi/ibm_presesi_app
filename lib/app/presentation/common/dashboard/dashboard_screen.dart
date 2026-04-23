import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/module/entity/dashboard.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/check_in_out/check_in_out_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/history/history_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/dashboard/dashboard_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/common/leave/list/leave_list_screen.dart';
import 'package:ibm_presensi_app/app/presentation/common/profile/profile_screen.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class DashboardScreen extends AppWidget<DashboardNotifier, void, void> {
  DashboardScreen({super.key}) : super(param1: null, param2: null);

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.errorMessage.isNotEmpty) {
      GlobalHelper.showErrorNotification(
        context: context,
        title: "Gagal Memuat",
        message: notifier.errorMessage,
      );
      notifier.clearError();
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => notifier.refreshAll(),
            color: theme.colorScheme.primary,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverToBoxAdapter(child: _buildHeader(context)),
                SliverToBoxAdapter(child: _buildPresenceCard(context)),
                SliverToBoxAdapter(child: _buildStatsSection(context)),
                SliverToBoxAdapter(
                    child: _buildRecentActivitiesHeader(context)),
                _buildRecentActivitiesList(context),
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ========== HEADER ==========
  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 16, 10),
      child: Row(
        children: [
          Hero(
            tag: 'avatar_dashboard_to_profile',
            child: GestureDetector(
              onTap: () => _onPressProfile(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: notifier.isLoading
                    ? _buildShimmerCircle(52)
                    : _buildAvatar(),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: notifier.isLoading
                ? _buildShimmerHeader()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateTimeHelper.greeting(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        notifier.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          letterSpacing: -0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        notifier.userPosition,
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
          ),
          IconButton(
            onPressed: () => _showMenuBottomSheet(context),
            icon: Icon(
              Icons.settings_suggest_rounded,
              color: Colors.grey.shade700,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    if (notifier.userAvatar != null && notifier.userAvatar!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: notifier.userAvatar!,
        width: 52,
        height: 52,
        fit: BoxFit.cover,
        placeholder: (context, url) => _buildAvatarPlaceholder(),
        errorWidget: (context, url, error) => _buildAvatarError(),
      );
    }
    return _buildAvatarError();
  }

  // ========== PRESENCE CARD ==========
  Widget _buildPresenceCard(BuildContext context) {
    final theme = Theme.of(context);

    if (notifier.isLoading) return _buildShimmerCard();

    final startTime = notifier.isOnLeave
        ? "CUTI"
        : (notifier.attendanceToday?.displayStartTime ?? '--:--');
    final endTime = notifier.isOnLeave
        ? "CUTI"
        : (notifier.attendanceToday?.displayEndTime ?? '--:--');
    final isDone = notifier.isCheckedOut;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withBlue(220),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: _buildChip(
                  DateFormat('EEEE, dd MMM', 'id_ID').format(DateTime.now()),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(child: _buildChip(notifier.officeName)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _buildTimeItem("Clock In", startTime)),
              Container(width: 1, height: 35, color: Colors.white24),
              Expanded(child: _buildTimeItem("Clock Out", endTime)),
            ],
          ),
          const SizedBox(height: 16),
          if (notifier.todaySchedule != null)
            Text(
              "Shift: ${notifier.shiftTime} ${notifier.isWfa ? '(WFA)' : ''}",
              style: const TextStyle(color: Colors.white70, fontSize: 10),
            ),
          const SizedBox(height: 16),
          _buildPresenceButton(context, isDone),
        ],
      ),
    );
  }

  // ========== STATS SECTION ==========
  Widget _buildStatsSection(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ringkasan Bulan Ini",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.8,
            children: [
              _buildStatsCard(
                context,
                title: "Hadir",
                value: "${notifier.stats?.stats.hadirBulanIni ?? 0} Hari",
                icon: Icons.calendar_today_rounded,
                color: Colors.green,
              ),
              _buildStatsCard(
                context,
                title: "Sisa Cuti",
                value: "${notifier.remainingLeave} Hari",
                icon: Icons.beach_access_rounded,
                color: Colors.orange,
                onTap: () => _onPressLeave(context),
              ),
              _buildStatsCard(
                context,
                title: "Durasi Kerja",
                value: notifier.workingDuration,
                icon: Icons.timer_outlined,
                color: Colors.blue,
              ),
              _buildStatsCard(
                context,
                title: "Terlambat",
                value: "${notifier.stats?.stats.terlambatBulanIni ?? 0}x",
                icon: Icons.warning_amber_rounded,
                color: Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    if (notifier.isLoading) return _buildShimmerBox();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade50),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========== RECENT ACTIVITIES ==========
  Widget _buildRecentActivitiesHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Aktivitas Terbaru",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
          GestureDetector(
            onTap: () => _onPressSeeAll(context),
            child: Text(
              "Lihat Semua",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivitiesList(BuildContext context) {
    if (notifier.isLoading) {
      return SliverToBoxAdapter(child: _buildShimmerHistory());
    }

    if (notifier.recentActivities.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            "Belum ada aktivitas",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    final displayActivities = notifier.recentActivities.take(5).toList();

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final activity = displayActivities[index];
            return _buildActivityItem(context, activity);
          },
          childCount: displayActivities.length,
        ),
      ),
    );
  }

  Widget _buildActivityItem(BuildContext context, RecentActivity activity) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: activity.statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              activity.typeIcon,
              color: activity.statusColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('dd MMM yyyy, HH:mm', 'id_ID').format(
                    DateTime.parse(activity.date),
                  ),
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: activity.statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              activity.status == 'on_time' ? 'Tepat' : activity.status,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: activity.statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ========== PRESENCE BUTTON ==========
  Widget _buildPresenceButton(BuildContext context, bool isDone) {
    if (notifier.isOnLeave) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.beach_access_rounded, color: Colors.orange, size: 20),
            SizedBox(width: 10),
            Text(
              "SEDANG CUTI",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    if (notifier.isBanned) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.block_rounded, color: Colors.red, size: 20),
            SizedBox(width: 10),
            Text(
              "AKUN DITANGGUHKAN",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    final buttonText = isDone
        ? "ABSENSI SELESAI"
        : (notifier.isCheckedIn ? "CHECK-OUT" : "CHECK-IN");

    return Material(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: isDone ? null : () => _onPressPresence(context),
        borderRadius: BorderRadius.circular(18),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isDone
                    ? Icons.verified_user_rounded
                    : Icons.fingerprint_rounded,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 10),
              Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ========== MENU BOTTOM SHEET ==========
  void _showMenuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) => Container(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading:
                  const Icon(Icons.person_outline_rounded, color: Colors.blue),
              title: const Text(
                "Profil Saya",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              onTap: () {
                Navigator.pop(context);
                _onPressProfile(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.power_settings_new_rounded,
                  color: Colors.red),
              title: const Text(
                "Keluar",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                notifier.logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // ========== SHIMMER WIDGETS ==========
  Widget _buildShimmerCircle(double size) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      );

  Widget _buildShimmerHeader() => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 80, height: 10, color: Colors.white),
            const SizedBox(height: 6),
            Container(width: 150, height: 18, color: Colors.white),
          ],
        ),
      );

  Widget _buildShimmerCard() => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
        ),
      );

  Widget _buildShimmerBox() => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

  Widget _buildShimmerHistory() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      );

  // ========== HELPER WIDGETS ==========
  Widget _buildChip(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            fontWeight: FontWeight.w800,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  Widget _buildTimeItem(String label, String time) => Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 10),
          ),
        ],
      );

  Widget _buildAvatarPlaceholder() => Container(
        width: 54,
        height: 54,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );

  Widget _buildAvatarError() => const CircleAvatar(
        radius: 27,
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.person_rounded, color: Colors.white, size: 30),
      );

  // ========== NAVIGATION ==========
  void _onPressPresence(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CheckInOutScreen()),
    );
  }

  void _onPressProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProfileScreen()),
    );
  }

  void _onPressLeave(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => LeaveListScreen()),
    );
  }

  void _onPressSeeAll(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HistoryScreen()),
    );
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}
