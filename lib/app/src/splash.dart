import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wp_blog_app/app/screens/tab_view.dart';
import 'package:wp_blog_app/const_values.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Box? storeData;
  @override
  void initState() {
    super.initState();
    storeData = Hive.box(appState);
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return TabView();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/logo/naijaguy.png',
                  height: setContainerHeight(150),
                  width: setContainerWidth(150),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "View Us",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
