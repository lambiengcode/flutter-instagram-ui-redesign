import 'package:flutter/material.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class SuggestionsUserCard extends StatefulWidget {
  final String blurHash;
  final String cover;
  final String image;
  final String fullName;
  SuggestionsUserCard({
    this.fullName,
    this.image,
    this.cover,
    this.blurHash,
  });
  @override
  State<StatefulWidget> createState() => _SuggestionsUserCardState();
}

class _SuggestionsUserCardState extends State<SuggestionsUserCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 114.sp,
          decoration:
              AppDecoration.buttonActionBorder(context, 15.0).decoration,
          margin: EdgeInsets.only(
            left: 8.sp,
            right: 2.sp,
            bottom: 12.sp,
            top: 4.sp,
          ),
          padding: EdgeInsets.only(bottom: 10.sp),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48.sp,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      child: BlurHash(
                        hash: widget.blurHash,
                        image: widget.cover,
                        imageFit: BoxFit.cover,
                        color: colorPrimary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print('follow'),
                    child: Container(
                      width: 114.sp,
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.sp,
                          vertical: 4.sp,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: colorPrimary,
                          boxShadow: [
                            BoxShadow(
                              color: mCD,
                              offset: Offset(4, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: mCL,
                            fontSize: 8.5.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.lato,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 30.sp,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      width: 114.sp,
                      alignment: Alignment.center,
                      child: Container(
                        height: 34.5.sp,
                        width: 34.5.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          height: 30.sp,
                          width: 30.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000.0),
                            child: BlurHash(
                              hash: widget.blurHash,
                              image: widget.image,
                              imageFit: BoxFit.cover,
                              color: colorPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4.sp),
                    Text(
                      widget.fullName,
                      style: TextStyle(
                        fontSize: 9.5.sp,
                        fontFamily: FontFamily.lato,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'You maybe know him',
                      style: TextStyle(
                        fontSize: 8.sp,
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
      ],
    );
  }
}
