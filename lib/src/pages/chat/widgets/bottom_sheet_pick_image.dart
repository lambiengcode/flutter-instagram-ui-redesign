import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/chat/widgets/image_picker_card.dart';
import 'package:whoru/src/pages/chat/widgets/option_bar_picker.dart';
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
                    height: controller.ratioHeightPickFile *
                            (93.5.h - sizeOfAppBar) -
                        (controller.ratioHeightPickFile == 1.0 ? 80.sp : 95.sp),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      controller: widget.scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.sp,
                        mainAxisSpacing: 4.5.sp,
                      ),
                      itemCount: controller.images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: ImagePickerCard(
                            imageMemory: controller.images[index],
                            index: index,
                            ratioHeight: controller.ratioHeightPickFile,
                          ),
                        );
                      },
                    ),
                  ),
                  // Type area
                  OptionBarPicker(
                    ratioHeight: controller.ratioHeightPickFile,
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
