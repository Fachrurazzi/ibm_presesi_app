import 'dart:io';
import 'dart:ui';
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
      // Jeda 1.5 detik agar user bisa melihat status "Berhasil"
      Future.delayed(const Duration(milliseconds: 1500), () async {
        if (context.mounted) {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MapScreen()),
          );
          if (result == true && context.mounted) Navigator.pop(context, true);
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
          _buildBackgroundDecor(theme),
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
                              _buildFaceFrame(theme, notifier),
                              const SizedBox(height: 40),
                              _buildStatusIndicator(theme, notifier),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30, top: 20),
                            child: _buildActionButton(theme, notifier),
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

  Widget _buildBackgroundDecor(ThemeData theme) {
    return Positioned(
      top: -100,
      right: -100,
      child: CircleAvatar(
          radius: 180,
          backgroundColor: theme.colorScheme.primary.withOpacity(0.04)),
    );
  }

  Widget _buildHeader(FaceRecognitionNotifier notifier) {
    return Column(
      children: [
        Text(
          notifier.isRegistrationMode
              ? "Pendaftaran Wajah"
              : "Verifikasi Wajah",
          style: const TextStyle(
              fontWeight: FontWeight.w900, fontSize: 26, letterSpacing: -0.5),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            notifier.isRegistrationMode
                ? "Ambil foto master wajah Anda untuk identitas biometrik."
                : "Posisikan wajah Anda tepat di tengah lingkaran cahaya.",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black54, fontSize: 13, height: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildFaceFrame(ThemeData theme, FaceRecognitionNotifier notifier) {
    final bool isError = notifier.percentMatch == -1.0;
    final bool isSuccess = notifier.percentMatch >= 75;

    final Color borderColor = isError
        ? Colors.redAccent
        : isSuccess
            ? Colors.green
            : theme.colorScheme.primary;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Glow
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 280,
            height: 280,
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
          // Main Frame
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 6),
            ),
            child: ClipOval(
              child: Container(
                color: Colors.grey.shade50,
                child: notifier.currentImage ??
                    notifier.basePhotoWidget ??
                    Icon(Icons.face_retouching_natural_rounded,
                        size: 100, color: Colors.grey.shade200),
              ),
            ),
          ),
          // Laser Scanner
          if (notifier.isLoading ||
              (notifier.percentMatch == 0 && notifier.currentImage != null))
            const ScanningLaser(size: 260),
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
          Text("Memproses biometrik...",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.primary)),
        ],
      );
    }

    if (notifier.percentMatch == -1.0) {
      return const Column(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.redAccent, size: 44),
          SizedBox(height: 8),
          Text("VERIFIKASI GAGAL",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w900,
                  fontSize: 16)),
          Text("Wajah tidak cocok, silakan coba lagi",
              style: TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      );
    }

    if (notifier.percentMatch >= 75) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child:
                const Icon(Icons.check_rounded, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 12),
          const Text("VERIFIKASI BERHASIL",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w900,
                  fontSize: 16)),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.info_outline_rounded, size: 14, color: Colors.grey.shade400),
        const SizedBox(width: 6),
        Text("Siap memindai wajah",
            style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w600,
                fontSize: 12)),
      ],
    );
  }

  Widget _buildActionButton(ThemeData theme, FaceRecognitionNotifier notifier) {
    if (!notifier.isLocationGranted) {
      return _buttonTemplate(
          "AKTIFKAN LOKASI",
          Icons.location_on_rounded,
          Colors.orange.shade800,
          () => notifier.requestLocationPermission(),
          notifier);
    }

    return _buttonTemplate(
      notifier.isRegistrationMode
          ? "AMBIL FOTO MASTER"
          : (notifier.percentMatch == -1.0
              ? "ULANGI SCAN"
              : "MULAI SCAN WAJAH"),
      notifier.percentMatch == -1.0
          ? Icons.refresh_rounded
          : Icons.face_unlock_rounded,
      theme.colorScheme.primary,
      () => notifier.getCurrentPhoto(),
      notifier,
    );
  }

  Widget _buttonTemplate(String label, IconData icon, Color color,
      VoidCallback onTap, FaceRecognitionNotifier notifier) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton.icon(
        onPressed: notifier.isLoading ? null : onTap,
        icon: Icon(icon, size: 20),
        label: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.w900, letterSpacing: 1.1, fontSize: 14)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          disabledBackgroundColor: color.withOpacity(0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 0,
        ),
      ),
    );
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

class ScanningLaser extends StatefulWidget {
  final double size;
  const ScanningLaser({super.key, required this.size});

  @override
  State<ScanningLaser> createState() => _ScanningLaserState();
}

class _ScanningLaserState extends State<ScanningLaser>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 1500, milliseconds: 500))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, child) {
        return Positioned(
          top: _ctrl.value * (widget.size - 10),
          child: Container(
            width: widget.size - 20,
            height: 3,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.6),
                    blurRadius: 12,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(colors: [
                Colors.blue.withOpacity(0),
                Colors.blue.withAlpha(200),
                Colors.blue.withOpacity(0),
              ]),
            ),
          ),
        );
      },
    );
  }
}
