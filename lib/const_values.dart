import 'package:flutter/material.dart';
import 'package:wp_blog_app/size_config.dart';

//primary colors
const mainColor = Color.fromRGBO(97, 44, 88, 1);
const subColor = Color.fromRGBO(255, 133, 0, 1);
//

// dark and light theme color
Color darkColor = Colors.grey[900];
const darkColorTwo = Color.fromRGBO(32, 32, 96, 1);

Color cardColor = Colors.grey[850];
//

setTextSize(double size) {
  var textMultiplier = SizeConfig.textMultiplier;
  var textHeight = size / SizeConfig.heightMultiplier;
  var textProperSize = textHeight * textMultiplier;
  return textProperSize;
}

setContainerHeight(double size) {
  var containerMultiplier = SizeConfig.heightMultiplier;
  var myHeight = size / SizeConfig.heightMultiplier;
  var properHeight = myHeight * containerMultiplier;
  return properHeight;
}

setContainerWidth(double size) {
  var containerMultiplier = SizeConfig.widthMultiplier;
  var myHeight = size / SizeConfig.widthMultiplier;
  var properHeight = myHeight * containerMultiplier;
  return properHeight;
}

//other colors
const defaultWhite = Color.fromRGBO(255, 255, 255, 1);
const defaultBlack = Color.fromRGBO(0, 0, 0, 1);

// hive box name
const String appState = "appstate";
const String themeKey = 'state';
