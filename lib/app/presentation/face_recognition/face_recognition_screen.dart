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
    if (notifier.percentMatch >= 75) {
      // Standar keamanan 75%
      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MapScreen()));
      });
    }
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient Dekoratif
          Positioned(
            top: -100,
            right: -50,
            child: CircleAvatar(
                radius: 150,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.05)),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  _buildHeader(context),
                  const Spacer(),
                  _buildFaceFrame(context),
                  const SizedBox(height: 40),
                  _buildStatusIndicator(context),
                  const Spacer(),
                  _buildActionButton(context),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          notifier.isRegistrationMode
              ? "Registrasi Biometrik"
              : "Verifikasi Identitas",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          notifier.isRegistrationMode
              ? "Ambil foto selfie Anda untuk mendaftarkan wajah ke sistem"
              : "Pastikan pencahayaan cukup agar wajah terdeteksi dengan baik",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildFaceFrame(BuildContext context) {
    final theme = Theme.of(context);
    bool isError = notifier.percentMatch < 0;
    bool isSuccess = notifier.percentMatch >= 75;

    Color borderColor = isError
        ? Colors.red
        : isSuccess
            ? Colors.green
            : theme.colorScheme.primary;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer Glow
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: borderColor.withOpacity(0.2),
                  blurRadius: 40,
                  spreadRadius: 10)
            ],
          ),
        ),

        // Frame Foto
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 4),
            color: Colors.white,
          ),
          child: ClipOval(
            child: _getImageContent(context),
          ),
        ),

        // Scanner Line Animation (Hanya muncul saat loading atau iddle)
        if (!isSuccess && !isError) const _ScannerAnimation(),
      ],
    );
  }

  Widget _getImageContent(BuildContext context) {
    if (notifier.currentImage != null) return notifier.currentImage!;
    if (notifier.basePhotoWidget != null) return notifier.basePhotoWidget!;
    return Icon(Icons.face_unlock_rounded,
        size: 100, color: Colors.grey.shade300);
  }

  Widget _buildStatusIndicator(BuildContext context) {
    if (notifier.isLoading) return const CircularProgressIndicator();

    if (notifier.percentMatch > 0) {
      bool isSuccess = notifier.percentMatch >= 75;
      return Column(
        children: [
          Icon(isSuccess ? Icons.check_circle : Icons.error,
              color: isSuccess ? Colors.green : Colors.red, size: 40),
          const SizedBox(height: 12),
          Text(
            isSuccess ? "Wajah Dikenali!" : "Wajah Tidak Cocok",
            style: TextStyle(
                color: isSuccess ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          if (!notifier.isRegistrationMode)
            Text("Kemiripan: ${notifier.percentMatch}%",
                style: const TextStyle(color: Colors.grey)),
        ],
      );
    }

    return const Text("Silakan mulai pemindaian wajah",
        style: TextStyle(color: Colors.grey));
  }

  Widget _buildActionButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: notifier.isLoading ? null : () => notifier.getCurrentPhoto(),
        style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        icon: const Icon(Icons.camera_front_rounded),
        label: Text(notifier.isRegistrationMode
            ? "Ambil Foto Selfie"
            : "Mulai Validasi"),
      ),
    );
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

// Widget Animasi Scanner Garis
class _ScannerAnimation extends StatefulWidget {
  const _ScannerAnimation();
  @override
  State<_ScannerAnimation> createState() => _ScannerAnimationState();
}

class _ScannerAnimationState extends State<_ScannerAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: 40 + (140 * _controller.value),
          child: Container(
            width: 180,
            height: 2,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    blurRadius: 10,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Theme.of(context).colorScheme.primary,
                Colors.transparent
              ]),
            ),
          ),
        );
      },
    );
  }
}
