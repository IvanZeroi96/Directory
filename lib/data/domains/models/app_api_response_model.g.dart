// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppApiResponseModel _$AppApiResponseModelFromJson(Map<String, dynamic> json) =>
    AppApiResponseModel(
      json['success'] as bool,
      json['message'] as String,
      json['response'],
      json['expPassword'] as bool?,
    );

Map<String, dynamic> _$AppApiResponseModelToJson(
        AppApiResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'expPassword': instance.expPassword,
      'response': instance.response,
    };
