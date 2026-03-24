import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_screen.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class FaceRecognitionScreen
    extends AppWidget<FaceRecognitionNotifier, void, void> {
  FaceRecognitionScreen({super.key});

  @override
  void checkVariableAfterUi(BuildContext context) {
    // Navigasi otomatis jika wajah cocok >= 70% atau pendaftaran sukses (100%)
    if (notifier.percentMatch >= 70) {
      // Menggunakan PostFrameCallback agar tidak error "navigating while building"
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MapScreen(),
          ),
        );
      });
    }
  }

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: const Text("Validasi Wajah"),
      centerTitle: true,
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- 1. Bagian Bingkai & Gambar Wajah ---
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: GlobalHelper.getColorSchema(context).primary,
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 10))
                  ],
                ),
                child: ClipOval(
                  child: (notifier.isLoading && notifier.currentImage == null)
                      ? const Center(child: CircularProgressIndicator())
                      : (notifier.currentImage != null)
                          ? SizedBox(
                              height: 180,
                              width: 180,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: notifier.currentImage!,
                              ),
                            )
                          : (notifier.basePhotoWidget != null)
                              ? SizedBox(
                                  height: 180,
                                  width: 180,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: notifier.basePhotoWidget!,
                                  ),
                                )
                              : const Icon(
                                  Icons.face_retouching_natural,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                ),
              ),
              const SizedBox(height: 40),

              // --- 2. Bagian Teks Status Dinamis ---
              _buildStatusText(context),

              const SizedBox(height: 40),

              // --- 3. Bagian Tombol Aksi ---
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton.icon(
                  onPressed:
                      notifier.isLoading ? null : () => _onPressOpenCamera(),
                  icon: notifier.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.camera_alt),
                  label: Text(
                    // Ubah teks tombol sesuai mode
                    notifier.isLoading
                        ? 'Memproses...'
                        : (notifier.isRegistrationMode
                            ? 'Daftarkan Wajah'
                            : 'Buka Kamera'),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper function untuk merapikan logika teks
  Widget _buildStatusText(BuildContext context) {
    if (notifier.isLoading && notifier.currentImage == null) {
      return Text(
        'Menyiapkan data wajah...',
        style: GlobalHelper.getTextStyle(
            context: context, appTextStyle: AppTextStyle.TITLE_MEDIUM),
      );
    }

    if (notifier.currentImage == null) {
      // Pesan khusus jika dalam mode pendaftaran
      return Text(
        notifier.isRegistrationMode
            ? 'Anda belum memiliki foto!\nSilakan ambil foto untuk didaftarkan.'
            : 'Silakan hadapkan wajah ke kamera',
        style: GlobalHelper.getTextStyle(
                context: context, appTextStyle: AppTextStyle.TITLE_MEDIUM)
            ?.copyWith(
          color: notifier.isRegistrationMode ? Colors.orange.shade800 : null,
          fontWeight: notifier.isRegistrationMode ? FontWeight.bold : null,
        ),
        textAlign: TextAlign.center,
      );
    }

    if (notifier.percentMatch < 0.0) {
      return Text(
        notifier.isRegistrationMode
            ? 'Gagal menyimpan wajah ke server.'
            : 'Akses Ditolak!\nWajah tidak cocok dengan pemilik akun.',
        style: GlobalHelper.getTextStyle(
                context: context, appTextStyle: AppTextStyle.TITLE_MEDIUM)
            ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );
    }

    return Text(
      notifier.isRegistrationMode
          ? 'Pendaftaran Berhasil!'
          : 'Tingkat Kemiripan: ${notifier.percentMatch.toStringAsFixed(1)}%',
      style: GlobalHelper.getTextStyle(
              context: context, appTextStyle: AppTextStyle.HEADLINE_SMALL)
          ?.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  void _onPressOpenCamera() {
    notifier.getCurrentPhoto();
  }
}
