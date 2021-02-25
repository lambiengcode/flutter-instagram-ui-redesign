import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class ImageBodyPost extends StatefulWidget {
  final List<String> images;
  ImageBodyPost({this.images});
  @override
  State<StatefulWidget> createState() => _ImageBodyPostCard();
}

class _ImageBodyPostCard extends State<ImageBodyPost> {
  @override
  Widget build(BuildContext context) {
    return widget.images.length == 1
        ? _buildSingleImage(context)
        : widget.images.length == 2
            ? _buildDoubleImage(context)
            : widget.images.length == 3
                ? _buildTripleImage(context)
                : _buildMultipleImage(context);
  }

  Widget _buildSingleImage(context) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: _size.height * .42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              image: NetworkImage(widget.images[0]),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
            child: Container(
              height: _size.height * .42,
              color: Colors.grey.withOpacity(0.1),
              alignment: Alignment.center,
            ),
          ),
        ),
        Container(
          height: _size.height * .42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              image: NetworkImage(widget.images[0]),
              fit: BoxFit.fitHeight,
            ),
          ),
          alignment: Alignment.center,
        ),
      ],
    );
  }

  Widget _buildDoubleImage(context) {
    final _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: _size.height * .36,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(16.0)),
              image: DecorationImage(
                image: NetworkImage(widget.images[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 4.0),
        Expanded(
          child: Container(
            height: _size.height * .36,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(16.0)),
              image: DecorationImage(
                image: NetworkImage(widget.images[1]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTripleImage(context) {
    final _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: _size.height * .36,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(16.0)),
              image: DecorationImage(
                image: NetworkImage(widget.images[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 4.0),
        Expanded(
          child: Container(
            height: _size.height * .36,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16.0)),
                      image: DecorationImage(
                        image: NetworkImage(widget.images[1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(16.0)),
                      image: DecorationImage(
                        image: NetworkImage(widget.images[2]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMultipleImage(context) {
    final _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Container(
            height: _size.height * .36,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(16.0)),
              image: DecorationImage(
                image: NetworkImage(widget.images[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 4.0),
        Expanded(
          child: Container(
            height: _size.height * .36,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16.0)),
                      image: DecorationImage(
                        image: NetworkImage(widget.images[1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.0)),
                          image: DecorationImage(
                            image: NetworkImage(widget.images[2]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: _size.height * .24,
                          maxWidth: _size.width,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.0)),
                          color: Colors.black26,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.images.length - 3}+',
                          style: TextStyle(
                            color: mCL,
                            fontWeight: FontWeight.w400,
                            fontSize: _size.width / 16.0,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
