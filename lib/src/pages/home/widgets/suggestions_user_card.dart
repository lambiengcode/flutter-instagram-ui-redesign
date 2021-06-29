import 'package:flutter/material.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';

class SuggestionsUserCard extends StatefulWidget {
  final String blurHash;
  final String cover;
  final String image;
  final String fullName;
  SuggestionsUserCard({
    this.fullName,
    this.image,
    this.cover,
    this.blurHash,
  });
  @override
  State<StatefulWidget> createState() => _SuggestionsUserCardState();
}

class _SuggestionsUserCardState extends State<SuggestionsUserCard> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: _size.width * .38,
          decoration:
              AppDecoration.buttonActionBorder(context, 15.0).decoration,
          margin: EdgeInsets.only(
            left: 10.0,
            right: 4.0,
            bottom: 16.0,
            top: 6.0,
          ),
          padding: EdgeInsets.only(bottom: 12.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: _size.width * .16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      child: BlurHash(
                        hash: widget.blurHash,
                        image: widget.cover,
                        imageFit: BoxFit.cover,
                        color: colorPrimary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print('follow'),
                    child: Container(
                      width: _size.width * .38,
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 26.5, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: colorPrimary,
                          boxShadow: [
                            BoxShadow(
                              color: mCD,
                              offset: Offset(4, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: mCL,
                            fontSize: _size.width / 35.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: _size.width * .1,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      width: _size.width * .38,
                      alignment: Alignment.center,
                      child: Container(
                        height: _size.width * .115,
                        width: _size.width * .115,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: mC,
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          height: _size.width * .1,
                          width: _size.width * .1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000.0),
                            child: BlurHash(
                              hash: widget.blurHash,
                              image: widget.image,
                              imageFit: BoxFit.cover,
                              color: colorPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      widget.fullName,
                      style: TextStyle(
                        fontSize: _size.width / 32.5,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'You maybe know him',
                      style: TextStyle(
                        fontSize: _size.width / 36.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
