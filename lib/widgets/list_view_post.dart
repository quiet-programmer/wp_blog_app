import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  snapshot.data[index].image,
                                ),
                                fit: BoxFit.cover),
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
                                    snapshot.data[index].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${displayTime(snapshot.data[index].time)}",
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                    ),
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
                    "Sorry please check you intetnet connection, and swipe on pull down to refresh",
                    style: TextStyle(color: Colors.white),
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
                    color: Colors.white,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
