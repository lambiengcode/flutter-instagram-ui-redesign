import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/pages/profile/widgets/bottom_pick_image.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  void showImageBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomPickImage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Colors.transparent,
        elevation: .0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            color: mCM,
            size: 20.sp,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: mCM,
            fontSize: 15.sp,
            fontFamily: FontFamily.lato,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Feather.check,
              color: colorCompleted,
              size: 20.sp,
            ),
            onPressed: () => print('settings'),
          ),
        ],
      ),
      body: Container(
        height: 100.h,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 8.sp),
                  _buildLineInfo(
                      context, 'FullName', 'Please input your fullname'),
                  _buildDivider(context),
                  _buildLineInfo(
                      context, 'Username', 'Please input your fullname'),
                  _buildDivider(context),
                  _buildLineInfo(
                    context,
                    'Phone Number',
                    'Please input your fullname',
                  ),
                  _buildDivider(context),
                  _buildLineInfo(
                    context,
                    'Description',
                    'Please input your fullname',
                  ),
                  _buildDivider(context),
                  SizedBox(height: 32.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLineInfo(context, title, valid) {
    return Container(
      padding: EdgeInsets.fromLTRB(6.sp, 20.sp, 18.0, 4.0),
      child: TextFormField(
        cursorColor: colorTitle,
        cursorRadius: Radius.circular(30.0),
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        validator: (val) => val.length == 0 ? valid : null,
        onChanged: (val) {
          setState(() {});
        },
        inputFormatters: [
          title == 'phoneNumber'.trArgs()
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        //obscureText: title == 'Password' || title == 'Mật khẩu' ? true : false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(
            left: 10.sp,
            top: 4.sp,
          ),
          border: InputBorder.none,
          labelText: title,
          labelStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(context) {
    return Divider(
      thickness: .25,
      height: .25,
      indent: 16.sp,
      endIndent: 25.0,
    );
  }
}
