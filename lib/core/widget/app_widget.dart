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
    return ChangeNotifierProvider<T>(
      create: (context) {
        // Inisialisasi Provider dari GetIt (sl)
        final instance = sl<T>(param1: param1, param2: param2);

        // Pindahkan callback UI ke sini agar hanya dieksekusi 1X saat layar dibuat
        WidgetsBinding.instance.addPostFrameCallback((_) {
          checkVariableAfterUi(context);
        });

        return instance;
      },
      builder: (context, child) => _build(context),
    );
  }

  Widget _build(BuildContext context) {
    notifier = Provider.of<T>(context);
    checkVariableBeforeUi(context);

    // Kita kembalikan pendengar UI ke sini agar mendeteksi saat user berhasil login
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (notifier.snackbarMessage.isNotEmpty) {
        DialogHelper.showSnackbar(
          context: context,
          text: notifier.snackbarMessage,
        );
        notifier.snackbarMessage = '';
      }

      // INI KUNCINYA: Akan mengeksekusi navigasi (push/pop) jika syaratnya terpenuhi
      checkVariableAfterUi(context);
    });

    return Scaffold(
      appBar: appBarBuild(context),
      body: (notifier.isLoading)
          ? const LoadingAppWidget()
          : (notifier.errorMessage.isNotEmpty)
              ? ErrorAppWidget(
                  description: notifier.errorMessage,
                  onPressDefaultButton: () {
                    notifier.errorMessage = '';
                    notifier.init();
                  },
                  alternatifButton: _alternatifErrorButton,
                )
              : bodyBuild(context),
    );
  }

  void checkVariableBeforeUi(BuildContext context) {}
  void checkVariableAfterUi(BuildContext context) {}
  AppBar? appBarBuild(BuildContext context) => null;
  Widget bodyBuild(BuildContext context);
}
