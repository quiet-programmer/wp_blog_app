import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_blog_app/custom_theme.dart';
import 'package:wp_blog_app/providers/theme_provider.dart';
import 'package:wp_blog_app/size_config.dart';
import 'package:wp_blog_app/src/splash.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final isThemeChange = Provider.of<ThemeProvider>(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        return OrientationBuilder(
          builder: (_, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'NaijaTechGuy Blog',
              theme: isThemeChange.mTheme == false
                  ? buildLightTheme()
                  : buildDarkTheme(),
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
