import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class ActiveFriendCard extends StatefulWidget {
  final String urlToImage;
  final String fullName;
  ActiveFriendCard({this.urlToImage, this.fullName});
  @override
  State<StatefulWidget> createState() => _ActivevFriendCardState();
}

class _ActivevFriendCardState extends State<ActiveFriendCard> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: _size.width * .14,
            width: _size.width * .14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomRight,
            child: Container(
              height: 16.0,
              width: 16.0,
              decoration: BoxDecoration(
                color: mC,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Container(
                height: 12.0,
                width: 12.0,
                decoration: BoxDecoration(
                  color: colorActive,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            widget.fullName.length > 10
                ? widget.fullName.substring(0, 8) + '..'
                : widget.fullName,
            style: TextStyle(
              color: colorTitle,
              fontSize: _size.width / 32.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Lato',
            ),
          ),
        ],
      ),
    );
  }
}
