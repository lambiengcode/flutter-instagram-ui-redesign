import 'package:flutter/material.dart';
import 'package:whoru/src/public/styles.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70.w,
              height: 70.w,
              child: splashLottie,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Load',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamily.lobster,
                      color: colorPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'ing...',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: FontFamily.lobster,
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
