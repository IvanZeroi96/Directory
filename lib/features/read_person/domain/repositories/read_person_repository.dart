import 'package:directory/data/domains/entitys/person_entity.dart';

abstract class ReadPersonRepository {
  Future<List<PersonEntity>> getPersonsService();
  Future<List<PersonEntity>> getPersonsDB();
}
