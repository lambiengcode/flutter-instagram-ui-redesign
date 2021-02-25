import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/profile/widgets/photos_gridview.dart';
import 'package:whoru/src/widgets/image_widget.dart';

import '../../common/styles.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  double min = 0, initial = 0, max = 0.86;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
    if (Get.height / Get.width > 2.0 && Get.height > 800) {
      min = .42;
      initial = .42;
    } else {
      min = .35;
      initial = .35;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: .0,
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
            onPressed: () => print('settings'),
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
                ClipRRect(
                  child: CachedNetworkImage(
                    width: _size.width,
                    height: _size.height * .265,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => PlaceHolderImage(),
                    errorWidget: (context, url, error) => ErrorLoadingImage(),
                    imageUrl:
                        'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797',
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
                SizedBox(height: 16.0),
                Text(
                  'lambiengcode',
                  style: TextStyle(
                    color: colorTitle,
                    fontSize: _size.width / 21.5,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: _size.width * .1),
                  alignment: Alignment.center,
                  child: Text(
                    'This is project about social network can use on multi platform. Use flutter and nodejs, firebase...',
                    style: TextStyle(
                      color: colorDarkGrey,
                      fontSize: _size.width / 28.5,
                      fontFamily: 'Lato',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _size.width * .145,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildActionProfile(
                        context,
                        'Edit',
                        Feather.clipboard,
                      ),
                      _buildActionProfile(
                        context,
                        'Edit',
                        Feather.camera,
                      ),
                      _buildActionProfile(
                        context,
                        'Edit',
                        Feather.lock,
                      ),
                      _buildActionProfile(
                        context,
                        'Edit',
                        Feather.mail,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: _size.height * .19,
              left: 0,
              child: Container(
                width: _size.width,
                alignment: Alignment.center,
                child: Container(
                  height: _size.height * .145,
                  width: _size.height * .145,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorPrimary,
                      width: 3.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    height: _size.height * .125,
                    width: _size.height * .125,
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
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: mC,
        boxShadow: [
          BoxShadow(
            color: mCD,
            offset: Offset(5, 5),
            blurRadius: 5,
          ),
          BoxShadow(
            color: mCL,
            offset: Offset(-5, -5),
            blurRadius: 5,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: colorDarkGrey,
        size: _size.width / 20.5,
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
          PhotosGridview(
            scrollController: scrollController,
          ),
          Container(),
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
                            height: 8.0,
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
