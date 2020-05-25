import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:wp_blog_app/screens/blog_View.dart';
import 'package:wp_blog_app/screens/bookmark.dart';
import 'package:wp_blog_app/screens/category.dart';
import 'package:wp_blog_app/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': BlogView(),
      'title': 'Home',
    },
    {
      'page': Bookmark(),
      'title': 'Bookmark',
    },
    {
      'page': Category(),
      'title': 'Categories',
    },
    {
      'page': Settings(),
      'title': 'Settings',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedPageIndex]['title']),
      //   actions: <Widget>[
      //   ],
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.bookmark, title: "Bookmark"),
          TabData(iconData: Icons.list, title: "Categories"),
          TabData(iconData: Icons.settings, title: "Settings"),
        ],

        onTabChangedListener: (index) {
          _selectPage(index);
        },

      ),
    );
  }
}
