part of 'app_pages.dart';

abstract class Routes {
  static const ROOT = '/root';

  // Home
  static const HOME = '/home';
  static const DETAILS_POST = '/detailsPost';
  static const VIEW_PHOTO = '/viewPhoto';

  // Chat Flow
  static const CHAT_ROOM = '/chatRoom';
  static const INCOMMING_CALL = '/incommingCall';
  static const CALL = '/call';
  static const CALLING = '/calling';

  // Profile Flow
  static const SETTINGS = '/settings';
  static const CHOOSE_LANGUAGE = '/chooseLanguage';
  static const QR_SCAN = '/qrScan';
  static const EDIT_PROFILE = '/editProfile';
  static const EDIT_PHOTO = '/editPhoto';
}
