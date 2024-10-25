import 'package:directory/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData getThemeData() => ThemeData(
  fontFamily: 'Montserrat',
  primarySwatch: Colors.blue,
  brightness: AppColors.isDarkMode ? Brightness.dark : Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundScaffold,
  cardColor: AppColors.backgroundCard,
  useMaterial3: true,
  textTheme: TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      color: AppColors.textColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColors.textColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: AppColors.textColor,
    ),
    labelSmall: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    labelMedium: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    labelLarge: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    displaySmall: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    displayMedium: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    displayLarge: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.appBarColor,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    elevation: 0,
    surfaceTintColor: AppColors.appBarColor,
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: CircleBorder(),
    backgroundColor: AppColors.primaryColor,
  ),
  iconTheme: IconThemeData(
    color: AppColors.iconColor,
    size: 35,
  ),
  primaryIconTheme: IconThemeData(
    color: AppColors.iconColor,
    size: 30,
  ),
);