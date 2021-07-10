import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class CustomImagePicker {
  final _picker = ImagePicker();

  Widget _buildImageModalButton({context, index, icon, text, source}) {
    return GestureDetector(
      onTap: () async {
        var image = await getImage(context: context, source: source);
        if (image != null) {
          // Go to editor pro
          Get.back();
          Get.toNamed(Routes.EDIT_PHOTO, arguments: File(image.path));
        } else {
          Get.back();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.sp),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.sp,
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(.92),
            ),
            SizedBox(width: 18.sp),
            Text(
              text,
              style: TextStyle(
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.lato,
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(.92),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage(
      {context,
      source = ImageSource.gallery,
      maxWidthImage,
      imageQualityImage}) async {
    return await _picker.getImage(source: source, imageQuality: 90);
  }

  Future openImagePicker({@required context, text = 'Chọn ảnh đại diện'}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.sp),
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          padding: EdgeInsets.only(left: 20.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 22.sp),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: FontFamily.lato,
                    fontWeight: FontWeight.w500,
                    color: colorPrimary,
                  ),
                ),
                SizedBox(height: 12.sp),
                _buildImageModalButton(
                  context: context,
                  index: 1,
                  icon: PhosphorIcons.aperture,
                  text: 'Chụp ảnh mới',
                  source: ImageSource.camera,
                ),
                Divider(),
                _buildImageModalButton(
                  context: context,
                  index: 0,
                  icon: PhosphorIcons.image_square,
                  text: 'Chọn ảnh có sẵn',
                  source: ImageSource.gallery,
                ),
                SizedBox(height: 22.sp),
              ],
            ),
          ),
        );
      },
    );
  }
}
