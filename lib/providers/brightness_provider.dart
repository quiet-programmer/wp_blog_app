import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrightnessProvider with ChangeNotifier {
  bool isDark = false;

  Future<bool> changeTheme() async {
    notifyListeners();
    return isDark = !isDark;
  }

  //store the state
  void saveState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var getIsDark = (pref.getBool('isDark') ?? changeTheme());
    await pref.setBool('isDark', getIsDark);
    notifyListeners();
  }
}
