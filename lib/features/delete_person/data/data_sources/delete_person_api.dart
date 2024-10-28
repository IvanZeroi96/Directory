import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/api_response_entity.dart';
import 'package:directory/data/providers/api_provider.dart';

class DeletePersonApi {
  Future<bool> setDeleterson(int id) async {
    ApiResponseEntity responseEntity = await APIProvider.delete(
      endpoint: ApiEndpoints.getPersons,
      id: id,
    ).request();

    return responseEntity.success;
  }
}