import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:wp_blog_app/screens/post_view.dart';

import '../wp_api.dart';

class ListViewPost extends StatefulWidget {
  @override
  _ListViewPostState createState() => _ListViewPostState();
}

class _ListViewPostState extends State<ListViewPost> {
  WpApi api = WpApi();

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  displayTime(String date) {
    return DateFormat.yMMMMEEEEd().format(DateTime.parse(date));
  }

  @override
  Widget build(BuildContext context) {
    final Posts changeData = Hive.box(appState).get('state');
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: FutureBuilder(
        future: api.fetchListPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                Posts post = snapshot.data[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return PostView(
                          posts: post,
                        );
                      }),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: setContainerWidth(100),
                          height: setContainerHeight(100),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: post.image,
                            fit: BoxFit.cover,
                            width: setContainerWidth(100),
                            height: setContainerHeight(100),
                            placeholder: (_, url) {
                              return Image.asset(
                                'assets/images/newLoading.gif',
                                width: 50,
                                height: 50,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    post.title.substring(0, 20) + "...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: setTextSize(18),
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "${displayTime(post.time)}",
                                    style: TextStyle(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Sorry please check you intetnet connection, and swipe on pull down to refresh \n \n Or",
                    style: TextStyle(),
                  ),
                  FlatButton(
                    color: changeData.isDark == false
                        ? subColor
                        : Colors.transparent,
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      "Refresh",
                      style: TextStyle(),
                    ),
                  )
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Please check if you are connected to the internet and swipe or pull down to refresh \n \n Or",
                      style: TextStyle(),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FlatButton(
                    color: changeData.isDark == false
                        ? subColor
                        : Colors.transparent,
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      "Refresh",
                      style: TextStyle(),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
