import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/widgets/loading.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback toggleView;

  SignupPage({this.toggleView});
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode textFieldFocus = FocusNode();
  String fullName = '';
  String phone = '';
  String email = '';
  String idNum = '';
  String password = '';

  bool hidePassword = true;
  bool loading = false;

  hideKeyboard() => textFieldFocus.unfocus();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: .0,
              backgroundColor: mC,
              brightness: Brightness.light,
              leading: IconButton(
                onPressed: () => widget.toggleView(),
                icon: Icon(
                  Feather.arrow_left,
                  color: colorTitle,
                  size: _size.width / 15.0,
                ),
              ),
              title: Text(
                'getStarted'.trArgs(),
                style: TextStyle(
                  color: colorTitle,
                  fontSize: _size.width / 20.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              height: _size.height,
              width: _size.width,
              color: mC,
              child: Form(
                key: _formKey,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                    return true;
                  },
                  child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: .0),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _size.width * 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: mC,
                                  boxShadow: [
                                    BoxShadow(
                                      color: mCL,
                                      offset: Offset(-10, -10),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 12.0),
                                    _buildLineInfo(context, 'phone'.trArgs(),
                                        'validphone'.trArgs()),
                                    _buildDivider(context),
                                    // _buildLineInfo(
                                    //   context,
                                    //   'fullname'.trArgs(),
                                    //   'validfullname'.trArgs(),
                                    // ),
                                    // _buildDivider(context),
                                    // _buildLineInfo(
                                    //   context,
                                    //   'email'.trArgs(),
                                    //   'validemail'.trArgs(),
                                    // ),
                                    // _buildDivider(context),
                                    // _buildLineInfo(
                                    //   context,
                                    //   'password'.trArgs(),
                                    //   'validpsw'.trArgs(),
                                    // ),
                                    // _buildDivider(context),
                                    // Container(
                                    //   padding: EdgeInsets.fromLTRB(
                                    //       14.0, 24.0, 18.0, 4.0),
                                    //   child: TextFormField(
                                    //     cursorColor: colorTitle,
                                    //     cursorRadius: Radius.circular(30.0),
                                    //     style: TextStyle(
                                    //       color: Colors.black87,
                                    //       fontSize: _size.width / 26.0,
                                    //       fontWeight: FontWeight.w500,
                                    //     ),
                                    //     validator: (val) =>
                                    //         val.trim() != password
                                    //             ? 'validconfirmpsw'.trArgs()
                                    //             : null,
                                    //     obscureText: hidePassword,
                                    //     decoration: InputDecoration(
                                    //       floatingLabelBehavior:
                                    //           FloatingLabelBehavior.always,
                                    //       contentPadding: EdgeInsets.only(
                                    //         left: 12.0,
                                    //       ),
                                    //       border: InputBorder.none,
                                    //       labelText: 'confirmpsw'.trArgs(),
                                    //       labelStyle: TextStyle(
                                    //         color: colorTitle,
                                    //         fontSize: _size.width / 26.0,
                                    //         fontWeight: FontWeight.w600,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // _buildDivider(context),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {}
                                },
                                child: Container(
                                  height: 46.8,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: _size.width * .12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    color: colorTitle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'createAccount'.trArgs(),
                                      style: TextStyle(
                                        color: mC,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 36.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
        validator: (val) {
          switch (title) {
            case 'Email':
              return GetUtils.isEmail(val.trim()) ? null : valid;
            case 'Phone Number':
              return GetUtils.isPhoneNumber(val.trim()) ? null : valid;
            case 'Password':
              return val.trim().length < 6 ? valid : null;

            // Vietnamese
            case 'Số điện thoại':
              return GetUtils.isPhoneNumber(val.trim()) ? null : valid;
            case 'Mật khẩu':
              return val.trim().length < 6 ? valid : null;
            default:
              return val.trim().length == 0 ? valid : null;
          }
        },
        onChanged: (val) {
          setState(() {
            switch (title) {
              // en-US
              case 'Full Name':
                fullName = val.trim();
                break;
              case 'Phone Number':
                phone = val.trim();
                break;
              case 'Email':
                email = val.trim();
                break;
              case 'ID Number':
                idNum = val.trim();
                break;
              case 'Password':
                password = val.trim();
                break;

              // vi-VN
              case 'Họ và Tên':
                fullName = val.trim();
                break;
              case 'Số điện thoại':
                phone = val.trim();
                break;
              case 'Email':
                email = val.trim();
                break;
              case 'Số CMND/CCCD':
                idNum = val.trim();
                break;
              case 'Mật khẩu':
                password = val.trim();
                break;
              default:
                break;
            }
          });
        },
        inputFormatters: [
          title == 'Phone Number' || title == 'Số Điện Thoại'
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter,
        ],
        obscureText: title == 'Password' || title == 'Mật khẩu' ? true : false,
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
