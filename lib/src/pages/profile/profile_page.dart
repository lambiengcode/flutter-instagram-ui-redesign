import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/profile/widgets/photos_gridview.dart';
import 'package:whoru/src/widgets/image_widget.dart';

import '../../common/styles.dart';
import '../../common/styles.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
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
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'lambiengcode ',
                style: TextStyle(
                  fontSize: _size.width / 20.0,
                  color: mCM,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lobster',
                ),
              ),
              TextSpan(
                text: '(Me)',
                style: TextStyle(
                  fontSize: _size.width / 24.0,
                  color: mCM,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Lobster',
                ),
              ),
            ],
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
                SizedBox(height: _size.height * .032),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: _size.width * .1),
                  alignment: Alignment.center,
                  child: Text(
                    'This is project about social network can use on multi platform. Use flutter and nodejs, firebase and ec2 for deploy api.',
                    style: TextStyle(
                      color: colorDarkGrey,
                      fontSize: _size.width / 30.0,
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
      height: 55.0,
      width: 55.0,
      decoration: nMboxCategoryOff,
      child: Icon(
        icon,
        color: colorDarkGrey,
        size: _size.width / 22.5,
      ),
    );
  }

  Widget _scrollMyFeet(context) {
    final _size = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
      maxChildSize: .88,
      minChildSize: .42,
      initialChildSize: .42,
      builder: (BuildContext context, ScrollController scrollController) {
        var _pages = [
          PhotosGridview(
            scrollController: scrollController,
          ),
          Container(),
          Container(),
        ];

        return Container(
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
                      height: 2.5,
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
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: _size.width / 28.5,
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
        );
      },
    );
  }
}
