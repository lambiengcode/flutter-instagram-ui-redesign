import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class ImagePickerCard extends StatefulWidget {
  final Uint8List imageMemory;
  final int index;
  final double ratioHeight;
  ImagePickerCard({
    this.imageMemory,
    this.index,
    this.ratioHeight,
  });
  @override
  State<StatefulWidget> createState() => _ImagePickerCardState();
}

class _ImagePickerCardState extends State<ImagePickerCard> {
  MemoryImage memoryImage;

  @override
  void initState() {
    super.initState();
    memoryImage = MemoryImage(widget.imageMemory);
  }

  @override
  void dispose() {
    memoryImage.evict().then((value) {
      print(value);
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            widget.ratioHeight == 1.0
                ? 2.0
                : widget.index == 0
                    ? 12.sp
                    : 2.0,
          ),
          topRight: Radius.circular(
            widget.ratioHeight == 1.0
                ? 2.0
                : widget.index == 2
                    ? 12.sp
                    : 2.0,
          ),
          bottomLeft: Radius.circular(2.0),
          bottomRight: Radius.circular(2.0),
        ),
        image: DecorationImage(
          image: memoryImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
