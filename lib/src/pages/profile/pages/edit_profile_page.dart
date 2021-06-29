import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/pages/profile/widgets/bottom_pick_image.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';

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
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Colors.transparent,
        elevation: .0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            color: mCM,
            size: _size.width / 15.0,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: mCM,
            fontSize: _size.width / 20.0,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Feather.check,
              color: colorCompleted,
              size: _size.width / 16.0,
            ),
            onPressed: () => print('settings'),
          ),
        ],
      ),
      body: Container(
        color: mC,
        height: _size.height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () => showImageBottomSheet(),
                    child: Container(
                      width: _size.width,
                      height: _size.height * .265,
                      child: BlurHash(
                        hash: "L79ZK77eC+of+G8^VXz;Ty^lb^2?",
                        image:
                            'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797',
                        imageFit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: _size.height * .045),
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
                  Container(
                    width: _size.width,
                    margin: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        color: colorHigh,
                        fontSize: _size.width / 26.8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _buildDivider(context),
                ],
              ),
              Positioned(
                top: _size.height * .182,
                left: 0,
                child: GestureDetector(
                  onTap: () => showImageBottomSheet(),
                  child: Container(
                    width: _size.width,
                    alignment: Alignment.center,
                    child: Container(
                      height: _size.height * .152,
                      width: _size.height * .152,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colorPrimary,
                          width: 3.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        height: _size.height * .132,
                        width: _size.height * .132,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/avt.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLineInfo(context, title, valid) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(14.0, 18.0, 18.0, 4.0),
      child: TextFormField(
        cursorColor: colorTitle,
        cursorRadius: Radius.circular(30.0),
        style: TextStyle(
          color: colorTitle,
          fontSize: _size.width / 26.0,
          fontWeight: FontWeight.w500,
        ),
        validator: (val) => val.length == 0 ? valid : null,
        onChanged: (val) {
          setState(() {});
        },
        inputFormatters: [
          title == 'Phone Number' || title == 'Số Điện Thoại'
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        //obscureText: title == 'Password' || title == 'Mật khẩu' ? true : false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.only(
            left: 12.0,
          ),
          border: InputBorder.none,
          labelText: title,
          labelStyle: TextStyle(
            color: colorTitle,
            fontSize: _size.width / 26.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(context) {
    return Divider(
      color: Colors.grey.shade400,
      thickness: .25,
      height: .25,
      indent: 25.0,
      endIndent: 25.0,
    );
  }
}
