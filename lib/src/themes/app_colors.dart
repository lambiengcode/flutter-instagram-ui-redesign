import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    @required this.header,
    @required this.primary,
    @required this.background,
    @required this.accent,
    @required this.disabled,
    @required this.error,
    @required this.divider,
    @required this.signIn,
    @required this.signOut,
  });

  factory AppColors.light() {
    return const AppColors(
      header: Color(0xff121212),
      primary: Color(0xFF1DA1F2),
      background: Colors.white,
      accent: Color(0xff17c063),
      disabled: Colors.black12,
      error: Color(0xffff7466),
      divider: Colors.black26,
      signIn: Color(0xff4285f4),
      signOut: Color(0xffc53829),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      header: Colors.white,
      primary: Color(0xFF1DA1F2),
      background: Color(0xff121212),
      accent: Color(0xff17c063),
      disabled: Colors.white12,
      error: Color(0xffff5544),
      divider: Colors.white24,
      signIn: Color(0xff4285f4),
      signOut: Color(0xffc53829),
    );
  }

  final Color primary;
  final Color background;
  final Color accent;
  final Color disabled;
  final Color error;
  final Color divider;
  final Color header;

  final Color signIn;
  final Color signOut;
}
