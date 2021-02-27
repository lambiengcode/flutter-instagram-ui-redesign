import 'dart:async';

import 'package:get/get.dart';

class PostController extends GetxController {
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
}
