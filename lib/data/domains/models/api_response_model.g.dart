// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseModel _$ApiResponseModelFromJson(Map<String, dynamic> json) =>
    ApiResponseModel(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      response: json['response'],
    );

Map<String, dynamic> _$ApiResponseModelToJson(ApiResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'response': instance.response,
    };
