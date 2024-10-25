import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/app_api_response_entity.dart';
import 'package:directory/data/providers/api_provider.dart';

class CreatePersonApi {
  Future<bool> createPerson(String name, String email, String age) async {
    AppApiResponseEntity responseEntity = await APIProvider.post(
      endpoint: ApiEndpoints.setPerson,
      body: {
        'name': name,
        'email': email,
        'age': age
      },
    ).request();

     return false;
  }
}
