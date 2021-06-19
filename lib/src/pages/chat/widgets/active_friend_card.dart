import 'package:flutter/material.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';

class ActiveFriendCard extends StatefulWidget {
  final String blurHash;
  final String urlToImage;
  final String fullName;
  ActiveFriendCard({
    this.urlToImage,
    this.fullName,
    this.blurHash,
  });
  @override
  State<StatefulWidget> createState() => _ActivevFriendCardState();
}

class _ActivevFriendCardState extends State<ActiveFriendCard> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 12.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: _size.width * .16,
                width: _size.width * .16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorPrimary,
                    width: 2.6,
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  height: _size.width * .14,
                  width: _size.width * .14,
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
              ),
              Container(
                height: _size.width * .16,
                width: _size.width * .16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorPrimary,
                    width: 2.5,
                  ),
                ),
                alignment: Alignment.bottomRight,
                child: Container(
                  height: _size.width / 22.5,
                  width: _size.width / 22.5,
                  decoration: BoxDecoration(
                    color: mC,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    height: _size.width / 28.5,
                    width: _size.width / 28.5,
                    decoration: BoxDecoration(
                      color: colorActive,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
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
