import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/utils.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/chat/chat_page.dart';
import 'package:whoru/src/pages/home/home_page.dart';
import 'package:whoru/src/pages/profile/profile_page.dart';
import 'package:whoru/src/pages/search/search_page.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final themeService = ThemeService();
  int currentPage = 0;
  var _pages = [
    HomePage(),
    SearchPage(),
    ChatPage(),
    Container(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 46.sp,
        width: 46.sp,
        child: FloatingActionButton(
          elevation: .0,
          child: Icon(
            AntDesign.message1,
            color: mCL,
            size: 22.sp,
          ),
          onPressed: () => setState(() => currentPage = 2),
          backgroundColor: colorPrimary,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX:
                Theme.of(context).brightness == Brightness.dark ? .25 : 10.0,
            sigmaY:
                Theme.of(context).brightness == Brightness.dark ? .25 : 10.0,
          ),
          child: BottomAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: CircularNotchedRectangle(),
            notchMargin: 5.sp,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.black.withOpacity(.25),
            elevation: .0,
            child: Container(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.black.withOpacity(.25),
              padding: EdgeInsets.fromLTRB(
                12.sp,
                15.sp,
                12.sp,
                GetPlatform.isAndroid ? 15.sp : 0.sp,
              ),
              child: Row(
                children: [
                  _buildItemBottomBar(Feather.home, 0),
                  _buildItemBottomBar(Feather.search, 1),
                  SizedBox(width: 16.w),
                  _buildItemBottomBar(Feather.activity, 3),
                  _buildItemBottomAccount(
                    'https://avatars.githubusercontent.com/u/60530946?v=4',
                    4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 32.sp),
        child: _pages[currentPage],
      ),
    );
  }

  Widget _buildItemBottomBar(icon, index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentPage = index;
          });
        },
        child: Container(
          color: Colors.transparent,
          child: Icon(
            icon,
            size: 18.8.sp,
            color: index == currentPage
                ? colorPrimary
                : Theme.of(context).brightness == Brightness.dark
                    ? null
                    : mC,
          ),
        ),
      ),
    );
  }

  Widget _buildItemBottomAccount(url, index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentPage = index;
          });
        },
        child: Container(
          height: 20.5.sp,
          width: 20.5.sp,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              width: currentPage == index ? 2.0 : .0,
              color: currentPage == index ? colorPrimary : Colors.transparent,
            ),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
