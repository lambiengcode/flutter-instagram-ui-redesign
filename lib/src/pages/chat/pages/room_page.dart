import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/data/content_chat.dart';
import 'package:whoru/src/pages/chat/controllers/room_controller.dart';
import 'package:whoru/src/pages/chat/widgets/content_chat_card.dart';
import 'package:whoru/src/pages/chat/widgets/input_chat.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class RoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  var roomController = Get.put(RoomController(), permanent: true);

  @override
  void initState() {
    super.initState();
    roomController.initialController();
  }

  @override
  void dispose() {
    if (roomController.showEmojiPicker) {
      roomController.hideEmojiContainer();
    } else if (roomController.textFieldFocus.hasFocus) {
      roomController.hideKeyboard();
    }
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (roomController.showEmojiPicker) {
      roomController.hideEmojiContainer();
      return false;
    } else if (roomController.textFieldFocus.hasFocus) {
      roomController.hideKeyboard();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
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
            brightness: Theme.of(context).brightness,
            toolbarHeight: _size.width * .16,
            elevation: 2.0,
            leading: IconButton(
              onPressed: () {
                if (roomController.showEmojiPicker) {
                  roomController.hideEmojiContainer();
                } else if (roomController.textFieldFocus.hasFocus) {
                  roomController.hideKeyboard();
                } else {
                  Get.back();
                }
              },
              icon: Icon(
                Feather.arrow_left,
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
                    height: 8.5.sp,
                    width: 8.5.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: mC,
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      height: 6.5.sp,
                      width: 6.5.sp,
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
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 2.5),
                    Text(
                      'Online',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
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
                indent: 12.0,
                endIndent: 8.0,
              ),
              IconButton(
                onPressed: () => print('more'),
                icon: Icon(
                  Feather.more_vertical,
                  size: _size.width / 16.0,
                ),
              ),
            ],
          ),
          body: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                          return true;
                        },
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
