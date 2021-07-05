import 'package:get/get.dart';
import 'package:whoru/src/app.dart';
import 'package:whoru/src/helpers/view_image/view_image.dart';
import 'package:whoru/src/pages/calling/pages/incomming_call_page.dart';
import 'package:whoru/src/pages/chat/pages/room_page.dart';
import 'package:whoru/src/pages/profile/pages/edit_profile_page.dart';
import 'package:whoru/src/pages/profile/pages/editor_page.dart';
import 'package:whoru/src/pages/profile/pages/settings_page.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => App(),
    ),

    // Home
    GetPage(
      name: Routes.VIEW_PHOTO,
      page: () => PageViewGallery(
          initImageList: Get.arguments['listPhoto'],
          initPosition: Get.arguments['index']),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
    ),

    // Chat Flow
    GetPage(
      name: Routes.CHAT_ROOM,
      page: () => RoomPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.INCOMMING_CALL,
      page: () => IncommingCallPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
    ),

    // Profile Page
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => EditProfilePage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
    ),
    GetPage(
      name: Routes.EDIT_PHOTO,
      page: () => EditorPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
    ),
  ];
}
