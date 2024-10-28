import 'package:dio/dio.dart';
import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/models/api_response_model.dart';
import 'package:directory/data/domains/entitys/api_response_entity.dart';
import 'package:directory/data/domains/exceptions/app_http_exception.dart';

enum HTTPMethod { post, put, delete, get, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return 'GET';
      case HTTPMethod.post:
        return 'POST';
      case HTTPMethod.delete:
        return 'DELETE';
      case HTTPMethod.patch:
        return 'PATCH';
      case HTTPMethod.put:
        return 'PUT';
    }
  }
}

class APIProvider {
  final HTTPMethod method;
  final ApiEndpoints endpoint;
  Map<String, String>? headers;
  Map<String, dynamic>? queryParams;
  Map<String, dynamic>? body;
  List<dynamic>? pathParameters;
  final bool bytesResponse;
  final int? id;

  APIProvider._(
      {required this.method,
      required this.endpoint,
      this.headers,
      this.body,
      this.queryParams,
      this.pathParameters,
      this.bytesResponse = false,
      this.id
      });

  APIProvider.post({
    required ApiEndpoints endpoint,
    Map<String, dynamic>? body,
  }) : this._(
          method: HTTPMethod.post,
          endpoint: endpoint,
          body: body,
        );

  APIProvider.get({
    required ApiEndpoints endpoint,
    Map<String, dynamic>? queryParams,
    List<dynamic>? pathParameters,
  }) : this._(
          method: HTTPMethod.get,
          endpoint: endpoint,
          queryParams: queryParams,
          pathParameters: pathParameters,
        );

  APIProvider.put({
    required ApiEndpoints endpoint,
    Map<String, dynamic>? body,
    int? id,
  }) : this._(
          method: HTTPMethod.put,
          endpoint: endpoint,
          body: body,
          id: id,
        );

  APIProvider.patch({
    required ApiEndpoints endpoint,
    Map<String, dynamic>? body,
  }) : this._(
          method: HTTPMethod.patch,
          endpoint: endpoint,
          body: body,
        );

  APIProvider.delete({
    required ApiEndpoints endpoint,
    Map<String, dynamic>? body,
    int? id,
  }) : this._(
          method: HTTPMethod.delete,
          endpoint: endpoint,
          body: body,
          id: id,
        );

  Future<ApiResponseEntity> request() async {
    String path = endpoint.url;

    if (pathParameters?.isNotEmpty ?? false) {
      for (var parameter in pathParameters!) {
        path = path.replaceFirst(RegExp(r'%[a-z]'), parameter);
      }
    }

    final String url = 'http://localhost:3000/$path';
    final Dio dio = Dio();

    dio.options.method = method.string;
    body ??= {};

    if (headers != null) {
      dio.options.headers = headers;
    }

    if (method == HTTPMethod.post || method == HTTPMethod.put || method == HTTPMethod.patch) {
      dio.options.headers['Content-Type'] = 'application/json';
    }

    try {
      Response response;
      if (method == HTTPMethod.get) {
        response = await dio.request(url, queryParameters: queryParams);
      }else if (method == HTTPMethod.put || method == HTTPMethod.delete) {
        response = await dio.request('$url/$id', queryParameters: queryParams, data: body);
      } else {
        response = await dio.request(url, queryParameters: queryParams, data: body);
      }

      return _handleResponse(response);
    } catch (e) {
      if (e is DioException && e.response != null) {
        final response = _handleResponse(e.response);
        _handleErrorMessage(errorMessage: response.message, responseCode: response.responseCode);
      } else {
        _handleErrorMessage();
      }
    }

    return _handleResponse(null);
  }

  void _handleErrorMessage({String? errorMessage, int? responseCode, dynamic response}) {
    errorMessage = errorMessage ?? 'No nos hemos podido comunicar con el servidor. Intenta de nuevo más tarde';

    throw AppHTTPException(errorMessage, responseCode ?? 500, response);
  }

  ApiResponseEntity _handleResponse(Response<dynamic>? response) {
    ApiResponseModel apiResponse = ApiResponseModel();
    try {
      apiResponse = ApiResponseModel.fromJson(response?.data);
    } catch (e) {}
    apiResponse.response ??= response?.data;
    ApiResponseEntity soApiResponse = ApiResponseEntity.fromModel(apiResponse, responseCode: response?.statusCode);

    if ((response?.statusCode != 200 && response?.statusCode != 201) && soApiResponse.message.isEmpty) {
      soApiResponse.message = 'No nos hemos podido comunicar con el servidor. Intenta de nuevo más tarde';
    }
    soApiResponse.success = response?.statusCode == 200 || response?.statusCode == 201;

    return soApiResponse;
  }
}
