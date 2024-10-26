
import 'package:directory/features/update_person.dart/domain/repositories/update_person_repository.dart';

class UpdatePersonUseCase {
  final UpdatePersonRepository _updatePersonRepository;
  UpdatePersonUseCase(this._updatePersonRepository);

  Future<bool> execute(String name, String email, String age) async {
    bool isSuccess = await _updatePersonRepository.updatePersonService(name, email, age);
    return await _updatePersonRepository.updatePersonDataBase(name, email, age);
  }
}
