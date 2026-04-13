import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraUtils {
  static final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  static InputImage? convertCameraImageToInputImage(
      CameraImage image, CameraDescription camera) {
    // 1. Hitung Rotasi secara Presisi
    final sensorOrientation = camera.sensorOrientation;
    InputImageRotation? rotation;

    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation = _orientations[DeviceOrientation.portraitUp];
      if (rotationCompensation == null) return null;

      if (camera.lensDirection == CameraLensDirection.front) {
        // Logika khusus kamera depan (Mirroring)
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // Logika kamera belakang
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    }

    if (rotation == null) return null;

    // 2. Validasi Format Gambar (NV21 untuk Android, BGRA8888 untuk iOS)
    final format = InputImageFormatValue.fromRawValue(image.format.raw);

    // Proteksi: ML Kit butuh format spesifik agar tidak crash
    if (format == null) return null;

    // 3. Gabungkan Plane Bytes (Khusus Android seringkali punya multiple planes)
    if (image.planes.isEmpty) return null;
    final plane = image.planes.first;

    // 4. Return InputImage untuk diproses ML Kit
    return InputImage.fromBytes(
      bytes:
          _concatenatePlanes(image.planes), // Gunakan helper penggabung bytes
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  /// Helper untuk menggabungkan semua plane kamera menjadi satu Uint8List
  /// Penting untuk stabilitas di HP Mediatek/Legacy Camera
  static Uint8List _concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }
}
