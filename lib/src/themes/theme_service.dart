import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeService {
  switchStatusColor(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: isDark
          ? GetPlatform.isAndroid
              ? Brightness.light
              : Brightness.dark
          : GetPlatform.isAndroid
              ? Brightness.dark
              : Brightness.light,
      statusBarIconBrightness: isDark
          ? GetPlatform.isAndroid
              ? Brightness.light
              : Brightness.dark
          : GetPlatform.isAndroid
              ? Brightness.dark
              : Brightness.light,
    ));
  }

  final storageKey = 'isDarkMode';

  ThemeMode getThemeMode() {
    switchStatusColor(true);
    return ThemeMode.dark;
  }

  // bool isSavedDarkMode() {
  //   return _getStorage.read(storageKey) ?? false;
  // }

  // void saveThemeMode(bool isDarkMode) {
  //   _getStorage.write(storageKey, isDarkMode);
  // }

  void changeThemeMode() {
    // Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    // saveThemeMode(!isSavedDarkMode());
  }
}
