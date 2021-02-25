import 'package:flutter/material.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/home/widgets/suggestions_user_card.dart';

import '../../../common/styles.dart';

class HorizontalUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HorizontalUserState();
}

class _HorizontalUserState extends State<HorizontalUser> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: _size.width * .46,
          width: _size.width,
          decoration: BoxDecoration(
            color: mCM,
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(right: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return SuggestionsUserCard(
                  image: chats[index].image,
                  fullName: chats[index].fullName,
                  cover: chats[index].image,
                );
              },
            ),
          ),
        ),
        Divider(
          height: 1.2,
          thickness: 1.2,
          color: mCM,
        ),
      ],
    );
  }
}
