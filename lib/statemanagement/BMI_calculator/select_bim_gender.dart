import 'package:flutter/material.dart';

class SelectBMIGenderProvider with ChangeNotifier {
  bool isMale = true;

  void switchGender(bool gender) {
    isMale = gender;
    notifyListeners();
  }
}
