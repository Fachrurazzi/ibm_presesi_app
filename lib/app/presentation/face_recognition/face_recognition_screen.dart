import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_screen.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';
import 'package:provider/provider.dart';

class FaceRecognitionScreen
    extends AppWidget<FaceRecognitionNotifier, void, void> {
  FaceRecognitionScreen({super.key});

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.percentMatch >= 75) {
      Future.delayed(const Duration(milliseconds: 1500), () async {
        if (context.mounted) {
          // 1. Tunggu sampai user kembali dari Map
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MapScreen()),
          );

          // 2. KETIKA KEMBALI KE SINI (User tekan Back dari Map)
          // Panggil fungsi reset di notifier agar lingkaran tidak hijau lagi
          notifier.resetState();
        }
      });
    }
  }

  @override
  void checkVariableBeforeUi(BuildContext context) {
    if (notifier.errorMessage.isNotEmpty) {
      _showTopSnackBar(context, notifier.errorMessage, Colors.redAccent);
      notifier.errorMessage = "";
    }
    if (notifier.snackbarMessage.isNotEmpty) {
      _showTopSnackBar(context, notifier.snackbarMessage, Colors.green);
      notifier.snackbarMessage = "";
    }
  }

  void _showTopSnackBar(BuildContext context, String message, Color color) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 120,
              left: 24,
              right: 24),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      );
    });
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);
    final notifier = context.watch<FaceRecognitionNotifier>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24)),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    size: 16, color: Colors.black87),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: CircleAvatar(
                radius: 180,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.04)),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 20),
                              _buildHeader(notifier),
                              const SizedBox(height: 40),
                              _buildFaceFrame(context, theme, notifier),
                              const SizedBox(height: 40),
                              _buildStatusIndicator(theme, notifier),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30, top: 20),
                            child: _buildActionButton(notifier),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(FaceRecognitionNotifier notifier) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            notifier.isRegistrationMode
                ? "Pendaftaran Wajah"
                : "Verifikasi Identitas",
            style: const TextStyle(
                fontWeight: FontWeight.w900, fontSize: 26, letterSpacing: -0.5),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            notifier.isRegistrationMode
                ? "Silakan KEDIPKAN MATA Anda untuk mendaftarkan wajah master."
                : "Silakan KEDIPKAN MATA Anda untuk memverifikasi kehadiran.",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black54, fontSize: 13, height: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildFaceFrame(
      BuildContext context, ThemeData theme, FaceRecognitionNotifier notifier) {
    double screenWidth = MediaQuery.of(context).size.width;
    double frameSize = (screenWidth * 0.7).clamp(220.0, 280.0);

    final bool isSuccess = notifier.percentMatch >= 75;
    final bool isError = notifier.percentMatch == -1.0;
    final Color borderColor = isError
        ? Colors.redAccent
        : isSuccess
            ? Colors.green
            : theme.colorScheme.primary;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: frameSize + 20,
            height: frameSize + 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: borderColor.withOpacity(0.15),
                    blurRadius: 40,
                    spreadRadius: 10)
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: frameSize,
            height: frameSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 6),
            ),
            child: ClipOval(
              child: Container(
                color: Colors.black,
                child: (notifier.cameraController != null &&
                        notifier.cameraController!.value.isInitialized)
                    ? AspectRatio(
                        aspectRatio: 1,
                        child: CameraPreview(notifier.cameraController!))
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(
      ThemeData theme, FaceRecognitionNotifier notifier) {
    if (notifier.isLoading) {
      return Column(
        children: [
          const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 3)),
          const SizedBox(height: 20),
          Text("Memproses...",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.primary)),
        ],
      );
    }

    if (notifier.percentMatch >= 75) {
      return const Column(
        children: [
          Icon(Icons.check_circle_rounded, color: Colors.green, size: 40),
          SizedBox(height: 12),
          Text("TERVERIFIKASI",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w900)),
        ],
      );
    }

    return Column(
      children: [
        Icon(
            notifier.percentMatch == -1.0
                ? Icons.warning_amber_rounded
                : Icons.remove_red_eye_outlined,
            color: notifier.percentMatch == -1.0
                ? Colors.redAccent
                : Colors.orange,
            size: 44),
        const SizedBox(height: 8),
        FittedBox(
          child: Text(
              notifier.percentMatch == -1.0 ? "COBA LAGI" : "SILAKAN BERKEDIP",
              style: TextStyle(
                  color: notifier.percentMatch == -1.0
                      ? Colors.redAccent
                      : Colors.orange,
                  fontWeight: FontWeight.w900,
                  fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildActionButton(FaceRecognitionNotifier notifier) {
    if (!notifier.isLocationGranted) {
      return SizedBox(
        width: double.infinity,
        height: 58,
        child: ElevatedButton.icon(
          onPressed: () => notifier.requestLocationPermission(),
          icon: const Icon(Icons.location_on_rounded),
          label: const Text("AKTIFKAN LOKASI",
              style: TextStyle(fontWeight: FontWeight.w900)),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}
