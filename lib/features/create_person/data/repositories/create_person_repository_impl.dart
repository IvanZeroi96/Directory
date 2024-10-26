import 'package:directory/core/manager/data_base_manager.dart';
import 'package:directory/features/create_person/data/data_sources/create_person_api.dart';
import 'package:directory/features/create_person/domain/repositories/create_person_repository.dart';
import 'package:flutter/material.dart';

class CreatePersonRepositoryImpl implements CreatePersonRepository {
  final CreatePersonApi _createPersonApi;
  CreatePersonRepositoryImpl(this._createPersonApi);

  @override
  Future<bool> sendPersonService(String name, String email, String age) async {
    try {
      final bool response = await _createPersonApi.createPerson(name, email, age);
      return response;
    } catch (e) {
      debugPrint('Error: _sendPersonService -> $e');
      return false;
    }
  }

  @override
  Future<bool> savePersonDataBase(String name, String email, String age) async {
    try {
      DatabaseManager databaseManager = DatabaseManager();
      return await databaseManager.insertPerson(name, email, age);
    } catch (e) {
      return false;
    }
  }
}
