import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/helpers/choose_image/custom_image_picker.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/pages/profile/pages/end_drawer.dart';
import 'package:whoru/src/pages/profile/widgets/photos_gridview.dart';
import 'package:whoru/src/pages/profile/widgets/posts_listsview.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
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
  bool isShowDrawer = false;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
    _advancedDrawerController.addListener(() {
      setState(() {
        isShowDrawer = _advancedDrawerController.value.visible;
      });
    });
    min = (100.h - 380.sp) / 100.h;
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
      drawer: Container(
        width: 100.w,
        child: EndDrawer(
          toggleDrawer: () {
            _advancedDrawerController.toggleDrawer();
          },
        ),
      ),
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
              PhosphorIcons.music_notes_simple,
              color: mCL,
              size: 22.5.sp,
            ),
            onPressed: () => Get.toNamed(Routes.SETTINGS),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: mCM,
              fontSize: 13.sp,
              fontFamily: FontFamily.lato,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              splashRadius: 10.0,
              icon: Icon(
                isShowDrawer ? PhosphorIcons.columns : PhosphorIcons.rows,
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
                  GestureDetector(
                    onTap: () => CustomImagePicker().openImagePicker(
                      context: context,
                      text: 'Thay đổi ảnh bìa',
                      viewUrl:
                          'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797',
                    ),
                    child: Container(
                      width: 300.sp,
                      height: 168.75.sp,
                      child: BlurHash(
                        hash: "L27B7e4n~WIU?bofD%xu4.t7RjRj",
                        image:
                            'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797',
                        imageFit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      _buildTitleFollow(
                        context,
                        'Followers',
                        '10.2k',
                        0,
                      ),
                      SizedBox(width: 24.w),
                      _buildTitleFollow(
                        context,
                        'Following',
                        '2.1k',
                        1,
                      ),
                    ],
                  ),
                  SizedBox(height: 18.sp),
                  Text(
                    'Đào Hồng Vinh - Dev',
                    style: TextStyle(
                      fontSize: 13.25.sp,
                      fontFamily: FontFamily.lato,
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
                        fontFamily: FontFamily.lato,
                        fontWeight: FontWeight.w500,
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
                          PhosphorIcons.notepad,
                        ),
                        _buildActionProfile(
                          context,
                          'Scan',
                          PhosphorIcons.qr_code,
                        ),
                        _buildActionProfile(
                          context,
                          'Card',
                          PhosphorIcons.identification_card,
                        ),
                        _buildActionProfile(
                          context,
                          'File Transfer',
                          PhosphorIcons.chats,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 118.75.sp,
                left: 0,
                child: GestureDetector(
                  onTap: () => CustomImagePicker().openImagePicker(
                    context: context,
                    text: 'Thay đổi ảnh đại diện',
                    viewUrl:
                        'https://avatars.githubusercontent.com/u/60530946?v=4',
                  ),
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
              ),
              _scrollMyFeet(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleFollow(context, title, value, index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.FOLLOWER, arguments: index),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Text(
                title,
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
              SizedBox(height: 5.sp),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12.5.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionProfile(context, title, icon) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'Edit Profile':
            // Get.toNamed(Routes.EDIT_PROFILE);
            break;
          case 'Scan':
            Get.toNamed(Routes.QR_SCAN);
            break;
          case 'Card':
            // Get.toNamed(Routes.EDIT_PHOTO);
            break;
          case 'File Transfer':
            Get.toNamed(Routes.CHAT_ROOM);
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.sp),
        alignment: Alignment.center,
        decoration: AppDecoration.buttonActionBorder(context, 8.sp).decoration,
        child: Icon(
          icon,
          size: 18.sp,
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
                  top: Radius.circular(20.0),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 5.sp),
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
                                fontFamily: FontFamily.lato,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 10.25.sp,
                                fontFamily: FontFamily.lato,
                              ),
                              tabs: [
                                Tab(
                                  text: 'Photos',
                                ),
                                Tab(
                                  text: 'Posts',
                                ),
                                Tab(
                                  text: 'Moments',
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
