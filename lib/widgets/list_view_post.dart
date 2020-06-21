import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_blog_app/providers/brightness_provider.dart';
import 'package:wp_blog_app/screens/post_view.dart';

import '../wp_api.dart';
import '../const_values.dart';

class ListViewPost extends StatefulWidget {
  @override
  _ListViewPostState createState() => _ListViewPostState();
}

class _ListViewPostState extends State<ListViewPost> {
  WpApi api = WpApi();

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    final changeData = Provider.of<BrightnessProvider>(context);
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
                    var title = snapshot.data[index];
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return PostView(
                          posts: title,
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
                          height: 90,
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
