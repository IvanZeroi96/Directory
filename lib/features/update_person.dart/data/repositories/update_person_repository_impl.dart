import 'package:directory/core/manager/data_base_manager.dart';
import 'package:directory/data/domains/entitys/person_entity.dart';
import 'package:directory/data/domains/models/person_model.dart';
import 'package:directory/features/update_person.dart/data/data_sources/update_person_api.dart';
import 'package:directory/features/update_person.dart/domain/repositories/update_person_repository.dart';
import 'package:flutter/material.dart';

class UpdatePersonRepositoryImpl implements UpdatePersonRepository {
  final UpdatePersonApi _updatePersonApi;
  UpdatePersonRepositoryImpl(this._updatePersonApi);

  @override
  Future<bool> updatePersonService(PersonEntity personEntity) async {
    try {
      final bool response = await _updatePersonApi.updatePerson(personEntity);
      return response;
    } catch (e) {
      debugPrint('Error: _updatePersonService -> $e');
      return false;
    }
  }

  @override
  Future<bool> updatePersonDataBase(PersonEntity personEntity) async {
    try {
      DatabaseManager databaseManager = DatabaseManager();
      return await databaseManager.updatePerson(personEntity);
    } catch (e) {
      debugPrint('Error: _updatePersonDataBase -> $e');
      return false;
    }
  }

  @override
  Future<PersonEntity> updateGetPersonDataBase(int id) async {
    try {
      DatabaseManager databaseManager = DatabaseManager();
      return await databaseManager.getPerson(id);
    } catch (e) {
      debugPrint('Error: _updateGetPersonDataBase-> $e');
      return PersonEntity();
    }
  }

  @override
  Future<PersonEntity> updateGetPersonService(int id) async {
    try {
      PersonModel personModel = await _updatePersonApi.updateGetPerson(id);
      return PersonEntity.fromModel(personModel);
    } catch (e) {
      debugPrint('Error: _updateGetPersonService -> $e');
      return PersonEntity();
    }
  }
}
