import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: api.fetchListPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: Container(
                height: 450,
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
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
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20.0, left: 10.0, right: 10.0),
                              height: 280,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    repeat: ImageRepeat.noRepeat,
                                    image: NetworkImage(
                                        snapshot.data[index].image),
                                  )),
                            ),
                            Positioned(
                              right: 15,
                              bottom: 40,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.pink[300],
                                  borderRadius: BorderRadius.circular(100)
                                ),
                                child: Icon(Icons.arrow_forward, size: 20.0, color: Colors.white,),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 90,
                              child: Container(
                                height: 45,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.pink[300],
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data[index].title,
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ),
            );
          } else {
            return Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
