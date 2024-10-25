
import 'package:directory/features/splash/presentation/manager/splash_binding.dart';
import 'package:directory/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart' as route;

class AppPages {
  static final routes = [
    GetPage(
      name: SplashPage.routeName,
      binding: SplashBinding(),
      page: () => const SplashPage(),
    ),
  ];
}
