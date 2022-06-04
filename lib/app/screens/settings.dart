import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/providers/theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String devInfo = "Hi, I'm Godsend Joseph by name, I am a Flutter "
      "Developer, you can click on contact us to get my contacts";

  String aboutBlog = "NaijaTechGuy is a Nigerian Technology Website "
      "Focused on Publishing the latest news on technology, smartphones,"
      " gadgets and more related content";
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
                      height: 100.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: isThemeChange.mTheme == false
                              ? const AssetImage('assets/logo/naijatechguyD.png')
                              : const AssetImage('assets/logo/naijatechguy.png'),
                        ),
                      ),
                    ),
                    Text(
                      aboutBlog,
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Text(
                  "Subscribe to notifications (Not Available Yet!)",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                trailing: const Switch(value: true, onChanged: null),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Text(
                  "About the developer",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                trailing: const Icon(
                  Icons.info,
                  color: subColor,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text(
                          "About the Developer",
                        ),
                        content: Text(
                          devInfo,
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Text(
                  "Contact the developer",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                trailing: const Icon(
                  Icons.phone,
                  color: subColor,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text(
                          "Developer Contact",
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(
                                Icons.email,
                              ),
                              title: Text(
                                "godsendjoseph@gmail.com",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.phone,
                              ),
                              title: Text(
                                "+234 8140864923",
                                style: TextStyle(
                                  fontSize: 15.sp,
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
              const Divider(),
              ListTile(
                title: Text(
                  "Share",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Text(
                  "Share the app with friends",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                trailing: const Icon(
                  Icons.share,
                  color: subColor,
                ),
                onTap: () {
                  Share.share('check out my blog app for Naija Tech Guy',
                      subject: 'Look what I made!');
                },
              ),
              const Divider(),
              ListTile(
                title: Text(
                  "Rate Us",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                subtitle: Text(
                  "Rate the app on play store",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
                trailing: const Icon(
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
