import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/app.dart';
import 'package:whoru/src/lang/translation_service.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Secret App',
    debugShowCheckedModeBanner: false,
    initialRoute: '/root',
    defaultTransition: Transition.native,
    locale: TranslationService.locale,
    fallbackLocale: TranslationService.fallbackLocale,
    translations: TranslationService(),
    getPages: [
      GetPage(
        name: '/root',
        page: () => App(),
      ),
    ],
  ));
}
