import 'package:flutter/material.dart';
import 'package:wp_blog_app/screens/home_screen.dart';

import '../const_values.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: mainColor,
        accentColor: subColor,
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          elevation: 0.0,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
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
