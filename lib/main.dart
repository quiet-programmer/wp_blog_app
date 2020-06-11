import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_blog_app/providers/brightness_provider.dart';
import 'package:wp_blog_app/src/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BrightnessProvider(),
        ),
      ],
      child: App(),
    ),
  );
}
