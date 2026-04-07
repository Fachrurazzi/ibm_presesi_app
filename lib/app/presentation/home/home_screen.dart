import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_screen.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/leave/leave_screen.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/app/presentation/profile/profile_screen.dart';
import 'package:ibm_presensi_app/core/constant/constant.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  HomeScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final homeProv = context.watch<HomeNotifier>();
    final theme = Theme.of(context);

    if (homeProv.isEmulator) {
      return Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phonelink_erase_rounded,
                      size: 100, color: Colors.red),
                  const SizedBox(height: 24),
                  const Text("AKSES DIBLOKIR",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: Colors.red)),
                  const SizedBox(height: 12),
                  const Text(
                      "Akun Anda ditangguhkan otomatis karena terdeteksi penggunaan Emulator atau Fake GPS.\n\nDemi keamanan data PT INTIBOGA MANDIRI, silakan gunakan smartphone asli untuk melakukan presensi.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54, fontSize: 14, height: 1.5)),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () => exit(0),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Text("TUTUP APLIKASI",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => homeProv.refreshData(),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: _buildHeader(context, homeProv)),
                  SliverToBoxAdapter(
                      child: _buildPresenceCard(context, homeProv)),
                  SliverToBoxAdapter(
                      child: _buildEmployeeInfoCards(context, homeProv)),
                  SliverToBoxAdapter(child: _buildHistoryHeader(context)),
                  _buildHistoryList(context, homeProv),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, HomeNotifier prov) {
    final hour = DateTime.now().hour;
    String greeting = hour < 11
        ? 'Selamat Pagi 🌤️'
        : hour < 15
            ? 'Selamat Siang ☀️'
            : hour < 18
                ? 'Selamat Sore 🌇'
                : 'Selamat Malam 🌙';

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _onPressProfile(context),
            child: (prov.photoUrl != null && prov.photoUrl!.isNotEmpty)
                ? CachedNetworkImage(
                    key: ValueKey(prov.photoUrl),
                    imageUrl: prov.photoUrl!,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      debugPrint("IMAGE_ERROR: Gagal muat URL -> $url");
                      return const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      );
                    },
                  )
                : const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(greeting,
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                Text(prov.name.isEmpty ? "Memuat..." : prov.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        letterSpacing: -0.5),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBadge(context, prov.positionName),
                    if (prov.schedule?.office != null) ...[
                      const SizedBox(width: 8),
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(Icons.location_on_rounded,
                            size: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                          child: Text(prov.schedule!.office.name,
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.grey))),
                    ],
                  ],
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
              onPressed: () => _showMenuBottomSheet(context),
              icon: const Icon(Icons.widgets_outlined))
        ],
      ),
    );
  }

  Widget _buildPresenceCard(BuildContext context, HomeNotifier prov) {
    final themeData = Theme.of(context);
    String locationLabel =
        (prov.schedule?.isWfa ?? false) ? "Dinas Luar" : "Kantor Area";
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(colors: [
          themeData.colorScheme.primary,
          themeData.colorScheme.primary.withOpacity(0.85)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
              color: themeData.colorScheme.primary.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10))
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildChip(DateTimeHelper.formatDateTime(
                  dateTime: DateTime.now(), format: 'EEEE, dd MMM')),
              _buildChip(locationLabel),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: _buildTimeItem(
                    "Masuk", prov.attendanceToday?.startTime ?? '--:--'),
              ),
              Container(width: 1, height: 40, color: Colors.white24),
              Flexible(
                child: _buildTimeItem(
                    "Keluar", prov.attendanceToday?.endTime ?? '--:--'),
              ),
            ],
          ),
          const SizedBox(height: 32),
          prov.isLeaves ? _buildLeaveInfo() : _buildActionButton(context, prov),
        ],
      ),
    );
  }

  Widget _buildEmployeeInfoCards(BuildContext context, HomeNotifier prov) {
    final currency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    final bool isWfa = prov.schedule?.isWfa ?? false;
    final bool isPusat =
        prov.schedule?.office.name.toLowerCase().contains("pusat") ?? false;

    // Logika: Jika di pusat tapi sedang WFA, maka dapat Uang Makan (Bukan Catering)
    final bool dapatCatering = isPusat && !isWfa;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              _buildSmallInfoItem(
                context,
                icon: dapatCatering
                    ? Icons.restaurant_rounded
                    : Icons.payments_rounded,
                label: dapatCatering ? "Fasilitas Makan" : "Uang Makan",
                value: dapatCatering
                    ? (prov.attendanceToday?.isLate ?? false
                        ? "Catering Hangus"
                        : "Catering Rantangan")
                    : currency.format(prov.totalLunchMoney),
                color: dapatCatering ? Colors.blue : Colors.green,
              ),
              const SizedBox(width: 12),
              _buildSmallInfoItem(
                context,
                icon: Icons.beach_access_rounded,
                label: "Sisa Cuti",
                value: "${prov.leaveQuota} Hari",
                color: Colors.orange,
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LeaveScreen())),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallInfoItem(BuildContext context,
      {required IconData icon,
      required String label,
      String? subLabel,
      required String value,
      required Color color,
      VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(12), // Kurangi padding sedikit
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade100)),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.1), shape: BoxShape.circle),
                  child: Icon(icon, size: 16, color: color)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                              color: Colors.black87)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context, HomeNotifier prov) {
    if (prov.listAttendanceThisMonth.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.event_busy_rounded,
                    size: 64,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.5)),
              ),
              const SizedBox(height: 20),
              const Text("Belum Ada Riwayat",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.black87)),
              const SizedBox(height: 8),
              const Text(
                  "Catatan presensi Anda bulan ini masih kosong.\nJangan lupa absen ya!",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.grey, fontSize: 13, height: 1.5)),
            ],
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = prov.listAttendanceThisMonth[index];
          final isLate = item.isLate ?? false;

          final String officeName =
              prov.schedule?.office.name.toLowerCase() ?? "";
          bool isDalamKota = officeName.contains("banjarmasin") ||
              officeName.contains("pusat");
          bool isDinasLuar = prov.schedule?.isWfa ?? false;

          // LOGIKA BARU DI RIWAYAT
          bool isDapatCatering = isDalamKota && !isDinasLuar;

          String lunchStatus = "";
          Color statusColor = Colors.green;

          if (isDapatCatering) {
            if (isLate) {
              lunchStatus = "Catering Hangus (Telat)";
              statusColor = Colors.red;
            } else {
              lunchStatus = "Catering Rantangan";
              statusColor = Colors.blue;
            }
          } else {
            lunchStatus = item.lunchMoneyLabel ?? "Rp 0";
            statusColor =
                (item.lunchMoney ?? 0) == 0 ? Colors.red : Colors.green;
          }

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
              border: Border.all(color: Colors.grey.shade100, width: 1),
            ),
            child: Row(children: [
              _buildDateBox(context, item.date!),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "${item.startTime ?? '--:--'} - ${item.endTime ?? '--:--'}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15)),
                    ),
                    const SizedBox(height: 6),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                                isDapatCatering
                                    ? Icons.restaurant_rounded
                                    : Icons.fastfood_rounded,
                                size: 10,
                                color: statusColor),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(lunchStatus,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: statusColor,
                                    fontWeight: FontWeight.bold)),
                          )
                        ])
                  ])),
              Column(
                children: [
                  Icon(isLate ? Icons.warning_rounded : Icons.verified_rounded,
                      color: isLate ? Colors.orange : Colors.green, size: 26),
                  if (isLate)
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text("Terlambat",
                          style: TextStyle(
                              fontSize: 9,
                              color: Colors.orange,
                              fontWeight: FontWeight.w900)),
                    )
                ],
              )
            ]),
          );
        }, childCount: prov.listAttendanceThisMonth.length),
      ),
    );
  }

  Widget _buildDateBox(BuildContext context, String date) => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade100)),
      child: Center(
          child: Text(
              DateTimeHelper.formatDateTimeFromString(
                  dateTimeString: date, format: 'dd\nMMM'),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary))));

  Widget _buildBadge(BuildContext context, String text) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      child: Text(text,
          style: TextStyle(
              fontSize: 10,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold)));

  Widget _buildChip(String text) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12)),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)));

  Widget _buildTimeItem(String label, String time) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 35, // Batasi tinggi agar tidak memakan tempat di HP pendek
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(time,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28, // Ukuran ideal
                      fontWeight: FontWeight.w900)),
            ),
          ),
          Text(label,
              style: const TextStyle(color: Colors.white70, fontSize: 11))
        ],
      );

  Widget _buildActionButton(BuildContext context, HomeNotifier prov) {
    bool isDone = prov.attendanceToday?.endTime != null &&
        prov.attendanceToday?.endTime != "--:--";
    return SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
            onPressed: isDone ? null : () => _onPressCreateAttendance(context),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).colorScheme.primary,
                disabledBackgroundColor: Colors.white30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0),
            child: Text(
                isDone
                    ? "Tugas Selesai! ✨"
                    : (prov.attendanceToday?.startTime == null
                        ? "Absen Masuk"
                        : "Absen Pulang"),
                style: const TextStyle(fontWeight: FontWeight.w900))));
  }

  Widget _buildLeaveInfo() => Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(20)),
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.beach_access_rounded, color: Colors.white),
        SizedBox(width: 8),
        Text("SEDANG MASA CUTI",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
      ]));

  Widget _buildHistoryHeader(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text("Riwayat Bulan Ini",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ),
        TextButton(
            onPressed: () => _onPressSeeAll(context),
            child: const Text("Lihat Semua"))
      ]));

  void _onPressProfile(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
  }

  void _onPressCreateAttendance(BuildContext context) {
    HapticFeedback.lightImpact(); // Getaran halus saat tombol ditekan
    Navigator.push(
            context, MaterialPageRoute(builder: (_) => FaceRecognitionScreen()))
        .then((_) => notifier.init());
  }

  void _onPressSeeAll(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => DetailAttendanceScreen()));

  void _onPressLeave(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => LeaveScreen()));

  void _onPressLogout(BuildContext context) async {
    await SharedPreferencesHelper.logout();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
    }
  }

  void _showMenuBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
        builder: (context) => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              _buildMenuTile(context, Icons.person_outline, "Profil Saya",
                  () => _onPressProfile(context)),
              _buildMenuTile(context, Icons.beach_access_outlined,
                  "Pengajuan Cuti", () => _onPressLeave(context)),
              _buildMenuTile(context, Icons.notifications_active_outlined,
                  "Pengingat Absen", () => _onPressEditNotification(context)),
              const Divider(height: 32),
              _buildMenuTile(context, Icons.logout, "Keluar",
                  () => _onPressLogout(context),
                  isDestructive: true)
            ])));
  }

  void _onPressEditNotification(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Row(children: [
              Icon(Icons.notifications_active, color: Colors.blue),
              SizedBox(width: 10),
              Text("Pengingat Presensi", style: TextStyle(fontSize: 16))
            ]),
            content: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Ingatkan saya sebelum jam kerja dimulai:",
                          style: TextStyle(fontSize: 13)),
                      const SizedBox(height: 20),
                      Center(
                          child: DropdownMenu<int>(
                              width: MediaQuery.of(context).size.width * 0.6,
                              initialSelection: notifier.timeNotification,
                              dropdownMenuEntries:
                                  notifier.listEditNotification,
                              onSelected: (int? value) async {
                                if (value != null) {
                                  await notifier.saveNotificationSetting(value);
                                  if (context.mounted) Navigator.pop(context);
                                }
                              }))
                    ]))));
  }

  Widget _buildMenuTile(
      BuildContext context, IconData icon, String title, VoidCallback onTap,
      {bool isDestructive = false}) {
    return ListTile(
        leading: Icon(icon, color: isDestructive ? Colors.red : Colors.black87),
        title: Text(title,
            style: TextStyle(
                color: isDestructive ? Colors.red : Colors.black87,
                fontWeight: FontWeight.w600)),
        onTap: () {
          Navigator.pop(context);
          onTap();
        });
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}
