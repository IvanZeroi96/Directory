import 'dart:ui';
import 'package:directory/core/manager/app_getx_controller.dart';
import 'package:directory/core/widgets/app_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLoadingPage<T extends AppGetXController> extends StatelessWidget {
  final Widget child;
  final T? init;

  const AppLoadingPage({
    super.key,
    required this.child,
    this.init,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: init,
      builder: (_) {
        return Stack(
          children: [
            child,
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: GetBuilder<T>(
                id: 'so-loading-controller-xyz',
                builder: (_) => _.loading
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: const Center(
                            child: SafeArea(
                              child: Center(
                                child: AppCircularProgress(
                                  width: 60,
                                  height: 60,
                                )
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ),
            ),
          ],
        );
      },
    );
  }
}
