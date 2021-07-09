import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class NearbyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        elevation: .0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => null,
          icon: Icon(
            Feather.x,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 20.sp,
          ),
        ),
        title: Text(
          'Nearby',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: FontFamily.lato,
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 2.sp),
            Divider(
              height: .35,
              thickness: .35,
            ),
            SizedBox(height: 8.sp),
          ],
        ),
      ),
    );
  }
}
