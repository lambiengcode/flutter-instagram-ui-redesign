import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/common/styles.dart';

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
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: mC,
        elevation: .0,
        toolbarHeight: 55.0,
        title: GestureDetector(
          onTap: () {},
          child: Container(
            height: 48.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: mC,
              boxShadow: [
                BoxShadow(
                  color: mCD,
                  offset: Offset(3, 3),
                  blurRadius: 3,
                ),
                BoxShadow(
                  color: mCL,
                  offset: Offset(-2, -2),
                  blurRadius: 2,
                ),
              ],
            ),
            padding: EdgeInsets.only(
              left: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Feather.search,
                  size: _size.width / 23.5,
                  color: fCL,
                ),
                SizedBox(
                  width: 12.5,
                ),
                Text(
                  'Search',
                  style: TextStyle(
                    color: fCL,
                    fontSize: _size.width / 26.0,
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
              Feather.maximize,
              color: colorDarkGrey,
              size: _size.width / 16.0,
            ),
          ),
          SizedBox(width: 4.0),
        ],
      ),
      body: Container(
        color: mC,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: mC,
                boxShadow: [
                  BoxShadow(
                    color: mCD,
                    offset: Offset(4, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 4.0,
                  ),
                  TabBar(
                    controller: _tabController,
                    labelColor: colorPrimary,
                    indicatorColor: colorPrimary,
                    unselectedLabelColor: colorDarkGrey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2.5,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: _size.width / 26.5,
                      fontFamily: 'Lato',
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: _size.width / 28.5,
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
