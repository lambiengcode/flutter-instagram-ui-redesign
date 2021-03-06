import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/pages/chat/widgets/message_card.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 4.0),
          Expanded(
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(top: .0),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed('/room'),
                    child: MessageCard(
                      pendingMessage: chats[index].pendingMessage,
                      urlToImage: chats[index].image,
                      fullName: chats[index].fullName,
                      lastMessage: chats[index].lastMessage,
                      time: chats[index].time,
                      notification: chats[index].notification,
                      blurHash: chats[index].blurHash,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
