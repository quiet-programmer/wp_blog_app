import 'package:flutter/material.dart';
import 'package:wp_blog_app/screens/home_screen.dart';


class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: HomeScreen(),
    );
  }
}