import 'package:directory/features/delete_person/domain/repositories/delete_person_repository.dart';

class DeletePersonUseCase {
  final DeletePersonRepository _deletePersonRepository;
  DeletePersonUseCase(this._deletePersonRepository);

  Future<bool> execute(int id) async {
    await _deletePersonRepository.setDeletePersonsService(id);
    bool isSuccess = await _deletePersonRepository.deletePersonsDataBase(id);
    return isSuccess;
  }
}