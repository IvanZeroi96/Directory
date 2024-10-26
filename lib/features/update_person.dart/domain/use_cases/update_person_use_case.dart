
import 'package:directory/features/read_person/domain/entities/person_entity.dart';
import 'package:directory/features/update_person.dart/domain/repositories/update_person_repository.dart';

class UpdatePersonUseCase {
  final UpdatePersonRepository _updatePersonRepository;
  UpdatePersonUseCase(this._updatePersonRepository);

  Future<bool> execute(PersonEntity personEntity) async {
    _updatePersonRepository.updatePersonService(personEntity);
    return await _updatePersonRepository.updatePersonDataBase(personEntity);
  }
}
