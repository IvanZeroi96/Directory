import 'package:directory/features/delete_person/domain/repositories/delete_person_repository.dart';

class DeletePersonUseCase {
  final DeletePersonRepository _deletePersonRepository;
  DeletePersonUseCase(this._deletePersonRepository);

  Future<bool> execute(int id) async {
    bool isSuccessService = await _deletePersonRepository.setDeletePersonsService(id);
    bool isSuccessDatabase = await _deletePersonRepository.deletePersonsDataBase(id);
    return isSuccessDatabase;
  }
}