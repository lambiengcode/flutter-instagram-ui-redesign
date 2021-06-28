import 'package:flutter/material.dart';
import 'package:whoru/src/common/styles.dart';

class AppColors {
  final Color primary;
  final Color background;
  final Color accent;
  final Color disabled;
  final Color error;
  final Color divider;
  final Color header;
  final Color button;
  final Color contentText1;

  const AppColors(
      {@required this.header,
      @required this.primary,
      @required this.background,
      @required this.accent,
      @required this.disabled,
      @required this.error,
      @required this.divider,
      @required this.button,
      @required this.contentText1});

  factory AppColors.light() {
    return AppColors(
      header: Color(0xff121212),
      primary: Color(0xFF1DA1F2),
      background: mC,
      accent: Color(0xff17c063),
      disabled: Colors.black12,
      error: Color(0xffff7466),
      divider: Colors.black26,
      button: Color(0xFF657786),
      contentText1: colorDarkGrey,
    );
  }

  factory AppColors.dark() {
    return AppColors(
      header: Colors.white,
      primary: Color(0xFF1DA1F2),
      background: Color(0xff121212),
      accent: Color(0xff17c063),
      disabled: Colors.white12,
      error: Color(0xffff5544),
      divider: Colors.white24,
      button: Colors.white,
      contentText1: mCL,
    );
  }
}
