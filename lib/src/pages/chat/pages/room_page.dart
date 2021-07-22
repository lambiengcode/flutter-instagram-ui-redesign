import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/pages/chat/widgets/bottom_sheet_pick_image.dart';
import 'package:whoru/src/pages/profile/controllers/editor_controller.dart';
import 'package:whoru/src/routes/app_pages.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/data/content_chat.dart';
import 'package:whoru/src/pages/chat/controllers/room_controller.dart';
import 'package:whoru/src/pages/chat/widgets/content_chat_card.dart';
import 'package:whoru/src/pages/chat/widgets/input_chat.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class RoomPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final pickFileController = Get.put(EditorController());
  final roomController = Get.put(RoomController());

  @override
  void initState() {
    super.initState();
    roomController.initialController();
  }

  @override
  void dispose() {
    if (roomController.showEmojiPicker &&
        roomController.textFieldFocus.hasFocus) {
      roomController.hideEmojiContainer();
      roomController.hideKeyboard();
    } else if (roomController.textFieldFocus.hasFocus) {
      roomController.hideKeyboard();
    } else if (roomController.showEmojiPicker) {
      roomController.hideEmojiContainer();
    }
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (roomController.showEmojiPicker &&
        roomController.textFieldFocus.hasFocus) {
      roomController.hideEmojiContainer();
      roomController.hideKeyboard();
      return false;
    } else if (roomController.textFieldFocus.hasFocus) {
      roomController.hideKeyboard();
      return false;
    } else if (roomController.showEmojiPicker) {
      roomController.hideEmojiContainer();
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
            if (roomController.showEmojiPicker &&
                roomController.textFieldFocus.hasFocus) {
              roomController.hideEmojiContainer();
              roomController.hideKeyboard();
            } else if (roomController.textFieldFocus.hasFocus) {
              roomController.hideKeyboard();
            } else if (roomController.showEmojiPicker) {
              roomController.hideEmojiContainer();
            } else {
              Get.back();
            }
          }
        },
        onTap: () {
          pickFileController.toggleVisiblePickFile(false);
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
                if (roomController.showEmojiPicker &&
                    roomController.textFieldFocus.hasFocus) {
                  roomController.hideEmojiContainer();
                  roomController.hideKeyboard();
                } else if (roomController.textFieldFocus.hasFocus) {
                  roomController.hideKeyboard();
                } else if (roomController.showEmojiPicker) {
                  roomController.hideEmojiContainer();
                }
                Get.back();
              },
              icon: Icon(
                Feather.arrow_left,
                size: _size.width / 15.0,
                color: Theme.of(context).textTheme.bodyText1.color.withOpacity(
                      ThemeService().isSavedDarkMode() ? .88 : .65,
                    ),
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
                      color: Theme.of(context).scaffoldBackgroundColor,
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
                        color: Theme.of(context).textTheme.bodyText1.color,
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
                  MaterialIcons.call,
                  color: colorPrimary,
                  size: 18.sp,
                ),
              ),
              IconButton(
                onPressed: () => print('more'),
                icon: Icon(
                  PhosphorIcons.video_camera_fill,
                  color: colorPrimary,
                  size: 18.sp,
                ),
              ),
              SizedBox(width: 8.0),
              VerticalDivider(
                width: .5,
                thickness: .5,
                indent: 12.sp,
                endIndent: 10.sp,
              ),
              IconButton(
                onPressed: () => Get.toNamed(
                  Routes.CHAT_ROOM + Routes.CUSTOMIZE_ROOM,
                ),
                icon: Icon(
                  PhosphorIcons.squares_four,
                  size: 20.sp,
                  color:
                      Theme.of(context).textTheme.bodyText1.color.withOpacity(
                            ThemeService().isSavedDarkMode() ? 1 : .65,
                          ),
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
                GetBuilder<EditorController>(
                  builder: (controller) => Visibility(
                    visible: controller.visiblePickFile,
                    child: _pickImageContainer(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pickImageContainer() {
    return DraggableScrollableSheet(
      minChildSize: .48,
      maxChildSize: 1,
      initialChildSize: .65,
      builder: (BuildContext context, ScrollController scrollController) {
        return NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            if (notification.extent <= .48) {
              pickFileController.toggleVisiblePickFile(false);
            } else {
              pickFileController.updateRatioPickFile(notification.extent);
            }
            return;
          },
          child: BottomSheetPickImage(
            scrollController: scrollController,
          ),
        );
      },
    );
  }
}
