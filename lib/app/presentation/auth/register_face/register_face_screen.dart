import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibm_presensi_app/app/presentation/auth/register_face/register_face_notifier.dart';
import 'package:ibm_presensi_app/core/helper/global_helper.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class RegisterFaceScreen extends AppWidget<RegisterFaceNotifier, void, void> {
  RegisterFaceScreen({super.key}) : super(param1: null, param2: null);

  @override
  void checkVariableAfterUi(BuildContext context) {
    final prov = notifier;

    // Tampilkan pesan status (kecuali pesan normal)
    final ignoredMessages = [
      "Posisikan wajah Anda di dalam bingkai",
      "Tahan... Kedipkan mata",
      "Menyiapkan kamera...",
      "Wajah tidak terdeteksi",
      "",
    ];

    if (prov.statusMessage.isNotEmpty &&
        !ignoredMessages.contains(prov.statusMessage) &&
        !prov.isRegistrationSuccess) {
      final msg = prov.statusMessage;
      prov.resetStatus();
      HapticFeedback.lightImpact();

      GlobalHelper.showWarningNotification(
        context: context,
        title: "Instruksi",
        message: msg,
      );
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {}

  @override
  Widget bodyBuild(BuildContext context) {
    final prov = context.watch<RegisterFaceNotifier>();
    final size = MediaQuery.of(context).size;

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
                      if (!prov.isLocationGranted) _buildPermissionButton(prov),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Success Overlay
          if (prov.isRegistrationSuccess) _buildSuccessOverlay(context, prov),
        ],
      ),
    );
  }

  Widget _buildCameraPreview(Size size, RegisterFaceNotifier prov) {
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
          ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.srcOut),
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
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, RegisterFaceNotifier prov) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          if (!prov.isRegistrationSuccess)
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white, size: 24),
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
                  "REGISTRASI WAJAH",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    letterSpacing: 1,
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

  Widget _buildStatusIndicator(RegisterFaceNotifier prov) {
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
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              prov.statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
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

  Widget _buildPermissionButton(RegisterFaceNotifier prov) {
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

  Widget _buildSuccessOverlay(BuildContext context, RegisterFaceNotifier prov) {
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
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: prov.capturedFaceBytes != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(114),
                            child: Image.memory(prov.capturedFaceBytes!,
                                fit: BoxFit.cover),
                          )
                        : null,
                  ),
                  const Positioned(
                    bottom: 10,
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.greenAccent,
                      size: 70,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                "REGISTRASI BERHASIL",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Wajah Anda telah terdaftar di sistem",
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => prov.navigateToNext(context),
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
  AppBar? appBarBuild(BuildContext context) => null;
}
