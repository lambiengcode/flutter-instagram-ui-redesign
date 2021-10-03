import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/home/widgets/camera_preview_box.dart';
import 'package:whoru/src/pages/profile/controllers/editor_controller.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class PickImagePostPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PickImagePostPageState();
}

class _PickImagePostPageState extends State<PickImagePostPage> {
  final editorController = Get.put(EditorController());

  @override
  void initState() {
    super.initState();
    editorController.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        elevation: .0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.x,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 18.sp,
          ),
        ),
        title: Text(
          'Photo & Video:\t\t0 / 10',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: FontFamily.lato,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              PhosphorIcons.image_square_fill,
              color: Theme.of(context).primaryColor,
              size: 18.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              PhosphorIcons.video_camera_bold,
              color: Theme.of(context).textTheme.bodyText2.color,
              size: 18.sp,
            ),
          ),
          SizedBox(width: 1.sp),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              child: Column(
                children: [
                  Divider(
                    height: .5,
                    thickness: .5,
                  ),
                  SizedBox(height: 5.sp),
                  Expanded(
                    child: GetBuilder<EditorController>(
                      builder: (_) => StaggeredGridView.countBuilder(
                        padding: EdgeInsets.symmetric(horizontal: 4.sp),
                        crossAxisCount: 4,
                        itemCount: _.images.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return index == 0
                              ? CameraPreviewBox()
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    image: DecorationImage(
                                      image: MemoryImage(_.images[index - 1]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(
                          index % 7 == 0 ? 2 : 1,
                          index % 7 == 0 ? 2 : 1,
                        ),
                        mainAxisSpacing: 4.sp,
                        crossAxisSpacing: 4.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: .0,
              bottom: .0,
              child: Container(
                height: 50.sp,
                width: 100.w,
                color: Theme.of(context).primaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20.sp),
                    Text(
                      'Write a content',
                      style: TextStyle(
                        color: mC,
                        fontSize: 12.sp,
                        fontFamily: FontFamily.lato,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    Icon(
                      FontAwesomeIcons.featherAlt,
                      size: 14.5.sp,
                      color: mC,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
