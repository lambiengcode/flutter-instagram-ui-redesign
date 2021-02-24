import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/pages/chat/chat_page.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/home/home_page.dart';
import 'package:whoru/src/pages/profile/profile_page.dart';

import '../../common/styles.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPage = 0;
  var _pages = [
    HomePage(),
    Container(),
    ChatPage(),
    Container(),
    ProfilePage(),
  ];

  // final FirebaseMessaging _fcm = FirebaseMessaging();
  // StreamSubscription iosSubscription;

  // _saveDeviceToken() async {
  //   // Get the token for this device
  //   String fcmToken = await _fcm.getToken();

  //   // Save it to Firestore
  //   if (fcmToken != null) {
  //     print(fcmToken + 'lambiengcode');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   if (Platform.isIOS) {
  //     iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
  //       _saveDeviceToken();
  //     });

  //     _fcm.requestNotificationPermissions(IosNotificationSettings());
  //   } else {
  //     _saveDeviceToken();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          initialActiveIndex: 0,
          height: 60.0,
          top: -24.0,
          curveSize: 85.0,
          style: TabStyle.fixedCircle,
          activeColor: currentPage == 2 ? colorTitle : colorPrimary,
          color: colorTitle,
          elevation: .4,
          items: [
            TabItem(icon: Feather.home),
            TabItem(icon: Feather.search),
            TabItem(icon: AntDesign.message1),
            TabItem(icon: Feather.activity),
            TabItem(icon: Feather.user),
          ],
          backgroundColor: mC,
          onTap: (int i) {
            setState(() {
              currentPage = i;
            });
          },
        ),
      ),
      body: _pages[currentPage],
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 25.0;

  @override
  double get activeIconMargin => 10.0;

  @override
  double get iconSize => 25.0;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 10.0, color: color);
  }
}
