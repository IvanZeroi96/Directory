import 'package:directory/core/manager/app_getx_controller.dart';
import 'package:directory/core/utils/app_regex_validations.dart';
import 'package:directory/core/utils/commons.dart';
import 'package:directory/data/domains/entitys/person_entity.dart';
import 'package:directory/features/update_person.dart/domain/use_cases/update_get_data_person_use_case.dart';
import 'package:directory/features/update_person.dart/domain/use_cases/update_person_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePersonController extends AppGetXController {
  final UpdatePersonUseCase _updatePersonUseCase;
  final UpdateGetDataPersonUseCase _updateGetDataPersonUseCase;
  UpdatePersonController(this._updatePersonUseCase, this._updateGetDataPersonUseCase);

  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  GlobalKey<FormState> get formKeyRegister => _formKeyRegister;

  final TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController get nameTextEditingController => _nameTextEditingController;

  final TextEditingController _emailTextController = TextEditingController();
  TextEditingController get emailTextController => _emailTextController;

  final TextEditingController _ageTextController = TextEditingController();
  TextEditingController get ageTextController => _ageTextController;

  @override
  void onInit() {
    int id = Get.arguments['id'] ?? '';
    getDataProspect(id);
    super.onInit();
  }

  void getDataProspect(int id) async {
    try {
      showProgressHUD();
      PersonEntity personEntity = await _updateGetDataPersonUseCase.execute(id);
      _nameTextEditingController.text = personEntity.name;
      _emailTextController.text = personEntity.email;
      _ageTextController.text = personEntity.age;
      dismissProgressHUD();
      update();
      if(personEntity.name.isEmpty){
        Common.showSnackBar(Get.context!, 'Contacto no encontrado.');
        Get.back();
      }
    } catch (e) {
      debugPrint('Error: _getDataProspect -> $e');
      Common.showSnackBar(Get.context!, 'Contacto no encontrado.');
      dismissProgressHUD();
      Get.back();
    }
  }

  String? validateName(String? value) {
    if (_nameTextEditingController.text.trim().isEmpty) {
      return 'Campo obligatorio.';
    } else if (!RegExValidation.text(_nameTextEditingController.text, '') && _nameTextEditingController.text.isNotEmpty) {
      return 'Caracteres no validos.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (_emailTextController.text.isEmpty) {
      return 'Campo obligatorio.';
    } else if (!GetUtils.isEmail(_emailTextController.text.trim()) && _emailTextController.text.isNotEmpty) {
      return 'Ingresa un correo válido.';
    }
    return null;
  }

  String? validateAge(String? value) {
    if (_ageTextController.text.trim().isEmpty) {
      return 'Campo obligatorio.';
    } else if (!RegExValidation.numeric(_ageTextController.text, decimal: false) && _ageTextController.text.isNotEmpty) {
      return 'Caracteres no validos.';
    } else if (int.parse(_ageTextController.text) <= 0) {
      return 'La edad debe ser mayor a 0 años';
    }
    return null;
  }

  void verifyRegistration() async {
    try {
      showProgressHUD();
      if (_formKeyRegister.currentState!.validate()) {
        var isSuccess = await _updatePersonUseCase.execute(
          PersonEntity(
            id: Get.arguments['id'] ?? 0,
            name: _nameTextEditingController.text,
            email: _emailTextController.text,
            age: _ageTextController.text,
          )
        );
        if (isSuccess) {
          Common.showSnackBar(Get.context!, 'Contacto actualizado correctamente.');
          Get.back(result: true);
        } else {
          Common.showSnackBar(Get.context!, 'Contacto no actualizado.');
        }
        dismissProgressHUD();
      } else {
        Common.showSnackBar(Get.context!, 'Faltan datos requeridos.');
        dismissProgressHUD();
      }
    } catch (e) {
      debugPrint('Error: _verifyRegistration -> $e');
      Common.showSnackBar(Get.context!, 'Contacto no actualizado.');
      dismissProgressHUD();
    }
  }
}
