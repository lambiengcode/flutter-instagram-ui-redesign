import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/lang/translation_service.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/themes/themes.dart';
import 'package:whoru/src/utils/logger/logger.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
      //showPerformanceOverlay: true,
      title: 'Whoru',
      enableLog: true,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light().data,
      darkTheme: AppTheme.dark().data,
      themeMode: ThemeService().getThemeMode(),
      logWriterCallback: Logger.write,
    );
  }));
}
