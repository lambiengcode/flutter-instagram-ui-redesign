import 'package:flutter/material.dart';
import 'package:whoru/src/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user;

  User get user => _user;

  void loginMapUser(Map<String, dynamic> data) {
    _user = User.fromMap(data);
  }
}
