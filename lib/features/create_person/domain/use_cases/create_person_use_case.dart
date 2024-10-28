import 'package:directory/features/create_person/domain/repositories/create_person_repository.dart';
import 'package:directory/data/domains/entitys/person_entity.dart';

class CreatePersonUseCase {
  final CreatePersonRepository _createPersonRepository;
  CreatePersonUseCase(this._createPersonRepository);

  Future<bool> execute(PersonEntity personEntity) async {
    PersonEntity? personEntityDB = await _createPersonRepository.savePersonDataBase(personEntity);
    if (personEntityDB == null) {
      return false;
    } else {
      await _createPersonRepository.sendPersonService(personEntityDB);
      return true;
    }
  }
}
