import 'package:flutter/material.dart';

class AccountProvider extends ChangeNotifier {
  String _accessToken;

  String get accessToken => _accessToken;

  set token(String tokenUser) {
    _accessToken = tokenUser;
  }
}
