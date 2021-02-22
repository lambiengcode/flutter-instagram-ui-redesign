import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/common/styles.dart';
import 'package:whoru/src/widgets/image_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: .0,
        leading: IconButton(
          icon: Icon(
            Feather.settings,
            color: mCM,
            size: _size.width / 16.0,
          ),
          onPressed: () => print('settings'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Feather.align_justify,
              color: mCM,
              size: _size.width / 16.0,
            ),
            onPressed: () => print('settings'),
          ),
        ],
      ),
      body: Container(
        color: mC,
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  child: CachedNetworkImage(
                    width: _size.width,
                    height: _size.height * .28,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => PlaceHolderImage(),
                    errorWidget: (context, url, error) => ErrorLoadingImage(),
                    imageUrl:
                        'https://img.freepik.com/free-photo/camera-laptop-black-minimal-table-top-view-copy-space-minimal-abstract-background-creative-flat-lay_232693-463.jpg?size=626&ext=jpg&ga=GA1.2.1860982554.1612112797',
                  ),
                ),
              ],
            ),
            Positioned(
              top: _size.height * .205,
              left: 0,
              child: Container(
                width: _size.width,
                alignment: Alignment.center,
                child: Container(
                  height: _size.height * .145,
                  width: _size.height * .145,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorPrimary,
                      width: 3.0,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    height: _size.height * .12,
                    width: _size.height * .12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/avt.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
