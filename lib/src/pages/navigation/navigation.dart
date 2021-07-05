import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/calling/pages/incomming_call_page.dart';
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
    // Open for Design
    // Future.delayed(
    //   Duration(seconds: 2),
    //   () => Get.toNamed(Routes.INCOMMING_CALL),
    // );
  }

  showIncommingCallBottomSheet() {
    Get.bottomSheet(
      ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30.0,
            sigmaY: 30.0,
          ),
          child: IncommingCallPage(),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(.15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: .0,
        child: Container(
          height: 52.sp,
          padding: EdgeInsets.symmetric(horizontal: 6.5.sp),
          alignment: Alignment.center,
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
                PhosphorIcons.magnifying_glass_bold,
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
          if (index == 0) {
            // showIncommingCallBottomSheet();
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                child: Icon(
                  index == currentPage ? activeIcon : inActiveIcon,
                  size: 21.5.sp,
                  color: index == currentPage
                      ? colorPrimary
                      : Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
              SizedBox(height: 2.5.sp),
              Container(
                height: 4.sp,
                width: 4.sp,
                decoration: BoxDecoration(
                  color: index == 2 ? colorPrimary : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
                        errorWidget: (context, url, error) =>
                            ErrorLoadingImage(),
                        imageUrl: urlToImage,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.5.sp),
              Container(
                height: 4.sp,
                width: 4.sp,
                decoration: BoxDecoration(
                  color: index == 3 ? colorPrimary : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
