import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/lib/blurhash/blurhash.dart';
import 'package:whoru/src/pages/profile/widgets/bottom_pick_image.dart';

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
                  SizedBox(height: 24.0),
                  Container(
                    width: _size.width,
                    margin: EdgeInsets.symmetric(horizontal: 22.0),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: mCD,
                      boxShadow: [
                        BoxShadow(
                          color: mCL,
                          offset: Offset(1, 1),
                          blurRadius: 1,
                          spreadRadius: -1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Feather.lock,
                          color: colorHigh,
                          size: _size.width / 21.5,
                        ),
                        SizedBox(width: 10.0),
                        Padding(
                          padding: EdgeInsets.only(top: 2.0),
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                              color: colorHigh,
                              fontSize: _size.width / 26.0,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
