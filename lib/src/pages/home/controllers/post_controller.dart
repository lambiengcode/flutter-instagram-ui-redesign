import 'dart:async';

import 'package:get/get.dart';

class PostController extends GetxController {
  List<String> favourited = [];
  String idPost = '';
  int countDown = 0;
  Timer timmerInstance;

  initialCount() {
    countDown = 0;
    update();
  }

  void startTimmer(String id) {
    idPost = id;
    countDown = 3;
    var oneSec = Duration(milliseconds: 350);
    timmerInstance = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countDown <= 0) {
          timmerInstance.cancel();
        } else {
          countDown--;
          update();
        }
      },
    );
    update();
  }

  favouritePost(String id) {
    favourited.add(id);
  }

  unFavouritePost(String id) {
    favourited.removeAt(favourited.indexOf(id));
  }

  bool isFavourite(String id) {
    return favourited.contains(id) ? true : false;
  }

  @override
  void dispose() {
    super.dispose();
    favourited = [];
  }
}
