import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/app_api_response_entity.dart';
import 'package:directory/data/providers/api_provider.dart';

class UpdatePersonApi {
  Future<bool> updatePerson(String name, String email, String age) async {
    AppApiResponseEntity responseEntity = await APIProvider.put(
      endpoint: ApiEndpoints.setPerson,
      body: {
        'name': name,
        'email': email,
        'age': age
      },
    ).request();

    return false;
  }

  Future<bool> updateGetPerson(int id) async {
    AppApiResponseEntity responseEntity = await APIProvider.get(
      endpoint: ApiEndpoints.setPerson,
      queryParams: {
        'id': id,
      },
    ).request();

    return false;
  }
}
