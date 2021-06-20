import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/chat/widgets/active_friend_card.dart';
import 'package:whoru/src/pages/home/widgets/horizontal_user.dart';
import 'package:whoru/src/pages/home/widgets/post_card.dart';
import 'package:whoru/src/routes/app_pages.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        title: GestureDetector(
          onTap: () => Get.offAndToNamed(Routes.ROOT),
          child: Text(
            'Whoru',
            style: TextStyle(
              fontFamily: 'Lobster',
              fontWeight: FontWeight.w400,
              fontSize: _size.width / 16.0,
            ),
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
        child: Column(
          children: [
            SizedBox(height: 4.0),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(top: .0),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? _buildActiveFriend(context)
                        : index == 5
                            ? HorizontalUser()
                            : PostCard(
                                idPost: index.toString(),
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

  Widget _buildActionHome(context, title, icon) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 1,
          ),
          BoxShadow(
            offset: Offset(-1, -1),
            blurRadius: 1,
          ),
        ],
      ),
      child: Icon(
        icon,
        size: _size.width / 22.5,
      ),
    );
  }

  Widget _buildActiveFriend(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            height: _size.width * .22,
            width: _size.width,
            padding: EdgeInsets.only(right: 2.0),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return ActiveFriendCard(
                    blurHash: chats[index].blurHash,
                    urlToImage: chats[index].image,
                    fullName: chats[index].fullName,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 2.0),
            child: Divider(
              height: .2,
              thickness: .2,
            ),
          ),
        ],
      ),
    );
  }
}
