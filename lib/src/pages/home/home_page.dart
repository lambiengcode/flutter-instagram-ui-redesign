import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/helpers/custom_scroll_physics/custom_listview_scroll_physics.dart';
import 'package:whoru/src/pages/chat/widgets/active_friend_card.dart';
import 'package:whoru/src/pages/home/widgets/horizontal_user.dart';
import 'package:whoru/src/pages/home/widgets/post_card.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  bool _showDivider = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenScrollListener);
    super.initState();
  }

  _listenScrollListener() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.minScrollExtent == 0.0) {
      setState(() {
        _showDivider = false;
      });
    } else {
      setState(() {
        _showDivider = true;
      });
    }
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // scroll to top
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      // scroll down
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        elevation: .0,
        title: GestureDetector(
          onTap: () => Get.offAndToNamed(Routes.ROOT),
          child: Text(
            'Whoru',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontFamily: FontFamily.lobster,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.POST),
            child: _buildActionHome(
              context,
              'Camera',
              PhosphorIcons.camera_bold,
            ),
          ),
          SizedBox(width: 8.sp),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.NOTIFICATION),
            child: _buildActionHome(
              context,
              'Notifications',
              PhosphorIcons.bell_simple_bold,
            ),
          ),
          SizedBox(width: 4.sp),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 5.sp),
            _showDivider
                ? Divider(
                    height: .35,
                    thickness: .35,
                  )
                : Container(),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  physics: CustomListViewScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(
                      parent: ClampingScrollPhysics(),
                    ),
                  ),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? _buildActiveFriend(context)
                        : index % 8 == 0
                            ? HorizontalUser()
                            : PostCard(
                                idPost: index.toString(),
                              );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionHome(context, title, icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.sp),
      padding: EdgeInsets.all(12.sp),
      alignment: Alignment.center,
      decoration: AppDecoration.buttonActionCircle(context).decoration,
      child: Icon(
        icon,
        size: 16.sp,
        color: Theme.of(context).buttonColor,
      ),
    );
  }

  Widget _buildActiveFriend(context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 65.sp,
            width: 100.w,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return ActiveFriendCard(
                    blurHash: chats[index].blurHash,
                    urlToImage: chats[index].image,
                    fullName: chats[index].fullName,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: .5.h),
            child: Divider(
              height: .2,
              thickness: .2,
            ),
          ),
        ],
      ),
    );
  }
}
