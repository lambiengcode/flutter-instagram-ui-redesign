import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class EndDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 24.0),
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
                // _buildDividerTransparant(context),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12.0, right: 8.0),
            margin: EdgeInsets.only(bottom: 70.sp),
            child: Text(
              '1.0.0 - Whoru',
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
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
            size: 12.sp,
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
        indent: 8.0,
        endIndent: 2.0,
      ),
    );
  }

  Widget _buildDivider(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.8),
      child: Divider(
        thickness: .12,
        height: .12,
        indent: 8.0,
        endIndent: 2.0,
      ),
    );
  }
}
