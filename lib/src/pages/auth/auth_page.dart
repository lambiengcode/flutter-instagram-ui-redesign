import 'package:flutter/material.dart';
import 'package:whoru/src/pages/auth/pages/login_page.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool signIn = true;

  togglePage() {
    setState(() {
      signIn = !signIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return signIn ? LoginPage(toggleView: togglePage) : Container();
  }
}
