import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/profile/controllers/editor_controller.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/pages/chat/controllers/room_controller.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/emoji/emoji.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class ChatInput extends StatefulWidget {
  final Color color;

  ChatInput({this.color});

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final pickFileController = Get.put(EditorController());
  List<Map<String, IconData>> categories = [
    {
      'active': PhosphorIcons.smiley_wink_fill,
      'inactive': PhosphorIcons.smiley_wink,
    },
    {
      'active': PhosphorIcons.sticker_fill,
      'inactive': PhosphorIcons.sticker_bold,
    },
    {
      'active': PhosphorIcons.gif_bold,
      'inactive': PhosphorIcons.gif,
    },
    {
      'active': PhosphorIcons.aperture_fill,
      'inactive': PhosphorIcons.aperture_bold,
    },
  ];
  String message = "";
  int maxLines = 1;
  int indexTabEmoji = 0;
  bool isWriting = false;

  bool record = false;
  bool media = true;
  String filePath = '';

  @override
  void initState() {
    super.initState();
    message = "";
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomController>(
      builder: (controller) => Container(
        decoration: controller.showEmojiPicker
            ? AppDecoration.inputChatDecoration(context).decoration
            : null,
        margin: EdgeInsets.only(top: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: controller.showEmojiPicker ||
                        controller.textFieldFocus.hasFocus
                    ? .0
                    : 12.sp,
              ),
              decoration: AppDecoration.inputChatDecoration(context).decoration,
              padding: EdgeInsets.symmetric(
                vertical: 3.sp,
                horizontal: controller.showEmojiPicker ? 8.sp : .0,
              ),
              child: chatControls(controller),
            ),
            SizedBox(
              height: controller.showEmojiPicker
                  ? 8.sp
                  : controller.textFieldFocus.hasFocus
                      ? 0.sp
                      : 14.sp,
            ),
            controller.showEmojiPicker
                ? Column(
                    children: [
                      Container(
                        height: 26.sp,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            listCategoriesMedia(context, 0),
                            listCategoriesMedia(context, 1),
                            listCategoriesMedia(context, 2),
                            listCategoriesMedia(context, 3),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.sp),
                      Container(
                        height: 100.w / 10 * 3 + 48.sp,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // 2 button : Icons & Sticker
                            emojiContainer(controller),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget emojiContainer(controller) {
    return EmojiPicker(
      bgColor: Colors.transparent,
      indicatorColor: Theme.of(context).dividerColor,
      progressIndicatorColor: colorPrimary,
      rows: 3,
      columns: 10,
      onEmojiSelected: (emoji, category) {
        setState(() {
          isWriting = true;
          message = message += emoji.emoji;
        });
        controller.updateTextFieldController(emoji.emoji);
      },
      recommendKeywords: ["face", "happy", "party", "sad", "dog", "smile"],
      numRecommended: 40,
      buttonMode: ButtonMode.CUPERTINO,
      noRecentsText: 'Bạn chưa từng gửi emoji',
      noRecommendationsStyle: TextStyle(
        color: colorPrimary,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.lato,
      ),
      noRecentsStyle: TextStyle(
        color: colorPrimary,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.lato,
      ),
    );
  }

  Widget listCategoriesMedia(context, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indexTabEmoji = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 1.25.sp,
          top: 1.sp,
          left: 6.sp,
          right: 2.sp,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 6.0),
        decoration: AppDecoration.buttonActionBorder(context, 30.0).decoration,
        alignment: Alignment.center,
        child: Icon(
          categories[index][index == indexTabEmoji ? 'active' : 'inactive'],
          color: index == indexTabEmoji
              ? colorPrimary
              : Theme.of(context).textTheme.bodyText1.color.withOpacity(
                    ThemeService().isSavedDarkMode() ? 1 : .55,
                  ),
          size: 16.sp,
        ),
      ),
    );
  }

  Widget chatControls(controller) {
    setWritingTo(bool val) {
      setState(() {
        isWriting = val;
      });
    }

    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(width: 5.sp),
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: widget.color.withOpacity(.95),
              size: 20.sp,
            ),
            onPressed: () => pickFileController.toggleVisiblePickFile(true),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  onTap: () {
                    controller.hideEmojiContainer();
                    setState(() {
                      media = false;
                    });
                  },
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: 12.sp,
                  ),
                  controller: controller.textFieldController,
                  focusNode: controller.textFieldFocus,
                  keyboardType: TextInputType.multiline,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 3.25.sp,
                      bottom: 3.sp,
                      top: 3.sp,
                      right: 10.sp,
                    ),
                    hintText: 'Type a message...',
                    hintStyle: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(
                            ThemeService().isSavedDarkMode() ? .85 : .65,
                          ),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.lato,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (mes) {
                    setState(() {
                      if (mes.length == 0) {
                        maxLines = 1;
                      } else {
                        if (mes.length > 18) {
                          maxLines = 2;
                        }
                      }

                      (mes.length != 0)
                          ? setWritingTo(true)
                          : setWritingTo(false);

                      (mes.length != 0) ? media = false : media = true;

                      return message = mes.trim();
                    });
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (!controller.showEmojiPicker) {
                // keyboard is visible
                controller.hideKeyboard();
                controller.showEmojiContainer();
              } else {
                //keyboard is hidden
                controller.showKeyboard();
                controller.hideEmojiContainer();
              }
            },
            child: Icon(
              PhosphorIcons.smiley_wink_fill,
              color: widget.color.withOpacity(.95),
              size: 20.sp,
            ),
          ),
          message.length == 0
              ? IconButton(
                  icon: Icon(
                    Icons.mic,
                    size: 20.sp,
                    color: widget.color.withOpacity(.95),
                  ),
                  onPressed: () async {},
                )
              : IconButton(
                  icon: Icon(
                    PhosphorIcons.telegram_logo_fill,
                    color: widget.color.withOpacity(.95),
                    size: 20.sp,
                  ),
                  onPressed: () {},
                ),
          SizedBox(width: 6.sp),
        ],
      ),
    );
  }
}
