import 'package:directory/features/create_person/data/data_sources/create_person_api.dart';
import 'package:directory/features/create_person/data/repositories/create_person_repository_impl.dart';
import 'package:directory/features/create_person/domain/use_cases/create_person_use_case.dart';
import 'package:directory/features/create_person/presentation/manager/create_person_controller.dart';
import 'package:get/get.dart';

class CreatePersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePersonApi());
    Get.lazyPut(() => CreatePersonRepositoryImpl(Get.find<CreatePersonApi>()));
    Get.lazyPut(() => CreatePersonUseCase(Get.find<CreatePersonRepositoryImpl>()));
    Get.lazyPut(() => CreatePersonController(Get.find<CreatePersonUseCase>()));
  }
}
