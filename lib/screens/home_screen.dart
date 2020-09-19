import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:wp_blog_app/widgets/horizonatl_view.dart';
import 'package:wp_blog_app/widgets/list_view_post.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../const_values.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dateFormat = DateFormat.yMMMMEEEEd().format(DateTime.now());

  @override
  void initState() {
    super.initState();
    HorizontalView();
    ListViewPost();
  }

  // fucntion to refersh page.
  Future<Null> refreshPage() async {
    Future.delayed(Duration(seconds: 2));

    setState(() {
      HorizontalView();
      ListViewPost();
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(appState).listenable(),
      builder: (context, box, _) {
        final Posts changeData = Hive.box(appState).get('state');
        return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: changeData.isDark == false ? mainColor : darkColor,
            body: RefreshIndicator(
              onRefresh: refreshPage,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 290,
                        decoration: BoxDecoration(
                          color: changeData.isDark == false
                              ? Colors.white
                              : darkColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(33),
                            bottomRight: Radius.circular(33),
                          ),
                        ),
                        child: Container(
                          height: 290,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Reviews",
                                        style: TextStyle(
                                          color: changeData.isDark == false
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                      Text(
                                        "$dateFormat",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              HorizontalView(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30, bottom: 10, top: 15),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Smart Phones",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      ListViewPost(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
