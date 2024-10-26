import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/app_api_response_entity.dart';
import 'package:directory/data/providers/api_provider.dart';

class DeletePersonApi {
  Future<bool> setDeleterson(int id) async {
    AppApiResponseEntity responseEntity = await APIProvider.delete(
      endpoint: ApiEndpoints.getPersons,
      body: {
        'id': id,
      }
    ).request();

    return false;
  }
}