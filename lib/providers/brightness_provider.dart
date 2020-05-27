import 'package:flutter/material.dart';

class BrightnessProvider with ChangeNotifier {
  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}