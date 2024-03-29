import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whoru/src/pages/auth/auth_page.dart';
import 'package:whoru/src/pages/navigation/navigation.dart';
import 'package:whoru/src/pages/splash/splash_page.dart';
import 'package:whoru/src/providers/user_provider.dart';
import 'package:whoru/src/themes/theme_service.dart';

class App extends StatefulWidget {
  static bool firstCome = true;
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final themeService = ThemeService();
  Timer _timmerInstance;
  int _countDown = 3;
  String points = '.';

  void startTimmer() {
    var oneSec = Duration(milliseconds: 400);
    _timmerInstance = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_countDown <= 0) {
            _timmerInstance.cancel();
            App.firstCome = false;
          } else {
            _countDown--;
            points += '.';
          }
        },
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
    startTimmer();
  }

  @override
  Widget build(BuildContext context) {
    return _countDown != 0 && App.firstCome
        ? SplashPage(points: points)
        : Provider.of<UserProvider>(context).user != null
            ? AuthenticationPage()
            : Navigation();
  }
}
