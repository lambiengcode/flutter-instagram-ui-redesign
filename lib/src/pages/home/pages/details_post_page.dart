import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/home/controllers/post_controller.dart';
import 'package:whoru/src/pages/home/widgets/bottom_input_comment.dart';
import 'package:whoru/src/pages/home/widgets/comment_card.dart';
import 'package:whoru/src/pages/home/widgets/post_card.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class DetailsPostPage extends StatefulWidget {
  final String idPost;
  final String author;
  DetailsPostPage({@required this.idPost, @required this.author});
  @override
  State<StatefulWidget> createState() => _DetailsPostPageState();
}

class _DetailsPostPageState extends State<DetailsPostPage> {
  final postController = Get.put(PostController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void onLikeButtonTapped(liked) {
    if (liked == false) {
      postController.startTimmer(widget.idPost);
      postController.favouritePost(widget.idPost);
    } else {
      postController.unFavouritePost(widget.idPost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Colors.transparent,
        elevation: .0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 20.sp,
          ),
        ),
        centerTitle: false,
        title: Text(
          widget.author,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.lato,
          ),
        ),
        actions: [
          GetBuilder<PostController>(
            builder: (_) => IconButton(
              onPressed: () => onLikeButtonTapped(_.isFavourite(widget.idPost)),
              icon: Icon(
                _.isFavourite(widget.idPost)
                    ? PhosphorIcons.heart_fill
                    : PhosphorIcons.heart,
                color: _.isFavourite(widget.idPost)
                    ? colorHigh
                    : Theme.of(context).textTheme.bodyText1.color,
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(width: 2.sp),
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                controller: scrollController,
                child: Column(
                  children: [
                    Divider(
                      height: .25,
                      thickness: .25,
                    ),
                    PostCard(
                      idPost: widget.idPost,
                      isInDetails: true,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 10.sp, bottom: 48.sp),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return CommentCard();
                      },
                    ),
                    // Comment Widget Here
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: .0,
              left: .0,
              child: Container(
                height: 50.sp,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: .25,
                    ),
                  ),
                ),
                child: BottomInputComment(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
