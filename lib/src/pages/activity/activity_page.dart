import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:location/location.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/activity/pages/find_page.dart';
import 'package:whoru/src/pages/activity/pages/stranger_page.dart';

import '../../common/styles.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  LocationData currentLocation;
  Future<dynamic> _myLocation;

  var _pages = [
    StrangerPage(),
    FindPage(),
    Container(),
  ];

  getUserLocation() async {
    //call this async method from whereever you need

    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    currentLocation = myLocation;
    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    String result = '${first.addressLine}';
    print(
        ' ${first.locality},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    result = result.replaceAll(first.adminArea, '');
    result = result.replaceAll(first.countryName, '');
    return result;
  }

  @override
  void initState() {
    super.initState();
    _myLocation = getUserLocation();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: mC,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: _size.height / 22.0),
            _buildTopBar(context),
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

  Widget _buildTopBar(context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () => null,
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 16.0),
                      Container(
                        height: _size.width * .1,
                        width: _size.width * .1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: colorPrimary, width: 2.0),
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          height: _size.width * .08,
                          width: _size.width * .08,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(chats[0].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: _size.width / 22.5,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Lato',
                            ),
                          ),
                          SizedBox(height: 2.5),
                          FutureBuilder(
                            future: _myLocation,
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Text(
                                    'Thành Phố Hồ Chí Minh, Việt Nam',
                                    style: TextStyle(
                                      color: colorTitle,
                                      fontSize: _size.width / 26.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                    ),
                                  );
                                default:
                                  if (snapshot.hasError) {
                                    return Text(
                                      'Thành Phố Hồ Chí Minh, Việt Nam',
                                      style: TextStyle(
                                        color: colorTitle,
                                        fontSize: _size.width / 26.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Lato',
                                      ),
                                    );
                                  }

                                  return Text(
                                    snapshot.data.toString(),
                                    style: TextStyle(
                                      color: colorTitle,
                                      fontSize: _size.width / 26.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                    ),
                                  );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => null,
                  icon: Icon(
                    LineAwesomeIcons.angle_right,
                    color: fCL,
                    size: _size.width / 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.0),
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
                    text: 'Stranger',
                  ),
                  Tab(
                    text: 'Find',
                  ),
                  Tab(
                    text: 'History',
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
