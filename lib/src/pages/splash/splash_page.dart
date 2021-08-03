import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  final String points;
  SplashPage({this.points});
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorPrimary,
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55.w,
                    width: 55.w,
                    child: Lottie.asset('assets/lottie/splash_cat.json'),
                  ),
                  SizedBox(height: 20.sp),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Whoru Social',
                          style: TextStyle(
                            color: mCL,
                            fontFamily: 'Lobster',
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: mCL,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.lato,
                          ),
                        ),
                        TextSpan(
                          text: widget.points,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: mCL,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.lato,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '@${DateTime.now().year} Develop by ',
                    style: TextStyle(
                      color: mC,
                      fontFamily: FontFamily.lato,
                      fontSize: 8.5.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'WANTED',
                    style: TextStyle(
                      color: mCL,
                      fontFamily: FontFamily.lato,
                      fontSize: 8.5.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28.sp),
          ],
        ),
      ),
    );
  }
}
