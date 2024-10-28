import 'package:directory/data/domains/models/api_response_model.dart';

class ApiResponseEntity {
  int? responseCode;
  String message;
  bool success;
  dynamic response;

  ApiResponseEntity({this.message = '', this.success = false, this.response, this.responseCode});

  factory ApiResponseEntity.fromModel(ApiResponseModel apiResponse, {int? responseCode}) {
    return ApiResponseEntity(
        success: apiResponse.success ?? true,
        message: apiResponse.message ?? '',
        response: apiResponse.response,
        responseCode: responseCode);
  }
}
