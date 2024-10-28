
import 'package:get/get.dart';

abstract class AppGetXController extends GetxController {
  bool _loading = false;
  bool get loading => _loading;

  void showProgressHUD() {
    _loading = true;
    update(['so-loading-controller-xyz']);
  }

  void dismissProgressHUD() {
    _loading = false;
    update(['so-loading-controller-xyz']);
  }
}
