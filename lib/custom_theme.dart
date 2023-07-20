import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wp_blog_app/const_values.dart';

ThemeData buildLightTheme() => ThemeData.light().copyWith(
      cardColor: Colors.white,
      hoverColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: defaultBlack,
      ),
      cardTheme: const CardTheme(
        color: Colors.white,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: defaultWhite,
      ),
      dividerColor: defaultWhite,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        color: defaultWhite,
        iconTheme: IconThemeData(
          color: Colors.grey[900],
        ), systemOverlayStyle: SystemUiOverlayStyle.light, toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ).bodyMedium, titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ).titleLarge,
      ),
      textTheme: Typography.blackCupertino, colorScheme: ColorScheme(primary: Colors.grey.shade50, brightness: Brightness.dark, onPrimary: Colors.grey.shade50, secondary: Colors.black, onSecondary: Colors.black12, error: Colors.red.shade50, onError:Colors.red.shade100, onBackground: Colors.blueGrey, surface: Colors.green.shade100, onSurface: Colors.green.shade50, background: Colors.grey.shade900),
    );

ThemeData buildDarkTheme() => ThemeData.dark().copyWith(
      cardColor: Colors.grey[850],
      hoverColor: Colors.grey[400],
      scaffoldBackgroundColor: darkColor,
      dividerColor: defaultBlack,
      iconTheme: const IconThemeData(
        color: defaultWhite,
      ),
      cardTheme: CardTheme(
        color: cardColor,
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: defaultBlack,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        color: Colors.grey[900],
        iconTheme: IconThemeData(
          color: Colors.grey[400],
        ), toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).bodyMedium, titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).titleLarge, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      textTheme: Typography.whiteCupertino, colorScheme: ColorScheme(primary: Colors.grey.shade50, brightness: Brightness.dark, onPrimary: Colors.grey.shade50, secondary: Colors.black, onSecondary: Colors.black12, error: Colors.red.shade50, onError:Colors.red.shade100, onBackground: Colors.blueGrey, surface: Colors.green.shade100, onSurface: Colors.green.shade50, background: Colors.grey.shade900),
    );
