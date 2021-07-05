import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class CarouselImage extends StatefulWidget {
  final List<Chat> imageList;
  final double minAspectRatio;
  CarouselImage({@required this.imageList, @required this.minAspectRatio});
  @override
  State<StatefulWidget> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
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
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio:
                widget.minAspectRatio < .8 ? .8 : widget.minAspectRatio,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
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
                return GestureDetector(
                  onTap: () => Get.toNamed(Routes.VIEW_PHOTO,
                      arguments: <String, dynamic>{
                        'listPhoto': _urlToImages,
                        'index': _currentIndex,
                      }),
                  child: Container(
                    color: colorBlack,
                    width: 100.w,
                    child: BlurHash(
                      decodingHeight: 1000,
                      hash: imgUrl.blurHash,
                      image: imgUrl.image,
                      imageFit: BoxFit.fitWidth,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          top: 8.sp,
          right: 8.sp,
          child: Container(
            width: 100.w,
            height: 350.sp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.sp,
                    vertical: 4.5.sp,
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
