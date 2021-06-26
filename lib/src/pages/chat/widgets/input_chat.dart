import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/pages/chat/controllers/room_controller.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/utils/emoji/emoji.dart';

class ChatInput extends StatefulWidget {
  final Color color;

  ChatInput({this.color});

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
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
        padding: EdgeInsets.all(
          4.0,
        ),
        margin: EdgeInsets.fromLTRB(
          24.0,
          16.0,
          24.0,
          24.0,
        ),
        decoration: AppDecoration.inputChatDecoration(context).decoration,
        child: Column(
          children: <Widget>[
            chatControls(controller),
            controller.showEmojiPicker
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // 2 button : Icons & Sticker
                        emojiContainer(controller),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  emojiContainer(controller) {
    final _size = MediaQuery.of(context).size;
    return EmojiPicker(
      bgColor: Colors.transparent,
      indicatorColor: Colors.white38,
      rows: 3,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          isWriting = true;
          message = message += emoji.emoji;
        });
        controller.updateTextFieldController(emoji.emoji);
      },
      recommendKeywords: ["face", "happy", "party", "sad", "dog", "smile"],
      numRecommended: 40,
      buttonMode: ButtonMode.MATERIAL,
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
              FontAwesome5Solid.smile,
              color: widget.color.withOpacity(.95),
              size: _size.width / 16.8,
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
                      left: 8.0,
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
                    size: _size.width / 15.5,
                    color: widget.color.withOpacity(.95),
                  ),
                  onPressed: () async {},
                )
              : IconButton(
                  icon: Icon(
                    Feather.send,
                    color: widget.color.withOpacity(.95),
                    size: _size.width / 16.5,
                  ),
                  onPressed: () {},
                ),
          SizedBox(
            width: 4.0,
          ),
        ],
      ),
    );
  }
}
