import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/profile/widgets/bottom_settings.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _fingerprint = false;
  List<String> valueOfLanguage = ['English', 'Vietnamese'];

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
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        elevation: .0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            size: 20.sp,
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
            _buildLineSettingWithValue(
              context,
              'Language',
              PhosphorIcons.translate_fill,
              'English',
            ),
            _buildLineSettingToggle(
              context,
              'Dark Mode',
            ),
            _buildLineSettingWithToggle(
              context,
              'Notifications',
              PhosphorIcons.bell_simple,
            ),
            _buildLineSettingWithToggle(
              context,
              'Fingerprint',
              PhosphorIcons.fingerprint_fill,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineSettingWithValue(context, title, icon, value) {
    return GestureDetector(
      onTap: () {
        if (title == 'Language') {
          showSettingBottomSheet(valueOfLanguage);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 12.sp,
          right: 8.sp,
          top: 18.sp,
          bottom: 18.sp,
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
                SizedBox(width: 12.sp),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
                SizedBox(width: 4.sp),
                Icon(PhosphorIcons.caret_right, size: 16.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineSettingWithToggle(context, title, icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Language') {
          showSettingBottomSheet(valueOfLanguage);
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 12.sp,
          right: 8.sp,
          top: 18.sp,
          bottom: 18.sp,
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
                SizedBox(width: 12.sp),
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
            FlutterSwitch(
              width: 40.sp,
              height: 22.sp,
              value: title == 'Notifications' ? _notifications : _fingerprint,
              toggleSize: 15.sp,
              activeColor: colorPrimary,
              onToggle: (val) {
                setState(() {
                  if (title == 'Notifications') {
                    _notifications = val;
                  } else {
                    _fingerprint = val;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineSettingToggle(context, title) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.sp,
        right: 8.sp,
        top: 18.sp,
        bottom: 18.sp,
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
                ThemeService().isSavedDarkMode()
                    ? PhosphorIcons.moon_stars_fill
                    : PhosphorIcons.moon_stars,
                size: 18.sp,
                color:
                    ThemeService().isSavedDarkMode() ? Color(0xFFFFDF5D) : null,
              ),
              SizedBox(width: 12.sp),
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
          FlutterSwitch(
            width: 40.sp,
            height: 22.sp,
            value: ThemeService().isSavedDarkMode(),
            toggleSize: 15.sp,
            activeColor: colorPrimary,
            onToggle: (val) {
              ThemeService().changeThemeMode();
            },
          ),
        ],
      ),
    );
  }
}
