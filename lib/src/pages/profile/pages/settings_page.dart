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
        backgroundColor:
            ThemeService().isSavedDarkMode() ? colorPrimaryBlack : mCL,
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
        color: ThemeService().isSavedDarkMode() ? colorBlack : mC,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: ThemeService().isSavedDarkMode()
                      ? colorPrimaryBlack
                      : mCL,
                  child: Column(
                    children: [
                      _buildTitle(context, 'Features'),
                      _buildLineSettingWithValue(
                        context: context,
                        title: 'Language',
                        icon: PhosphorIcons.translate_fill,
                        value: 'English',
                      ),
                      _buildLineSettingToggle(
                        context: context,
                        title: 'Dark Mode',
                      ),
                      _buildLineSettingWithToggle(
                        context: context,
                        title: 'Floating Chat',
                        icon: PhosphorIcons.chat_circle_dots,
                      ),
                      _buildLineSettingWithToggle(
                        context: context,
                        title: 'Shake to see user around',
                        icon: PhosphorIcons.vibrate,
                      ),
                      _buildLineSettingWithToggle(
                        context: context,
                        title: 'Play audio in profile',
                        icon: PhosphorIcons.music_notes,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.sp),
                Container(
                  color: ThemeService().isSavedDarkMode()
                      ? colorPrimaryBlack
                      : mCL,
                  child: Column(
                    children: [
                      _buildTitle(context, 'Notifications'),
                      _buildLineSettingWithToggle(
                        context: context,
                        title: 'Messages',
                        icon: PhosphorIcons.chat_centered_dots,
                      ),
                      _buildLineSettingWithToggle(
                        context: context,
                        title: 'React Post',
                        icon: PhosphorIcons.heart,
                      ),
                      _buildLineSettingWithToggle(
                        context: context,
                        title: 'Follow',
                        icon: PhosphorIcons.user_circle_plus,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.sp),
                Container(
                  color: ThemeService().isSavedDarkMode()
                      ? colorPrimaryBlack
                      : mCL,
                  child: Column(
                    children: [
                      _buildTitle(context, 'Security'),
                      _buildLineSettingWithToggle(
                        context: context,
                        title: 'PIN',
                        icon: PhosphorIcons.lock,
                      ),
                      _buildLineSettingWithToggle(
                        context: context,
                        title: 'Fingerprint',
                        icon: PhosphorIcons.fingerprint_fill,
                        isLast: true,
                      ),
                      SizedBox(height: 12.sp),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(context, title) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.sp,
        right: 8.sp,
        top: 15.sp,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.25.sp,
              fontFamily: FontFamily.lato_bold,
              fontWeight: FontWeight.bold,
              color: colorPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineSettingWithValue({
    context,
    title,
    icon,
    value,
    isLast = false,
  }) {
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
          top: 16.sp,
          bottom: 16.sp,
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
                      fontWeight: FontWeight.w500,
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

  Widget _buildLineSettingWithToggle({
    context,
    title,
    icon,
    isLast = false,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.sp,
        right: 8.sp,
        top: 16.sp,
        bottom: 16.sp,
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
                    fontWeight: FontWeight.w500,
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

  Widget _buildLineSettingToggle({context, title, isLast = false}) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.sp,
        right: 8.sp,
        top: 16.sp,
        bottom: 16.sp,
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
                    fontWeight: FontWeight.w500,
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
