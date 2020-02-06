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
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellowAccent,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.bookmark),
            title: Text('Bookmark'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.list),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}