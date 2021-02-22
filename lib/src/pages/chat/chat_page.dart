import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/widgets/image_widget.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  SlidableController slidableController = new SlidableController();
  Animation<double> _rotationAnimation;
  Color _fabColor = Colors.blue;

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }

  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      _fabColor = isOpen ? Colors.green : Colors.blue;
    });
  }

  @override
  void initState() {
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _size.height / 20.0),
            Padding(
              padding: EdgeInsets.only(left: 14.0, right: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                          width: 38.0,
                          height: 38.0,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => PlaceHolderImage(),
                          errorWidget: (context, url, error) =>
                              ErrorLoadingImage(),
                          imageUrl:
                              'https://avatars.githubusercontent.com/u/60530946?s=460&u=e342f079ed3571122e21b42eedd0ae251a9d91ce&v=4',
                        ),
                      ),
                      SizedBox(width: 8.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hi, ',
                              style: TextStyle(
                                fontSize: _size.width / 16.0,
                                color: colorTitle,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Lobster',
                              ),
                            ),
                            TextSpan(
                              text: 'lambiengcode',
                              style: TextStyle(
                                fontSize: _size.width / 16.0,
                                color: colorPrimary,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Lobster',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 54.0,
                    width: 54.0,
                    decoration: nMboxCategoryOff,
                    child: Icon(
                      Feather.plus,
                      color: colorPrimary,
                      size: _size.width / 20.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
