import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_screen.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/dialog_helper.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/helper/shared_preferences_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  HomeScreen({super.key}) : super(param1: null, param2: null);

  @override
  AppBar? appBarBuild(BuildContext context) {
    return null;
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.init(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerLayout(context),
              _todayLayout(context),
              _thisMonthLayout(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _headerLayout(BuildContext context) {
    final hour = DateTime.now().hour;
    String greeting = 'Selamat Pagi,';
    if (hour >= 11 && hour <= 14) {
      greeting = 'Selamat Siang,';
    } else if (hour > 14 && hour <= 18) {
      greeting = 'Selamat Sore,';
    } else if (hour > 18) {
      greeting = 'Selamat Malam,';
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5))
              ],
            ),
            child: CircleAvatar(
              backgroundColor:
                  GlobalHelper.getColorSchema(context).primaryContainer,
              radius: 35,
              backgroundImage: (notifier.photoUrl != null)
                  ? NetworkImage(notifier.photoUrl!)
                  : null,
              child: (notifier.photoUrl == null)
                  ? Icon(Icons.person,
                      size: 40,
                      color: GlobalHelper.getColorSchema(context).primary)
                  : null,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  notifier.name,
                  style: GlobalHelper.getTextStyle(
                    context: context,
                    appTextStyle: AppTextStyle.HEADLINE_SMALL,
                  )?.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                (notifier.isLeaves)
                    ? const SizedBox()
                    : Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Colors.redAccent),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              notifier.schedule?.office.name ?? "-",
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          // --- TOMBOL EDIT NOTIFIKASI ---
          IconButton(
            onPressed: () => _onPressEditNotification(context),
            icon: Icon(Icons.notifications_active,
                color: GlobalHelper.getColorSchema(context).primary),
            tooltip: 'Pengaturan Notifikasi',
          ),
          // --- TOMBOL LOGOUT ---
          IconButton(
            onPressed: () => _onPressLogout(context),
            icon: const Icon(Icons.logout, color: Colors.red),
            tooltip: 'Keluar',
          ),
        ],
      ),
    );
  }

  Container _todayLayout(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: GlobalHelper.getColorSchema(context).primary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: GlobalHelper.getColorSchema(context).onPrimary,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.today),
                    const SizedBox(width: 5),
                    Text(
                      DateTimeHelper.formatDateTime(
                        dateTime: DateTime.now(),
                        format: 'EEE, dd MMM yyyy',
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              (notifier.isLeaves)
                  ? const SizedBox()
                  : Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: GlobalHelper.getColorSchema(context).onPrimary,
                      ),
                      child: Text(
                          (notifier.schedule?.isWfa ?? false) ? "WFA" : 'WFO'),
                    ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _timeTodayLayout(context, "Masuk",
                  notifier.attendanceToday?.startTime ?? '--:--'),
              _timeTodayLayout(context, "Keluar",
                  notifier.attendanceToday?.endTime ?? '--:--'),
            ],
          ),
          const SizedBox(height: 20),
          (notifier.isLeaves)
              ? Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: GlobalHelper.getColorSchema(context)
                          .onPrimary
                          .withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.beach_access,
                        color: GlobalHelper.getColorSchema(context).onPrimary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Anda sedang dalam masa cuti',
                        style: GlobalHelper.getTextStyle(
                          context: context,
                          appTextStyle: AppTextStyle.LABEL_LARGE,
                        )?.copyWith(
                          color: GlobalHelper.getColorSchema(context).onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: double.maxFinite,
                  child: FilledButton(
                    onPressed: () => _onPressCreateAttendance(context),
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          GlobalHelper.getColorSchema(context).onPrimary,
                      foregroundColor:
                          GlobalHelper.getColorSchema(context).primary,
                    ),
                    child: const Text("Buat Kehadiran"),
                  ),
                ),
        ],
      ),
    );
  }

  Expanded _timeTodayLayout(BuildContext context, String label, String time) {
    return Expanded(
      child: Column(
        children: [
          Text(
            time,
            style: GlobalHelper.getTextStyle(
              context: context,
              appTextStyle: AppTextStyle.HEADLINE_MEDIUM,
            )?.copyWith(
              color: GlobalHelper.getColorSchema(context).onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: GlobalHelper.getTextStyle(
              context: context,
              appTextStyle: AppTextStyle.BODY_MEDIUM,
            )?.copyWith(color: GlobalHelper.getColorSchema(context).onPrimary),
          ),
        ],
      ),
    );
  }

  Container _thisMonthLayout(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - kToolbarHeight),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: GlobalHelper.getColorSchema(context).primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Presensi Sebulan Terakhir",
                  style: GlobalHelper.getTextStyle(
                    context: context,
                    appTextStyle: AppTextStyle.TITLE_LARGE,
                  ),
                ),
              ),
              FilledButton(
                  onPressed: () => _onPressSeeAll(context),
                  child: const Text("Lihat Semua")),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            height: 2,
            color: GlobalHelper.getColorSchema(context).primary,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Tgl',
                    style: GlobalHelper.getTextStyle(
                      context: context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Masuk',
                    style: GlobalHelper.getTextStyle(
                      context: context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Keluar',
                    style: GlobalHelper.getTextStyle(
                      context: context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Container(
            height: 2,
            color: GlobalHelper.getColorSchema(context).primary,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = notifier.listAttendanceThisMonth[index];
              return _itemThisMonth(context, item);
            },
            separatorBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              height: 1,
              color: GlobalHelper.getColorSchema(context).surface,
            ),
            itemCount: notifier.listAttendanceThisMonth.length,
          ),
        ],
      ),
    );
  }

  Container _itemThisMonth(BuildContext context, AttendanceEntity item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: GlobalHelper.getColorSchema(context).primary,
              ),
              child: Text(
                DateTimeHelper.formatDateTimeFromString(
                    dateTimeString: item.date!, format: 'dd\nMMM'),
                style: GlobalHelper.getTextStyle(
                  context: context,
                  appTextStyle: AppTextStyle.LABEL_LARGE,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                item.startTime,
                style: GlobalHelper.getTextStyle(
                  context: context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                item.endTime,
                style: GlobalHelper.getTextStyle(
                  context: context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- SEMUA LOGIKA TOMBOL & AKSI ---

  void _onPressCreateAttendance(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FaceRecognitionScreen()),
    );
  }

  _onPressEditNotification(BuildContext context) async {
    DialogHelper.showBottomDialog(
      context: context,
      title: "Pengingat Absen (Sebelum Shift)",
      content: DropdownMenu<int>(
        initialSelection: notifier.timeNotification,
        onSelected: (value) => _onSaveEditNotification(context, value!),
        dropdownMenuEntries: notifier.listEditNotification,
        width: MediaQuery.of(context).size.width -
            40, // Biar full width di bottom sheet
      ),
    );
  }

  _onSaveEditNotification(BuildContext context, int param) {
    Navigator.pop(context); // Tutup dialog
    notifier.saveNotificationSetting(param); // Panggil fungsi di notifier
  }

  _onPressLogout(BuildContext context) async {
    await SharedPreferencesHelper.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
      (route) => false,
    );
  }

  _onPressSeeAll(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailAttendanceScreen(),
        ));
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    // Fungsi ini bawaan AppWidget. Bisa dikosongkan jika tidak ada aksi setelah UI dirender.
  }
}
