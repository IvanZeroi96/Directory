import 'package:directory/features/create_person/domain/repositories/create_person_repository.dart';
import 'package:directory/features/read_person/domain/entities/person_entity.dart';

class CreatePersonUseCase {
  final CreatePersonRepository _createPersonRepository;
  CreatePersonUseCase(this._createPersonRepository);

  Future<bool> execute(PersonEntity personEntity) async {
    await _createPersonRepository.sendPersonService(personEntity);
    return await _createPersonRepository.savePersonDataBase(personEntity);
  }
}
