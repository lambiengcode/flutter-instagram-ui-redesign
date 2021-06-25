import 'package:flutter/material.dart';
import 'package:whoru/src/pages/auth/pages/login_page.dart';
import 'package:whoru/src/pages/auth/pages/register_page.dart';
import 'package:whoru/src/themes/theme_service.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final themeService = ThemeService();
  bool signIn = true;

  togglePage() {
    setState(() {
      signIn = !signIn;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return signIn
        ? LoginPage(toggleView: togglePage)
        : SignupPage(toggleView: togglePage);
  }
}
