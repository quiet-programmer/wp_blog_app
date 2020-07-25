import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';

class PostView extends StatefulWidget {
  final Posts posts;
  PostView({Key key, @required this.posts}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  displayTime(String date) {
    return DateFormat.yMMMMEEEEd().format(DateTime.parse(date));
  }

  @override
  Widget build(BuildContext context) {
    final Posts changeData = Hive.box(appState).get('state');
    return Scaffold(
      backgroundColor: changeData.isDark == false ? mainColor : darkColorTwo,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(33),
                      bottomRight: Radius.circular(33),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(widget.posts.image),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.posts.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${displayTime(widget.posts.time)}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.posts.contents,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
