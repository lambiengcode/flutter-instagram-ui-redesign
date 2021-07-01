import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/pages/chat/chat_page.dart';
import 'package:whoru/src/pages/home/home_page.dart';
import 'package:whoru/src/pages/profile/profile_page.dart';
import 'package:whoru/src/pages/search/search_page.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';
import 'package:whoru/src/widgets/image_widget.dart';

class Navigation extends StatefulWidget {
  final int initialIndex;
  Navigation({this.initialIndex = 0});
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
    currentPage = widget.initialIndex;
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
            bottom: 11.5.sp,
            left: 6.5.sp,
            right: 6.5.sp,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
                width: .2,
              ),
            ),
          ),
          child: Row(
            children: [
              _buildItemBottomBar(
                PhosphorIcons.house,
                PhosphorIcons.house_fill,
                0,
                'Home',
              ),
              _buildItemBottomBar(
                PhosphorIcons.magnifying_glass,
                PhosphorIcons.magnifying_glass_fill,
                1,
                'Search',
              ),
              _buildItemBottomBar(
                PhosphorIcons.chats_teardrop,
                PhosphorIcons.chats_teardrop_fill,
                2,
                'Message',
              ),
              _buildItemBottomBar(
                PhosphorIcons.broadcast,
                PhosphorIcons.broadcast_fill,
                3,
                'Discover',
              ),
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

  Widget _buildItemBottomBar(inActiveIcon, activeIcon, index, title) {
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
            index == currentPage ? activeIcon : inActiveIcon,
            size: 22.25.sp,
            color: index == currentPage
                ? colorPrimary
                : Theme.of(context).textTheme.bodyText1.color,
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
      child: GestureDetector(
        onTap: () {
          setState(() {
            currentPage = index;
          });
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: currentPage == index
                        ? colorPrimary
                        : Colors.transparent,
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
            ],
          ),
        ),
      ),
    );
  }
}
