import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../common/styles.dart';

class SplashPage extends StatefulWidget {
  final String points;
  SplashPage({this.points});
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: colorPrimary,
        height: _size.height,
        width: _size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: _size.width * .5,
                    width: _size.width * .5,
                    child: Lottie.asset('assets/lottie/splash_cat.json'),
                  ),
                  SizedBox(height: 24.0),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Whoru Social',
                          style: TextStyle(
                            color: mCL,
                            fontFamily: 'Lobster',
                            fontSize: _size.width / 18.8,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            fontSize: _size.width / 60.0,
                            color: mCL,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                          ),
                        ),
                        TextSpan(
                          text: widget.points,
                          style: TextStyle(
                            fontSize: _size.width / 20.0,
                            color: mCL,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '@${DateTime.now().year} Develop by ',
                    style: TextStyle(
                      color: mC,
                      fontFamily: 'Lato',
                      fontSize: _size.width / 32.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'WANTED',
                    style: TextStyle(
                      color: mCL,
                      fontFamily: 'Lato',
                      fontSize: _size.width / 35.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
