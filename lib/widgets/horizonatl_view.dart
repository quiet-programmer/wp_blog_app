import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wp_blog_app/providers/brightness_provider.dart';
import 'package:wp_blog_app/screens/post_view.dart';
// import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

import '../wp_api.dart';
import '../const_values.dart';

class HorizontalView extends StatefulWidget {
  @override
  _HorizontalViewState createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {
  WpApi api = WpApi();

  @override
  Widget build(BuildContext context) {
    final BrightnessProvider changeData = Hive.box(appState).get('state');
    return FutureBuilder(
      future: api.fetchTopPosts(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                // var formatedTime =
                //     DateFormat.m().format(snapshot.data[index].time);
                // print(formatedTime.toString());
                return InkWell(
                  onTap: () {
                    var post = snapshot.data[index];
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return PostView(
                          posts: post,
                        );
                      }),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 150,
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                        child: Image.network(
                          snapshot.data[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            AutoSizeText(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  color: changeData.isDark == false
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              maxLines: 2,
                              minFontSize: 15,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                            // Text(
                            //   "$formatedTime minutes ago",
                            //   style: TextStyle(
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Sorry please check you intetnet connection, and swipe on pull down to refresh",
                  style: TextStyle(
                    color: changeData.isDark == false
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Center(
                child: Image.asset(
                  'assets/images/newLoading.gif',
                  width: 350,
                  height: 200,
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Please check if you are connected to the internet and swipe or pull down to refresh",
                style: TextStyle(
                  color:
                      changeData.isDark == false ? Colors.black : Colors.white,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
    );
  }
}
