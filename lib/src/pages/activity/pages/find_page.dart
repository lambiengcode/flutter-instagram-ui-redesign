import 'package:flutter/material.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/pages/home/widgets/post_card.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: mC,
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
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(top: .0),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return PostCard(
                      idPost: index.toString(),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
