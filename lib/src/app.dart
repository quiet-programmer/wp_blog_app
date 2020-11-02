import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wp_blog_app/custom_theme.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wp_blog_app/size_config.dart';
import 'package:wp_blog_app/src/splash.dart';

import '../const_values.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // final changeData = Provider.of<BrightnessProvider>(context);
    final Posts changeData = Hive.box(appState).get('state');
    return ValueListenableBuilder(
      valueListenable: Hive.box(appState).listenable(),
      builder: (context, box, _) {
        return LayoutBuilder(
          builder: (_, constraints) {
            return OrientationBuilder(
              builder: (_, orientation) {
                SizeConfig().init(constraints, orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'NaijaTechGuy Blog',
                  theme: changeData.isDark == false
                      ? buildLightTheme()
                      : buildDarkTheme(),
                  home: SplashScreen(),
                );
              },
            );
          },
        );
      },
    );
  }
}
