import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:whoru/src/helpers/choose_image/crop_image.dart';
import 'package:whoru/src/themes/app_colors.dart';
import 'package:whoru/src/themes/app_decoration.dart';
import 'package:whoru/src/themes/font_family.dart';
import 'package:whoru/src/utils/sizer/sizer.dart';

class CircleEditorCropLayerPainter extends EditorCropLayerPainter {
  const CircleEditorCropLayerPainter();

  @override
  void paintCorners(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    // do nothing
  }

  @override
  void paintMask(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    final Rect rect = Offset.zero & size;
    final Rect cropRect = painter.cropRect;
    final Color maskColor = painter.maskColor;
    canvas.saveLayer(rect, Paint());
    canvas.drawRect(
        rect,
        Paint()
          ..style = PaintingStyle.fill
          ..color = maskColor);
    canvas.drawCircle(cropRect.center, cropRect.width / 2.0,
        Paint()..blendMode = BlendMode.clear);
    canvas.restore();
  }

  @override
  void paintLines(
      Canvas canvas, Size size, ExtendedImageCropLayerPainter painter) {
    final Rect cropRect = painter.cropRect;
    if (painter.pointerDown) {
      canvas.save();
      canvas.clipPath(Path()..addOval(cropRect));
      super.paintLines(canvas, size, painter);
      canvas.restore();
    }
  }
}

class AspectRatioPainter extends CustomPainter {
  AspectRatioPainter(
      {this.aspectRatioS, this.aspectRatio, this.isSelected = false});
  final String aspectRatioS;
  final double aspectRatio;
  final bool isSelected;
  @override
  void paint(Canvas canvas, Size size) {
    final Color color = isSelected ? Color(0xff4E37D3) : Color(0xffffffff);
    final Rect rect = Offset.zero & size;
    //https://github.com/flutter/flutter/issues/49328
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    // final double aspectRatioResult =
    //     (aspectRatio != null && aspectRatio > 0.0) ? aspectRatio : 1.0;
    canvas.drawRect(
        getDestinationRect(
            rect: const EdgeInsets.all(10.0).deflateRect(rect),
            inputSize: Size(200, 100.0),
            fit: BoxFit.contain),
        paint);

    final TextPainter textPainter = TextPainter(
        text: TextSpan(
            text: aspectRatioS,
            style: TextStyle(
              color:
                  color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
              fontSize: 16.0,
            )),
        textDirection: TextDirection.ltr,
        maxLines: 1);
    textPainter.layout(maxWidth: rect.width);

    textPainter.paint(
        canvas,
        rect.center -
            Offset(textPainter.width / 2.0, textPainter.height / 2.0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate is AspectRatioPainter &&
        (oldDelegate.isSelected != isSelected ||
            oldDelegate.aspectRatioS != aspectRatioS ||
            oldDelegate.aspectRatio != aspectRatio);
  }
}

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget(
      {this.aspectRatioS, this.aspectRatio, this.isSelected = false});
  final String aspectRatioS;
  final double aspectRatio;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: AspectRatioPainter(
        aspectRatio: aspectRatio,
        aspectRatioS: aspectRatioS,
        isSelected: isSelected,
      ),
    );
  }
}

class AspectRatioItem {
  AspectRatioItem({this.value, this.text});

  final String text;
  final double value;
}

class ImageEditor extends StatefulWidget {
  final image;
  final bool editAvatar;
  ImageEditor({@required this.image, this.editAvatar = false});

  @override
  _ImageEditorState createState() => _ImageEditorState();
}

class _ImageEditorState extends State<ImageEditor> {
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          Container(
              margin: EdgeInsets.only(left: 20), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  final GlobalKey<PopupMenuButtonState<EditorCropLayerPainter>> popupMenuKey =
      GlobalKey<PopupMenuButtonState<EditorCropLayerPainter>>();
  final List<AspectRatioItem> _aspectRatios = <AspectRatioItem>[
    AspectRatioItem(text: 'custom', value: CropAspectRatios.custom),
    AspectRatioItem(text: 'original', value: CropAspectRatios.original),
    AspectRatioItem(text: '1*1', value: CropAspectRatios.ratio1_1),
    AspectRatioItem(text: '4*3', value: CropAspectRatios.ratio4_3),
    AspectRatioItem(text: '3*4', value: CropAspectRatios.ratio3_4),
    AspectRatioItem(text: '16*9', value: CropAspectRatios.ratio16_9),
    AspectRatioItem(text: '9*16', value: CropAspectRatios.ratio9_16)
  ];
  EditorCropLayerPainter _cropLayerPainter;
  AspectRatioItem _aspectRatio;

  @override
  void initState() {
    _aspectRatio = _aspectRatios[3];
    _cropLayerPainter = widget.editAvatar
        ? const CircleEditorCropLayerPainter()
        : const EditorCropLayerPainter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.sp,
        brightness: Theme.of(context).brightness,
        elevation: 3.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Feather.x,
            color: Theme.of(context).textTheme.bodyText1.color,
            size: 20.sp,
          ),
        ),
        title: Text(
          'Edit Photo',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontFamily: FontFamily.lato,
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              showAlertDialog(context);
              await cropImageDataWithDartLibrary(
                state: editorKey.currentState,
              );
              Get.back();
              Get.back();
            },
            icon: Icon(
              PhosphorIcons.check,
              color: colorPrimary,
              size: 20.sp,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: !kIsWeb
                    ? ExtendedImage.file(
                        widget.image,
                        fit: BoxFit.contain,
                        mode: ExtendedImageMode.editor,
                        enableLoadState: true,
                        extendedImageEditorKey: editorKey,
                        initEditorConfigHandler: (ExtendedImageState state) {
                          return EditorConfig(
                            maxScale: 10.0,
                            cropRectPadding: const EdgeInsets.all(20.0),
                            hitTestSize: 20.0,
                            cropLayerPainter: _cropLayerPainter,
                            initCropRectType: InitCropRectType.imageRect,
                            cropAspectRatio: widget.editAvatar
                                ? CropAspectRatios.ratio1_1
                                : _aspectRatio.value,
                          );
                        },
                        cacheRawData: true,
                      )
                    : ExtendedImage.network(
                        widget.image,
                        fit: BoxFit.contain,
                        mode: ExtendedImageMode.editor,
                        enableLoadState: true,
                        extendedImageEditorKey: editorKey,
                        initEditorConfigHandler: (ExtendedImageState state) {
                          return EditorConfig(
                            maxScale: 10.0,
                            cropRectPadding: const EdgeInsets.all(20.0),
                            hitTestSize: 20.0,
                            cropLayerPainter: _cropLayerPainter,
                            initCropRectType: InitCropRectType.imageRect,
                            cropAspectRatio: _aspectRatio.value,
                          );
                        },
                        cacheRawData: true,
                      ),
              ),
              Container(
                height: 60.sp,
                decoration:
                    AppDecoration.containerOnlyShadowTop(context).decoration,
                alignment: Alignment.center,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 12.sp),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            editorKey.currentState.flip();
                          },
                          child: Icon(
                            Icons.flip,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          'Flip',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                    SizedBox(width: 12.sp),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            editorKey.currentState.getCropRect();
                          },
                          child: Icon(
                            Icons.flip,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          'Flip',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                    SizedBox(width: 25.sp),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              editorKey.currentState.rotate(right: true);
                            },
                            child: Icon(Icons.rotate_right,
                                size: 30,
                                color: Theme.of(context).primaryColor)),
                        Text(
                          'Quay phải',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                    SizedBox(width: 25.sp),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            editorKey.currentState.rotate(right: false);
                          },
                          child: Icon(Icons.rotate_left,
                              size: 30, color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          'Quay trái',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                    !widget.editAvatar ? SizedBox(width: 25.sp) : Container(),
                    !widget.editAvatar
                        ? Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Column(
                                          children: <Widget>[
                                            const Expanded(
                                              child: SizedBox(),
                                            ),
                                            SizedBox(
                                              height: 100,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                itemBuilder: (_, int index) {
                                                  final AspectRatioItem item =
                                                      _aspectRatios[index];
                                                  return GestureDetector(
                                                    child: AspectRatioWidget(
                                                      aspectRatio: item.value,
                                                      aspectRatioS: item.text,
                                                      isSelected:
                                                          item == _aspectRatio,
                                                    ),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        _aspectRatio = item;
                                                      });
                                                    },
                                                  );
                                                },
                                                itemCount: _aspectRatios.length,
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Icon(Icons.crop,
                                    size: 30,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                'Tỉ lệ',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              )
                            ],
                          )
                        : Container(
                            width: 0,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
