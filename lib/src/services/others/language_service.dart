import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whoru/src/constants/language.dart';

class LanguageService {
  final _getStorage = GetStorage();
  final storageKey = 'countryCode';

  Locale getLocale() {
    switch (_getStorage.read(storageKey)) {
      case 'US':
        return Locale('en', 'US');
      default:
        return Locale('vi', 'VN');
    }
  }

  void changeLanguage(Language value) {
    switch (value) {
      case Language.english:
        _getStorage.write(storageKey, 'US');
        Get.updateLocale(Locale('en', 'US'));
        break;
      default:
        _getStorage.write(storageKey, 'US');
        Get.updateLocale(Locale('vi', 'VN'));
        break;
    }
  }
}
