import 'package:directory/data/domains/api_end_points.dart';
import 'package:directory/data/domains/entitys/app_api_response_entity.dart';
import 'package:directory/data/providers/api_provider.dart';

class ReadPersonApi {
  Future<bool> getReadPersons() async {
    AppApiResponseEntity responseEntity = await APIProvider.get(
      endpoint: ApiEndpoints.getPersons,
    ).request();

    return false;
  }
}
