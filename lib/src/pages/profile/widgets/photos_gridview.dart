import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class PhotosGridview extends StatefulWidget {
  final scrollController;
  PhotosGridview({this.scrollController});
  @override
  State<StatefulWidget> createState() => _PhotosGridviewState();
}

class _PhotosGridviewState extends State<PhotosGridview> {
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    chats.forEach((element) {
      images.add(element.image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        controller: widget.scrollController,
        padding: EdgeInsets.symmetric(horizontal: 1.25.w),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 2.sp,
          mainAxisSpacing: 2.sp,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(
              Routes.VIEW_PHOTO,
              arguments: <String, dynamic>{
                'listPhoto': images,
                'index': index,
              },
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.sp),
              child: Container(
                child: BlurHash(
                  hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                  image: images[index],
                  imageFit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
