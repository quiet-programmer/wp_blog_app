import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_blog_app/providers/brightness_provider.dart';
import 'package:wp_blog_app/screens/home_screen.dart';

import '../const_values.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    final changeData = Provider.of<BrightnessProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WP Flutter Blog Demo',
      theme: ThemeData(
        primaryColor: mainColor,
        accentColor: subColor,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          elevation: 0.0,
          color: changeData.isDark == false ? Colors.white : darkColor,
          iconTheme: IconThemeData(
            color: changeData.isDark == false ? Colors.black : Colors.white,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
