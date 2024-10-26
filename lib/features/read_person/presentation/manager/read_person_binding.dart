import 'package:directory/features/delete_person/data/data_sources/delete_person_api.dart';
import 'package:directory/features/delete_person/data/repositories/delete_person_repository_impl.dart';
import 'package:directory/features/delete_person/domain/use_cases/delete_person_use_case.dart';
import 'package:directory/features/read_person/data/data_sources/read_person_api.dart';
import 'package:directory/features/read_person/data/repositories/read_person_repository_impl.dart';
import 'package:directory/features/read_person/domain/use_cases/read_person_use_case.dart';
import 'package:directory/features/read_person/presentation/manager/read_person_controller.dart';
import 'package:get/get.dart';

class ReadPersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReadPersonApi());
    Get.lazyPut(() => DeletePersonApi());

    Get.lazyPut(() => ReadPersonRepositoryImpl(Get.find<ReadPersonApi>()));
    Get.lazyPut(() => DeletePersonRepositoryImpl(Get.find<DeletePersonApi>()));

    Get.lazyPut(() => ReadPersonUseCase(Get.find<ReadPersonRepositoryImpl>()));
    Get.lazyPut(() => DeletePersonUseCase(Get.find<DeletePersonRepositoryImpl>()));

    Get.lazyPut(() => ReadPersonController(Get.find<ReadPersonUseCase>(),Get.find<DeletePersonUseCase>()));
  }
}
