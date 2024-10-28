import 'dart:async';
import 'package:directory/features/read_person/presentation/pages/read_person_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Get.offNamed(ReadPersonPage.routeName);
      },
    );
  }
}
