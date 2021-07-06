import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:whoru/src/routes/app_pages.dart';
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

  @override
  void initState() {
    super.initState();
    ThemeService().switchStatusColor();
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
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            _buildTitle(context, 'Features'),
            _buildLineSettingWithValue(
              context,
              'Language',
              PhosphorIcons.translate_fill,
              'English',
              false,
            ),
            _buildLineSettingToggle(
              context,
              'Dark Mode',
              false,
            ),
            _buildLineSettingWithToggle(
              context,
              'Floating Chat',
              PhosphorIcons.chat_circle_dots,
              false,
            ),
            _buildLineSettingWithToggle(
              context,
              'Fingerprint',
              PhosphorIcons.fingerprint_fill,
              true,
            ),
            _buildTitle(context, 'Notifications'),
            _buildLineSettingWithToggle(
              context,
              'Messages',
              PhosphorIcons.chat_centered_dots,
              false,
            ),
            _buildLineSettingWithToggle(
              context,
              'React Post',
              PhosphorIcons.heart,
              false,
            ),
            _buildLineSettingWithToggle(
              context,
              'Follow',
              PhosphorIcons.user_circle_plus,
              true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(context, title) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.sp,
        right: 8.sp,
        top: 18.sp,
        bottom: 4.sp,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontFamily.lato_bold,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineSettingWithValue(context, title, icon, value, isLast) {
    return GestureDetector(
      onTap: () {
        if (title == 'Language') {
          Get.toNamed(Routes.SETTINGS + Routes.CHOOSE_LANGUAGE);
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
              color:
                  isLast ? Colors.transparent : Theme.of(context).dividerColor,
              width: .1,
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

  Widget _buildLineSettingWithToggle(context, title, icon, isLast) {
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
            color: isLast ? Colors.transparent : Theme.of(context).dividerColor,
            width: .1,
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
    );
  }

  Widget _buildLineSettingToggle(context, title, isLast) {
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
            color: isLast ? Colors.transparent : Theme.of(context).dividerColor,
            width: .1,
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
