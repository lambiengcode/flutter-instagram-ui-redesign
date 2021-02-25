import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/data/content_chat.dart';
import 'package:whoru/src/pages/chat/controllers/room_controller.dart';
import 'package:whoru/src/pages/chat/widgets/content_chat_card.dart';
import 'package:whoru/src/pages/chat/widgets/input_chat.dart';

import '../../../common/styles.dart';

class RoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  var roomController = Get.put(RoomController());

  @override
  void initState() {
    super.initState();
    roomController.initialController();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => true,
      child: GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          if (dragEndDetails.primaryVelocity < 0) {
            // Go to customize chat room
          } else if (dragEndDetails.primaryVelocity > 0) {
            if (roomController.showEmojiPicker) {
              roomController.hideEmojiContainer();
            } else if (roomController.textFieldFocus.hasFocus) {
              roomController.hideKeyboard();
            } else {
              Get.back();
            }
          }
        },
        onTap: () {
          if (roomController.showEmojiPicker) {
            roomController.hideEmojiContainer();
          } else if (roomController.textFieldFocus.hasFocus) {
            roomController.hideKeyboard();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: _size.width * .16,
            backgroundColor: mC,
            elevation: 2.0,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Feather.arrow_left,
                color: colorTitle,
                size: _size.width / 15.0,
              ),
            ),
            title: Row(
              children: [
                Container(
                  height: _size.width * .1,
                  width: _size.width * .1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(chats[4].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 15.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mC,
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorActive,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chats[4].fullName,
                      style: TextStyle(
                        color: colorTitle,
                        fontSize: _size.width / 24.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 2.5),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: colorDarkGrey,
                        fontSize: _size.width / 30.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => print('more'),
                icon: Icon(
                  Feather.video,
                  color: colorPrimary,
                  size: _size.width / 16.0,
                ),
              ),
              SizedBox(width: 8.0),
              VerticalDivider(
                width: .25,
                thickness: .25,
                color: mCH,
                indent: 12.0,
                endIndent: 8.0,
              ),
              IconButton(
                onPressed: () => print('more'),
                icon: Icon(
                  Feather.more_vertical,
                  color: colorTitle,
                  size: _size.width / 16.0,
                ),
              ),
            ],
          ),
          body: Container(
            color: mCM,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(.0),
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: contents.length,
                        itemBuilder: (context, index) {
                          return ContentChatCard(
                            id: contents[index].id,
                            content: contents[index].content,
                            image: contents[index].image,
                            createdAt: contents[index].createdAt,
                            createdUser: contents[index].createdUser,
                            isDeteled: contents[index].isDeteled,
                            isSeenAt: contents[index].isSeenAt,
                            isLatest: index == 0,
                          );
                        },
                      ),
                    ),
                    Container(
                      child: ChatInput(
                        color: colorPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
