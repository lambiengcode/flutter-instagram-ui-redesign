import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class SuggestionsUserCard extends StatefulWidget {
  final String cover;
  final String image;
  final String fullName;
  SuggestionsUserCard({this.fullName, this.image, this.cover});
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
          width: _size.width * .4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: mC,
            boxShadow: [
              BoxShadow(
                color: mCD,
                offset: Offset(2, 2),
                blurRadius: 2,
              ),
              BoxShadow(
                color: mCL,
                offset: Offset(-10, -10),
                blurRadius: 10,
              ),
            ],
          ),
          margin: EdgeInsets.only(
            left: 10.0,
            right: 4.0,
            bottom: 16.0,
            top: 6.0,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: _size.width * .16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(widget.cover),
                        fit: BoxFit.cover,
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
                      width: _size.width * .4,
                      alignment: Alignment.center,
                      child: Container(
                        height: _size.height * .06,
                        width: _size.height * .06,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: mC,
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          height: _size.height * .05,
                          width: _size.height * .05,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(widget.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.fullName,
                      style: TextStyle(
                        color: colorTitle,
                        fontSize: _size.width / 30.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'You maybe know him',
                      style: TextStyle(
                        color: colorDarkGrey,
                        fontSize: _size.width / 35.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 14.0),
                    Container(
                      width: _size.width * .4,
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
                    SizedBox(height: 6.0),
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
