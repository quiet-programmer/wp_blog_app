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
  Widget build(BuildContext context) {
    final changeData = Provider.of<BrightnessProvider>(context);
    return Container(
      child: FutureBuilder(
        future: api.fetchListPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: Container(
                child: ListView.builder(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 80,
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Sorry please check you intetnet connection",
                    style: TextStyle(color: Colors.white),
                  ),
                  RaisedButton(
                    color: changeData.isDark == false ? Theme.of(context).accentColor : darkColor,
                    onPressed: () {},
                    child: Text(
                      "Refresh",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Column(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/images/pageloading.gif',
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
