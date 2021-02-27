import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/common/styles.dart';

class EndDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      color: mC,
      height: _size.height,
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
                  colorDarkGrey,
                ),
                _buildDividerTransparant(context),
                _buildLine(
                  context,
                  'Statistic',
                  Feather.pie_chart,
                  colorDarkGrey,
                ),
                _buildDividerTransparant(context),
                _buildLine(
                  context,
                  'Term & Privacy',
                  Feather.help_circle,
                  colorDarkGrey,
                ),
                _buildDividerTransparant(context),
                _buildLine(
                  context,
                  'About',
                  Feather.info,
                  colorDarkGrey,
                ),
                _buildDivider(context),
                _buildLine(
                  context,
                  'Logout',
                  Feather.log_out,
                  colorPrimary,
                ),
                _buildDividerTransparant(context),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 12.0, right: 8.0),
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text(
              'v1.0.0 - Whoru',
              style: TextStyle(
                color: fCL,
                fontSize: _size.width / 36.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine(context, title, icon, color) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: _size.width / 18.5,
            color: color,
          ),
          SizedBox(width: 10.0),
          Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: _size.width / 26.5,
                fontWeight: FontWeight.w500,
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
        color: mC,
        thickness: .24,
        height: .24,
        indent: 8.0,
        endIndent: 2.0,
      ),
    );
  }

  Widget _buildDivider(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.8),
      child: Divider(
        color: mCH,
        thickness: .24,
        height: .24,
        indent: 8.0,
        endIndent: 2.0,
      ),
    );
  }
}
