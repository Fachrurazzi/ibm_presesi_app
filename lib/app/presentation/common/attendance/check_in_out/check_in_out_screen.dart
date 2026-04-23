import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/module/entity/attendance.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/check_in_out/check_in_out_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class CheckInOutScreen extends AppWidget<CheckInOutNotifier, void, void> {
  CheckInOutScreen({super.key}) : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<CheckInOutNotifier>();
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Presensi",
            style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: prov.isLoadingData
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildInfoCard(context, prov, theme),
                  const SizedBox(height: 24),
                  _buildAttendanceCard(context, prov, theme),
                  const SizedBox(height: 24),
                  _buildActionButton(context, prov, theme),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoCard(
      BuildContext context, CheckInOutNotifier prov, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.business_rounded,
                    color: theme.colorScheme.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Lokasi",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(prov.officeName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.schedule_rounded, color: Colors.orange),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Shift",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(prov.shiftTime,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    if (prov.schedule?.isWfa == true)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("WFA",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceCard(
      BuildContext context, CheckInOutNotifier prov, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withBlue(220)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
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
          const Text("Status Hari Ini",
              style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeBox("Check In",
                  prov.attendanceToday?.displayStartTime ?? "--:--"),
              Container(width: 1, height: 50, color: Colors.white24),
              _buildTimeBox(
                  "Check Out", prov.attendanceToday?.displayEndTime ?? "--:--"),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              prov.isCheckedOut
                  ? "Absensi Selesai ✅"
                  : (prov.isCheckedIn ? "Sedang Bekerja" : "Belum Absen"),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBox(String label, String time) {
    return Column(
      children: [
        Text(time,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context, CheckInOutNotifier prov, ThemeData theme) {
    final isDisabled = prov.isOnLeave || prov.isBanned || prov.isCheckedOut;

    Color buttonColor = theme.colorScheme.primary;
    if (prov.isOnLeave) buttonColor = Colors.orange;
    if (prov.isBanned) buttonColor = Colors.red;
    if (prov.isCheckedOut) buttonColor = Colors.green;

    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [buttonColor, buttonColor.withBlue(220)],
        ),
        boxShadow: [
          BoxShadow(
            color: buttonColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isDisabled || prov.isLoading
            ? null
            : () => _onPressAction(context, prov),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        child: prov.isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2))
            : Text(
                prov.buttonText,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Colors.white),
              ),
      ),
    );
  }

  void _onPressAction(BuildContext context, CheckInOutNotifier prov) {
    // Navigate to Face Recognition first, then Map
    Navigator.pushNamed(context, '/face-recognition',
        arguments: {'nextRoute': '/map'});
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.actionMessage.isNotEmpty) {
      final msg = notifier.actionMessage;
      final isError = msg.toLowerCase().contains("gagal") ||
          msg.toLowerCase().contains("tidak");
      notifier.clearError();

      if (isError) {
        GlobalHelper.showErrorNotification(
            context: context, title: "Gagal", message: msg);
      } else {
        GlobalHelper.showSuccessNotification(
            context: context, title: "Berhasil", message: msg);
      }
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}
