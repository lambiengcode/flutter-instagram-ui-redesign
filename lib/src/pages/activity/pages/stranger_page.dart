import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:whoru/src/common/styles.dart';

class StrangerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StrangerPageState();
}

class _StrangerPageState extends State<StrangerPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      color: mC,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24.0),
              Expanded(
                child: Container(
                  width: _size.width,
                  alignment: Alignment.center,
                  child: Container(
                    width: _size.width * .8,
                    child: Lottie.asset('assets/lottie/stranger_cat.json'),
                  ),
                ),
              ),
              SizedBox(height: _size.width * .1),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: _size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16.0, top: 16.0),
                      padding: EdgeInsets.all(16.5),
                      alignment: Alignment.center,
                      decoration: nMbox,
                      child: Icon(
                        Feather.settings,
                        color: colorDarkGrey,
                        size: _size.width / 22.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionProfile(
                        context, 'Call', Feather.phone_call, colorCompleted),
                    SizedBox(width: 36.0),
                    _buildActionProfile(
                        context, 'Video', Feather.video, colorPrimary),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionProfile(context, title, icon, color) {
    final _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        switch (title) {
          default:
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 46.0,
        ),
        alignment: Alignment.center,
        decoration: nMbox,
        child: Icon(
          icon,
          color: color,
          size: _size.width / 18.5,
        ),
      ),
    );
  }
}
