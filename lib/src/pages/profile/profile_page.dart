import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/pages/profile/pages/end_drawer.dart';
import 'package:whoru/src/pages/profile/widgets/photos_gridview.dart';
import 'package:whoru/src/pages/profile/widgets/posts_listsview.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';
import 'package:whoru/src/utils/slide_drawer/flutter_advanced_drawer.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _advancedDrawerController = AdvancedDrawerController();
  TabController _tabController;
  double min = 0, initial = 0, max = 0.88;
  String title = '';

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
    min = (100.h - 335.sp) / 100.h;
    initial = min;
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor:
          ThemeService().isSavedDarkMode() ? colorBlack.withOpacity(.45) : mCM,
      animationCurve: Curves.easeInToLinear,
      animationDuration: Duration(milliseconds: 300),
      animateChildDecoration: true,
      openRatio: .6,
      rtlOpening: true,
      drawer: Container(width: 100.w, child: EndDrawer()),
      controller: _advancedDrawerController,
      child: Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          brightness: Theme.of(context).brightness,
          backgroundColor: Colors.transparent,
          elevation: .0,
          centerTitle: true,
          leading: IconButton(
            splashColor: colorPrimary,
            splashRadius: 5.0,
            icon: Icon(
              PhosphorIcons.sliders_horizontal,
              color: mCL,
              size: 22.5.sp,
            ),
            onPressed: () => Get.toNamed('/settings'),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: mCM,
              fontSize: 13.5.sp,
              fontFamily: 'FreeSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              splashColor: colorPrimary,
              splashRadius: 5.0,
              icon: Icon(
                PhosphorIcons.rows,
                color: mCL,
                size: 22.5.sp,
              ),
              onPressed: () => _advancedDrawerController.toggleDrawer(),
            ),
          ],
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: 300.sp,
                    height: 168.75.sp,
                    child: BlurHash(
                      hash: "L27B7e4n~WIU?bofD%xu4.t7RjRj",
                      image:
                          'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797',
                      imageFit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 13.5.sp),
                  Row(
                    children: [
                      _buildTitleFollow(context, 'Follower', '554'),
                      SizedBox(width: 24.w),
                      _buildTitleFollow(context, 'Following', '208'),
                    ],
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    'Đào Hồng Vinh - Dev',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'FreeSans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.sp),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    alignment: Alignment.center,
                    child: Text(
                      'Mobile App Developer (lambiengcode)',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 14.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildActionProfile(
                          context,
                          'Edit Profile',
                          Feather.clipboard,
                        ),
                        _buildActionProfile(
                          context,
                          'Scan',
                          Feather.maximize,
                        ),
                        _buildActionProfile(
                          context,
                          'Editor',
                          Feather.image,
                        ),
                        _buildActionProfile(
                          context,
                          'File Transfer',
                          Feather.mail,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 118.75.sp,
                left: 0,
                child: Container(
                  width: 100.w,
                  alignment: Alignment.center,
                  child: Container(
                    height: 100.sp,
                    width: 100.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorPrimary,
                        width: 3.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      height: 88.sp,
                      width: 88.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/avt.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _scrollMyFeet(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleFollow(context, title, value) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$value\n',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontSize: 10.5.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionProfile(context, title, icon) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Edit Profile':
            // Get.toNamed(Routes.EDIT_PROFILE);
            break;
          case 'Editor':
            Get.toNamed(Routes.EDIT_PHOTO);
            break;
          case 'File Transfer':
            Get.toNamed(Routes.CHAT_ROOM);
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        decoration: AppDecoration.buttonActionBorder(context, 12.sp).decoration,
        child: Icon(
          icon,
          size: _size.width / 22.5,
          color: Theme.of(context).buttonColor,
        ),
      ),
    );
  }

  Widget _scrollMyFeet(context) {
    return DraggableScrollableSheet(
      minChildSize: min,
      maxChildSize: max,
      initialChildSize: initial,
      builder: (BuildContext context, ScrollController scrollController) {
        var _pages = [
          PhotosGridview(scrollController: scrollController),
          PostsListview(scrollController: scrollController),
          Container(),
        ];

        return NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            if (notification.extent < (100.h - 200.sp) / 100.h) {
              setState(() {
                title = '';
              });
            } else {
              setState(() {
                title = 'Đào Hồng Vinh';
              });
            }
            return;
          },
          child: AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 2.5.sp),
                        decoration:
                            AppDecoration.tabBarDecoration(context).decoration,
                        child: Column(
                          children: <Widget>[
                            TabBar(
                              controller: _tabController,
                              labelColor: colorPrimary,
                              indicatorColor: colorPrimary,
                              unselectedLabelColor: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(
                                    ThemeService().isSavedDarkMode()
                                        ? .88
                                        : .65,
                                  ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorWeight: 2.5,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                                fontFamily: 'Lato',
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10.25.sp,
                                fontFamily: 'Lato',
                              ),
                              tabs: [
                                Tab(
                                  text: 'Photos',
                                ),
                                Tab(
                                  text: 'Posts',
                                ),
                                Tab(
                                  text: 'Videos',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          padding: EdgeInsets.only(top: 5.sp),
                          child: TabBarView(
                            controller: _tabController,
                            children: _pages.map((Widget tab) {
                              return tab;
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
