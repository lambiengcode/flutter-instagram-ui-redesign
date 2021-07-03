import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/avatar_glow/avatar_glow.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class IncommingCallPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IncommingCallPageState();
}

class _IncommingCallPageState extends State<IncommingCallPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 70.sp),
              Text(
                'Incomming Call..',
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w600,
                  color: mC,
                ),
              ),
              SizedBox(height: 12.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarGlow(
                    startDelay: Duration(milliseconds: 1000),
                    glowColor: colorPrimary,
                    endRadius: 80.sp,
                    duration: Duration(milliseconds: 1500),
                    repeat: true,
                    showTwoGlows: true,
                    repeatPauseDuration: Duration(milliseconds: 150),
                    child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: mC,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/avt.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        radius: 55.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.sp),
              Text(
                'lambiengcode',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w600,
                  color: mC,
                ),
              ),
              SizedBox(height: 8.sp),
              Text(
                'Mobile',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w400,
                  color: mC,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButton(
                      PhosphorIcons.phone_disconnect_fill,
                      'Decline',
                      colorHigh,
                    ),
                    _buildButton(
                      PhosphorIcons.phone_call_fill,
                      'Accept',
                      colorActive,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.sp),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(icon, title, color) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(17.25.sp),
              decoration:
                  AppDecoration.buttonActionCircleCall(context).decoration,
              child: Icon(
                icon,
                color: color,
                size: 20.sp,
              ),
            ),
            SizedBox(height: 8.sp),
            Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                fontFamily: FontFamily.lato,
                fontWeight: FontWeight.w400,
                color: mC,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
