import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/chat/widgets/active_friend_card.dart';
import 'package:whoru/src/pages/chat/widgets/message_card.dart';

import '../../common/styles.dart';

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
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: mC,
        height: _size.height,
        width: _size.width,
        padding: EdgeInsets.only(left: 16.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _size.height / 19.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: _size.width / 16.8,
                    color: colorTitle,
                    fontFamily: 'Lato-Bold',
                  ),
                ),
                Container(
                  height: 54.0,
                  width: 54.0,
                  decoration: nMboxCategoryOff,
                  child: Icon(
                    Feather.search,
                    color: colorDarkGrey,
                    size: _size.width / 20.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            _buildActiveFriend(context),
            SizedBox(height: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(context, 'Pinned'),
                  ListView.builder(
                    padding: EdgeInsets.only(top: 8.0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return MessageCard(
                        pendingMessage: chats[3].pendingMessage,
                        urlToImage: chats[3].image,
                        fullName: chats[3].fullName,
                        lastMessage: chats[3].lastMessage,
                        time: chats[3].time,
                        notification: chats[3].notification,
                      );
                    },
                  ),
                  SizedBox(height: 12.5),
                  _buildTitle(context, 'Recent Conversation'),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 8.0),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        return MessageCard(
                          pendingMessage: chats[index].pendingMessage,
                          urlToImage: chats[index].image,
                          fullName: chats[index].fullName,
                          lastMessage: chats[index].lastMessage,
                          time: chats[index].time,
                          notification: chats[index].notification,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(context, title) {
    final _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: colorDarkGrey,
            fontSize: _size.width / 26.5,
            fontWeight: FontWeight.w600,
            fontFamily: 'Lato',
          ),
        ),
        SizedBox(width: 12.0),
        title == 'Pinned'
            ? Padding(
                padding: EdgeInsets.only(bottom: 2.0),
                child: Icon(
                  LineAwesomeIcons.thumb_tack,
                  color: fCD,
                  size: _size.width / 22.5,
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _buildActiveFriend(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.width * .215,
      width: _size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chats.length - 1,
        itemBuilder: (context, index) {
          return ActiveFriendCard(
            urlToImage: chats[index + 1].image,
            fullName: chats[index + 1].fullName,
          );
        },
      ),
    );
  }
}
