import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<int> indexOfs = [2, 14, 24, 29, 38, 47, 56];

  var _pages = [
    Container(),
    Container(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: .0,
        automaticallyImplyLeading: false,
        toolbarHeight: 42.sp,
        title: GestureDetector(
          onTap: () {},
          child: Container(
            height: 36.sp,
            decoration:
                AppDecoration.buttonActionBorder(context, 4.0).decoration,
            padding: EdgeInsets.only(left: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Feather.search,
                  size: 13.25.sp,
                  color:
                      Theme.of(context).textTheme.bodyText1.color.withOpacity(
                            ThemeService().isSavedDarkMode() ? .88 : .65,
                          ),
                ),
                SizedBox(
                  width: 8.sp,
                ),
                Text(
                  'Search...',
                  style: TextStyle(
                    color:
                        Theme.of(context).textTheme.bodyText1.color.withOpacity(
                              ThemeService().isSavedDarkMode() ? .95 : .65,
                            ),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              PhosphorIcons.qr_code,
              size: 24.sp,
              color: Theme.of(context).textTheme.bodyText1.color.withOpacity(
                    ThemeService().isSavedDarkMode() ? .88 : .65,
                  ),
            ),
          ),
          SizedBox(width: 2.sp),
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
                  SizedBox(
                    height: 4.0,
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: colorPrimary,
                    indicatorColor: colorPrimary,
                    unselectedLabelColor:
                        Theme.of(context).textTheme.bodyText1.color.withOpacity(
                              ThemeService().isSavedDarkMode() ? .88 : .65,
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
                      fontSize: 10.sp,
                      fontFamily: 'Lato',
                    ),
                    tabs: [
                      Tab(
                        text: 'Suggest',
                      ),
                      Tab(
                        text: 'Nearby',
                      ),
                      Tab(
                        text: 'Discover',
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
