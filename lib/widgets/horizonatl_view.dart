import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wp_blog_app/providers/brightness_provider.dart';
import 'package:wp_blog_app/screens/post_view.dart';

import '../wp_api.dart';
import '../const_values.dart';

class HorizontalView extends StatefulWidget {
  @override
  _HorizontalViewState createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {
  WpApi api = WpApi();

  @override
  void initState() {
    super.initState();
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final changeData = Provider.of<BrightnessProvider>(context);
    return FutureBuilder(
      future: api.fetchTopPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                var formatedTime =
                    DateFormat.m().format(snapshot.data[index].time);
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
                            Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              "$formatedTime minutes ago",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Sorry please check you intetnet connection",
                  style: TextStyle(
                    color: changeData.isDark == false ? Colors.black : Colors.white,
                  ),
                ),
                RaisedButton(
                  color: changeData.isDark == false ? Theme.of(context).primaryColor : darkColorTwo,
                  onPressed: _rebuild,
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
              SizedBox(height: 10.0),
              Center(
                child: Image.asset(
                  'assets/images/pageloading.gif',
                  width: 350,
                  height: 200,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
