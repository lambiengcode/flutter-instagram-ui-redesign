import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class EndDrawer extends StatefulWidget {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLine(
              context,
              'Activities',
              Feather.activity,
              null,
            ),
            _buildDividerTransparant(context),
            _buildLine(
              context,
              'Statistic',
              Feather.pie_chart,
              null,
            ),
            _buildDividerTransparant(context),
            _buildLine(
              context,
              'Term & Privacy',
              Feather.help_circle,
              null,
            ),
            _buildDividerTransparant(context),
            _buildLine(
              context,
              'About',
              Feather.info,
              null,
            ),
            _buildDivider(context),
            _buildLine(
              context,
              'Logout',
              Feather.log_out,
              colorPrimary,
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLine(context, title, icon, color) {
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 14.sp,
            color: color,
          ),
          SizedBox(width: 10.0),
          Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
        ],
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
