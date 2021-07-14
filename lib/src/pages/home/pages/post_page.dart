import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class PostPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
            size: 20.sp,
          ),
        ),
        title: Text(
          '\tBài viết mới',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: FontFamily.lato,
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              PhosphorIcons.share,
              color: colorPrimary,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 1.sp),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 2.sp),
            Divider(
              height: .35,
              thickness: .35,
            ),
            SizedBox(height: 10.sp),
            Container(
              margin: EdgeInsets.fromLTRB(
                10.sp,
                10.sp,
                4.sp,
                10.sp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 32.sp,
                        width: 32.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://avatars.githubusercontent.com/u/60530946?v=4',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.sp),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.sp),
                          Text(
                            'Hồng Vinh',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: FontFamily.lato,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 3.sp),
                          Text(
                            'Public',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: FontFamily.lato,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        PhosphorIcons.airplay,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(.92),
                        size: 18.sp,
                      ),
                      SizedBox(height: 3.sp),
                      Text(
                        'Preview',
                        style: TextStyle(
                          fontFamily: FontFamily.lato,
                          fontSize: 8.5.sp,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(.92),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextFormField(
              maxLines: int.parse((100.h / 30.sp).toStringAsFixed(0)),
              autofocus: true,
              onFieldSubmitted: (val) => null,
              cursorColor: colorPrimary,
              cursorRadius: Radius.circular(4.0),
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontSize: 12.5.sp,
                fontFamily: FontFamily.lato,
                fontWeight: FontWeight.w400,
              ),
              onChanged: (val) {},
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 6.sp,
                  right: 5.sp,
                  bottom: 5.sp,
                  left: 10.sp,
                ),
                border: InputBorder.none,
                hintText: "Lets write something...",
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: FontFamily.lato,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Divider(
              height: .35,
              thickness: .35,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 10.sp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        PhosphorIcons.projector_screen,
                        size: 17.25.sp,
                      ),
                      SizedBox(width: 6.sp),
                      Text(
                        'Photo & Video',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: FontFamily.lato,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '0 / 10',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: FontFamily.lato,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
