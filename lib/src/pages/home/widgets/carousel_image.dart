import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/home/controllers/post_controller.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class CarouselImage extends StatefulWidget {
  final List<Chat> imageList;
  final String idPost;
  final double minAspectRatio;
  final bool isInDetails;
  CarouselImage({
    @required this.imageList,
    @required this.minAspectRatio,
    @required this.idPost,
    this.isInDetails = false,
  });
  @override
  State<StatefulWidget> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  final postController = Get.put(PostController());
  int _currentIndex = 0;
  List<String> _urlToImages = [];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    widget.imageList.forEach((element) {
      _urlToImages.add(element.image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: (100.h / 100.w) < 16 / 9
              ? 1.0 * 100.w
              : widget.minAspectRatio < 1
                  ? 1 * 100.w
                  : 100.w / widget.minAspectRatio,
          width: 100.w,
          color: colorPrimaryBlack,
        ),
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: (100.h / 100.w) < 16 / 9
                ? 1.0
                : widget.minAspectRatio < 1
                    ? 1
                    : widget.minAspectRatio,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: widget.imageList.length > 1,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: Duration(seconds: 10),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.imageList.map((imgUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    GestureDetector(
                      onLongPress: () => Get.toNamed(
                        Routes.VIEW_PHOTO,
                        arguments: <String, dynamic>{
                          'listPhoto': _urlToImages,
                          'index': _currentIndex,
                        },
                      ),
                      onTap: () {
                        if (widget.isInDetails) {
                          Get.toNamed(
                            Routes.VIEW_PHOTO,
                            arguments: <String, dynamic>{
                              'listPhoto': _urlToImages,
                              'index': _currentIndex,
                            },
                          );
                        } else {
                          Get.toNamed(Routes.DETAILS_POST, arguments: {
                            'idPost': widget.idPost,
                            'author': widget.imageList[0].fullName,
                          });
                        }
                      },
                      child: Container(
                        color: colorBlack,
                        width: 100.w,
                        child: BlurHash(
                          hash: imgUrl.blurHash,
                          image: imgUrl.image,
                          imageFit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    postController.countDown != 0 &&
                            postController.idPost == widget.idPost
                        ? Container(
                            height: (100.h / 100.w) < 16 / 9
                                ? 1.0 * 100.w
                                : widget.minAspectRatio < 1
                                    ? 1 * 100.w
                                    : 100.w / widget.minAspectRatio,
                            width: 100.w,
                            color: Colors.black26,
                            child: Lottie.asset(
                              'assets/lottie/favourite.json',
                            ),
                          )
                        : Container(),
                  ],
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          top: 6.sp,
          right: 6.sp,
          child: Container(
            width: 100.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                widget.imageList.length < 2
                    ? Container()
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.sp,
                          vertical: 5.sp,
                        ),
                        decoration: BoxDecoration(
                          color: colorBlack.withOpacity(.35),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          '${_currentIndex + 1} / ${widget.imageList.length}',
                          style: TextStyle(
                            fontSize: 8.5.sp,
                            color: mC,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.lato,
                          ),
                        ),
                      ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: map<Widget>(widget.imageList, (index, url) {
                //     return Container(
                //       width: _currentIndex == index ? 4.sp : 2.sp,
                //       height: _currentIndex == index ? 4.sp : 2.sp,
                //       margin: EdgeInsets.symmetric(horizontal: 4.sp),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(40.0)),
                //         color: _currentIndex == index
                //             ? mCL
                //             : Colors.white.withOpacity(.9),
                //       ),
                //     );
                //   }),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
