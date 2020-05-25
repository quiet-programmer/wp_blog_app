import 'package:flutter/material.dart';
import 'package:wp_blog_app/widgets/horizonatl_view.dart';
import 'package:wp_blog_app/widgets/list_view_post.dart';

class BlogView extends StatefulWidget {
  @override
  _BlogViewState createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
              Container(
                margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text(
                  "You may like",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          HorizontalView(),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              "Your Choice",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListViewPost(),
        ],
      ),
    );
  }
}
