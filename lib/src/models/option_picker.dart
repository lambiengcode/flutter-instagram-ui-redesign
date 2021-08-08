import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whoru/src/themes/app_colors.dart';

class OptionPicker {
  final String title;
  final IconData icon;
  final Color color;
  OptionPicker({this.color, this.icon, this.title});
}

List<OptionPicker> optionPickers = [
  OptionPicker(
    title: 'Ảnh',
    icon: FontAwesomeIcons.solidFileImage,
    color: Colors.blueAccent,
  ),
  OptionPicker(
    title: 'Video',
    icon: FontAwesomeIcons.solidFileVideo,
    color: colorPrimary,
  ),
  OptionPicker(
    title: 'File',
    icon: FontAwesomeIcons.solidFile,
    color: Colors.amber.shade600,
  ),
  OptionPicker(
    title: 'Âm thanh',
    icon: PhosphorIcons.music_note_fill,
    color: Colors.deepPurpleAccent.shade200,
  ),
  OptionPicker(
    title: 'Vị trí',
    icon: FontAwesomeIcons.mapMarkerAlt,
    color: Colors.green.shade400,
  ),
  OptionPicker(
    title: 'Liên hệ',
    icon: FontAwesomeIcons.solidIdBadge,
    color: Colors.redAccent.shade100,
  ),
];
