abstract class BaseResponse {
  final bool _success;
  final String _message;

  // Getter untuk mengakses properti dari luar class
  bool get success => _success;
  String get message => _message;

  // Constructor dengan initializer list
  BaseResponse({required bool success, required String message})
      : _success = success,
        _message = message;
}
