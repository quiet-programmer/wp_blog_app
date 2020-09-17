import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: changeData.isDark == false
                                  ? AssetImage('assets/logo/naijatechguyD.png')
                                  : AssetImage('assets/logo/naijatechguy.png'),
                            ),
                          ),
                        ),
                        Text(
                          "NaijaTechGuy is a Nigerian Technology Website Focused on Publishing the latest news on technology, smartphones, gadgets and more related content",
                          style: TextStyle(
                            color: changeData.isDark == false
                                ? defaultBlack
                                : defaultWhite,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    title: Text(
                      "Notifications",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "Subscribe to notifications",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                      ),
                    ),
                    trailing: Switch(value: true, onChanged: null),
                  ),
                  Divider(
                    color: changeData.isDark == false
                        ? defaultBlack
                        : defaultWhite,
                  ),
                  ListTile(
                    title: Text(
                      "About Us",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "About the developer",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                      ),
                    ),
                    trailing: Icon(
                      Icons.info,
                      color: subColor,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            backgroundColor: changeData.isDark == false
                                ? defaultWhite
                                : darkColor,
                            title: Text(
                              "About the Developer",
                              style: TextStyle(
                                color: changeData.isDark == false
                                    ? defaultBlack
                                    : defaultWhite,
                              ),
                            ),
                            content: Text(
                              "Hi, I'm Godsend Joseph by name, I am a Flutter Developer, you can press on us to get my contacts",
                              style: TextStyle(
                                color: changeData.isDark == false
                                    ? defaultBlack
                                    : defaultWhite,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Divider(
                    color: changeData.isDark == false
                        ? defaultBlack
                        : defaultWhite,
                  ),
                  ListTile(
                    title: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "Contact the developer",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                      ),
                    ),
                    trailing: Icon(
                      Icons.phone,
                      color: subColor,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            backgroundColor: changeData.isDark == false
                                ? defaultWhite
                                : darkColor,
                            title: Text(
                              "Developer Contact",
                              style: TextStyle(
                                color: changeData.isDark == false
                                    ? defaultBlack
                                    : defaultWhite,
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.email,
                                    color: changeData.isDark == false
                                        ? defaultBlack
                                        : defaultWhite,
                                  ),
                                  title: Text(
                                    "godsendjoseph@gmail.com",
                                    style: TextStyle(
                                      color: changeData.isDark == false
                                          ? defaultBlack
                                          : defaultWhite,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.phone,
                                    color: changeData.isDark == false
                                        ? defaultBlack
                                        : defaultWhite,
                                  ),
                                  title: Text(
                                    "+234 8140864923",
                                    style: TextStyle(
                                      color: changeData.isDark == false
                                          ? defaultBlack
                                          : defaultWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Divider(
                    color: changeData.isDark == false
                        ? defaultBlack
                        : defaultWhite,
                  ),
                  ListTile(
                    title: Text(
                      "Share",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "Share the app with friends",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                      ),
                    ),
                    trailing: Icon(
                      Icons.share,
                      color: subColor,
                    ),
                    onTap: () {
                      Share.share('check out my website https://example.com',
                          subject: 'Look what I made!');
                    },
                  ),
                  Divider(
                    color: changeData.isDark == false
                        ? defaultBlack
                        : defaultWhite,
                  ),
                  ListTile(
                    title: Text(
                      "Rate Us",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "Rate the app on play store",
                      style: TextStyle(
                        color: changeData.isDark == false
                            ? defaultBlack
                            : defaultWhite,
                      ),
                    ),
                    trailing: Icon(
                      Icons.star,
                      color: subColor,
                    ),
                    onTap: () {
                      LaunchReview.launch(
                        androidAppId: "com.example.wp_blog_app",
                      );
                    },
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
