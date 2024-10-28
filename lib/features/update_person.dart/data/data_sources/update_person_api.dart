import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/api_response_entity.dart';
import 'package:directory/data/domains/models/person_model.dart';
import 'package:directory/data/providers/api_provider.dart';
import 'package:directory/data/domains/entitys/person_entity.dart';

class UpdatePersonApi {
  Future<bool> updatePerson(PersonEntity personEntity) async {
    ApiResponseEntity responseEntity = await APIProvider.put(
      endpoint: ApiEndpoints.setPerson,
      id: personEntity.id,
      body: {
        'id': personEntity.id,
        'name': personEntity.name,
        'email': personEntity.email,
        'age': personEntity.age
      },
    ).request();

    return responseEntity.success;
  }

  Future<PersonModel> updateGetPerson(int id) async {
    ApiResponseEntity responseEntity = await APIProvider.get(
      endpoint: ApiEndpoints.setPerson,
      queryParams: {
        'id': id,
      },
    ).request();

    List<PersonModel> personModelList = PersonModel.fromJsonList(responseEntity.response);
    return personModelList.isEmpty? PersonModel() : personModelList.first;
  }
}
