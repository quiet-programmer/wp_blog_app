import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrightnessProvider with ChangeNotifier {
  bool isDark = false;

  Future<bool> changeTheme() async {
    notifyListeners();
    return isDark = !isDark;
  }

  Future<bool> getState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isBright = prefs.getBool('isDark');
    notifyListeners();
    if(isBright == null) {
      return changeTheme();
    }
    return isBright;
  }

}
