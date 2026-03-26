import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_get_bytes.dart';
import 'package:ibm_presensi_app/app/module/use_case/photo_upload.dart'; // Import UseCase Upload
import 'package:ibm_presensi_app/core/provider/app_provider.dart';

class FaceRecognitionNotifier extends AppProvider {
  final PhotoGetBytesUseCase _photoGetBytesUseCase;
  final PhotoUploadUseCase _photoUploadUseCase;

  FaceRecognitionNotifier(
      this._photoGetBytesUseCase, this._photoUploadUseCase) {
    init();
  }

  final _faceSDK = FaceSDK.instance;
  MatchFacesImage? mfImage1, mfImage2;
  Image? _currentImage, _basePhotoWidget;
  double _percentMatch = 0.0;
  bool _isRegistrationMode = false;

  // Getters
  Image? get currentImage => _currentImage;
  Image? get basePhotoWidget => _basePhotoWidget;
  double get percentMatch => _percentMatch;
  bool get isRegistrationMode => _isRegistrationMode;

  @override
  Future<void> init() async {
    try {
      showLoading();
      await _faceSDK.initialize();
      await _getBasePhoto();

      if (errorMessage.isEmpty && !_isRegistrationMode) {
        getCurrentPhoto();
      }
    } catch (e) {
      errorMessage = "Inisialisasi gagal: $e";
    } finally {
      hideLoading();
    }
  }

  Future<void> _getBasePhoto() async {
    final response = await _photoGetBytesUseCase();
    if (response.success && response.data != null) {
      _setImage(response.data!, ImageType.PRINTED, 1);
    } else if (response.message.toLowerCase().contains('belum diatur')) {
      _isRegistrationMode = true;
    } else {
      errorMessage = response.message;
    }
  }

  void _setImage(Uint8List bytes, ImageType type, int flag) {
    final mdImage = MatchFacesImage(bytes, type);
    if (flag == 1) {
      mfImage1 = mdImage;
      _basePhotoWidget = Image.memory(bytes);
    } else {
      mfImage2 = mdImage;
      _currentImage = Image.memory(bytes);
    }
    notifyListeners();
  }

  Future<void> getCurrentPhoto() async {
    _currentImage = null;
    _percentMatch = 0.0;
    notifyListeners();

    final response = await _faceSDK.startFaceCapture();
    if (response.image != null) {
      _setImage(response.image!.image, ImageType.LIVE, 2);
      _isRegistrationMode
          ? await _uploadFace(response.image!.image)
          : await _matchFaces();
    }
  }

  Future<void> _uploadFace(Uint8List bytes) async {
    showLoading();
    try {
      final tempDir = await getTemporaryDirectory();
      final file = File(
          '${tempDir.path}/face_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await file.writeAsBytes(bytes);

      final response = await _photoUploadUseCase(param: file);
      if (response.success) {
        _percentMatch = 100.0;
        snackbarMessage = "Wajah berhasil didaftarkan!";
      } else {
        _percentMatch = -1.0;
        snackbarMessage = response.message;
      }
    } catch (e) {
      _percentMatch = -1.0;
    } finally {
      hideLoading();
    }
  }

  Future<void> _matchFaces() async {
    if (mfImage1 == null || mfImage2 == null) return;
    showLoading();

    final request = MatchFacesRequest([mfImage1!, mfImage2!]);
    final response = await _faceSDK.matchFaces(request);

    if (response.error != null) {
      _percentMatch = -1.0;
    } else {
      final split = await _faceSDK.splitComparedFaces(response.results, 0.75);
      _percentMatch = split.matchedFaces.isNotEmpty
          ? double.parse(
              (split.matchedFaces[0].similarity * 100).toStringAsFixed(1))
          : -1.0;
    }
    hideLoading();
  }
}
