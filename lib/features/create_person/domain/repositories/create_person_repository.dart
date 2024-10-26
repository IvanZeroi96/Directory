import 'package:directory/features/read_person/domain/entities/person_entity.dart';

abstract class CreatePersonRepository {
  Future<bool> sendPersonService(PersonEntity personEntity);
  Future<bool> savePersonDataBase(PersonEntity personEntity);
}
