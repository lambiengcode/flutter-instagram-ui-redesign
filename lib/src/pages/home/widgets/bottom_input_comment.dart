import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class BottomInputComment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomInputCommentState();
}

class _BottomInputCommentState extends State<BottomInputComment> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 4.sp),
        IconButton(
          onPressed: () => null,
          icon: Icon(
            PhosphorIcons.sticker_bold,
            color: colorPrimary,
            size: 22.sp,
          ),
        ),
        Expanded(
          child: TextField(
            onTap: () {},
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1.color,
              fontSize: 12.sp,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 6.sp,
                bottom: 3.sp,
                top: 3.sp,
                right: 10.sp,
              ),
              hintText: 'Type a comment...',
              hintStyle: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color.withOpacity(
                      ThemeService().isSavedDarkMode() ? .85 : .65,
                    ),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.lato,
              ),
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (mes) {},
          ),
        ),
        IconButton(
          onPressed: () => null,
          icon: Icon(
            PhosphorIcons.telegram_logo_fill,
            color: colorPrimary,
            size: 22.sp,
          ),
        ),
        SizedBox(width: 4.sp),
      ],
    );
  }
}
