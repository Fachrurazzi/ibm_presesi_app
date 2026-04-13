import 'package:flutter/material.dart';

abstract class AppProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isDispose = false;
  String _errorMessage = '';
  String _snackbarMessage = '';
  Color _snackbarColor = Colors.black87;

  // --- Getters ---
  bool get isLoading => _isLoading;
  bool get isDispose => _isDispose;
  String get errorMessage => _errorMessage;
  String get snackbarMessage => _snackbarMessage;
  Color get snackbarColor => _snackbarColor;

  // --- Setters ---
  set errorMessage(String param) {
    _errorMessage = param;
    notifyListeners();
  }

  set snackbarMessage(String param) {
    _snackbarMessage = param;
    notifyListeners();
  }

  /// Menampilkan Snackbar/Pill dengan warna dinamis (Sukses/Error)
  void setSnackbar(String message, {Color color = Colors.black87}) {
    _snackbarMessage = message;
    _snackbarColor = color;
    notifyListeners();
  }

  /// Proteksi agar tidak memanggil UI update jika provider sudah dimatikan
  @override
  void notifyListeners() {
    if (!_isDispose) {
      super.notifyListeners();
    }
  }

  /// Menampilkan Loading Overlay/Widget
  void showLoading() {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners();
    }
  }

  /// Menyembunyikan Loading
  void hideLoading() {
    if (_isLoading) {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fungsi wajib untuk inisialisasi data di setiap Notifier
  void init();

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }
}
