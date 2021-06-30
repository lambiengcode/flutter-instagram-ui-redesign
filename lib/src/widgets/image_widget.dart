import 'package:flutter/material.dart';
import 'package:whoru/src/themes/app_decoration.dart';

class ErrorLoadingImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.buttonActionCircle(context).decoration,
    );
  }
}

class PlaceHolderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.inputChatDecoration(context).decoration,
    );
  }
}
