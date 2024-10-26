import 'package:dio/dio.dart';
import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/app_api_response_entity.dart';
import 'package:directory/data/domains/exceptions/app_http_exception.dart';
import 'package:directory/data/domains/models/app_api_response_model.dart';

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

  APIProvider._(
      {required this.method,
      required this.endpoint,
      this.headers,
      this.body,
      this.queryParams,
      this.pathParameters,
      this.bytesResponse = false});

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
  }) : this._(
          method: HTTPMethod.put,
          endpoint: endpoint,
          body: body,
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
  }) : this._(
          method: HTTPMethod.delete,
          endpoint: endpoint,
          body: body,
        );

  Future<AppApiResponseEntity> request() async {
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

    try {
      if (bytesResponse) {
        Response response =
            await dio.request(url, queryParameters: queryParams, data: body, options: Options(responseType: ResponseType.bytes));

        return AppApiResponseEntity(
            responseCode: response.statusCode, success: response.statusCode == 200, response: response.data);
      } else {
        Response response = await dio.request(url, queryParameters: queryParams, data: body);
        return _handleResponse(response);
      }
    } catch (e) {
      if (e is DioException && e.response != null && e.response?.data is Map) {
        final response = _handleResponse(e.response);
        _handleErrorMessage(errorMessage: response.message, responseCode: response.responseCode, response: e.response?.data);
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

  AppApiResponseEntity _handleResponse(Response<dynamic>? response) {
    final AppApiResponseModel apiResponse = AppApiResponseModel.fromJson(response?.data);
    AppApiResponseEntity soApiResponse = AppApiResponseEntity.fromModel(apiResponse, responseCode: response?.statusCode);

    if (response?.statusCode != 200 && soApiResponse.message.isEmpty) {
      soApiResponse.message = 'No nos hemos podido comunicar con el servidor. Intenta de nuevo más tarde';
    }

    return soApiResponse;
  }

  static Future<List<int>?> downloadFile(String url) async {
    List<int>? responseBytes;
    final Dio dio = Dio();
    final Response response = await dio.get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    if (response.statusCode == 200) {
      responseBytes = response.data;
    }

    return responseBytes;
  }
}
