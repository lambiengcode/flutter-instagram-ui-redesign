import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/profile/controllers/editor_controller.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class BottomSheetPickImage extends StatefulWidget {
  final ScrollController scrollController;
  BottomSheetPickImage({this.scrollController});
  @override
  State<StatefulWidget> createState() => _BottomSheetPickImageState();
}

class _BottomSheetPickImageState extends State<BottomSheetPickImage> {
  final editorController = Get.put(EditorController());
  double sizeOfAppBar = .0;

  @override
  void initState() {
    super.initState();
    editorController.requestPermission();
    AppBar appBar = AppBar();
    sizeOfAppBar = appBar.preferredSize.height;
  }

  @override
  void dispose() {
    editorController.disposePickImage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditorController>(
      builder: (controller) => GestureDetector(
        onTap: () => null,
        child: Container(
          decoration: BoxDecoration(
            color: controller.ratioHeightPickFile == 1.0
                ? Theme.of(context).scaffoldBackgroundColor
                : ThemeService().isSavedDarkMode()
                    ? colorBlack
                    : mCL,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                controller.ratioHeightPickFile == 1.0 ? .0 : 30.0,
              ),
            ),
          ),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              controller: widget.scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 8.sp),
                  controller.ratioHeightPickFile == 1.0
                      ? Container()
                      : Column(
                          children: [
                            Container(
                              height: 3.sp,
                              margin: EdgeInsets.symmetric(
                                horizontal: 40.w,
                              ),
                              decoration: AppDecoration.buttonActionBorder(
                                      context, 30.0)
                                  .decoration,
                            ),
                            SizedBox(height: 12.sp),
                          ],
                        ),
                  Container(
                    color: Colors.transparent,
                    height:
                        controller.ratioHeightPickFile * (94.h - sizeOfAppBar) -
                            65.sp,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      controller: widget.scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 2.sp,
                        mainAxisSpacing: 2.sp,
                      ),
                      itemCount: controller.images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  controller.ratioHeightPickFile == 1.0
                                      ? 2.0
                                      : index == 0
                                          ? 12.sp
                                          : 2.0,
                                ),
                                topRight: Radius.circular(
                                  controller.ratioHeightPickFile == 1.0
                                      ? 2.0
                                      : index == 3
                                          ? 12.sp
                                          : 2.0,
                                ),
                                bottomLeft: Radius.circular(2.0),
                                bottomRight: Radius.circular(2.0),
                              ),
                              image: DecorationImage(
                                image: MemoryImage(controller.images[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Type area
                  Container(
                    height: 65.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
