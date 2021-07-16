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

  showKeyboard() {
    textFieldFocus.requestFocus();
    update();
  }

  hideKeyboard() {
    textFieldFocus.unfocus();
    update();
  }

  hideEmojiContainer() {
    showEmojiPicker = false;
    showKeyboard();
  }

  showEmojiContainer() {
    showEmojiPicker = true;
    hideKeyboard();
  }

  updateTextFieldController(String input) {
    textFieldController.text += input;
    update();
  }
}
