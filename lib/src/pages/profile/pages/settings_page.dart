import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/profile/widgets/bottom_settings.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> valueOfTheme = ['Light', 'Dark'];
  List<String> valueOfLanguage = ['English', 'Vietnamese'];
  List<String> valueOfNotification = ['On', 'Off'];

  void showSettingBottomSheet(List data) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomSettings(
          values: data,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mC,
        elevation: .0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            color: colorTitle,
            size: _size.width / 15.0,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: colorTitle,
            fontSize: _size.width / 20.0,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: mC,
        child: Column(
          children: [
            SizedBox(height: 16.0),
            _buildLineSetting(
              context,
              'Theme',
              Feather.sun,
              'Light',
              colorDarkGrey,
            ),
            _buildLineSetting(
              context,
              'Language',
              Feather.globe,
              'English',
              colorDarkGrey,
            ),
            _buildLineSetting(
              context,
              'Notifications',
              Feather.bell,
              'On',
              colorCompleted,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineSetting(context, title, icon, value, color) {
    final _size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        if (title == 'Theme') {
          showSettingBottomSheet(valueOfTheme);
        } else if (title == 'Language') {
          showSettingBottomSheet(valueOfLanguage);
        } else {
          showSettingBottomSheet(valueOfNotification);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 18.0,
          top: 20.0,
          bottom: 20.0,
        ),
        decoration: BoxDecoration(
          color: mC,
          border: Border(
            bottom: BorderSide(
              color: mCH,
              width: .25,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: colorDarkGrey,
                  size: _size.width / 18.0,
                ),
                SizedBox(width: 12.0),
                Padding(
                  padding: EdgeInsets.only(top: 1.2),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: colorDarkGrey,
                      fontSize: _size.width / 24.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: _size.width / 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
