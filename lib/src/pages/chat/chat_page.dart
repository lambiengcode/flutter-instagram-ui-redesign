import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/chat/widgets/active_friend_card.dart';
import 'package:whoru/src/pages/chat/widgets/message_card.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 12.sp, right: 8.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 38.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: FontFamily.lato,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12.5.sp),
                  alignment: Alignment.center,
                  decoration:
                      AppDecoration.buttonActionCircle(context).decoration,
                  child: Icon(
                    Feather.search,
                    size: 17.5,
                    color: Theme.of(context).buttonColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.sp),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 80.sp),
                  itemCount: chats.length + 2,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Column(
                            children: [
                              _buildActiveFriend(context),
                              SizedBox(height: 16.0),
                            ],
                          )
                        : index == 1
                            ? Column(
                                children: [
                                  _buildTitle(context, 'Pinned'),
                                  ListView.builder(
                                    padding: EdgeInsets.only(top: 8.0),
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () =>
                                            Get.toNamed(Routes.CHAT_ROOM),
                                        child: MessageCard(
                                          pendingMessage:
                                              chats[3].pendingMessage,
                                          urlToImage: chats[3].image,
                                          fullName: chats[3].fullName,
                                          lastMessage: chats[3].lastMessage,
                                          time: chats[3].time,
                                          notification: chats[3].notification,
                                          blurHash: chats[3].blurHash,
                                          isLast: false,
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 12.5),
                                  _buildTitle(context, 'Recent Conversation'),
                                  SizedBox(height: 8.0),
                                ],
                              )
                            : Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(Routes.CHAT_ROOM),
                                    child: MessageCard(
                                      pendingMessage:
                                          chats[index - 2].pendingMessage,
                                      urlToImage: chats[index - 2].image,
                                      fullName: chats[index - 2].fullName,
                                      lastMessage: chats[index - 2].lastMessage,
                                      time: chats[index - 2].time,
                                      notification:
                                          chats[index - 2].notification,
                                      blurHash: chats[index - 2].blurHash,
                                      isLast: index == chats.length + 1,
                                    ),
                                  )
                                ],
                              );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(context, title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 11.5.sp,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.lato,
          ),
        ),
        SizedBox(width: 6.sp),
        title == 'Pinned'
            ? Padding(
                padding: EdgeInsets.only(bottom: 1.sp),
                child: Icon(
                  LineAwesomeIcons.thumb_tack,
                  size: 12.sp,
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _buildActiveFriend(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.width * .22,
      width: _size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chats.length - 1,
        itemBuilder: (context, index) {
          return ActiveFriendCard(
            urlToImage: chats[index + 1].image,
            fullName: chats[index + 1].fullName,
            blurHash: chats[index + 1].blurHash,
          );
        },
      ),
    );
  }
}
