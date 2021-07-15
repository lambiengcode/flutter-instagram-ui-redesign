import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class FollowerPage extends StatefulWidget {
  final int initialIndex;
  FollowerPage({this.initialIndex});
  @override
  State<StatefulWidget> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _pages = [
    Container(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        elevation: .0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.x,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 20.sp,
          ),
        ),
        title: Text(
          'Đào Hồng Vinh',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: FontFamily.lato,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              PhosphorIcons.sliders_horizontal,
              color: Theme.of(context).textTheme.bodyText1.color,
              size: 20.sp,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration:
                  AppDecoration.tabBarDecorationSecond(context).decoration,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 6.sp),
                  TabBar(
                    controller: _tabController,
                    labelColor: colorPrimary,
                    indicatorColor: colorPrimary,
                    unselectedLabelColor:
                        Theme.of(context).textTheme.bodyText1.color.withOpacity(
                              ThemeService().isSavedDarkMode() ? 1 : .65,
                            ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 1.sp,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                      fontFamily: FontFamily.lato,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10.5.sp,
                      fontFamily: FontFamily.lato,
                    ),
                    tabs: [
                      Tab(
                        text: 'Followers:\t10k',
                      ),
                      Tab(
                        text: 'Following:\t2.1k',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _pages.map((Widget tab) {
                  return tab;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
