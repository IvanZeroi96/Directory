import 'package:directory/core/manager/app_getx_controller.dart';
import 'package:directory/features/create_person/presentation/pages/create_person_page.dart';
import 'package:directory/features/delete_person/domain/use_cases/delete_person_use_case.dart';
import 'package:directory/features/read_person/domain/entities/person_entity.dart';
import 'package:directory/features/read_person/domain/use_cases/read_person_use_case.dart';
import 'package:directory/features/update_person.dart/presentation/pages/update_person_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadPersonController extends AppGetXController {
  final ReadPersonUseCase _readPersonUseCase;
  final DeletePersonUseCase _deletePersonUseCase;
  ReadPersonController(this._readPersonUseCase,this._deletePersonUseCase);

  List<PersonEntity> _listPerson = [];
  List<PersonEntity> get listPerson => _listPerson;


  @override
  void onInit() {
    _getContacts();
    super.onInit();
  }

  Future<void> _getContacts() async {
    try {
      showProgressHUD();
      _listPerson = await _readPersonUseCase.execute();
      dismissProgressHUD();
      update(['list_person']);
    } catch (e) {
      debugPrint('Error: _readPersonUseCase -> $e');
      dismissProgressHUD();
      update(['list_person']);
    }
  }

  void goToCreatePerson() async {
    var result = await Get.toNamed(CreatePersonPage.routeName);
    if(result != null){
      _getContacts();
    }
  }

  void goToEditPerson(int id) async {
    var result = await Get.toNamed(UpdatePersonPage.routeName,arguments: {'id': id});
    if(result != null){
      _getContacts();
    }
  }

  Future<void> setDeletePerson(int id) async {
    try {
      showProgressHUD();
      await _deletePersonUseCase.execute(id);
      dismissProgressHUD();
      _getContacts();
    } catch (e) {
      debugPrint('Error: _readPersonUseCase -> $e');
      dismissProgressHUD();
      update(['list_person']);
      _getContacts();
    }
  }
}
