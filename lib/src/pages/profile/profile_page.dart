import 'package:flutter/material.dart';
import 'package:whoru/src/lib/blurhash/blurhash.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/profile/pages/end_drawer.dart';
import 'package:whoru/src/pages/profile/widgets/photos_gridview.dart';
import 'package:whoru/src/pages/profile/widgets/posts_listsview.dart';

import '../../common/styles.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;
  double min = 0, initial = 0, max = 0.88;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
    if (Get.height / Get.width > 2.0) {
      min = .425;
      initial = .425;
    } else {
      min = .365;
      initial = .365;
    }
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      endDrawer: Container(
        width: _size.width * .52,
        child: Drawer(
          child: EndDrawer(),
        ),
      ),
      endDrawerEnableOpenDragGesture: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: .0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Feather.settings,
            color: mCM,
            size: _size.width / 16.0,
          ),
          onPressed: () => print('settings'),
        ),
        title: Text(
          'Me',
          style: TextStyle(
            color: mCM,
            fontSize: _size.width / 22.5,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Feather.align_justify,
              color: mCM,
              size: _size.width / 16.0,
            ),
            onPressed: () => _openEndDrawer(),
          ),
        ],
      ),
      body: Container(
        color: mC,
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            Column(
              children: [
                // Container(
                //   child: ProgressiveImage(
                //     placeholder: ,
                //     thumbnail: NetworkImage(
                //         'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797'),
                //     image: NetworkImage(
                //         'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797'),
                //     width: _size.width,
                //     height: _size.height * .265,
                //   ),
                // ),
                Container(
                  width: _size.width,
                  height: _size.height * .265,
                  child: BlurHash(
                    hash: "L79ZK77eC+of+G8^VXz;Ty^lb^2?",
                    image:
                        'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797',
                    imageFit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: _size.height * .018),
                Row(
                  children: [
                    _buildTitleFollow(context, 'Follower', '104k'),
                    SizedBox(width: _size.width * .2),
                    _buildTitleFollow(context, 'Following', '10k'),
                  ],
                ),
                SizedBox(height: _size.height * .03),
                Text(
                  'Đào Hồng Vinh - Dev',
                  style: TextStyle(
                    color: colorTitle,
                    fontSize: _size.width / 21.5,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: _size.width * .1),
                  alignment: Alignment.center,
                  child: Text(
                    'Mobile App Developer (lambiengcode)',
                    style: TextStyle(
                      color: colorDarkGrey,
                      fontSize: _size.width / 26.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _size.width * .15,
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
              top: _size.height * .186,
              left: 0,
              child: Container(
                width: _size.width,
                alignment: Alignment.center,
                child: Container(
                  height: _size.height * .152,
                  width: _size.height * .152,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorPrimary,
                      width: 3.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    height: _size.height * .132,
                    width: _size.height * .132,
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
    );
  }

  Widget _buildTitleFollow(context, title, value) {
    final _size = MediaQuery.of(context).size;
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
                    fontSize: _size.width / 24.0,
                    color: colorBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontSize: _size.width / 28.5,
                    color: colorDarkGrey,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
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
            Get.toNamed('/editProfile');
            break;
          case 'Editor':
            Get.toNamed('/editor');
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        decoration: nMbox,
        child: Icon(
          icon,
          color: colorDarkGrey,
          size: _size.width / 22.5,
        ),
      ),
    );
  }

  Widget _scrollMyFeet(context) {
    final _size = MediaQuery.of(context).size;

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

        return AnimatedBuilder(
          animation: scrollController,
          builder: (context, child) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: mC,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: mC,
                        boxShadow: [
                          BoxShadow(
                            color: mCD,
                            offset: Offset(10, 10),
                            blurRadius: 10,
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
                                text: 'Photos',
                              ),
                              Tab(
                                text: 'Posts',
                              ),
                              Tab(
                                text: 'Info',
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
          },
        );
      },
    );
  }
}
