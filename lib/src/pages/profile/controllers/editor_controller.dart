import 'dart:io';
import 'dart:typed_data';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:photo_manager/photo_manager.dart';

class EditorController extends GetxController {
  List<Uint8List> images = [];
  List<Uint8List> imagesChoosen = [];
  List<File> availables = [];
  bool visiblePickFile = false;
  double ratioHeightPickFile = .65;

  requestPermission() async {
    List<AssetPathEntity> list =
        await PhotoManager.getAssetPathList(type: RequestType.image);
    AssetPathEntity data = list[0];
    List<AssetEntity> imageList = await data.getAssetListRange(
      start: 0,
      end: 50,
    );
    imageList.asMap().forEach((index, element) async {
      AssetEntity entity = element;
      File file = await entity.file;
      images.add(file.readAsBytesSync());
      update();
    });
  }

  chooseImage(int index) {
    if (!imagesChoosen.contains(images[index])) {
      imagesChoosen.add(images[index]);
    }
  }

  toggleVisiblePickFile(value) {
    visiblePickFile = value;
    if (!value) {
      disposePickImage();
    }
    update();
  }

  updateRatioPickFile(value) {
    ratioHeightPickFile = value;
    update();
  }

  disposePickImage() {
    images.clear();
    imagesChoosen.clear();
    availables.clear();
    PhotoManager.clearFileCache();
    PhotoManager.stopChangeNotify();
    ratioHeightPickFile = .65;
  }
}
