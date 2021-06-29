import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/profile/widgets/bottom_settings.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> valueOfTheme = ['Light', 'Dark'];
  List<String> valueOfLanguage = ['English', 'Vietnamese'];
  List<String> valueOfNotification = ['On', 'Off'];

  @override
  void initState() {
    super.initState();
    ThemeService().switchStatusColor();
  }

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
        brightness: Theme.of(context).brightness,
        elevation: .0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            size: _size.width / 15.0,
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontFamily: FontFamily.lato,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            _buildLineSetting(
              context,
              'Theme',
              Feather.sun,
              'Light',
            ),
            _buildLineSetting(
              context,
              'Language',
              Feather.globe,
              'English',
            ),
            _buildLineSetting(
              context,
              'Notifications',
              Feather.bell,
              'On',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineSetting(context, title, icon, value) {
    return GestureDetector(
      onTap: () {
        if (title == 'Theme') {
          ThemeService().changeThemeMode();
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
          border: Border(
            bottom: BorderSide(
              width: .04,
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
                  size: 18.sp,
                ),
                SizedBox(width: 10.sp),
                Padding(
                  padding: EdgeInsets.only(top: 1.2),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: title == 'Notifications'
                    ? Theme.of(context).primaryColor
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
