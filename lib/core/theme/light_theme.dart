import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// =======================================================
/// THÈME CLAIR DE MEDICARE
/// =======================================================
class LightTheme {

  static ThemeData theme = ThemeData(

    useMaterial3: true,

    scaffoldBackgroundColor:
    AppColors.background,

    primaryColor:
    AppColors.primary,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(

        backgroundColor:
        AppColors.primary,

        foregroundColor:
        Colors.white,

        minimumSize:
        const Size(double.infinity, 55),
      ),
    ),
  );
}