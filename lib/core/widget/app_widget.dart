import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/dialog_helper.dart';
import 'package:ibm_presensi_app/core/provider/app_provider.dart';
import 'package:ibm_presensi_app/core/widget/error_app_widget.dart';
import 'package:ibm_presensi_app/core/widget/loading_app_widget.dart';
import 'package:provider/provider.dart';

/// [AppWidget] adalah Base Class untuk semua Screen di aplikasi.
/// T: Tipe Notifier (Provider) yang digunakan.
/// P1 & P2: Parameter opsional untuk inisialisasi Notifier lewat GetIt.
// ignore: must_be_immutable
abstract class AppWidget<T extends AppProvider, P1, P2>
    extends StatelessWidget {
  AppWidget({super.key, this.param1, this.param2});

  late T notifier;
  final P1? param1;
  final P2? param2;
  FilledButton? _alternatifErrorButton;

  /// Digunakan jika ingin mengganti tombol retry default di ErrorAppWidget
  set alternatifErrorButton(FilledButton? param) =>
      _alternatifErrorButton = param;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      // Mengambil instance Notifier dari Service Locator (GetIt)
      create: (context) => sl<T>(param1: param1, param2: param2)..init(),
      child: Consumer<T>(
        builder: (context, value, child) {
          notifier = value;

          // LOGIKA SIDE-EFFECT (Snackbar & Navigasi)
          // Dieksekusi SETELAH build frame selesai untuk menghindari crash.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted && !notifier.isDispose) {
              // 1. Menampilkan Snackbar jika ada pesan dari Notifier
              if (notifier.snackbarMessage.isNotEmpty) {
                DialogHelper.showSnackbar(
                  context: context,
                  text: notifier.snackbarMessage,
                );
                // Reset pesan agar tidak muncul berulang kali saat rebuild
                notifier.snackbarMessage = '';
              }

              // 2. Cek variabel untuk navigasi (misal: redirect ke Home setelah sukses)
              checkVariableAfterUi(context);
            }
          });

          return _layout(context);
        },
      ),
    );
  }

  /// Layout dasar menggunakan Scaffold
  Widget _layout(BuildContext context) {
    // Dipanggil sebelum UI dirender (opsional)
    checkVariableBeforeUi(context);

    return Scaffold(
      appBar: appBarBuild(context),
      body: _buildBody(context),
    );
  }

  /// Logika Switcher antara Loading, Error, dan Content Asli
  Widget _buildBody(BuildContext context) {
    // 1. Tampilan Loading (Global)
    if (notifier.isLoading) {
      return const LoadingAppWidget();
    }

    // 2. Tampilan Error (Global)
    if (notifier.errorMessage.isNotEmpty) {
      return ErrorAppWidget(
        description: notifier.errorMessage,
        onPressDefaultButton: () {
          // Reset error dan panggil init ulang (Retry)
          notifier.errorMessage = '';
          notifier.init();
        },
        alternatifButton: _alternatifErrorButton,
      );
    }

    // 3. Tampilan Konten Asli (Didefinisikan di Screen masing-masing)
    return bodyBuild(context);
  }

  // --- METHODS UNTUK DI-OVERRIDE DI SUB-CLASS ---

  /// Digunakan untuk logika sebelum UI muncul (Jarang digunakan)
  void checkVariableBeforeUi(BuildContext context) {}

  /// SANGAT PENTING: Digunakan untuk Navigasi/Redirect setelah API sukses
  void checkVariableAfterUi(BuildContext context) {}

  /// Override jika halaman membutuhkan AppBar
  AppBar? appBarBuild(BuildContext context) => null;

  /// WAJIB di-override: Isi konten utama dari halaman
  Widget bodyBuild(BuildContext context);
}
