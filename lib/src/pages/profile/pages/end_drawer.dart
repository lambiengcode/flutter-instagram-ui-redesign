import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class EndDrawer extends StatefulWidget {
  final VoidCallback toggleDrawer;
  EndDrawer({@required this.toggleDrawer});
  @override
  State<StatefulWidget> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100.h,
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLine(
                    context,
                    'Activities',
                    PhosphorIcons.clock_counter_clockwise,
                    null,
                  ),
                  _buildDividerTransparant(context),
                  _buildLine(
                    context,
                    'Donate',
                    PhosphorIcons.credit_card,
                    null,
                  ),
                  _buildDividerTransparant(context),
                  _buildLine(
                    context,
                    'Support',
                    PhosphorIcons.headset,
                    null,
                  ),
                  _buildDividerTransparant(context),
                  _buildLine(
                    context,
                    'Settings',
                    PhosphorIcons.sliders_horizontal,
                    null,
                  ),
                  _buildDivider(context),
                  _buildLine(
                    context,
                    'Logout',
                    PhosphorIcons.sign_out,
                    colorPrimary,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: FontFamily.helvetica,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: 'Term & Privacy',
                          style: TextStyle(
                            color: colorPrimary,
                          ),
                        ),
                        TextSpan(
                          text: '\t\t|\t\t',
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(.4),
                            fontFamily: FontFamily.helvetica,
                            fontSize: 10.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'About\t\t\t\t',
                          style: TextStyle(
                            color: colorPrimary,
                          ),
                        ),
                      ],
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

  Widget _buildLine(context, title, icon, color) {
    return GestureDetector(
      onTap: () {
        widget.toggleDrawer();
        if (title == 'Settings') {
          Get.toNamed(Routes.SETTINGS);
        }
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(left: 12.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 16.sp,
              color: color,
            ),
            SizedBox(width: 8.sp),
            Padding(
              padding: EdgeInsets.only(top: 1.25.sp),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: color,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDividerTransparant(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.8),
      child: Divider(
        thickness: .1,
        height: .1,
        indent: 8.sp,
        endIndent: 10.w,
      ),
    );
  }

  Widget _buildDivider(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.8),
      child: Divider(
        thickness: .12,
        height: .12,
        indent: 8.sp,
        endIndent: 10.w,
      ),
    );
  }
}
