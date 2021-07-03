import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/home/widgets/suggestions_user_card.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class HorizontalUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HorizontalUserState();
}

class _HorizontalUserState extends State<HorizontalUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8.sp),
        Container(
          margin: EdgeInsets.symmetric(vertical: 6.sp),
          padding: EdgeInsets.only(left: 10.sp, right: 4.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Maybe you know',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.lato,
                ),
              ),
              // Text(
              //   'View All',
              //   style: TextStyle(
              //     color: Colors.blueAccent.shade400,
              //     fontSize: _size.width / 28.5,
              //     fontWeight: FontWeight.w500,
              //     fontFamily: 'Lato',
              //   ),
              // ),
              Icon(
                Feather.list,
                color: colorPrimary,
                size: 16.sp,
              ),
            ],
          ),
        ),
        Container(
          height: 144.sp,
          width: 100.w,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(right: 12.sp),
              scrollDirection: Axis.horizontal,
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return SuggestionsUserCard(
                  image: chats[index].image,
                  fullName: chats[index].fullName,
                  cover: chats[index].image,
                  blurHash: chats[index].blurHash,
                );
              },
            ),
          ),
        ),
        Divider(
          height: .25,
          thickness: .25,
        ),
      ],
    );
  }
}
