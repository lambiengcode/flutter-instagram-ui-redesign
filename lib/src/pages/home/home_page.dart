import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:whoru/src/models/access.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/widgets/image_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _size.height / 18.0),
            Padding(
              padding: EdgeInsets.only(left: 14.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => PlaceHolderImage(),
                          errorWidget: (context, url, error) =>
                              ErrorLoadingImage(),
                          imageUrl:
                              'https://avatars.githubusercontent.com/u/60530946?s=460&u=e342f079ed3571122e21b42eedd0ae251a9d91ce&v=4',
                        ),
                      ),
                      SizedBox(width: 12.0),
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
                      Feather.mic,
                      color: colorDarkGrey,
                      size: _size.width / 22.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0),
            _buildTitle(context, 'Activities'),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(context, title) {
    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: 14.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: colorTitle,
              fontSize: _size.width / 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'View All',
            style: TextStyle(
              color: colorPrimary,
              fontSize: _size.width / 28.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
