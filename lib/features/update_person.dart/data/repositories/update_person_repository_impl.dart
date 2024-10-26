import 'package:directory/core/manager/data_base_manager.dart';
import 'package:directory/features/read_person/domain/entities/person_entity.dart';
import 'package:directory/features/update_person.dart/data/data_sources/update_person_api.dart';
import 'package:directory/features/update_person.dart/domain/repositories/update_person_repository.dart';
import 'package:flutter/material.dart';

class UpdatePersonRepositoryImpl implements UpdatePersonRepository {
  final UpdatePersonApi _updatePersonApi;
  UpdatePersonRepositoryImpl(this._updatePersonApi);

  @override
  Future<bool> updatePersonService(String name, String email, String age) async {
    try {
      final bool response = await _updatePersonApi.updatePerson(name, email, age);
      return response;
    } catch (e) {
      debugPrint('Error: _sendPersonService -> $e');
      return false;
    }
  }

  @override
  Future<bool> updatePersonDataBase(String name, String email, String age) async {
    try {
      DatabaseManager databaseManager = DatabaseManager();
      return await databaseManager.insertPerson(name, email, age);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<PersonEntity> updateGetPersonDataBase(int id) async {
    try {
      DatabaseManager databaseManager = DatabaseManager();
      return await databaseManager.getPerson(id);
    } catch (e) {
      return PersonEntity();
    }
  }

  @override
  Future<PersonEntity> updateGetPersonService(int id) async {
    try {
      final bool response = await _updatePersonApi.updateGetPerson(id);
      return PersonEntity();
    } catch (e) {
      debugPrint('Error: _sendPersonService -> $e');
      return PersonEntity();
    }
  }
}
