import 'package:directory/data/domains/entitys/person_entity.dart';

abstract class UpdatePersonRepository {
  Future<bool> updatePersonService(PersonEntity personEntity);
  Future<bool> updatePersonDataBase(PersonEntity personEntity);
  Future<PersonEntity> updateGetPersonService(int id);
  Future<PersonEntity> updateGetPersonDataBase(int id);
}