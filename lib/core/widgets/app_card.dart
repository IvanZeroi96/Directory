import 'package:directory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget? child;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double? borderWidth;
  final GestureTapCallback? onTap;

  const AppCard({
    super.key,
    this.elevation,
    this.padding,
    this.child,
    this.color,
    this.margin,
    this.borderColor,
    this.borderWidth,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: color ?? AppColors.backgroundCard,
        margin: margin,
        surfaceTintColor: color ?? AppColors.backgroundCard,
        elevation: elevation ?? 7.0,
        shadowColor: Colors.black.withOpacity(0.3),
        clipBehavior: Clip.hardEdge,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: borderWidth ?? 0.5,
              color: borderColor ?? Colors.transparent,
            )),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
