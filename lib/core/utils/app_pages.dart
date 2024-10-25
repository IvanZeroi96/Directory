
import 'package:directory/features/create_person/presentation/manager/create_person_binding.dart';
import 'package:directory/features/create_person/presentation/pages/create_person_page.dart';
import 'package:directory/features/read_person/presentation/manager/read_person_binding.dart';
import 'package:directory/features/read_person/presentation/pages/read_person_page.dart';
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
    GetPage(
      name: ReadPersonPage.routeName,
      page: () => const ReadPersonPage(),
      binding: ReadPersonBinding(),
      transition: route.Transition.fadeIn,
      transitionDuration: const Duration(
        milliseconds: 1000,
      ),
    ),
    GetPage(
      name: CreatePersonPage.routeName,
      page: () => const CreatePersonPage(),
      binding: CreatePersonBinding(),
      transition: route.Transition.fadeIn,
      transitionDuration: const Duration(
        milliseconds: 900,
      ),
    ),
  ];
}
