import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/pages/chat/chat_page.dart';
import 'package:whoru/src/pages/home/home_page.dart';
import 'package:whoru/src/pages/profile/profile_page.dart';
import 'package:whoru/src/pages/search/search_page.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';
import 'package:whoru/src/widgets/image_widget.dart';

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
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: .0,
        child: Container(
          padding: EdgeInsets.only(
            top: 16.sp,
            bottom: 14.sp,
            left: 8.sp,
            right: 8.sp,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
                width: .35,
              ),
            ),
          ),
          child: Row(
            children: [
              _buildItemBottomBar(Feather.home, 0, 'Home'),
              _buildItemBottomBar(Feather.search, 1, 'Search'),
              _buildItemBottomBar(Feather.inbox, 2, 'Message'),
              _buildItemBottomBar(Feather.activity, 3, 'Discover'),
              _buildItemBottomAccount(
                'https://avatars.githubusercontent.com/u/60530946?v=4',
                4,
              ),
            ],
          ),
        ),
      ),
      body: _pages[currentPage],
    );
  }

  Widget _buildItemBottomBar(icon, index, title) {
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
            size: 20.sp,
            color: index == currentPage
                ? colorPrimary
                : Theme.of(context).textTheme.bodyText1.color.withOpacity(.85),
          ),
        ),
      ),
    );
  }

  Widget _buildItemBottomAccount(
    urlToImage,
    index,
  ) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                currentPage = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      currentPage == index ? colorPrimary : Colors.transparent,
                  width: 1.8.sp,
                ),
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  height: 20.sp,
                  width: 20.sp,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => PlaceHolderImage(),
                  errorWidget: (context, url, error) => ErrorLoadingImage(),
                  imageUrl: urlToImage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
