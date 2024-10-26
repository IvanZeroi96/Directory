import 'package:directory/features/read_person/domain/entities/person_entity.dart';

abstract class UpdatePersonRepository {
  Future<bool> updatePersonService(String name, String email, String age);
  Future<bool> updatePersonDataBase(String name, String email, String age);
  Future<PersonEntity> updateGetPersonService(int id);
  Future<PersonEntity> updateGetPersonDataBase(int id);
}