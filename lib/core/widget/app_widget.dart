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
      create: (context) => sl<T>(param1: param1, param2: param2),
      child: Consumer<T>(
        // Menggunakan Consumer agar lebih reaktif dan rapi
        builder: (context, value, child) {
          notifier = value;

          // PINDAHKAN LOGIKA SIDE-EFFECT KE SINI
          WidgetsBinding.instance.addPostFrameCallback((_) {
            print(
                "DEBUG: Frame Selesai - Mengecek snackbar & navigasi..."); // CEK DISINI
            if (context.mounted) {
              // 1. Handle Snackbar
              if (notifier.snackbarMessage.isNotEmpty) {
                DialogHelper.showSnackbar(
                  context: context,
                  text: notifier.snackbarMessage,
                );
                notifier.snackbarMessage = '';
              }

              // 2. Handle Navigation & Redirect
              checkVariableAfterUi(context);
            }
          });

          return _layout(context);
        },
      ),
    );
  }

  Widget _layout(BuildContext context) {
    checkVariableBeforeUi(context);

    return Scaffold(
      appBar: appBarBuild(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (notifier.isLoading) {
      return const LoadingAppWidget();
    }

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

  // Method yang bisa di-override
  void checkVariableBeforeUi(BuildContext context) {}
  void checkVariableAfterUi(BuildContext context) {}
  AppBar? appBarBuild(BuildContext context) => null;
  Widget bodyBuild(BuildContext context);
}
