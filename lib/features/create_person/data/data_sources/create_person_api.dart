import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/api_response_entity.dart';
import 'package:directory/data/providers/api_provider.dart';
import 'package:directory/data/domains/entitys/person_entity.dart';

class CreatePersonApi {
  Future<bool> createPerson(PersonEntity personEntity) async {
    ApiResponseEntity responseEntity = await APIProvider.post(
      endpoint: ApiEndpoints.setPerson,
      body: {
        'id': personEntity.id.toString(),
        'name': personEntity.name,
        'email': personEntity.email,
        'age': personEntity.age
      },
    ).request();

     return responseEntity.success;
  }
}
