import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/common/styles.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<int> indexOfs = [2, 14, 24, 29, 38, 47, 56];
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mC,
        elevation: .0,
        toolbarHeight: 56.0,
        title: GestureDetector(
          onTap: () {},
          child: Container(
            height: 48.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: mC,
              boxShadow: [
                BoxShadow(
                  color: mCD,
                  offset: Offset(5, 5),
                  blurRadius: 5,
                ),
                BoxShadow(
                  color: mCL,
                  offset: Offset(-2, -2),
                  blurRadius: 2,
                ),
              ],
            ),
            padding: EdgeInsets.only(
              left: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Feather.search,
                  size: _size.width / 22.5,
                  color: fCL,
                ),
                SizedBox(
                  width: 12.5,
                ),
                Text(
                  'Search',
                  style: TextStyle(
                    color: fCL,
                    fontSize: _size.width / 24.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.maximize,
              color: colorDarkGrey,
              size: _size.width / 16.0,
            ),
          ),
          SizedBox(width: 4.0),
        ],
      ),
      body: Container(
        color: mC,
      ),
    );
  }
}
