import 'package:flutter/material.dart';
import 'package:whoru/src/themes/app_colors.dart';

class DividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: 4.0,
      margin: EdgeInsets.symmetric(
        horizontal: _size.width * .35,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: mCD,
        boxShadow: [
          BoxShadow(
            color: mCD,
            offset: Offset(2.0, 2.0),
            blurRadius: 2.0,
          ),
          BoxShadow(
            color: mCL,
            offset: Offset(-1.0, -1.0),
            blurRadius: 1.0,
          ),
        ],
      ),
    );
  }
}
