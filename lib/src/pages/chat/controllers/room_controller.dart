import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomController extends GetxController {
  TextEditingController textFieldController = TextEditingController();
  FocusNode textFieldFocus = FocusNode();
  bool showEmojiPicker = false;

  initialController() {
    textFieldController.text = '';
    update();
  }

  showKeyboard() => textFieldFocus.requestFocus();

  hideKeyboard() => textFieldFocus.unfocus();

  hideEmojiContainer() {
    showEmojiPicker = false;
    update();
  }

  showEmojiContainer() {
    showEmojiPicker = true;
    update();
  }

  updateTextFieldController(String input) {
    textFieldController.text += input;
  }
}
