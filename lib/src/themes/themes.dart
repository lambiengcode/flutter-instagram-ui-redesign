import 'package:flutter/material.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_text_theme.dart';

class AppTheme {
  AppTheme({
    @required this.mode,
    @required this.data,
    @required this.textTheme,
    @required this.appColors,
  });

  factory AppTheme.light() {
    final mode = ThemeMode.light;
    final appColors = AppColors.light();
    final themeData = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: appColors.background,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline2: TextStyle(color: appColors.background),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColors.background,
        selectedItemColor: colorPrimary,
      ),
      scaffoldBackgroundColor: appColors.background,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  factory AppTheme.dark() {
    final mode = ThemeMode.dark;
    final appColors = AppColors.dark();
    final themeData = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: appColors.background,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline2: TextStyle(color: appColors.background),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColors.background,
        selectedItemColor: colorPrimary,
      ),
      scaffoldBackgroundColor: appColors.background,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: appColors.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
    return AppTheme(
      mode: mode,
      data: themeData,
      textTheme: AppTextTheme(),
      appColors: appColors,
    );
  }

  final ThemeMode mode;
  final ThemeData data;
  final AppTextTheme textTheme;
  final AppColors appColors;
}
