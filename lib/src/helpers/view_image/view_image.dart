import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class PageViewGallery extends StatefulWidget {
  final List initImageList;
  final int initPosition;

  PageViewGallery({@required this.initImageList, @required this.initPosition});

  @override
  _PageViewGalleryState createState() => _PageViewGalleryState();
}

class _PageViewGalleryState extends State<PageViewGallery>
    with SingleTickerProviderStateMixin {
  List images = [];
  int currentIndex;
  Function animationListener;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initPosition != null ? widget.initPosition : 0;
    images = widget.initImageList;
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<double> doubleTapScales = [1.0, 2.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          // constraints: BoxConstraints(maxWidth: 380),
          color: Colors.black,
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  String item = images[index];
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(item),
                    initialScale: PhotoViewComputedScale.contained * 1.0,
                    minScale: PhotoViewComputedScale.contained * 1.0,
                    maxScale: PhotoViewComputedScale.covered * 1.0,
                  );
                },
                itemCount: images.length,
                loadingBuilder: (context, progress) => Center(
                  child: Container(
                    width: 18.sp,
                    height: 18.sp,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                pageController: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              Positioned(
                top: 30.sp,
                child: Container(
                  width: 100.w,
                  padding: EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Feather.arrow_left,
                            color: mC,
                            size: 20.sp,
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: 20.sp),
                        child: Text(
                          '${currentIndex + 1} / ${images.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(''),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
