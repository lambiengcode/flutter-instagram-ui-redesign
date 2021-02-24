import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:geocoder/geocoder.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:location/location.dart';

import '../../common/styles.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  LocationData currentLocation;
  Future<dynamic> _myLocation;

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
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: mC,
        child: Column(
          children: [
            SizedBox(height: _size.height / 22.0),
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
                          Icon(
                            Feather.map_pin,
                            color: colorPrimary,
                            size: _size.width / 16.0,
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
                        color: colorDarkGrey,
                        size: _size.width / 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
