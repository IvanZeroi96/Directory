import 'package:directory/core/manager/data_base_manager.dart';
import 'package:directory/features/read_person/data/data_sources/read_person_api.dart';
import 'package:directory/features/read_person/domain/entities/person_entity.dart';
import 'package:directory/features/read_person/domain/repositories/read_person_repository.dart';
import 'package:flutter/material.dart';

class ReadPersonRepositoryImpl implements ReadPersonRepository {
  final ReadPersonApi _readPersonApi;
  ReadPersonRepositoryImpl(this._readPersonApi);

  @override
  Future<List<PersonEntity>> getPersonsService() async {
    try {
      List<PersonEntity> listPersons = await _readPersonApi.getReadPersons();
      return listPersons;
    } catch (e) {
      debugPrint('Error: _getPersonService -> $e');
      return [];
    }
  }

  @override
  Future<List<PersonEntity>> getPersonsDB() async {
    try {
      DatabaseManager databaseManager = DatabaseManager();
      return await databaseManager.getPersons();
    } catch (e) {
      return [];
    }
  }
}
