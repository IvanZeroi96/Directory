import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/app_api_response_entity.dart';
import 'package:directory/data/providers/api_provider.dart';
import 'package:directory/features/read_person/domain/entities/person_entity.dart';

class UpdatePersonApi {
  Future<bool> updatePerson(PersonEntity personEntity) async {
    AppApiResponseEntity responseEntity = await APIProvider.put(
      endpoint: ApiEndpoints.setPerson,
      body: {
        'id': personEntity.id,
        'name': personEntity.name,
        'email': personEntity.email,
        'age': personEntity.age
      },
    ).request();

    return false;
  }

  Future<PersonEntity> updateGetPerson(int id) async {
    AppApiResponseEntity responseEntity = await APIProvider.get(
      endpoint: ApiEndpoints.setPerson,
      queryParams: {
        'id': id,
      },
    ).request();

    return PersonEntity();
  }
}
