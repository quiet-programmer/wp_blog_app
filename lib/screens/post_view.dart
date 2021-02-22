import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
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

  Box storeData;

  @override
  void initState() {
    super.initState();
    storeData = Hive.box(appState);
  }

  @override
  Widget build(BuildContext context) {
    final Posts changeData = storeData.get('state');
    return Scaffold(
      backgroundColor:
          changeData.isDark == false ? Colors.white : Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: setContainerHeight(300),
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
                      color: changeData.isDark == false
                          ? Colors.black
                          : Colors.white,
                      fontSize: setTextSize(23),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "${displayTime(widget.posts.time)}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          Posts post = Posts(
                            title: widget.posts.title,
                            image: widget.posts.image,
                            contents: widget.posts.contents,
                            time: widget.posts.time,
                            authur: widget.posts.authur,
                          );
                          await storeData.add(post);
                          Toast.show('Bookmarked!!!', context,
                              duration: 5, gravity: Toast.BOTTOM);
                        },
                        child: Icon(
                          Icons.bookmark_border,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    widget.posts.contents,
                    style: TextStyle(
                      color: changeData.isDark == false
                          ? Colors.black
                          : Colors.white,
                      fontSize: setTextSize(18),
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
