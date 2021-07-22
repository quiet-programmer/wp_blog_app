import 'package:flutter/material.dart';
import 'package:wp_blog_app/size_config.dart';

//primary colors
const mainColor = Color.fromRGBO(97, 44, 88, 1);
const subColor = Color.fromRGBO(255, 133, 0, 1);
//

// dark and light theme color
Color? darkColor = Colors.grey[900];
const darkColorTwo = Color.fromRGBO(32, 32, 96, 1);

Color? cardColor = Colors.grey[850];
//

double? hMultiplier = SizeConfig.heightMultiplier;
double? wMultiplier = SizeConfig.widthMultiplier;

setTextSize(double? size) {
  double? textMultiplier = SizeConfig.textMultiplier;
  double? textHeight = size! / hMultiplier!;
  double? textProperSize = textHeight * textMultiplier!;
  return textProperSize;
}

setContainerHeight(double? size) {
  double? containerMultiplier = SizeConfig.heightMultiplier;
  double? myHeight = size! / hMultiplier!;
  double? properHeight = myHeight * containerMultiplier!;
  return properHeight;
}

setContainerWidth(double? size) {
  double? containerMultiplier = SizeConfig.widthMultiplier;
  double? myWidth = size! / wMultiplier!;
  double? properWidth = myWidth * containerMultiplier!;
  return properWidth;
}

//other colors
const defaultWhite = Color.fromRGBO(255, 255, 255, 1);
const defaultBlack = Color.fromRGBO(0, 0, 0, 1);

// hive box name
const String appState = "appstate";
const String themeKey = 'state';
