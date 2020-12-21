import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    final Posts changeData = Hive.box(appState).get('state');
    return ValueListenableBuilder(
      valueListenable: Hive.box(appState).listenable(),
      builder: (context, box, _) {
        return Scaffold(
          backgroundColor:
              changeData.isDark == false ? defaultWhite : darkColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  //TODO all bookmark post to show here as a list view
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
