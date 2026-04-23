import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/module/use_case/auth_register_face_use_case.dart';
import 'package:ibm_presensi_app/app/presentation/common/attendance/face_recognation/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/core/di/dependency.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class FaceRecognitionScreen extends StatelessWidget {
  const FaceRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FaceRecognitionNotifier(sl<AuthRegisterFaceUseCase>()),
      child: _FaceRecognitionView(),
    );
  }
}

class _FaceRecognitionView
    extends AppWidget<FaceRecognitionNotifier, void, void> {
  _FaceRecognitionView() : super(param1: null, param2: null);

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<FaceRecognitionNotifier>();
    final size = MediaQuery.of(context).size;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final nextRoute = args?['nextRoute'] as String? ?? '/user-navbar';

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Camera Preview
          _buildCameraPreview(size, prov),

          // Overlay Bingkai
          _buildCameraOverlay(context),

          // UI Elements
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context, prov),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildStatusIndicator(prov),
                      const SizedBox(height: 30),
                      if (!prov.isCameraGranted) _buildPermissionButton(prov),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Success Overlay
          if (prov.isVerificationSuccess)
            _buildSuccessOverlay(context, prov, nextRoute),
        ],
      ),
    );
  }

  Widget _buildCameraPreview(Size size, FaceRecognitionNotifier prov) {
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
              Text(
                "Menghubungkan Kamera...",
                style: TextStyle(color: Colors.white54, fontSize: 11),
              ),
            ],
          ),
        ),
      );
    }

    final camera = prov.cameraController!.value;
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
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.srcOut),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: BlendMode.dstOut,
            ),
          ),
          Center(
            child: Container(
              width: 280,
              height: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(140),
              ),
            ),
          ),
          // Corner lines
          Center(
            child: Container(
              width: 280,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140),
                border: Border.all(color: Colors.white, width: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, FaceRecognitionNotifier prov) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          if (!prov.isVerificationSuccess)
            IconButton(
              icon: const Icon(Icons.close_rounded,
                  color: Colors.white, size: 28),
              onPressed: () {
                prov.stopCamera();
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
                  border: Border.all(color: Colors.white10),
                ),
                child: const Text(
                  "VERIFIKASI WAJAH",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 11,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(FaceRecognitionNotifier prov) {
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
            key: ValueKey(prov.statusMessage),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              prov.statusMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: prov.isErrorMessage ? Colors.red.shade300 : Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Icon(Icons.face_retouching_natural_rounded,
            color: Colors.blueAccent, size: 45),
        const SizedBox(height: 10),
        const Text(
          "SILAKAN BERKEDIP",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionButton(FaceRecognitionNotifier prov) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: () => prov.requestCameraPermission(),
          icon: const Icon(Icons.camera_alt_rounded, size: 18),
          label: const Text(
            "AKTIFKAN KAMERA",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessOverlay(
      BuildContext context, FaceRecognitionNotifier prov, String nextRoute) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Container(
        color: Colors.black.withOpacity(0.7),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.greenAccent, width: 4),
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.greenAccent,
                      size: 80,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "VERIFIKASI BERHASIL",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Melanjutkan ke halaman berikutnya...",
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () =>
                      prov.navigateToNext(context, nextRoute: nextRoute),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Text(
                    "LANJUTKAN",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void checkVariableAfterUi(BuildContext context) {
    final prov = notifier;
    final ignoredMessages = [
      "Posisikan wajah Anda di dalam bingkai",
      "Tahan... Kedipkan mata",
      "Menyiapkan kamera...",
      "Wajah tidak terdeteksi",
      "",
    ];

    if (prov.statusMessage.isNotEmpty &&
        !ignoredMessages.contains(prov.statusMessage) &&
        !prov.isVerificationSuccess &&
        prov.isErrorMessage) {
      final msg = prov.statusMessage;
      prov.resetStatus();
      HapticFeedback.lightImpact();

      GlobalHelper.showErrorNotification(
        context: context,
        title: "Verifikasi Gagal",
        message: msg,
      );
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}
