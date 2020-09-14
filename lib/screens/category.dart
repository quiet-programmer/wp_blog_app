import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final Posts changeData = Hive.box(appState).get('state');
    return ValueListenableBuilder(
      valueListenable: Hive.box(appState).listenable(),
      builder: (context, box, _) {
        return Scaffold(
          backgroundColor:
              changeData.isDark == false ? Colors.white : darkColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Accessories",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Android",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Apps",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Apps",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Gaming",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Gaming Android",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Hacking",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Internet",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "IOS",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Networks",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Reviews",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Smartphones",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Social",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Sponsored",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Tech",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Tutorials",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80.0,
                          child: Card(
                            color: changeData.isDark == false
                                ? Colors.white
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Tweaks",
                                style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
