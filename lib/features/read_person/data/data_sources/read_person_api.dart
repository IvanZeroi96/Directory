import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/app_api_response_entity.dart';
import 'package:directory/data/providers/api_provider.dart';
import 'package:directory/features/read_person/domain/entities/person_entity.dart';

class ReadPersonApi {
  Future<List<PersonEntity>> getReadPersons() async {
    AppApiResponseEntity responseEntity = await APIProvider.get(
      endpoint: ApiEndpoints.getPersons,
    ).request();

    return [];
  }
}
