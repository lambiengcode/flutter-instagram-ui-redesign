import 'package:flutter/material.dart';
import 'package:whoru/src/themes/app_colors.dart';

class AppDecoration {
  final BoxDecoration decoration;
  AppDecoration({@required this.decoration});
  factory AppDecoration.buttonActionCircle(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorPrimaryBlack,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.8),
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
            BoxShadow(
              color: colorBlack.withOpacity(.35),
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: mC,
          boxShadow: [
            BoxShadow(
              color: mCD,
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
            BoxShadow(
              color: mCL,
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.buttonActionBorder(context, radius) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: colorPrimaryBlack,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.8),
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
            BoxShadow(
              color: colorBlack.withOpacity(.35),
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: mC,
          boxShadow: [
            BoxShadow(
              color: mCD,
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
            BoxShadow(
              color: mCL,
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.tabBarDecoration(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
        color: colorPrimaryBlack.withOpacity(.85),
        boxShadow: [
          BoxShadow(
            color: colorBlack,
            offset: Offset(-2, -2),
            blurRadius: 2,
          ),
          BoxShadow(
            color: colorBlack.withOpacity(.8),
            offset: Offset(2, 2),
            blurRadius: 2,
          ),
        ],
      ));
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          color: mCL,
          boxShadow: [
            BoxShadow(
              color: mCD,
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
            BoxShadow(
              color: mC,
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.tabBarDecorationSecond(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
          decoration: BoxDecoration(
        color: colorPrimaryBlack,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.6),
            offset: Offset(1, 1),
            blurRadius: 1,
          ),
        ],
      ));
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          color: mC,
          boxShadow: [
            BoxShadow(
              color: mCD,
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    }
  }

  factory AppDecoration.inputChatDecoration(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
          color: Colors.black.withOpacity(.35),
          boxShadow: [
            BoxShadow(
              color: colorPrimaryBlack.withOpacity(.15),
              offset: Offset(2, 2),
              blurRadius: 2,
              spreadRadius: -2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
          color: mCD,
          boxShadow: [
            BoxShadow(
              color: mCL,
              offset: Offset(3, 3),
              blurRadius: 3,
              spreadRadius: -3,
            ),
          ],
        ),
      );
    }
  }
}
