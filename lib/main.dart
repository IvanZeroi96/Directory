import 'package:directory/core/utils/app_colors.dart';
import 'package:directory/core/utils/app_pages.dart';
import 'package:directory/core/utils/app_themes.dart';
import 'package:directory/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Directory',
      themeMode: AppColors.themeMode,
      theme: getThemeData(),
      darkTheme: getThemeData(),
      debugShowCheckedModeBanner: true,
      initialRoute: SplashPage.routeName,
      getPages: AppPages.routes,
    );
  }
}
