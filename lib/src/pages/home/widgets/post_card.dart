import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/home/controllers/post_controller.dart';
import 'package:whoru/src/pages/home/widgets/image_body_post.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';

class PostCard extends StatefulWidget {
  final String idPost;
  PostCard({this.idPost});
  @override
  State<StatefulWidget> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final postController = Get.put(PostController());
  final GlobalKey<LikeButtonState> _globalKey = GlobalKey<LikeButtonState>();
  List<String> images = [];
  List<String> blurHashs = [];
  bool liked = false;
  int likeCount = 797;

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    if (liked == false) {
      postController.startTimmer(widget.idPost);
      postController.favouritePost(widget.idPost);
    } else {
      postController.unFavouritePost(widget.idPost);
    }

    setState(() {
      liked = !liked;
      liked ? likeCount++ : likeCount--;
    });

    return !isLiked;
  }

  @override
  void initState() {
    super.initState();
    postController.initialCount();
    chats.forEach((e) {
      images.add(e.image);
      blurHashs.add(e.blurHash);
    });
    images.shuffle();
    liked = postController.isFavourite(widget.idPost);
    if (postController.isFavourite(widget.idPost)) likeCount++;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: mCH,
            width: .2,
          ),
        ),
      ),
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
    return Padding(
      padding: EdgeInsets.only(left: 12.0, right: 6.0),
      child: Row(
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
      ),
    );
  }

  Widget _buildBody(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: images.length == 0 ? 16.0 : 12.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              'Adding a few more photos to my portfolio. Need a photographer? Get in touch!',
              style: TextStyle(
                color: colorTitle,
                fontSize: _size.width / 26.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato',
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: images.length == 0 ? .0 : 14.0),
          images.length == 0
              ? Container()
              : GestureDetector(
                  onDoubleTap: () {
                    _globalKey.currentState.onTap();
                  },
                  child: GetBuilder<PostController>(
                    builder: (controller) => Stack(
                      children: [
                        ImageBodyPost(
                          images: images.sublist(0, 5),
                          blurHashs: blurHashs,
                        ),
                        controller.countDown != 0 &&
                                controller.idPost == widget.idPost
                            ? Container(
                                height: images.length == 1
                                    ? _size.height * .42
                                    : _size.height * .38,
                                width: _size.width,
                                color: Colors.black26,
                                child: Lottie.asset(
                                    'assets/lottie/favourite.json'),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
          SizedBox(height: images.length == 0 ? 16.0 : 20.0),
        ],
      ),
    );
  }

  Widget _buildBottom(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 6.0),
              LikeButton(
                key: _globalKey,
                isLiked: liked,
                likeCountAnimationType: likeCount < 1000
                    ? LikeCountAnimationType.part
                    : LikeCountAnimationType.none,
                size: _size.width / 20.0,
                circleColor: CircleColor(
                  start: Color(0xff00ddff),
                  end: Color(0xff0099cc),
                ),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: colorHigh,
                  dotSecondaryColor: colorHigh,
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Feather.heart,
                    color: liked ? colorHigh : colorDarkGrey,
                    size: _size.width / 20.0,
                  );
                },
                likeCount: likeCount,
                countBuilder: (int count, bool isLiked, String text) {
                  var color = isLiked ? colorHigh : colorDarkGrey;
                  Widget result;
                  result = Text(
                    text,
                    style: TextStyle(
                      color: color,
                      fontSize: _size.width / 28.5,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato',
                    ),
                  );

                  return result;
                },
                likeCountPadding: EdgeInsets.only(left: 8.0),
                onTap: onLikeButtonTapped,
              ),
              SizedBox(width: 16.0),
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
    return GestureDetector(
      onTap: () {
        if (title == 'Like') {
          setState(() {
            liked = !liked;
          });
        }
      },
      child: Container(
        child: Row(
          children: [
            SizedBox(width: images.length == 0 ? 4.0 : 8.0),
            Icon(
              icon,
              color: color,
              size: _size.width / 20.0,
            ),
            SizedBox(width: 6.0),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000.0),
            child: BlurHash(
              hash: chats[0].blurHash,
              image: chats[0].image,
              imageFit: BoxFit.cover,
              color: colorPrimary,
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
