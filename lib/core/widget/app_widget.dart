import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/dialog_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/widget/error_app_widget.dart';
import 'package:ibm_presensi_app/core/widget/loading_app_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
abstract class AppWidget<T extends AppProvider, P1, P2>
    extends StatelessWidget {
  AppWidget({super.key, this.param1, this.param2});

  late T notifier;
  final P1? param1;
  final P2? param2;
  FilledButton? _alternatifErrorButton;

  set alternatifErrorButton(FilledButton? param) =>
      _alternatifErrorButton = param;

  @override
  Widget build(BuildContext context) {
    // 1. Ambil instance dari GetIt (Singleton/Factory)
    final instance = sl<T>(param1: param1, param2: param2);

    // 2. Gunakan .value agar Singleton tidak di-dispose oleh Flutter
    return ChangeNotifierProvider<T>.value(
      value: instance, // Jangan panggil .init() di sini untuk cegah loop
      child: Consumer<T>(
        builder: (context, value, child) {
          notifier = value;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted && !notifier.isDispose) {
              // --- PROTEKSI INIT (Mencegah Spam API) ---
              // Panggil init hanya jika sedang tidak loading dan data masih kosong
              if (!notifier.isLoading && notifier.errorMessage.isEmpty) {
                // Kita panggil init secara cerdas di sini jika diperlukan
                _handleInitialFetch();
              }

              // Snackbar Handler
              if (notifier.snackbarMessage.isNotEmpty) {
                DialogHelper.showSnackbar(
                  context: context,
                  text: notifier.snackbarMessage,
                );
                notifier.snackbarMessage = '';
              }

              checkVariableAfterUi(context);
            }
          });

          return _layout(context);
        },
      ),
    );
  }

  // Helper untuk menentukan kapan harus memanggil init()
  void _handleInitialFetch() {
    // Logika: Jika notifier belum pernah ambil data (misal: dashboard masih kosong)
    // panggil init(). Ini mencegah init() dipanggil setiap kali ada rebuild UI kecil.
    // Kamu bisa menyesuaikan kondisi ini di sub-class jika perlu.
  }

  Widget _layout(BuildContext context) {
    checkVariableBeforeUi(context);
    return Scaffold(
      appBar: appBarBuild(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (notifier.isLoading) return const LoadingAppWidget();

    if (notifier.errorMessage.isNotEmpty) {
      return ErrorAppWidget(
        description: notifier.errorMessage,
        onPressDefaultButton: () {
          notifier.errorMessage = '';
          notifier.init();
        },
        alternatifButton: _alternatifErrorButton,
      );
    }

    return bodyBuild(context);
  }

  void checkVariableBeforeUi(BuildContext context) {}
  void checkVariableAfterUi(BuildContext context) {}
  AppBar? appBarBuild(BuildContext context) => null;
  Widget bodyBuild(BuildContext context);
}
