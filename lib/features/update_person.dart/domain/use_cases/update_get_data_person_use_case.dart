import 'package:directory/data/domains/entitys/person_entity.dart';
import 'package:directory/features/update_person.dart/domain/repositories/update_person_repository.dart';

class UpdateGetDataPersonUseCase {
  final UpdatePersonRepository _updatePersonRepository;
  UpdateGetDataPersonUseCase(this._updatePersonRepository);

  Future<PersonEntity> execute(int id) async {
    PersonEntity personEntity = await _updatePersonRepository.updateGetPersonService(id);
    if(personEntity.name.isEmpty){
      return await _updatePersonRepository.updateGetPersonDataBase(id);
    }else{
      return personEntity;
    }
  }
}
