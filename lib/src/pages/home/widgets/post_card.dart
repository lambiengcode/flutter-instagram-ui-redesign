import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whoru/src/data/chat.dart';

import '../../../common/styles.dart';

class PostCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mC,
        boxShadow: [
          BoxShadow(
            color: mCD,
            offset: Offset(10, 10),
            blurRadius: 10,
          ),
          BoxShadow(
            color: mCL,
            offset: Offset(-10, -10),
            blurRadius: 10,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 12.0),
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: [
          _buildHeader(context),
          _buildBody(context),
          _buildBottom(context),
        ],
      ),
    );
  }

  Widget _buildHeader(context) {
    final _size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoWritter(context),
        IconButton(
          icon: Icon(
            Feather.more_horizontal,
            color: colorDarkGrey,
            size: _size.width / 16.0,
          ),
          onPressed: () => null,
        )
      ],
    );
  }

  Widget _buildBody(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.8),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.0),
          Text(
            'Adding a few more photos to my portfolio. Need a photographer? Get in touch!',
            style: TextStyle(
              color: colorTitle,
              fontSize: _size.width / 25.4,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 18.0),
          Container(
            height: _size.height * .26,
            constraints: BoxConstraints(
              maxHeight: _size.height * .24,
              maxWidth: _size.width,
            ),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => Container(
                decoration: BoxDecoration(
                  borderRadius: index == 0
                      ? BorderRadius.horizontal(
                          left: Radius.circular(12.0),
                        )
                      : index == 1
                          ? BorderRadius.only(
                              topRight: Radius.circular(12.0),
                            )
                          : BorderRadius.only(
                              bottomRight: Radius.circular(12.0),
                            ),
                  image: DecorationImage(
                    image: NetworkImage(chats[index + 1].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index == 0 ? 2.4 : 1.2),
            ),
          ),
          SizedBox(height: 26.0),
        ],
      ),
    );
  }

  Widget _buildBottom(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildActionButton(
                context,
                'Like',
                Feather.thumbs_up,
                colorPrimary,
                '10k',
              ),
              SizedBox(width: 24.0),
              _buildActionButton(
                context,
                'Comment',
                Feather.message_circle,
                colorDarkGrey,
                '229',
              ),
            ],
          ),
          _buildActionButton(
            context,
            'Share',
            Feather.upload,
            colorDarkGrey,
            null,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(context, title, icon, color, value) {
    final _size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          SizedBox(width: 8.0),
          Icon(
            icon,
            color: color,
            size: _size.width / 20.0,
          ),
          SizedBox(width: 8.0),
          title == 'Share'
              ? Container()
              : Text(
                  value.toString(),
                  style: TextStyle(
                    color: color,
                    fontSize: _size.width / 28.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Lato',
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildInfoWritter(context) {
    final _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          height: _size.width * .115,
          width: _size.width * .115,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/avt.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'lambiengcode',
              style: TextStyle(
                color: colorTitle,
                fontSize: _size.width / 24.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Lato',
              ),
            ),
            SizedBox(height: 2.5),
            Text(
              '2m ago',
              style: TextStyle(
                color: colorDarkGrey,
                fontSize: _size.width / 28.5,
                fontWeight: FontWeight.w500,
                fontFamily: 'Lato',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
