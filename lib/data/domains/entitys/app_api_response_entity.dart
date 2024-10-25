
import 'package:directory/data/domains/models/app_api_response_model.dart';

class AppApiResponseEntity {

  int? responseCode;
  String message;
  bool success;
  dynamic response;

  AppApiResponseEntity({
    this.message = '',
    this.success = false,
    this.response,
    this.responseCode
  });

  factory AppApiResponseEntity.fromModel(AppApiResponseModel apiResponse, {int? responseCode}) {
    return AppApiResponseEntity(
        success: apiResponse.success,
        message: apiResponse.message,
        response: apiResponse.response,
        responseCode: responseCode
    );
  }
}