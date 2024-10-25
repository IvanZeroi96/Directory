import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppColors {
  static ThemeMode themeMode = ThemeMode.system;
  static bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      return PlatformDispatcher.instance.platformBrightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  static const primaryColor = Color(0xFFC91959);
  static const secondaryColor = Color(0xFF640207);

  static Color get textColor => isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF272D3B);
  static Color get backgroundScaffold => isDarkMode ? const Color(0xFF0D0F11) : const Color(0xFFF6F6F6);
  static Color get backgroundCard => isDarkMode ? const Color(0xFF1A1D22) : const Color(0xFFFFFFFF);
}
