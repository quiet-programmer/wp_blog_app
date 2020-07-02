import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:wp_blog_app/screens/bookmark.dart';
import 'package:wp_blog_app/screens/category.dart';
import 'package:wp_blog_app/screens/home_screen.dart';
import 'package:wp_blog_app/screens/settings.dart';
import 'package:wp_blog_app/widgets/horizonatl_view.dart';
import 'package:wp_blog_app/widgets/list_view_post.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final List<Map<String, Object>> _pages = [
    {
      'page': HomeScreen(),
    },
    {
      'page': Category(),
    },
    {
      'page': Bookmark(),
    },
    {
      'page': Settings(),
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Posts changeData = Hive.box(appState).get('state');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NaijaTechGuy Blog",
          style: TextStyle(
            color: changeData.isDark == false ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        actions: <Widget>[
          Icon(Icons.search),
          IconButton(
            icon: Icon(
                changeData.isDark ? Icons.brightness_6 : Icons.brightness_3),
            onPressed: () {
              changeData.changeTheme();
              Hive.box(appState).put("state", changeData);
            },
          )
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: changeData.isDark == false ? defaultWhite : darkColor,
        selectedIndex: _selectedPageIndex,
        onItemSelected: _selectPage,
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: changeData.isDark == false ? mainColor : defaultWhite,
            inactiveColor:
                changeData.isDark == false ? defaultBlack : defaultWhite,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.list),
              title: Text('Category'),
              activeColor:
                  changeData.isDark == false ? mainColor : defaultWhite,
              inactiveColor:
                  changeData.isDark == false ? defaultBlack : defaultWhite),
          BottomNavyBarItem(
              icon: Icon(Icons.bookmark),
              title: Text('Bookmark'),
              activeColor:
                  changeData.isDark == false ? mainColor : defaultWhite,
              inactiveColor:
                  changeData.isDark == false ? defaultBlack : defaultWhite),
          BottomNavyBarItem(
              icon: Icon(Icons.info),
              title: Text('About'),
              activeColor:
                  changeData.isDark == false ? mainColor : defaultWhite,
              inactiveColor:
                  changeData.isDark == false ? defaultBlack : defaultWhite)
        ],
      ),
    );
  }
}
