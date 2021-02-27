import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/app.dart';
import 'package:whoru/src/lang/translation_service.dart';
import 'package:whoru/src/pages/chat/pages/room_page.dart';
import 'package:whoru/src/pages/profile/pages/edit_profile_page.dart';
import 'package:whoru/src/pages/profile/pages/editor_page.dart';
import 'package:whoru/src/pages/profile/pages/settings_page.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Whoru',
    //showPerformanceOverlay: true,
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
      GetPage(
        name: '/room',
        page: () => RoomPage(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 250),
      ),

      // Profile Page
      GetPage(
        name: '/settings',
        page: () => SettingsPage(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: '/editProfile',
        page: () => EditProfilePage(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 250),
      ),
      GetPage(
        name: '/editor',
        page: () => EditorPage(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 250),
      ),
    ],
  ));
}
