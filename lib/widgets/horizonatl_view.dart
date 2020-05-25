import 'package:flutter/material.dart';
import 'package:wp_blog_app/screens/post_view.dart';

import '../wp_api.dart';

class HorizontalView extends StatefulWidget {
  @override
  _HorizontalViewState createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {
  WpApi api = WpApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.fetchTopPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
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
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 350,
                              height: 200,
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                // borderRadius:
                                //     BorderRadius.all(Radius.circular(20.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    snapshot.data[index].image,
                                  ),
                                ),
                              ),
                              // child: FadeInImage.assetNetwork(
                              //   placeholder: 'images/loading.gif',
                              //   image: snapshot.data[index].image,
                              //   width: 350,
                              //   height: 250,
                              // ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 5,
                              child: Container(
                                // decoration: BoxDecoration(
                                //     color: Colors.pink[300],
                                //     borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  snapshot.data[index].title,
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ));
              },
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
    );
  }
}
