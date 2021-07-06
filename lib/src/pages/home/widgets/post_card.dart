import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:whoru/src/pages/home/widgets/carousel_image.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/home/controllers/post_controller.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class PostCard extends StatefulWidget {
  final String idPost;
  final bool isInDetails;
  PostCard({@required this.idPost, this.isInDetails = false});
  @override
  State<StatefulWidget> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final postController = Get.put(PostController());
  final GlobalKey<LikeButtonState> _globalKey = GlobalKey<LikeButtonState>();
  List<Chat> localImage = [];
  int likeCount = 888;

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (isLiked == false) {
      postController.startTimmer(widget.idPost);
      postController.favouritePost(widget.idPost);
    } else {
      postController.unFavouritePost(widget.idPost);
    }

    return !isLiked;
  }

  @override
  void initState() {
    super.initState();
    postController.initialCount();
    localImage.addAll(chats);
    localImage.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: .2,
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
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAILS_POST, arguments: {
        'idPost': widget.idPost,
        'author': localImage[0].fullName,
      }),
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
              child: Text(
                'lambiengcode: adding a few more photos to my portfolio. Need a photographer? Get in touch!',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 1.5.h),
            GestureDetector(
              onDoubleTap: () {
                _globalKey.currentState.onTap();
              },
              child: GetBuilder<PostController>(
                builder: (controller) => Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.isInDetails) {}
                      },
                      child: CarouselImage(
                        imageList: localImage,
                        minAspectRatio: 1.25,
                        idPost: widget.idPost,
                        isInDetails: widget.isInDetails,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
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
              GetBuilder<PostController>(
                builder: (_) => LikeButton(
                  key: _globalKey,
                  isLiked: _.isFavourite(widget.idPost),
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
                      _.isFavourite(widget.idPost)
                          ? PhosphorIcons.heart_fill
                          : PhosphorIcons.heart,
                      color: _.isFavourite(widget.idPost) ? colorHigh : null,
                      size: 18.sp,
                    );
                  },
                  likeCount:
                      _.isFavourite(widget.idPost) ? likeCount + 1 : likeCount,
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
        if (title == 'Comment') {
          if (widget.isInDetails) {
            print('Scroll to end');
          } else {
            Get.toNamed(Routes.DETAILS_POST, arguments: {
              'idPost': widget.idPost,
              'author': localImage[0].fullName,
            });
          }
        }
      },
      child: Container(
        child: Row(
          children: [
            SizedBox(width: 4.sp),
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
              hash: localImage[0].blurHash,
              image: localImage[0].image,
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
              localImage[0].fullName,
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
