import 'package:directory/core/utils/app_colors.dart';
import 'package:directory/features/splash/presentation/manager/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.8],
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
              tileMode: TileMode.clamp,
            )),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.contacts_outlined,
                    size: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 200),
                  Text(
                    'Bienvenido a tu directorio',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
