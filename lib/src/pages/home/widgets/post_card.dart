import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/home/controllers/post_controller.dart';
import 'package:whoru/src/pages/home/widgets/image_body_post.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class PostCard extends StatefulWidget {
  final String idPost;
  PostCard({@required this.idPost});
  @override
  State<StatefulWidget> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final postController = Get.put(PostController());
  final GlobalKey<LikeButtonState> _globalKey = GlobalKey<LikeButtonState>();
  List<String> images = [];
  List<String> blurHashs = [];
  bool liked = false;
  int likeCount = 888;

  Future<bool> onLikeButtonTapped(bool isLiked) async {
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
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: .085,
            color: Theme.of(context).dividerColor,
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
    return Padding(
      padding: EdgeInsets.only(left: 2.w, right: 1.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoWritter(context),
          IconButton(
            icon: Icon(
              PhosphorIcons.dots_three,
              size: 25.sp,
            ),
            onPressed: () => null,
          )
        ],
      ),
    );
  }

  Widget _buildBody(context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: images.length == 0 ? 2.2.h : 1.5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
            child: Text(
              'lambiengcode: adding a few more photos to my portfolio. Need a photographer? Get in touch!',
              style: TextStyle(
                fontSize: 11.sp,
                fontFamily: FontFamily.helvetica,
                fontWeight: FontWeight.w600,
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(.75),
              ),
              textAlign: TextAlign.start,
              maxLines: 2,
            ),
          ),
          SizedBox(height: images.length == 0 ? .0 : 1.5.h),
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
                                height: images.length == 1 ? 42.h : 38.h,
                                width: 100.w,
                                color: Colors.black26,
                                child: Lottie.asset(
                                  'assets/lottie/favourite.json',
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
          SizedBox(height: images.length == 0 ? 3.h : 2.h),
        ],
      ),
    );
  }

  Widget _buildBottom(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 4.sp),
              LikeButton(
                key: _globalKey,
                isLiked: liked,
                likeCountAnimationType: likeCount < 1000
                    ? LikeCountAnimationType.part
                    : LikeCountAnimationType.none,
                size: 18.sp,
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
                    liked ? PhosphorIcons.heart_fill : PhosphorIcons.heart,
                    color: liked ? colorHigh : null,
                    size: 18.sp,
                  );
                },
                likeCount: likeCount,
                countBuilder: (int count, bool isLiked, String text) {
                  var color = isLiked ? colorHigh : null;
                  Widget result;
                  result = Text(
                    text,
                    style: TextStyle(
                      color: color,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato',
                    ),
                  );

                  return result;
                },
                likeCountPadding: EdgeInsets.only(left: 6.sp),
                onTap: onLikeButtonTapped,
              ),
              SizedBox(width: 16.0),
              _buildActionButton(
                context,
                'Comment',
                PhosphorIcons.chat_teardrop_dots,
                colorDarkGrey,
                '229',
              ),
            ],
          ),
          _buildActionButton(
            context,
            'Share',
            PhosphorIcons.share,
            colorDarkGrey,
            null,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(context, title, icon, color, value) {
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
            SizedBox(width: images.length == 0 ? 2.sp : 4.sp),
            Icon(
              icon,
              size: 18.sp,
            ),
            SizedBox(width: 4.sp),
            title == 'Share'
                ? Container()
                : Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 10.5.sp,
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
    return Row(
      children: [
        Container(
          height: 32.sp,
          width: 32.sp,
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
                fontSize: 12.45.sp,
                fontFamily: FontFamily.lato,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 2.15.sp),
            Text(
              '2m ago',
              style: TextStyle(
                fontSize: 10.sp,
                fontFamily: FontFamily.lato,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
