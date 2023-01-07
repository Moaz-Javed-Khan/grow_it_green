import 'package:grow_it_green/_common/helpers/custom_exception.dart';

/// Exception model for internet related exceptions
class FetchDataException extends CustomException {
  const FetchDataException([
    String message = 'Please check your internet and try again later.',
  ]) : super(message, '');
}

class BadRequestException extends CustomException {
  const BadRequestException([String? message])
      : super(message, 'Invalid Request: ');
}

class InsecureException extends CustomException {
  const InsecureException([String? message])
      : super(message, 'Invalid Response: ');
}

class UnauthorizedException extends CustomException {
  const UnauthorizedException([String? message])
      : super(message, 'Unauthorized: ');
}

class NotFoundException extends CustomException {
  const NotFoundException([String? message]) : super(message, 'Not Found: ');
}

class TimeOutExceptionC extends CustomException {
  const TimeOutExceptionC([
    String message =
        'Something went wrong, please check your internet and try again later.',
  ]) : super(message, '');
}

class APIException extends CustomException {
  const APIException([
    String? message = '',
  ]) : super(message, '');
}
