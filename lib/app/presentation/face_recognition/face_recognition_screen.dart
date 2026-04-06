import 'package:flutter/material.dart';
import 'package:ibm_presensi_app/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:ibm_presensi_app/app/presentation/map/map_screen.dart';
import 'package:ibm_presensi_app/core/widget/app_widget.dart';

class FaceRecognitionScreen
    extends AppWidget<FaceRecognitionNotifier, void, void> {
  FaceRecognitionScreen({super.key});

  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.percentMatch >= 75) {
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
              style: const TextStyle(fontWeight: FontWeight.w600)),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              left: 20,
              right: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      );
    });
  }

  @override
  Widget bodyBuild(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                size: 18, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Stack(
        children: [
          _buildBackgroundDecor(theme),
          SafeArea(
            // --- FIX OVERFLOW DISINI ---
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
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
                              _buildHeader(theme),
                              const SizedBox(
                                  height: 30), // Dikurangi sedikit agar muat
                              _buildFaceFrame(theme),
                              const SizedBox(height: 30),
                              _buildStatusIndicator(theme),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24, top: 20),
                            child: _buildActionButton(theme),
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
          radius: 150,
          backgroundColor: theme.colorScheme.primary.withOpacity(0.05)),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      children: [
        Text(
          notifier.isRegistrationMode
              ? "Pendaftaran Wajah"
              : "Verifikasi Wajah",
          style: const TextStyle(
              fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: -0.5),
        ),
        const SizedBox(height: 8),
        Text(
          notifier.isRegistrationMode
              ? "Ambil foto master untuk identitas biometrik."
              : "Posisikan wajah Anda tepat di tengah lingkaran.",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildFaceFrame(ThemeData theme) {
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
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 270,
            height: 270,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor, width: 6),
              boxShadow: [
                BoxShadow(
                    color: borderColor.withOpacity(0.2),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
            ),
            child: ClipOval(
              child: Container(
                color: Colors.white,
                child: notifier.currentImage ??
                    notifier.basePhotoWidget ??
                    Icon(Icons.face_rounded,
                        size: 120, color: Colors.grey.shade200),
              ),
            ),
          ),
          // Animasi Laser hanya muncul saat scan
          if (notifier.isLoading ||
              (notifier.percentMatch == 0 && notifier.currentImage != null))
            const ScanningLaser(size: 250),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(ThemeData theme) {
    if (notifier.isLoading) {
      return const Column(
        children: [
          SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 3)),
          SizedBox(height: 16),
          Text("Memproses wajah...",
              style: TextStyle(fontWeight: FontWeight.w600)),
        ],
      );
    }

    if (notifier.percentMatch == -1.0) {
      return Column(
        children: [
          const Icon(Icons.cancel_rounded, color: Colors.red, size: 40),
          const SizedBox(height: 8),
          const Text("VERIFIKASI GAGAL",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w900)),
          Text(notifier.errorMessage,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      );
    }

    if (notifier.percentMatch >= 75) {
      return const Column(
        children: [
          Icon(Icons.check_circle_rounded, color: Colors.green, size: 40),
          SizedBox(height: 8),
          Text("Wajah Terverifikasi!",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        ],
      );
    }

    return Text("Siap memindai wajah",
        style: TextStyle(color: Colors.grey.shade400));
  }

  Widget _buildActionButton(ThemeData theme) {
    if (!notifier.isLocationGranted) {
      return _buttonTemplate("AKTIFKAN LOKASI", Icons.location_on,
          Colors.orange.shade800, () => notifier.requestLocationPermission());
    }

    return _buttonTemplate(
      notifier.isRegistrationMode
          ? "AMBIL FOTO MASTER"
          : (notifier.percentMatch == -1.0 ? "COBA LAGI" : "MULAI SCAN"),
      notifier.percentMatch == -1.0
          ? Icons.replay_rounded
          : Icons.camera_alt_rounded,
      theme.colorScheme.primary,
      () => notifier.getCurrentPhoto(),
    );
  }

  Widget _buttonTemplate(
      String label, IconData icon, Color color, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: notifier.isLoading ? null : onTap,
        icon: Icon(icon),
        label: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 1.2)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  @override
  AppBar? appBarBuild(BuildContext context) => null;
}

// --- WIDGET ANIMASI LASER ---
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
    _ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
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
          top: _ctrl.value * (widget.size - 20),
          child: Container(
            width: widget.size,
            height: 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.blue.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 2)
              ],
              gradient: const LinearGradient(colors: [
                Colors.transparent,
                Colors.blue,
                Colors.transparent
              ]),
            ),
          ),
        );
      },
    );
  }
}
