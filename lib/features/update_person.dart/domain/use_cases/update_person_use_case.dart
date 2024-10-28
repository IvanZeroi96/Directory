
import 'package:directory/data/domains/entitys/person_entity.dart';
import 'package:directory/features/update_person.dart/domain/repositories/update_person_repository.dart';

class UpdatePersonUseCase {
  final UpdatePersonRepository _updatePersonRepository;
  UpdatePersonUseCase(this._updatePersonRepository);

  Future<bool> execute(PersonEntity personEntity) async {
    await _updatePersonRepository.updatePersonService(personEntity);
    return await _updatePersonRepository.updatePersonDataBase(personEntity);
  }
}
