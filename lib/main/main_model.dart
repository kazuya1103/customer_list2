import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String kazuyaText = '名前';

  void changeKazuyaText() {
    kazuyaText = 'カズヤさんかっこいい';
    notifyListeners();
  }
}
