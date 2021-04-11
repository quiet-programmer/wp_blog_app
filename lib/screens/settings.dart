import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/providers/theme_provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String devInfo = "Hi, I'm Godsend Joseph by name, I am a Flutter " +
      "Developer, you can click on contact us to get my contacts";

  String aboutBlog = "NaijaTechGuy is a Nigerian Technology Website " +
      "Focused on Publishing the latest news on technology, " +
      "smartphones, gadgets and more related content";
  @override
  Widget build(BuildContext context) {
    final isThemeChange = Provider.of<ThemeProvider>(context);
    return Scaffold(
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
                          image: isThemeChange.mTheme == false
                              ? AssetImage('assets/logo/naijatechguyD.png')
                              : AssetImage('assets/logo/naijatechguy.png'),
                        ),
                      ),
                    ),
                    Text(
                      aboutBlog,
                      style: TextStyle(
                        fontSize: setTextSize(15),
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
                    fontSize: setTextSize(18),
                  ),
                ),
                subtitle: Text(
                  "Subscribe to notifications (Not Available Yet!)",
                  style: TextStyle(
                    fontSize: setTextSize(13),
                  ),
                ),
                trailing: Switch(value: true, onChanged: null),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: setTextSize(18),
                  ),
                ),
                subtitle: Text(
                  "About the developer",
                  style: TextStyle(
                    fontSize: setTextSize(13),
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
                        title: Text(
                          "About the Developer",
                          style: TextStyle(),
                        ),
                        content: Text(
                          devInfo,
                          style: TextStyle(
                            fontSize: setTextSize(15),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: setTextSize(18),
                  ),
                ),
                subtitle: Text(
                  "Contact the developer",
                  style: TextStyle(
                    fontSize: setTextSize(13),
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
                        title: Text(
                          "Developer Contact",
                          style: TextStyle(),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.email,
                              ),
                              title: Text(
                                "godsendjoseph@gmail.com",
                                style: TextStyle(
                                  fontSize: setTextSize(15),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.phone,
                              ),
                              title: Text(
                                "+234 8140864923",
                                style: TextStyle(
                                  fontSize: setTextSize(15),
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
              Divider(),
              ListTile(
                title: Text(
                  "Share",
                  style: TextStyle(
                    fontSize: setTextSize(18),
                  ),
                ),
                subtitle: Text(
                  "Share the app with friends",
                  style: TextStyle(
                    fontSize: setTextSize(13),
                  ),
                ),
                trailing: Icon(
                  Icons.share,
                  color: subColor,
                ),
                onTap: () {
                  Share.share('check out my blog app for Naija Tech Guy',
                      subject: 'Look what I made!');
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Rate Us",
                  style: TextStyle(
                    fontSize: setTextSize(18),
                  ),
                ),
                subtitle: Text(
                  "Rate the app on play store",
                  style: TextStyle(
                    fontSize: setTextSize(13),
                  ),
                ),
                trailing: Icon(
                  Icons.star,
                  color: subColor,
                ),
                onTap: () {
                  LaunchReview.launch(
                    androidAppId: "com.viewus.wp_blog",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
