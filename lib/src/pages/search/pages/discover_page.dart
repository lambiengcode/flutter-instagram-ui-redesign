import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whoru/src/data/chat.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.symmetric(horizontal: 4.sp),
        crossAxisCount: 4,
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.sp),
              image: DecorationImage(
                image: NetworkImage(chats[index].image),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(
          index % 7 == 0 ? 2 : 1,
          index % 7 == 0 ? 2 : 1,
        ),
        mainAxisSpacing: 2.5.sp,
        crossAxisSpacing: 2.5.sp,
      ),
    );
  }
}
