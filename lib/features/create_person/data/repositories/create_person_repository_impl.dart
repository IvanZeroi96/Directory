import 'package:directory/core/manager/data_base_manager.dart';
import 'package:directory/features/create_person/data/data_sources/create_person_api.dart';
import 'package:directory/features/create_person/domain/repositories/create_person_repository.dart';
import 'package:directory/data/domains/entitys/person_entity.dart';
import 'package:flutter/material.dart';

class CreatePersonRepositoryImpl implements CreatePersonRepository {
  final CreatePersonApi _createPersonApi;
  CreatePersonRepositoryImpl(this._createPersonApi);

  @override
  Future<bool> sendPersonService(PersonEntity personEntity) async {
    try {
      final bool response = await _createPersonApi.createPerson(personEntity);
      return response;
    } catch (e) {
      debugPrint('Error: _sendPersonService -> $e');
      return false;
    }
  }

  @override
  Future<PersonEntity?> savePersonDataBase(PersonEntity personEntity) async {
    try {
      DatabaseManager databaseManager = DatabaseManager();
      bool isSuccess = await databaseManager.insertPerson(personEntity);
      if(isSuccess){
        return await databaseManager.getLastPerson();
      }
      return null;
    } catch (e) {
      debugPrint('Error: _savePersonDataBase -> $e');
      return null;
    }
  }
}
