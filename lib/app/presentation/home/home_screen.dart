import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:ibm_presensi_app/app/presentation/home/home_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/login/login_screen.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_screen.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            _headerLayout(context),
            _todayLayout(context),
            _thisMonthLayout(context),
          ],
        ),
      ),
    );
  }

  Container _headerLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                GlobalHelper.getColorSchema(context).primaryContainer,
            radius: 30,
            child: const Icon(Icons.person, size: 40),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notifier.name,
                  style: GlobalHelper.getTextStyle(
                    context: context,
                    appTextStyle: AppTextStyle.HEADLINE_SMALL,
                  )?.copyWith(fontWeight: FontWeight.bold),
                  overflow:
                      TextOverflow.ellipsis, // Tambahkan ini juga buat Nama
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.location_city, size: 18),
                          const SizedBox(width: 5),
                          // PERBAIKAN DI SINI: Bungkus Text dengan Expanded
                          Expanded(
                            child: Text(
                              notifier.schedule?.office.name ?? "-",
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow
                                  .ellipsis, // Munculkan "..." jika kepanjangan
                              maxLines: 1, // Paksa satu baris saja
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10), // Beri jarak antar kolom
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.access_time, size: 18),
                          const SizedBox(width: 5),
                          // PERBAIKAN DI SINI: Bungkus Text dengan Expanded
                          Expanded(
                            child: Text(
                              notifier.schedule?.shift.name ?? "-",
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
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
          const SizedBox(width: 10),
          IconButton(
              onPressed: () => _onPressLogout(context),
              icon: const Icon(Icons.logout)),
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
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: GlobalHelper.getColorSchema(context).onPrimary,
                ),
                child:
                    Text((notifier.schedule?.isWfa ?? false) ? "WFA" : 'WFO'),
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
          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: () => _onPressCreateAttendance(context),
              style: FilledButton.styleFrom(
                backgroundColor: GlobalHelper.getColorSchema(context).onPrimary,
                foregroundColor: GlobalHelper.getColorSchema(context).primary,
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

  void _onPressCreateAttendance(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    );

    notifier.init();
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
    // TODO: implement checkVariableAfterUi
  }

  // @override
  // void checkVariableBeforeUi(BuildContext context) {
  //   if (!notifier.isPhysicDevice) {
  //     alternatifErrorButton =
  //         FilledButton(onPressed: () => {exit(0)}, child: const Text('Tutup'));
  //   } else {
  //     alternatifErrorButton = null;
  //   }
  // }
}
