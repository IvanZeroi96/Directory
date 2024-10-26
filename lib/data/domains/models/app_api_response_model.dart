import 'package:json_annotation/json_annotation.dart';

part 'app_api_response_model.g.dart';

@JsonSerializable()
class AppApiResponseModel {
  final bool success;
  final String message;
  final bool? expPassword;
  dynamic response;

  AppApiResponseModel(
    this.success,
    this.message,
    this.response,
    this.expPassword,
  );

  factory AppApiResponseModel.fromJson(Map<String, dynamic> json) => _$AppApiResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppApiResponseModelToJson(this);
}
