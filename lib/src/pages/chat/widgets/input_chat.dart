import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/chat/controllers/room_controller.dart';
import 'package:whoru/src/themes/app_decoration.dart';
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
  List<String> categories = ['Emoji', 'Sticker', 'Photo', 'Gif'];
  String message = "";
  int maxLines = 1;
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
        padding: EdgeInsets.only(bottom: 12.0),
        margin: EdgeInsets.only(top: 16.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: controller.showEmojiPicker ? .0 : 20.0),
              decoration: AppDecoration.inputChatDecoration(context).decoration,
              padding: EdgeInsets.symmetric(
                vertical: 2.sp,
                horizontal: controller.showEmojiPicker ? 8.sp : .0,
              ),
              child: chatControls(controller),
            ),
            SizedBox(height: controller.showEmojiPicker ? 8.sp : 14.sp),
            controller.showEmojiPicker
                ? Column(
                    children: [
                      Container(
                        height: 26.sp,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) => listCategoriesMedia(
                            context,
                            index,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.sp),
                      Container(
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
    final _size = MediaQuery.of(context).size;
    return EmojiPicker(
      bgColor: Colors.transparent,
      indicatorColor:
          Theme.of(context).textTheme.bodyText1.color.withOpacity(.4),
      rows: 3,
      columns: 9,
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
      noRecommendationsStyle: TextStyle(
        color: colorPrimary,
        fontSize: _size.width / 26.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lato',
      ),
      noRecentsStyle: TextStyle(
        color: colorPrimary,
        fontSize: _size.width / 26.0,
        fontWeight: FontWeight.w400,
        fontFamily: 'Lato',
      ),
    );
  }

  Widget listCategoriesMedia(context, index) {
    return GestureDetector(
      onTap: () => print(categories[index]),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 1.25.sp,
          top: 1.sp,
          left: 6.sp,
          right: 2.sp,
        ),
        padding: EdgeInsets.symmetric(horizontal: 22.sp),
        decoration: AppDecoration.buttonActionBorder(context, 30.0).decoration,
        alignment: Alignment.center,
        child: Text(
          categories[index],
          style: TextStyle(
            fontSize: 10.5.sp,
            color: index == 0
                ? colorPrimary
                : Theme.of(context).textTheme.bodyText1.color.withOpacity(
                      ThemeService().isSavedDarkMode() ? 1 : .6,
                    ),
          ),
        ),
      ),
    );
  }

  Widget chatControls(controller) {
    final _size = MediaQuery.of(context).size;
    setWritingTo(bool val) {
      setState(() {
        isWriting = val;
      });
    }

    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(width: 4.sp),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
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
            icon: Icon(
              FontAwesome5Solid.meteor,
              color: widget.color.withOpacity(.95),
              size: 18.sp,
            ),
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
                    color: Colors.grey.shade800,
                    fontSize: _size.width / 26.0,
                  ),
                  controller: controller.textFieldController,
                  focusNode: controller.textFieldFocus,
                  keyboardType: TextInputType.multiline,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 4.0,
                      right: 40.0,
                      bottom: 4.0,
                      top: 4.0,
                    ),
                    hintText: 'Type message...',
                    hintStyle: TextStyle(
                      color: colorDarkGrey,
                      fontSize: _size.width / 26.5,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
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
                    Feather.send,
                    color: widget.color.withOpacity(.95),
                    size: 20.sp,
                  ),
                  onPressed: () {},
                ),
          SizedBox(width: 4.sp),
        ],
      ),
    );
  }
}
