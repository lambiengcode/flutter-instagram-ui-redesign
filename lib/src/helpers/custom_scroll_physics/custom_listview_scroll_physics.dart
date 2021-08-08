import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class CustomListViewScrollPhysics extends ScrollPhysics {
  const CustomListViewScrollPhysics({ScrollPhysics parent})
      : super(parent: parent);

  @override
  CustomListViewScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomListViewScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 80.0,
        stiffness: 100.0,
        damping: 1.0,
      );
}
