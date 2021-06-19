import 'package:flutter/material.dart';
import 'package:whoru/src/utils/blurhash/blurhash.dart';

class PhotosGridview extends StatefulWidget {
  final scrollController;
  PhotosGridview({this.scrollController});
  @override
  State<StatefulWidget> createState() => _PhotosGridviewState();
}

class _PhotosGridviewState extends State<PhotosGridview> {
  List images = [
    'https://avatars.githubusercontent.com/u/60530946?s=460&u=e342f079ed3571122e21b42eedd0ae251a9d91ce&v=4',
    'https://images.unsplash.com/photo-1516726817505-f5ed825624d8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8bW9kZWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8bW9kZWx8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1508606572321-901ea443707f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDJ8fG1vZGVsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1481824429379-07aa5e5b0739?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDh8fG1vZGVsfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        controller: widget.scrollController,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2.5),
              child: Container(
                child: BlurHash(
                  hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I",
                  image: images[index],
                  imageFit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
