import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/chat/chat_page.dart';
import 'package:whoru/src/pages/home/home_page.dart';
import 'package:whoru/src/pages/profile/profile_page.dart';
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
    Container(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 46.sp,
        width: 46.sp,
        child: FloatingActionButton(
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
          top: Radius.circular(50.0),
        ),
        child: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: CircularNotchedRectangle(),
          notchMargin: 6.sp,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withOpacity(.65)
              : Colors.black.withOpacity(.085),
          elevation: .0,
          child: Container(
            padding: EdgeInsets.only(
              top: 12.sp,
              right: 12.sp,
              left: 12.sp,
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
      body: _pages[currentPage],
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
          child: Icon(
            icon,
            size: 18.sp,
            color: index == currentPage ? colorPrimary : null,
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
          height: 20.sp,
          width: 20.sp,
          decoration: BoxDecoration(
            border: Border.all(
              width: currentPage == index ? 2.0 : .0,
              color: colorPrimary,
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
