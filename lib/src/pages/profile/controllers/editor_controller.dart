import 'dart:io';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:photo_manager/photo_manager.dart';

class EditorController extends GetxController {
  List<File> images = [];
  List<File> imagesChoosen = [];
  List<File> availables = [];

  requestPermission() async {
    List<AssetPathEntity> list =
        await PhotoManager.getAssetPathList(type: RequestType.image);
    AssetPathEntity data = list[0];
    List<AssetEntity> imageList = await data.assetList;
    imageList.asMap().forEach((index, element) async {
      AssetEntity entity = element;
      File file = await entity.file;
      images.add(file);
      update();
    });
  }

  chooseImage(int index) {
    imagesChoosen.contains(images[index])
        ? imagesChoosen.add(images[index])
        : print('haha');
  }
}
