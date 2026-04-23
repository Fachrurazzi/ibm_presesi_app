import 'package:flutter/material.dart';

abstract class AppProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isDispose = false;
  bool _isInitialized = false;
  String _errorMessage = '';
  String _snackbarMessage = '';
  Color _snackbarColor = Colors.black87;

  // 👇 Tambahan: Untuk tracking error type
  ErrorType _errorType = ErrorType.unknown;

  bool get isLoading => _isLoading;
  bool get isDispose => _isDispose;
  bool get isInitialized => _isInitialized;
  bool get hasError => _errorMessage.isNotEmpty;
  String get errorMessage => _errorMessage;
  String get snackbarMessage => _snackbarMessage;
  Color get snackbarColor => _snackbarColor;
  ErrorType get errorType => _errorType;

  // 👇 Tambahan: Cek specific error types
  bool get isUnauthenticatedError => _errorType == ErrorType.unauthenticated;
  bool get isBannedError => _errorType == ErrorType.banned;
  bool get isNetworkError => _errorType == ErrorType.network;
  bool get isValidationError => _errorType == ErrorType.validation;

  void setError(String message, {ErrorType type = ErrorType.unknown}) {
    _errorMessage = message;
    _errorType = type;
    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = '';
    _errorType = ErrorType.unknown;
    notifyListeners();
  }

  void setSnackbar(String message,
      {Color color = Colors.black87, bool isError = false}) {
    _snackbarMessage = message;
    _snackbarColor = isError ? Colors.red.shade700 : color;
    notifyListeners();
  }

  void showSuccessSnackbar(String message) {
    setSnackbar(message, color: Colors.green.shade700);
  }

  void showErrorSnackbar(String message) {
    setSnackbar(message, color: Colors.red.shade700, isError: true);
  }

  void showWarningSnackbar(String message) {
    setSnackbar(message, color: Colors.orange.shade700);
  }

  void clearSnackbar() {
    _snackbarMessage = '';
    notifyListeners();
  }

  void resetState() {
    _isLoading = false;
    _errorMessage = '';
    _errorType = ErrorType.unknown;
    _snackbarMessage = '';
    notifyListeners();
  }

  void markInitialized() {
    _isInitialized = true;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_isDispose) super.notifyListeners();
  }

  void showLoading() {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners();
    }
  }

  void hideLoading() {
    if (_isLoading) {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 👇 Tambahan: Wrapper untuk async operation dengan loading state
  Future<void> executeWithLoading(Future<void> Function() action) async {
    showLoading();
    try {
      await action();
    } catch (e) {
      setError(e.toString(), type: ErrorType.unknown);
    } finally {
      hideLoading();
    }
  }

  /// 👇 Tambahan: Wrapper untuk async operation dengan error handling
  Future<T?> executeSafely<T>(
    Future<T> Function() action, {
    ErrorType errorType = ErrorType.unknown,
  }) async {
    try {
      return await action();
    } catch (e) {
      setError(e.toString(), type: errorType);
      return null;
    }
  }

  Future<void> init();

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }
}

/// 👇 Tambahan: Enum untuk error type
enum ErrorType {
  unknown,
  network,
  unauthenticated,
  banned,
  validation,
  server,
  timeout,
}
