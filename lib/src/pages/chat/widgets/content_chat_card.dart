import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class ContentChatCard extends StatefulWidget {
  final String id;
  final String content;
  final String image;
  final DateTime createdAt;
  final String createdUser;
  final bool isDeteled;
  final DateTime isSeenAt;
  final bool isLatest;

  ContentChatCard({
    this.content,
    this.createdAt,
    this.createdUser,
    this.id,
    this.image,
    this.isDeteled,
    this.isSeenAt,
    this.isLatest,
  });

  @override
  State<StatefulWidget> createState() => _ContentChatCardState();
}

class _ContentChatCardState extends State<ContentChatCard> {
  String time = '';
  bool showTime = false;
  int secondLeft = 0;
  bool isMe = false;

  @override
  void initState() {
    super.initState();
    isMe = widget.createdUser == '18110239';
  }

  @override
  Widget build(BuildContext context) {
    //final _size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPress: () async {},
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              senderLayout(),
            ],
          ),
        ),
      ],
    );
  }

  Widget senderLayout() {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: 16.0,
        right: 10.0,
        left: 10.0,
      ),
      constraints: BoxConstraints(
        maxWidth: widget.image != '' ? _size.width * 0.6 : _size.width * 0.65,
        maxHeight: _size.height * 0.35,
      ),
      decoration: BoxDecoration(
        color: widget.image != ''
            ? Colors.white.withOpacity(.04)
            : isMe
                ? colorPrimary
                : Theme.of(context).brightness == Brightness.dark
                    ? colorBlack.withOpacity(.75)
                    : mC,
        borderRadius: widget.image != ''
            ? BorderRadius.all(Radius.circular(8.0))
            : BorderRadius.all(Radius.circular(30.0)),
        boxShadow: isMe && widget.image == ''
            ? null
            : [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : mCD,
                  offset: Offset(4, 4),
                  blurRadius: 4,
                ),
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? colorBlack.withOpacity(.45)
                      : mCL,
                  offset: Offset(-3, -3),
                  blurRadius: 3,
                ),
              ],
      ),
      child: Padding(
        padding: widget.image != ''
            ? EdgeInsets.all(1.5)
            : EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: widget.image != '' ? getImage() : getMessage(),
      ),
    );
  }

  getMessage() {
    final _size = MediaQuery.of(context).size;
    return widget.image == ''
        ? Text(
            widget.image == ''
                ? widget.content
                : isMe
                    ? '${widget.content.replaceAll('username', 'You')}'
                    : '${widget.content.replaceAll('username', '')}',
            style: TextStyle(
              color: isMe ? mCL : null,
              fontSize: _size.width / 26.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
            ),
          )
        : widget.content != null
            ? Container()
            : Text("Error!");
  }

  getImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
