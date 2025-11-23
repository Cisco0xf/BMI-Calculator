import 'package:flutter/material.dart';

class GetHeightProvider with ChangeNotifier {
  bool isCm = true;

  void switchUnit(bool unit) {
    isCm = unit;
    notifyListeners();
  }

  int userHeight = 50;

  void getUserHeight({required int selectedHeight}) {
    userHeight = selectedHeight;
    notifyListeners();
  }
}
