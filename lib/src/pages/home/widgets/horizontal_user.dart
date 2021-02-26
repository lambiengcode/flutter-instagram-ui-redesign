import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.only(left: 12.0, right: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Maybe you know',
                style: TextStyle(
                  color: colorDarkGrey,
                  fontSize: _size.width / 26.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Lato',
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
                size: _size.width / 18.0,
              ),
            ],
          ),
        ),
        Container(
          height: _size.width * .48,
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
