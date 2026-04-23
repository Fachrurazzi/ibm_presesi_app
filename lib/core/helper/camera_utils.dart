import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraUtils {
  static final Map<DeviceOrientation, int> _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  /// Konversi CameraImage ke InputImage untuk ML Kit.
  static InputImage? convertCameraImageToInputImage(
    CameraImage image,
    CameraDescription camera,
  ) {
    // 1. Hitung rotasi
    final rotation = _getRotation(image, camera);
    if (rotation == null) return null;

    // 2. Validasi format
    final format = _getInputImageFormat(image);
    if (format == null) return null;

    // 3. Ekstrak bytes sesuai format
    final bytes = _extractBytes(image, format);
    if (bytes == null) return null;

    return InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: image.planes.first.bytesPerRow,
      ),
    );
  }

  static InputImageRotation? _getRotation(
    CameraImage image,
    CameraDescription camera,
  ) {
    if (Platform.isIOS) {
      return InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation = _orientations[DeviceOrientation.portraitUp];
      if (rotationCompensation == null) return null;

      if (camera.lensDirection == CameraLensDirection.front) {
        rotationCompensation =
            (camera.sensorOrientation + rotationCompensation) % 360;
      } else {
        rotationCompensation =
            (camera.sensorOrientation - rotationCompensation + 360) % 360;
      }
      return InputImageRotationValue.fromRawValue(rotationCompensation);
    }
    return null;
  }

  static InputImageFormat? _getInputImageFormat(CameraImage image) {
    if (Platform.isAndroid) {
      return InputImageFormat.nv21; // Android menggunakan NV21
    } else if (Platform.isIOS) {
      return InputImageFormat.bgra8888; // iOS menggunakan BGRA
    }
    return InputImageFormatValue.fromRawValue(image.format.raw);
  }

  static Uint8List? _extractBytes(CameraImage image, InputImageFormat format) {
    if (Platform.isAndroid && format == InputImageFormat.nv21) {
      // Gabungkan Y + UV planes untuk NV21
      final yPlane = image.planes[0];
      final uvPlane = image.planes[1];
      final yBytes = yPlane.bytes;
      final uvBytes = uvPlane.bytes;
      final totalBytes = yBytes.length + uvBytes.length;
      final bytes = Uint8List(totalBytes);
      bytes.setAll(0, yBytes);
      bytes.setAll(yBytes.length, uvBytes);
      return bytes;
    } else if (Platform.isIOS && format == InputImageFormat.bgra8888) {
      return image.planes.first.bytes;
    } else {
      // Fallback: gabungkan semua plane
      final totalBytes = image.planes.fold<int>(
        0,
        (sum, p) => sum + p.bytes.length,
      );
      final bytes = Uint8List(totalBytes);
      var offset = 0;
      for (final plane in image.planes) {
        bytes.setAll(offset, plane.bytes);
        offset += plane.bytes.length;
      }
      return bytes;
    }
  }
}
