import 'package:directory/core/manager/app_getx_controller.dart';
import 'package:directory/features/create_person/presentation/pages/create_person_page.dart';
import 'package:get/get.dart';

class ReadPersonController extends AppGetXController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void goToCreatePerson() {
    Get.toNamed(CreatePersonPage.routeName);
  }
}
