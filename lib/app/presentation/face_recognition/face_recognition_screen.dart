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
    final prov = notifier;

    // 1. HANDLER NOTIFIKASI BIOMETRIK (Instruksi Real-time)
    final List<String> ignoredMessages = [
      "Posisikan wajah Anda",
      "Tahan... Kedipkan mata",
      "Menyiapkan sensor...",
      "Wajah tidak terdeteksi",
      "Siap...",
      ""
    ];

    if (prov.biometricMessage.isNotEmpty &&
        !ignoredMessages.contains(prov.biometricMessage)) {
      final msg = prov.biometricMessage;
      final isError = prov.isErrorMessage;

      prov.resetBiometricMessage();
      HapticFeedback.lightImpact();
      _showPill(context, msg, isError, screenWidth, safeAreaTop);
    }

    // 2. LOGIKA NAVIGASI (OPTIMASI KECEPATAN)
    if (prov.percentMatch >= 80) {
      HapticFeedback.heavyImpact();

      // Cek apakah ini mode pendaftaran atau absensi rutin
      final bool isSuccessRegister = prov.isRegistrationMode;

      // UX: Beri waktu user melihat Success Overlay sebentar (1.5 - 2 detik)
      Future.delayed(const Duration(milliseconds: 2000), () {
        if (context.mounted) {
          // KUNCI: Matikan kamera segera sebelum transisi
          prov.stopCameraManual();

          if (isSuccessRegister) {
            // Jika baru daftar wajah -> Kembali ke Dashboard Utama
            Navigator.pushNamedAndRemoveUntil(
                context, '/main-navbar', (route) => false);
          } else {
            // Jika absensi rutin -> Lanjut ke Map Geofencing
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
        msg.toLowerCase().contains("lurus") ||
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
        (isError || isInstruction) ? "Instruksi" : "Status",
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
      ),
      description: Text(
        msg,
        maxLines: 2,
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
      borderRadius: BorderRadius.circular(20),
      displayCloseButton: false,
    ).show(context);
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<FaceRecognitionNotifier>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildFullScreenCamera(size, prov),
          _buildCameraOverlay(context),

          SafeArea(
            child: Column(
              children: [
                _buildTopHeader(context, prov),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLiveStatus(prov),
                      const SizedBox(height: 30),
                      _buildBottomAction(prov),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Success Overlay: Tampil saat verifikasi/registrasi mencapai ambang batas
          if (prov.capturedFaceBytes != null && prov.percentMatch >= 80)
            _buildSuccessOverlay(context, prov),
        ],
      ),
    );
  }

  Widget _buildSuccessOverlay(
      BuildContext context, FaceRecognitionNotifier prov) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Container(
        color: Colors.black.withOpacity(0.6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 240,
                    height: 340,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(120),
                      border: Border.all(color: Colors.greenAccent, width: 6),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.greenAccent.withOpacity(0.3),
                            blurRadius: 30)
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(114),
                      child: Image.memory(prov.capturedFaceBytes!,
                          fit: BoxFit.cover),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    child: Icon(Icons.check_circle_rounded,
                        color: Colors.greenAccent, size: 70),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                  prov.isRegistrationMode
                      ? "PENDAFTARAN BERHASIL"
                      : "VERIFIKASI BERHASIL",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      letterSpacing: 2)),
              const SizedBox(height: 10),
              Text(
                  prov.isRegistrationMode
                      ? "Wajah terdaftar di sistem PT IBM."
                      : "Membuka modul lokasi...",
                  style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullScreenCamera(Size size, FaceRecognitionNotifier prov) {
    if (prov.cameraController == null ||
        !prov.cameraController!.value.isInitialized) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              SizedBox(height: 20),
              Text("Menghubungkan Sensor Kamera...",
                  style: TextStyle(color: Colors.white54, fontSize: 11)),
            ],
          ),
        ),
      );
    }

    var camera = prov.cameraController!.value;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: Center(child: CameraPreview(prov.cameraController!)),
    );
  }

  Widget _buildCameraOverlay(BuildContext context) {
    return ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.srcOut),
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

  Widget _buildTopHeader(BuildContext context, FaceRecognitionNotifier prov) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 24),
            onPressed: () {
              prov.stopCameraManual();
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white10)),
                child: Text(
                  prov.isRegistrationMode
                      ? "REGISTRASI WAJAH"
                      : "SCAN BIOMETRIK",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 10,
                      letterSpacing: 1),
                ),
              ),
            ),
          ),
          const SizedBox(width: 48), // Spacer penyeimbang
        ],
      ),
    );
  }

  Widget _buildLiveStatus(FaceRecognitionNotifier prov) {
    if (prov.isLoading) {
      return const Column(
        children: [
          CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
          SizedBox(height: 16),
          Text("Memproses...",
              style: TextStyle(color: Colors.white, fontSize: 12)),
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey(prov.biometricMessage),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              prov.biometricMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Icon(Icons.face_retouching_natural_rounded,
            color: Colors.blueAccent, size: 45),
        const SizedBox(height: 10),
        const Text("SILAKAN BERKEDIP",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                fontSize: 13)),
      ],
    );
  }

  Widget _buildBottomAction(FaceRecognitionNotifier prov) {
    if (!prov.isLocationGranted) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () => prov.requestLocationPermission(),
            icon: const Icon(Icons.location_on_rounded, size: 18),
            label: const Text("AKTIFKAN LOKASI",
                style: TextStyle(fontWeight: FontWeight.w900)),
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
