import 'package:directory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    this.title = '',
    this.elevation,
    this.padding,
    this.child,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.primaryColor,
        textColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: child ??
            Text(
              title ?? '',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
      ),
    );
  }
}
