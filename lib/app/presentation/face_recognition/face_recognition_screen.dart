import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_screen.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class FaceRecognitionScreen
    extends AppWidget<FaceRecognitionNotifier, void, void> {
  FaceRecognitionScreen({super.key}) : super(param1: null, param2: null);

  @override
  void checkVariableAfterUi(BuildContext context) {
    final double safeAreaTop = MediaQuery.of(context).padding.top;
    final double screenWidth = MediaQuery.of(context).size.width;
    final prov = context.read<FaceRecognitionNotifier>();

    // 1. HANDLER NOTIFIKASI BIOMETRIK (DEBOUNCED)
    // Filter pesan agar tidak spamming notifikasi untuk instruksi dasar
    if (prov.biometricMessage.isNotEmpty &&
        prov.biometricMessage != "Posisikan wajah Anda" &&
        prov.biometricMessage != "Tahan, jangan bergerak..." &&
        prov.biometricMessage != "Siap...") {
      final msg = prov.biometricMessage;
      final isError = prov.isErrorMessage;
      prov.biometricMessage = ""; // Reset segera

      HapticFeedback.lightImpact();
      _showPill(context, msg, isError, screenWidth, safeAreaTop);
    }

    // 2. LOGIKA NAVIGASI DENGAN JEDA FOTO (2 DETIK)
    if (prov.percentMatch >= 80) {
      HapticFeedback.heavyImpact();
      prov.stopCameraManual(); // Matikan kamera agar hardware istirahat

      // Berikan jeda agar user bisa melihat pratinjau wajah sukses di Overlay
      Future.delayed(const Duration(milliseconds: 2000), () {
        if (context.mounted) {
          if (prov.isRegistrationMode) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-navbar', (route) => false);
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => MapScreen()));
          }
          prov.resetState();
        }
      });
    }
  }

  void _showPill(BuildContext context, String msg, bool isError, double width,
      double margin) {
    bool isInstruction = msg.toLowerCase().contains("dekatkan") ||
        msg.toLowerCase().contains("mohon");

    ElegantNotification(
      width: width * 0.9,
      notificationMargin: margin + 10,
      position: Alignment.topCenter,
      animation: AnimationType.fromTop,
      background: (isError || isInstruction)
          ? Colors.red.shade50
          : Colors.green.shade50,
      title: Text(
        (isError || isInstruction) ? "Instruksi" : "Berhasil",
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
      ),
      description: Text(
        msg,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
      icon: Icon(
        (isError || isInstruction)
            ? Icons.warning_amber_rounded
            : Icons.check_circle_rounded,
        color: (isError || isInstruction) ? Colors.red : Colors.green,
      ),
      showProgressIndicator: false,
      borderRadius: BorderRadius.circular(20), // Konsisten dengan gaya IBM 20px
      displayCloseButton: false,
    ).show(context);
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final notifier = context.watch<FaceRecognitionNotifier>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. FULL CAMERA PREVIEW
          _buildFullScreenCamera(size, notifier),

          // 2. SCANNING MASK (Lubang Oval)
          _buildCameraOverlay(context),

          // 3. UI LAYER
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTopHeader(context, notifier),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    children: [
                      _buildLiveStatus(notifier),
                      const SizedBox(height: 30),
                      _buildBottomAction(notifier),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 4. SUCCESS OVERLAY
          if (notifier.capturedFaceBytes != null && notifier.percentMatch >= 80)
            _buildSuccessOverlay(context, notifier),
        ],
      ),
    );
  }

  Widget _buildSuccessOverlay(
      BuildContext context, FaceRecognitionNotifier notifier) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 260,
                    height: 360,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(130),
                      border: Border.all(color: Colors.greenAccent, width: 8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.greenAccent.withOpacity(0.5),
                            blurRadius: 40)
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(122),
                      child: Image.memory(notifier.capturedFaceBytes!,
                          fit: BoxFit.cover),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    child: Icon(Icons.check_circle_rounded,
                        color: Colors.greenAccent, size: 90),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text("VERIFIKASI BERHASIL",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      letterSpacing: 2)),
              const SizedBox(height: 10),
              Text(
                  notifier.isRegistrationMode
                      ? "Pendaftaran wajah sukses, mengalihkan..."
                      : "Mohon tunggu, mengalihkan ke peta...",
                  style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullScreenCamera(Size size, FaceRecognitionNotifier notifier) {
    if (notifier.cameraController == null ||
        !notifier.cameraController!.value.isInitialized) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.white));
    }
    var camera = notifier.cameraController!.value;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
      scale: scale,
      child: Center(child: CameraPreview(notifier.cameraController!)),
    );
  }

  Widget _buildCameraOverlay(BuildContext context) {
    return ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.srcOut),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.black, backgroundBlendMode: BlendMode.dstOut)),
          Center(
            child: Container(
              width: 260,
              height: 360,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(130)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader(
      BuildContext context, FaceRecognitionNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close_rounded,
                    color: Colors.white, size: 30),
                onPressed: () {
                  notifier.stopCameraManual();
                  Navigator.pop(context);
                },
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  notifier.isRegistrationMode
                      ? "MODE PENDAFTARAN"
                      : "MODE VERIFIKASI",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(width: 48), // Balance for close button
            ],
          ),
          const SizedBox(height: 20),
          _buildHeaderText(notifier),
        ],
      ),
    );
  }

  Widget _buildHeaderText(FaceRecognitionNotifier notifier) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10)),
      child: Text(
        notifier.isRegistrationMode
            ? "Posisikan wajah di dalam oval\ndan kedipkan mata untuk mendaftar"
            : "Silakan berkedip untuk\nmemverifikasi kehadiran Anda",
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            height: 1.5),
      ),
    );
  }

  Widget _buildLiveStatus(FaceRecognitionNotifier notifier) {
    if (notifier.isLoading) {
      return const Column(
        children: [
          CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
          SizedBox(height: 16),
          Text("Memproses Biometrik...",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      );
    }
    return Column(
      children: [
        Icon(Icons.remove_red_eye_rounded,
            color: Colors.orangeAccent.shade200, size: 45),
        const SizedBox(height: 12),
        const Text("SILAKAN BERKEDIP",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                fontSize: 16)),
      ],
    );
  }

  Widget _buildBottomAction(FaceRecognitionNotifier notifier) {
    if (!notifier.isLocationGranted) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton.icon(
            onPressed: () => notifier.requestLocationPermission(),
            icon: const Icon(Icons.location_on_rounded),
            label: const Text("AKTIFKAN AKSES LOKASI",
                style:
                    TextStyle(fontWeight: FontWeight.w900, letterSpacing: 0.5)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}
