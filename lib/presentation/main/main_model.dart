import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String Text = '';

  void changeText() {
    Text = '';
    notifyListeners();
  }
}
