import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/home/controllers/post_controller.dart';
import 'package:whoru/src/pages/home/widgets/post_card.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class DetailsPostScreen extends StatefulWidget {
  final String idPost;
  final String author;
  DetailsPostScreen({@required this.idPost, @required this.author});
  @override
  State<StatefulWidget> createState() => _DetailsPostScreenState();
}

class _DetailsPostScreenState extends State<DetailsPostScreen> {
  final postController = Get.put(PostController());
  ScrollController scrollController = ScrollController();
  bool liked = false;

  @override
  void initState() {
    super.initState();
    liked = postController.isFavourite(widget.idPost);
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    if (liked == false) {
      postController.startTimmer(widget.idPost);
      postController.favouritePost(widget.idPost);
    } else {
      postController.unFavouritePost(widget.idPost);
    }

    setState(() {
      liked = !liked;
    });

    return !isLiked;
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
            size: 18.sp,
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
          IconButton(
            onPressed: () => onLikeButtonTapped(liked),
            icon: Icon(
              liked ? PhosphorIcons.heart_fill : PhosphorIcons.heart,
              color: liked
                  ? colorHigh
                  : Theme.of(context).textTheme.bodyText1.color,
              size: 18.sp,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Divider(
                height: .25,
                thickness: .25,
              ),
              PostCard(idPost: widget.idPost),

              // Comment Widget Here
            ],
          ),
        ),
      ),
    );
  }
}
