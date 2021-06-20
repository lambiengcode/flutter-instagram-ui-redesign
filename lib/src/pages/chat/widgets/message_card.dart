import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class MessageCard extends StatefulWidget {
  final int pendingMessage;
  final String urlToImage;
  final String blurHash;
  final String fullName;
  final String lastMessage;
  final String time;
  final bool notification;
  final bool isLast;
  MessageCard({
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
  State<StatefulWidget> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                              fontSize: 13.5.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato',
                            ),
                          ),
                          SizedBox(height: 6.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.lastMessage,
                                  style: TextStyle(
                                    fontSize: 10.5.sp,
                                    fontWeight: widget.pendingMessage == 0
                                        ? FontWeight.w500
                                        : FontWeight.w600,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                TextSpan(
                                  text: '\t\t•\t',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                TextSpan(
                                  text: widget.time,
                                  style: TextStyle(
                                    fontSize: 9.5.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                widget.notification == false
                    ? Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Feather.bell_off,
                          size: 18.sp,
                        ),
                      )
                    : widget.pendingMessage == 0
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(right: 6.0),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.5,
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: colorPrimary,
                            ),
                            child: Text(
                              widget.pendingMessage.toString(),
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: mCL,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Lato',
                              ),
                            ),
                          ),
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
