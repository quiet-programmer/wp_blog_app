import 'package:flutter/material.dart';
import 'package:wp_blog_app/models/posts.dart';

class PostView extends StatelessWidget {

  final Posts posts;
  PostView({Key key, @required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(posts.title),
      ),
      body: Container(
        child: Center(
          child: Image.network(posts.image),
        ),
      ),
    );
  }
}