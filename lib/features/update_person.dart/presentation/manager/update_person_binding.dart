

import 'package:directory/features/update_person.dart/data/data_sources/update_person_api.dart';
import 'package:directory/features/update_person.dart/data/repositories/update_person_repository_impl.dart';
import 'package:directory/features/update_person.dart/domain/use_cases/update_get_data_person_use_case.dart';
import 'package:directory/features/update_person.dart/domain/use_cases/update_person_use_case.dart';
import 'package:directory/features/update_person.dart/presentation/manager/update_person_controller.dart';
import 'package:get/get.dart';

class UpdatePersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePersonApi());
    Get.lazyPut(() => UpdatePersonRepositoryImpl(Get.find<UpdatePersonApi>()));
    Get.lazyPut(() => UpdatePersonUseCase(Get.find<UpdatePersonRepositoryImpl>()));
    Get.lazyPut(() => UpdateGetDataPersonUseCase(Get.find<UpdatePersonRepositoryImpl>()));
    Get.lazyPut(() => UpdatePersonController(Get.find<UpdatePersonUseCase>(),Get.find<UpdateGetDataPersonUseCase>()));
  }
}
