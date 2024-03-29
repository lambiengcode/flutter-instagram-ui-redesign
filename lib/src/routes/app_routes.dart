part of 'app_pages.dart';

abstract class Routes {
  static const ROOT = '/root';

  // Home
  static const HOME = '/home';
  static const DETAILS_POST = '/detailsPost';
  static const VIEW_PHOTO = '/viewPhoto';
  static const NOTIFICATION = '/notification';
  static const PICK_MEDIA_POST = '/pickMediaPost';
  static const POST_CONTENT = '/postContent';
  static const PICK_FRIEND_SHARE = '/pickFriendShare';

  // Chat Flow
  static const CHAT_ROOM = '/chatRoom';
  static const CUSTOMIZE_ROOM = '/customizeRoom';
  static const INCOMMING_CALL = '/incommingCall';
  static const CALL = '/call';
  static const CALLING = '/calling';

  // Profile Flow
  static const FOLLOWER = '/follower';
  static const SETTINGS = '/settings';
  static const CHOOSE_LANGUAGE = '/chooseLanguage';
  static const QR_SCAN = '/qrScan';
  static const EDIT_PROFILE = '/editProfile';
  static const EDIT_PHOTO = '/editPhoto';
  static const EDITOR_PRO = '/editorPro';
}
