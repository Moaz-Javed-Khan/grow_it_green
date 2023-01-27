import 'package:grow_it_green/_common/helpers/custom_exception.dart';

class LoginFailure extends CustomException {
  LoginFailure([
    String message = 'An unknown error occurred.',
    this.statusCode = 'login_failed',
  ]) : super(message, '');

  final String statusCode;
}

class RegisterFailure extends CustomException {
  RegisterFailure([
    String message = 'An unknown error occurred.',
    this.statusCode = 'register_failed',
  ]) : super(message, '');

  final String statusCode;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure extends CustomException {
  LogOutFailure([String? message]) : super(message, '');
}
