import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class CustomRoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomRoomPageState();
}

class _CustomRoomPageState extends State<CustomRoomPage> {
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
            Feather.arrow_left,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 20.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.more_vertical,
              color: Theme.of(context).textTheme.bodyText1.color,
              size: 20.sp,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 4.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => null,
                  child: Container(
                    height: 90.sp,
                    width: 90.sp,
                    padding: EdgeInsets.only(
                      bottom: 2.sp,
                      right: 8.sp,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(chats[4].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 16.5.sp,
                      width: 16.5.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        height: 12.sp,
                        width: 12.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorActive,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.sp),
            Text(
              'Material',
              style: TextStyle(
                fontSize: 13.25.sp,
                fontFamily: FontFamily.lato,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.sp),
          ],
        ),
      ),
    );
  }
}
