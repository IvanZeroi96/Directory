import 'package:directory/features/create_person/domain/repositories/create_person_repository.dart';

class CreatePersonUseCase {
  final CreatePersonRepository _createPersonRepository;
  CreatePersonUseCase(this._createPersonRepository);

  Future<bool> execute(String name, String email, String age) async {
    bool isSuccess = await _createPersonRepository.sendPersonService(name, email, age);
    return await _createPersonRepository.savePersonDataBase(name, email, age);
  }
}
