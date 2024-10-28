import 'package:directory/data/domains/entitys/person_entity.dart';

abstract class CreatePersonRepository {
  Future<bool> sendPersonService(PersonEntity personEntity);
  Future<PersonEntity?> savePersonDataBase(PersonEntity personEntity);
}
