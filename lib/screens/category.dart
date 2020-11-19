import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wp_blog_app/screens/category_screens/accessories.dart';
import 'package:wp_blog_app/screens/category_screens/android_cart.dart';
import 'package:wp_blog_app/screens/category_screens/apps_cart.dart';
import 'package:wp_blog_app/screens/category_screens/gaming_android.dart';
import 'package:wp_blog_app/screens/category_screens/gaming_cart.dart';
import 'package:wp_blog_app/screens/category_screens/hacking_cart.dart';
import 'package:wp_blog_app/screens/category_screens/internet_cart.dart';
import 'package:wp_blog_app/screens/category_screens/ios_cart.dart';
import 'package:wp_blog_app/screens/category_screens/network_cart.dart';
import 'package:wp_blog_app/screens/category_screens/reviews_cart.dart';
import 'package:wp_blog_app/screens/category_screens/smart_phones_cart.dart';
import 'package:wp_blog_app/screens/category_screens/social_cart.dart';

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
              changeData.isDark == false ? Colors.white : Colors.grey[900],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AccessoriesScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Accessories",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AndroidCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Android",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AppsCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Apps",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return GamingCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Gaming",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return GamingAndroidScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Gaming Android",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return HackingScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Hacking",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return InternetCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Internet",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return IosCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "IOS",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return NetworkCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Networks",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return ReviewsCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Reviews",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return SmartphonesScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Smartphones",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return SocialCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Social",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AppsCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Tech",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AppsCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Tutorials",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AppsCartScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: setContainerHeight(80),
                        child: Card(
                          color: changeData.isDark == false
                              ? Colors.white
                              : cardColor,
                          child: Center(
                            child: Text(
                              "Tweaks",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: setTextSize(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
