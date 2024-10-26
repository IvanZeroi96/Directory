import 'package:directory/features/read_person/domain/entities/person_entity.dart';

abstract class ReadPersonRepository {
  Future<List<PersonEntity>> getPersonsService();
  Future<List<PersonEntity>> getPersonsDB();
}
