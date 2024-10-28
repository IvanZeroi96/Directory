import 'package:directory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppCircularProgress extends StatelessWidget {
  final double width;
  final double height;
  final double stokeWidth;

  const AppCircularProgress({
    super.key,
    this.width = 40.0,
    this.height = 40.0,
    this.stokeWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
        backgroundColor: AppColors.secondaryColor,
        strokeWidth: stokeWidth,
      ),
    );
  }
}
