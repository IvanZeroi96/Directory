import 'package:directory/data/domains/exceptions/app_exception.dart';

class AppHTTPException extends AppException {
  final int? responseCode;
  final dynamic response;
  AppHTTPException(
      super.message,
      this.responseCode,
      this.response
      );

  @override
  String toString() {
    return '$message $responseCode';
  }
}