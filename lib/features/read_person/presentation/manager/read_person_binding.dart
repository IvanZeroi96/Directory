import 'package:directory/features/read_person/presentation/manager/read_person_controller.dart';
import 'package:get/get.dart';

class ReadPersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReadPersonController());
  }
}
