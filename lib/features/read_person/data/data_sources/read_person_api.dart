import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/api_response_entity.dart';
import 'package:directory/data/domains/models/person_model.dart';
import 'package:directory/data/providers/api_provider.dart';

class ReadPersonApi {
  Future<List<PersonModel>> getReadPersons() async {
    ApiResponseEntity responseEntity = await APIProvider.get(
      endpoint: ApiEndpoints.getPersons,
    ).request();

    if (responseEntity.response != null) {
      return PersonModel.fromJsonList(responseEntity.response);
    } else {
      return [];
    }
  }
}
