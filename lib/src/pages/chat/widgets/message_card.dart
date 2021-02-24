import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../common/styles.dart';

class MessageCard extends StatefulWidget {
  final int pendingMessage;
  final String urlToImage;
  final String fullName;
  final String lastMessage;
  final String time;
  final bool notification;
  MessageCard({
    this.pendingMessage,
    this.fullName,
    this.lastMessage,
    this.notification,
    this.time,
    this.urlToImage,
  });
  @override
  State<StatefulWidget> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: _size.width * .135,
                      width: _size.width * .135,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.urlToImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.fullName,
                          style: TextStyle(
                            color: colorTitle,
                            fontSize: _size.width / 24.5,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato',
                          ),
                        ),
                        SizedBox(height: 6.0),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.lastMessage,
                                style: TextStyle(
                                    fontSize: _size.width / 28.5,
                                    color: colorDarkGrey,
                                    fontWeight: widget.pendingMessage == 0
                                        ? FontWeight.w500
                                        : FontWeight.w600,
                                    fontFamily: 'Lato'),
                              ),
                              TextSpan(
                                text: '\t\t•\t',
                                style: TextStyle(
                                  fontSize: _size.width / 40.0,
                                  color: fCL,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              TextSpan(
                                text: widget.time,
                                style: TextStyle(
                                  fontSize: _size.width / 32.5,
                                  color: fCL,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              widget.notification == false
                  ? Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Feather.bell_off,
                        color: colorDarkGrey,
                        size: _size.width / 20.0,
                      ),
                    )
                  : widget.pendingMessage == 0
                      ? Container()
                      : Container(
                          margin: EdgeInsets.only(right: 6.0),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.5,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: colorPrimary,
                          ),
                          child: Text(
                            widget.pendingMessage.toString(),
                            style: TextStyle(
                              fontSize: _size.width / 32.5,
                              color: mCL,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Lato',
                            ),
                          ),
                        ),
            ],
          ),
        ),
        Divider(
          color: mCH,
          thickness: .2,
          height: .2,
          indent: _size.width * .16,
          endIndent: 12.0,
        ),
      ],
    );
  }
}
