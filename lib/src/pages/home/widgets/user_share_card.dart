import 'package:flutter/material.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class UserShareCard extends StatefulWidget {
  final int pendingMessage;
  final String urlToImage;
  final String blurHash;
  final String fullName;
  final String lastMessage;
  final String time;
  final bool notification;
  final bool isLast;
  UserShareCard({
    this.pendingMessage,
    this.fullName,
    this.lastMessage,
    this.notification,
    this.time,
    this.urlToImage,
    this.blurHash,
    @required this.isLast,
  });
  @override
  State<StatefulWidget> createState() => _UserShareCardState();
}

class _UserShareCardState extends State<UserShareCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.sp, right: 8.sp),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 14.w,
                        width: 14.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000.0),
                          child: BlurHash(
                            hash: widget.blurHash,
                            image: widget.urlToImage,
                            imageFit: BoxFit.cover,
                            curve: Curves.bounceInOut,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.fullName,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: widget.pendingMessage == 0
                                  ? FontFamily.lato
                                  : FontFamily.lato_bold,
                              wordSpacing: .01,
                            ),
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            'Active 5m ago',
                            style: TextStyle(
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.lato,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Ratio Button
              ],
            ),
          ),
          widget.isLast
              ? Container()
              : Divider(
                  thickness: .2,
                  height: .2,
                  indent: 14.w,
                  endIndent: 12.0,
                ),
        ],
      ),
    );
  }
}
