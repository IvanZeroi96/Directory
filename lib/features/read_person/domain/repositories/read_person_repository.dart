import 'package:directory/features/read_person/domain/entities/person_entity.dart';

abstract class ReadPersonRepository {
  Future<bool> getPersonsService();
  Future<List<PersonEntity>> getPersonsDB();
  Future<bool> savePersonsDataBase();
}
