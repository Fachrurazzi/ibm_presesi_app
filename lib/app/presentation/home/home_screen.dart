import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_screen.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_screen.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  HomeScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => notifier.init(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildHeader(context)),
              SliverToBoxAdapter(child: _buildPresenceCard(context)),
              SliverToBoxAdapter(child: _buildEmployeeInfoCards(context)),
              SliverToBoxAdapter(child: _buildHistoryHeader(context)),
              _buildHistoryList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final hour = DateTime.now().hour;
    String greeting = hour < 11
        ? 'Selamat Pagi'
        : hour < 15
            ? 'Selamat Siang'
            : hour < 18
                ? 'Selamat Sore'
                : 'Selamat Malam';

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            backgroundImage: notifier.photoUrl != null
                ? NetworkImage(notifier.photoUrl!)
                : null,
            child: notifier.photoUrl == null ? const Icon(Icons.person) : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(greeting,
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                Text(
                  notifier.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        notifier.positionName,
                        style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (notifier.schedule?.office != null)
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 12, color: Colors.grey),
                            const SizedBox(width: 2),
                            Expanded(
                              child: Text(
                                notifier.schedule!.office.name,
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
              onPressed: () => _showMenuBottomSheet(context),
              icon: const Icon(Icons.grid_view_rounded))
        ],
      ),
    );
  }

  Widget _buildPresenceCard(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withBlue(250)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8))
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildChip(DateTimeHelper.formatDateTime(
                  dateTime: DateTime.now(), format: 'EEE, dd MMM yyyy')),
              if (!notifier.isLeaves)
                _buildChip((notifier.schedule?.isWfa ?? false) ? "WFA" : "WFO"),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTimeItem(
                  "Masuk", notifier.attendanceToday?.startTime ?? '--:--'),
              Container(width: 1, height: 40, color: Colors.white24),
              _buildTimeItem(
                  "Keluar", notifier.attendanceToday?.endTime ?? '--:--'),
            ],
          ),
          const SizedBox(height: 24),
          notifier.isLeaves ? _buildLeaveInfo() : _buildActionButton(context),
        ],
      ),
    );
  }

  Widget _buildEmployeeInfoCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              _buildSmallInfoItem(context,
                  icon: Icons.beach_access_rounded,
                  label: "Cuti Tahunan",
                  value: "${notifier.leaveQuota} Hari",
                  color: Colors.orange,
                  onTap: () => _onPressLeave(context)),
              const SizedBox(width: 12),
              _buildSmallInfoItem(context,
                  icon: Icons.history_rounded,
                  label: "Sisa Cuti Lalu",
                  value: "${notifier.cashableLeave} Hari",
                  color: Colors.teal,
                  onTap: null),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildSmallInfoItem(context,
                  icon: Icons.calendar_month_rounded,
                  label: "Tanggal Bergabung",
                  value: notifier.joinDate.isNotEmpty
                      ? DateTimeHelper.formatDateTimeFromString(
                          dateTimeString: notifier.joinDate,
                          format: 'dd MMM yyyy')
                      : "-",
                  color: Colors.blue,
                  onTap: null),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallInfoItem(BuildContext context,
      {required IconData icon,
      required String label,
      required String value,
      required Color color,
      VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, size: 18, color: color),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey)),
                    Text(value,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Riwayat Bulan Ini",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          TextButton(
              onPressed: () => _onPressSeeAll(context),
              child: const Text("Lihat Semua")),
        ],
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context) {
    if (notifier.listAttendanceThisMonth.isEmpty) {
      return const SliverToBoxAdapter(
          child: Center(
              child: Padding(
                  padding: EdgeInsets.all(40), child: Text("Belum ada data"))));
    }
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = notifier.listAttendanceThisMonth[index];
            final moneyColor =
                (item.lunchMoney ?? 0) == 0 ? Colors.red : Colors.green;

            return Card(
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 12),
              color: Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest
                  .withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Container(
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    DateTimeHelper.formatDateTimeFromString(
                        dateTimeString: item.date!, format: 'dd\nMMM'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                title: Text("${item.startTime} - ${item.endTime}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Presensi Berhasil",
                        style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.fastfood_rounded,
                            size: 12, color: moneyColor),
                        const SizedBox(width: 4),
                        Text(
                          item.lunchMoneyLabel ?? "Rp 0",
                          style: TextStyle(
                              fontSize: 11,
                              color: moneyColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Icon(
                  (item.isLate ?? false)
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline_rounded,
                  color: (item.isLate ?? false) ? Colors.orange : Colors.green,
                ),
                onTap: () {},
              ),
            );
          },
          childCount: notifier.listAttendanceThisMonth.length,
        ),
      ),
    );
  }

  Widget _buildChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildTimeItem(String label, String time) {
    return Column(
      children: [
        Text(time,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        Text(label,
            style:
                TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () => _onPressCreateAttendance(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 0,
        ),
        child: const Text("Ambil Absensi",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildLeaveInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(14)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.beach_access_rounded, color: Colors.white),
          SizedBox(width: 8),
          Text("Anda sedang cuti hari ini",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void _showMenuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.event_available_rounded),
              title: const Text("Pengaturan Cuti"),
              onTap: () {
                Navigator.pop(context);
                _onPressLeave(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_active_outlined),
              title: const Text("Notifikasi"),
              onTap: () {
                Navigator.pop(context);
                _onPressEditNotification(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.red),
              title: const Text("Keluar", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _onPressLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onPressCreateAttendance(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => FaceRecognitionScreen()));
  void _onPressSeeAll(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => DetailAttendanceScreen()));
  void _onPressLeave(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => LeaveScreen()));
  void _onPressLogout(BuildContext context) async {
    await SharedPreferencesHelper.logout();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  }

  void _onPressEditNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.notifications_active, color: Colors.blue),
            SizedBox(width: 10),
            Text("Pengingat Presensi")
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ingatkan saya sebelum jam kerja:"),
            const SizedBox(height: 20),
            Center(
              child: DropdownMenu<int>(
                width: 200,
                initialSelection: notifier.timeNotification,
                dropdownMenuEntries: notifier.listEditNotification,
                onSelected: (int? value) async {
                  if (value != null) {
                    await notifier.saveNotificationSetting(value);
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "Berhasil! Pengingat diset $value menit sebelumnya."),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
  @override
  void checkVariableAfterUi(BuildContext context) {}
  @override
  void checkVariableBeforeUi(BuildContext context) {}
}
