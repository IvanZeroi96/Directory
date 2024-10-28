import 'package:directory/core/manager/data_base_manager.dart';
import 'package:directory/features/delete_person/data/data_sources/delete_person_api.dart';
import 'package:directory/features/delete_person/domain/repositories/delete_person_repository.dart';
import 'package:flutter/material.dart';

class DeletePersonRepositoryImpl implements DeletePersonRepository {
  final DeletePersonApi _deletePersonApi;
  DeletePersonRepositoryImpl(this._deletePersonApi);

  @override
  Future<bool> deletePersonsDataBase(int id) async {
    try {
      DatabaseManager databaseManager = DatabaseManager();
      return await databaseManager.deletePerson(id);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> setDeletePersonsService(int id) async {
    try {
      final bool response = await _deletePersonApi.setDeleterson(id);
      return response;
    } catch (e) {
      debugPrint('Error: _setDeletePersonsService -> $e');
      return false;
    }
  }
}
