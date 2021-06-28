import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whoru/src/common/styles.dart';

import 'package:whoru/src/widgets/loading.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback toggleView;

  LoginPage({this.toggleView});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode textFieldFocus = FocusNode();
  String email = '';
  String password = '';

  bool hidePassword = true;
  bool loading = false;
  bool rememberPsw = false;

  hideKeyboard() => textFieldFocus.unfocus();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              height: _size.height,
              width: _size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                    .85,
                    .0,
                  ), // 10% of the width, so there are ten blinds.
                  colors: [
                    mC,
                    mCL,
                  ], // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
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
                        SizedBox(height: 24.0),
                        Container(
                          height: _size.height * .36,
                          width: _size.width,
                          margin: EdgeInsets.fromLTRB(
                            _size.width * 0.1,
                            _size.height * .088 - 16.0,
                            _size.width * 0.1,
                            16.0,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/login.png'),
                              fit: BoxFit.fitHeight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: mCL,
                                offset: Offset(-10, -10),
                                blurRadius: 10,
                              ),
                              BoxShadow(
                                color: mCL,
                                offset: Offset(10, 10),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: _size.width * 0.1,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: mC,
                                  boxShadow: [
                                    BoxShadow(
                                      color: mCD,
                                      offset: Offset(10, 10),
                                      blurRadius: 10,
                                    ),
                                    BoxShadow(
                                      color: mCL,
                                      offset: Offset(-10, -10),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 10.0),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: TextFormField(
                                        cursorColor: colorTitle,
                                        cursorRadius: Radius.circular(30.0),
                                        style: TextStyle(
                                          color: colorTitle,
                                          fontSize: _size.width / 26.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .singleLineFormatter,
                                        ],
                                        validator: (val) =>
                                            GetUtils.isPhoneNumber(
                                                        val.trim()) ==
                                                    false
                                                ? 'validphone'.trArgs()
                                                : null,
                                        onChanged: (val) => email = val.trim(),
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'phone'.trArgs(),
                                          labelStyle: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: _size.width / 26.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade300,
                                      thickness: .25,
                                      height: .25,
                                      indent: 18.0,
                                      endIndent: 18.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: TextFormField(
                                        cursorColor: colorTitle,
                                        cursorRadius: Radius.circular(30.0),
                                        style: TextStyle(
                                          color: colorTitle,
                                          fontSize: _size.width / 26.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        focusNode: textFieldFocus,
                                        validator: (val) => val.length < 6
                                            ? 'validpsw'.trArgs()
                                            : null,
                                        onChanged: (val) =>
                                            password = val.trim(),
                                        obscureText: hidePassword,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          contentPadding: EdgeInsets.only(
                                            left: 12.0,
                                            right: 8.0,
                                          ),
                                          border: InputBorder.none,
                                          labelText: 'password'.trArgs(),
                                          labelStyle: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: _size.width / 26.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          suffix: GestureDetector(
                                            onTap: () => print('forgot'),
                                            child: Text(
                                              'forgot'.trArgs(),
                                              style: TextStyle(
                                                color: colorPrimary,
                                                fontSize: _size.width / 36.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 6.0),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.toggleView();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 24.0,
                                    bottom: 12.0,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'gosignup'.trArgs(),
                                      style: TextStyle(
                                        color: colorTitle,
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {}
                                },
                                child: Container(
                                  height: 46.8,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 32.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: colorTitle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'login'.trArgs(),
                                      style: TextStyle(
                                        color: mC,
                                        fontSize: 12.8,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
