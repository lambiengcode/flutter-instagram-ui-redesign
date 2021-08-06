import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class CustomRoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomRoomPageState();
}

class _CustomRoomPageState extends State<CustomRoomPage> {
  bool _notifications = true;
  bool _sendMail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        elevation: .0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 20.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => print('more'),
            icon: Icon(
              MaterialIcons.call,
              color: colorPrimary,
              size: 18.sp,
            ),
          ),
          IconButton(
            onPressed: () => print('more'),
            icon: Icon(
              PhosphorIcons.video_camera_fill,
              color: colorPrimary,
              size: 18.sp,
            ),
          ),
          SizedBox(width: 8.0),
          VerticalDivider(
            width: .5,
            thickness: .5,
            indent: 12.sp,
            endIndent: 10.sp,
          ),
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.more_vertical,
              color: Theme.of(context).textTheme.bodyText1.color,
              size: 20.sp,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 6.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => null,
                    child: Container(
                      height: 90.sp,
                      width: 90.sp,
                      padding: EdgeInsets.only(
                        bottom: 2.sp,
                        right: 8.sp,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(chats[4].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 15.5.sp,
                        width: 15.5.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          height: 12.sp,
                          width: 12.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorActive,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.sp),
              Text(
                'Material Design',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.sp),
              _buildLineSettingWithValue(
                context: context,
                title: 'Color',
                value: 'Mint',
                icon: PhosphorIcons.paint_bucket,
              ),
              _buildLineSettingWithValue(
                context: context,
                title: 'Alias',
                value: '',
                isLast: true,
                icon: PhosphorIcons.swatches,
              ),
              _buildTitle(context, 'Others  Feature'),
              _buildLineSettingWithValue(
                context: context,
                title: 'Photos',
                value: '146',
                icon: PhosphorIcons.image,
              ),
              _buildLineSettingWithValue(
                context: context,
                title: 'Videos',
                value: '2',
                icon: PhosphorIcons.monitor_play,
              ),
              _buildLineSettingWithValue(
                context: context,
                title: 'Files',
                value: '6',
                icon: PhosphorIcons.file,
              ),
              _buildLineSettingWithValue(
                context: context,
                title: 'Shared Links',
                value: '1',
                icon: PhosphorIcons.link,
              ),
              _buildLineSettingWithValue(
                context: context,
                title: 'Go to secret conversation',
                value: '',
                icon: PhosphorIcons.lock,
              ),
              _buildLineSettingWithValue(
                context: context,
                title: 'Create Group with Material',
                value: '',
                icon: PhosphorIcons.users,
                isLast: true,
              ),
              _buildTitle(context, 'Notifications'),
              _buildLineSettingWithToggle(
                context: context,
                title: 'Notification',
                icon: PhosphorIcons.bell,
              ),
              _buildLineSettingWithToggle(
                context: context,
                title: 'Send message to Email',
                isLast: true,
                icon: PhosphorIcons.envelope,
              ),
              _buildTitle(context, 'Privacy'),
              _buildLineSettingWithoutValue(
                context: context,
                title: 'Report Material',
                icon: PhosphorIcons.user_circle_minus,
              ),
              _buildLineSettingWithoutValue(
                context: context,
                title: 'Delete Conversation',
                icon: PhosphorIcons.trash_simple,
                color: colorHigh,
                isLast: true,
              ),
              SizedBox(height: 20.sp),
            ],
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
        bottom: 4.sp,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 10.sp,
              fontFamily: FontFamily.lato_bold,
              fontWeight: FontWeight.bold,
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(.65),
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
          right: 5.sp,
          top: 15.sp,
          bottom: 15.sp,
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
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(.8),
                  ),
                ),
                SizedBox(width: 6.sp),
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
            width: 36.sp,
            height: 20.sp,
            value: title == 'Notification' ? _notifications : _sendMail,
            toggleSize: 14.sp,
            activeColor: colorPrimary,
            onToggle: (val) {
              setState(() {
                if (title == 'Notification') {
                  _notifications = val;
                } else {
                  _sendMail = val;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLineSettingWithoutValue({
    context,
    title,
    icon,
    isLast = false,
    color,
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
          right: 5.sp,
          top: 15.sp,
          bottom: 15.sp,
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
                  color: color,
                ),
                SizedBox(width: 12.sp),
                Padding(
                  padding: EdgeInsets.only(top: 1.2),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
