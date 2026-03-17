import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:ibm_presensi_app/core/helper/date_time_helper.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class DetailAttendanceScreen
    extends AppWidget<DetailAttendanceNotifier, void, void> {
  DetailAttendanceScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text('Detail Presensi'),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownMenu<int>(
                  expandedInsets: const EdgeInsets.symmetric(horizontal: 1),
                  label: const Text('Bulan'),
                  dropdownMenuEntries: notifier.monthListDropdown,
                  initialSelection: 1,
                  controller: notifier.monthController,
                ),
              ),
              Expanded(
                child: DropdownMenu<int>(
                  expandedInsets: const EdgeInsets.symmetric(horizontal: 1),
                  label: const Text('Tahun'),
                  dropdownMenuEntries: notifier.yearListDropdown,
                  initialSelection: 2026,
                  controller: notifier.yearController,
                ),
              ),
              IconButton(
                  onPressed: () => _onPressSearch(),
                  icon: const Icon(Icons.search))
            ],
          ),
          const SizedBox(
            height: 20,
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
              final item = notifier.listAttendance[index];
              return _itemThisMonth(context, item);
            },
            separatorBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              height: 1,
              color: GlobalHelper.getColorSchema(context).surface,
            ),
            itemCount: notifier.listAttendance.length,
          ),
        ],
      ),
    ));
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

  _onPressSearch() {
    notifier.search();
  }
}
