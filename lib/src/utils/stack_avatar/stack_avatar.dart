import 'package:flutter/material.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class StackAvatar extends StatefulWidget {
  final List<String> images;
  StackAvatar({this.images});
  @override
  State<StatefulWidget> createState() => _StackAvatarState();
}

class _StackAvatarState extends State<StackAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          _buildAvatar(context, 0),
          _buildAvatar(context, 1),
          _buildAvatar(context, 2),
        ],
      ),
    );
  }

  Widget _buildAvatar(context, index) {
    return Container(
      height: 24.sp,
      width: 24.sp,
      margin: EdgeInsets.only(left: index * 12.sp),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: 3.sp,
        ),
        image: DecorationImage(
          image: NetworkImage(widget.images[index]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
