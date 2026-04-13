import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/dialog_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/widget/error_app_widget.dart';
import 'package:ibm_presensi_app/core/widget/loading_app_widget.dart';
import 'package:provider/provider.dart';

abstract class AppWidget<T extends AppProvider, P1, P2>
    extends StatelessWidget {
  AppWidget({super.key, this.param1, this.param2});

  final P1? param1;
  final P2? param2;

  // Menggunakan getter agar tidak perlu late variable yang rawan error
  late T notifier;

  @override
  Widget build(BuildContext context) {
    // 1. Ambil instance dari GetIt
    final instance = sl<T>(param1: param1, param2: param2);

    return ChangeNotifierProvider<T>.value(
      value: instance,
      child: Consumer<T>(
        builder: (context, value, child) {
          notifier = value;

          // 2. Lifecycle Handler (Post Frame)
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted && !notifier.isDispose) {
              // --- HANDLER NOTIFIKASI PILL/SNACKBAR ---
              if (notifier.snackbarMessage.isNotEmpty) {
                DialogHelper.showSnackbar(
                  context: context,
                  text: notifier.snackbarMessage,
                  backgroundColor: notifier.snackbarColor,
                );
                notifier.snackbarMessage = ''; // Reset prevent loop
              }

              // Jalankan logika tambahan setelah UI stabil
              checkVariableAfterUi(context);
            }
          });

          return _layout(context);
        },
      ),
    );
  }

  Widget _layout(BuildContext context) {
    // Jalankan pengecekan variabel sebelum UI dirender
    checkVariableBeforeUi(context);

    return Scaffold(
      appBar: appBarBuild(context),
      // Gunakan AnimatedSwitcher agar transisi Loading -> Body lebih halus (IBM Look)
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    // 1. Jika sedang loading berat (API)
    if (notifier.isLoading) {
      return const LoadingAppWidget();
    }

    // 2. Jika terjadi error
    if (notifier.errorMessage.isNotEmpty) {
      return ErrorAppWidget(
        description: notifier.errorMessage,
        onPressDefaultButton: () {
          notifier.errorMessage = '';
          notifier.init(); // Retry
        },
      );
    }

    // 3. Tampilkan Body Utama
    return bodyBuild(context);
  }

  // Hook functions yang bisa di-override di subclass
  void checkVariableBeforeUi(BuildContext context) {}
  void checkVariableAfterUi(BuildContext context) {}
  AppBar? appBarBuild(BuildContext context) => null;
  Widget bodyBuild(BuildContext context);
}
