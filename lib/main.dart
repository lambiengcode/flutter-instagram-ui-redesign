import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/lang/translation_service.dart';
import 'package:whoru/src/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    //showPerformanceOverlay: true,
    title: 'Whoru',
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.native,
    locale: TranslationService.locale,
    fallbackLocale: TranslationService.fallbackLocale,
    translations: TranslationService(),
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
