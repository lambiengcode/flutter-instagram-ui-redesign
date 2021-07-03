import 'package:flutter/material.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class BottomSheetIncomming extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomSheetIncommingState();
}

class _BottomSheetIncommingState extends State<BottomSheetIncomming> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
