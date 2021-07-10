import 'dart:typed_data';
import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart';
import 'package:image/image.dart';

Future<Uint8List> _loadNetwork(ExtendedNetworkImageProvider key) async {
  try {
    final Response response = await HttpClientHelper.get(Uri.parse(key.url),
        headers: key.headers,
        timeLimit: key.timeLimit,
        timeRetry: key.timeRetry,
        retries: key.retries,
        cancelToken: key.cancelToken);
    return response.bodyBytes;
  } on OperationCanceledError catch (_) {
    print('User cancel request ${key.url}.');
    return Future<Uint8List>.error(
        StateError('User cancel request ${key.url}.'));
  } catch (e) {
    return Future<Uint8List>.error(StateError('failed load ${key.url}. \n $e'));
  }
}

Future<Uint8List> cropImageDataWithDartLibrary(
    {ExtendedImageEditorState state}) async {
  final Rect cropRect = state.getCropRect();

  Uint8List data = kIsWeb &&
          state.widget.extendedImageState.imageWidget.image
              is ExtendedNetworkImageProvider
      ? await _loadNetwork(state.widget.extendedImageState.imageWidget.image
          as ExtendedNetworkImageProvider)

      ///toByteData is not work on web
      ///https://github.com/flutter/flutter/issues/44908
      // (await state.image.toByteData(format: ui.ImageByteFormat.png))
      //     .buffer
      //     .asUint8List()
      : state.rawImageData;
  final EditActionDetails editAction = state.editAction;
  // final EditActionDetails editAction = state.editAction!;

  //Decode source to Animation. It can holds multi frame.

  try {
    data = await FlutterImageCompress.compressWithList(
      data,
      minHeight: 800,
      quality: 95,
    );
  } catch (e) {
    if (data.length > 300000) return data;
  }

  print(kIsWeb ? 'before on web' : 'before');
  Image src = decodeImage(data);
  print('after');
  src = copyCrop(src, cropRect.left.toInt(), cropRect.top.toInt(),
      cropRect.width.toInt(), cropRect.height.toInt());
  if (editAction.hasRotateAngle) {
    src = copyRotate(src, editAction.rotateAngle);
  }
  src = bakeOrientation(src);
  src = copyResize(src, width: 1280);
  // return data;
  return encodeJpg(src);

  ///crop rect base on raw image
}


/// you can encode your image
///
/// it costs much time and blocks ui.
//var fileData = encodeJpg(src);

/// it will not block ui with using isolate.
//var fileData = await compute(encodeJpg, src);
//var fileData = await isolateEncodeImage(src);
// List<int>? fileData;
// print('start encode');
// final DateTime time4 = DateTime.now();
// if (src != null) {
//   final bool onlyOneFrame = src.numFrames == 1;
//   //If there's only one frame, encode it to jpg.
//   if (kIsWeb) {
//     fileData = onlyOneFrame ? encodeJpg(src.first) : encodeGifAnimation(src);
//   } else {
//     //fileData = await lb.run<List<int>, Image>(encodeJpg, src);
//     fileData = onlyOneFrame
//         ? await compute(encodeJpg, src.first)
//         : await compute(encodeGifAnimation, src);
//   }
// }
// final DateTime time5 = DateTime.now();
// print('${time5.difference(time4)} : encode');
// print('${time5.difference(time1)} : total time');
// return Uint8List.fromList(fileData!);
