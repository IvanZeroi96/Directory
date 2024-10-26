import 'package:directory/features/read_person/domain/entities/person_entity.dart';
import 'package:directory/features/read_person/domain/repositories/read_person_repository.dart';

class ReadPersonUseCase {
  final ReadPersonRepository _readPersonRepository;
  ReadPersonUseCase(this._readPersonRepository);

  Future<List<PersonEntity>> execute() async {
    bool isSuccess = await _readPersonRepository.getPersonsService();
    if(!isSuccess){
      return await _readPersonRepository.getPersonsDB();
    }
    return [];
  }
}