import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/themes/theme_service.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class ScanQRPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanQRPage();
}

class _ScanQRPage extends State<ScanQRPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        backgroundColor: Colors.transparent,
        elevation: .0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.arrow_left,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 20.sp,
          ),
        ),
        centerTitle: true,
        title: Text(
          'lambiengcode',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.lato,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => print('download QRScan'),
            icon: Icon(
              Feather.download,
              color: Theme.of(context).textTheme.bodyText1.color,
              size: 18.sp,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Divider(
              height: .2,
              thickness: .2,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        QrImage(
                          backgroundColor: ThemeService().isSavedDarkMode()
                              ? mC
                              : Colors.transparent,
                          data: 'profile - lambiengcode',
                          version: QrVersions.auto,
                          size: 180.sp,
                          gapless: true,
                          embeddedImage: NetworkImage(
                              'https://github.com/theyakka/qr.flutter/blob/master/example/assets/images/4.0x/logo_yakka.png?raw=true'),
                          embeddedImageStyle: QrEmbeddedImageStyle(
                            size: Size(40.sp, 40.sp),
                          ),
                          errorStateBuilder: (cxt, err) {
                            return Container(
                              child: Center(
                                child: Text(
                                  "Uh oh! Something went wrong...",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => print('Open Camera for Scan'),
              child: Container(
                height: 55.sp,
                width: 100.w,
                decoration:
                    AppDecoration.containerOnlyShadowTop(context).decoration,
                margin: EdgeInsets.only(bottom: 15.sp),
                alignment: Alignment.center,
                child: Text(
                  'Scan QRCode',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.5.sp,
                    color: colorPrimary,
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
