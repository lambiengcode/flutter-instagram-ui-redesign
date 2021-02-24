import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/chat/widgets/active_friend_card.dart';
import 'package:whoru/src/pages/home/widgets/post_card.dart';

import '../../common/styles.dart';
import '../../common/styles.dart';
import '../../common/styles.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mC,
        elevation: .0,
        title: Text(
          'Whoru',
          style: TextStyle(
            color: colorTitle,
            fontFamily: 'Lobster',
            fontWeight: FontWeight.w400,
            fontSize: _size.width / 16.5,
          ),
        ),
        actions: [
          _buildActionHome(context, 'Camera', Feather.camera),
          SizedBox(width: 12.0),
          _buildActionHome(context, 'Camera', Feather.align_justify),
          SizedBox(width: 10.0),
        ],
      ),
      body: Container(
        color: mC,
        child: Column(
          children: [
            SizedBox(height: 10.0),
            _buildActiveFriend(context),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Divider(
                height: .2,
                thickness: .2,
                color: mCH,
              ),
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(top: .0),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return PostCard();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionHome(context, title, icon) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: 52.0,
      width: 52.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: mC,
        boxShadow: [
          BoxShadow(
            color: mCD,
            offset: Offset(2, 2),
            blurRadius: 2,
          ),
          BoxShadow(
            color: mCL,
            offset: Offset(-2, -2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: colorDarkGrey,
        size: _size.width / 20.5,
      ),
    );
  }

  Widget _buildActiveFriend(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.width * .215,
      width: _size.width,
      padding: EdgeInsets.only(left: 16.0, right: 4.0),
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
