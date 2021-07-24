import 'package:flutter/material.dart';
import 'package:whoru/src/models/option_picker.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class OptionBarPicker extends StatefulWidget {
  final double ratioHeight;
  OptionBarPicker({this.ratioHeight});
  @override
  State<StatefulWidget> createState() => _OptionBarPickerState();
}

class _OptionBarPickerState extends State<OptionBarPicker> {
  int indexOption = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.sp,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        bottom: widget.ratioHeight == 1.0 ? .0 : 12.sp,
      ),
      child: ListView.builder(
        padding: EdgeInsets.only(
          left: 12.sp,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: optionPickers.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 14.sp),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2.sp),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: index == 0
                          ? optionPickers[index].color
                          : Colors.transparent,
                      width: 3.0,
                    ),
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(11.sp),
                    decoration: BoxDecoration(
                      color: optionPickers[index].color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      optionPickers[index].icon,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.sp),
                Text(
                  optionPickers[index].title,
                  style: TextStyle(
                    fontFamily: FontFamily.lato,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
