import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double? _screenWidth=392.7;
  static double? _screenHeight=309.2;
  static double? _blockWidth = 30;
  static double? _blockHeight = 30;

  static double? textMultiplier=1;
  static double? imageSizeMultiplier=1;
  static double? heightMultiplier=1;
  static double? widthMultiplier=1;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth! < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth! / 100;
    _blockHeight = _screenHeight! / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;

    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    if (kDebugMode) {
      print(_blockWidth);
      print(_blockHeight);
    }
  }
}
