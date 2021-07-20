import 'package:flutter/material.dart';
import 'package:whoru/src/pages/home/widgets/post_card.dart';

class PostsListview extends StatefulWidget {
  final ScrollController scrollController;
  PostsListview({this.scrollController});
  @override
  State<StatefulWidget> createState() => _PostsListviewState();
}

class _PostsListviewState extends State<PostsListview> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: ListView.builder(
        controller: widget.scrollController,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.only(top: .0),
        itemCount: 12,
        itemBuilder: (context, index) {
          return PostCard(
            idPost: index.toString(),
          );
        },
      ),
    );
  }
}
