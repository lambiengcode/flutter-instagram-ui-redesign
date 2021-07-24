import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class CommentCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.sp,
        right: 4.sp,
        bottom: 16.sp,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 26.sp,
                  width: 26.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/60530946?v=4',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'lambiengcode',
                              style: TextStyle(
                                fontFamily: FontFamily.lato,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\tcho em hỏi cô Thu Minh có người yêu chưa ạ? Em yêu cô!!!',
                              style: TextStyle(
                                fontFamily: FontFamily.lato,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.85.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Reply',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.75),
                              fontFamily: FontFamily.lato,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(width: 12.sp),
                          Text(
                            'Report',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.75),
                              fontFamily: FontFamily.lato,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            '\t\t\t•\t\t2m ago',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.75),
                              fontFamily: FontFamily.lato,
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 6.sp),
          IconButton(
            onPressed: () => null,
            icon: Icon(
              PhosphorIcons.heart,
              color: null,
              size: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
