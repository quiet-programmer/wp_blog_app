import 'package:flutter/material.dart';
import 'package:wp_blog_app/const_values.dart';

ThemeData buildLightTheme() => ThemeData.light().copyWith(
      cardColor: Colors.white,
      backgroundColor: Colors.grey[100],
      accentColor: Colors.grey[800],
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        elevation: 0.0,
        color: defaultWhite,
        iconTheme: IconThemeData(
          color: Colors.grey[900],
        ),
      ),
      textTheme: Typography.blackCupertino,
    );

ThemeData buildDarkTheme() => ThemeData.dark().copyWith(
      cardColor: Colors.grey[850],
      backgroundColor: Colors.grey[900],
      accentColor: Colors.grey[400],
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        elevation: 0.0,
        color: Colors.grey[900],
        iconTheme: IconThemeData(
          color: Colors.grey[400],
        ),
      ),
      textTheme: Typography.whiteCupertino,
    );
