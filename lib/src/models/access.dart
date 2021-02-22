import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Access {
  final String title;
  final IconData icon;
  Access({this.title, this.icon});
}

List<Access> actions = [
  new Access(
    title: 'Secret',
    icon: Feather.lock,
  ),
  new Access(
    title: 'Chart',
    icon: Feather.pie_chart,
  ),
  new Access(
    title: 'History',
    icon: Feather.clock,
  ),
  new Access(
    title: 'Trash',
    icon: Feather.trash,
  ),
];
