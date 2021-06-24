import 'package:flutter/material.dart';
import 'package:whoru/src/common/styles.dart';

class AppDecoration {
  final BoxDecoration boxDecoration;
  AppDecoration({@required this.boxDecoration});
  factory AppDecoration.buttonActionCircle(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        boxDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorBlack.withOpacity(.75),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
            BoxShadow(
              color: colorBlack.withOpacity(.45),
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        boxDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: mC,
          boxShadow: [
            BoxShadow(
              color: mCD,
              offset: Offset(2, 2),
              blurRadius: 2,
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

  factory AppDecoration.buttonActionBorder(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return AppDecoration(
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: colorBlack.withOpacity(.75),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 2,
            ),
            BoxShadow(
              color: colorBlack.withOpacity(.45),
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
      );
    } else {
      return AppDecoration(
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: mC,
          boxShadow: [
            BoxShadow(
              color: mCD,
              offset: Offset(2, 2),
              blurRadius: 2,
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
}
