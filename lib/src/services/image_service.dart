import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:blurhash/blurhash.dart';

class ImageService {
  Future<String> blurHashEncode(String path) async {
    ByteData bytes = await rootBundle.load(path);
    Uint8List pixels = bytes.buffer.asUint8List();
    var blurHash = await BlurHash.encode(pixels, 4, 3);
    print(blurHash);
    return blurHash;
  }
}
