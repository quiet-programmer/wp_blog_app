import 'package:flutter/material.dart';
import 'package:wp_blog_app/wp_api.dart';

import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;


class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  WpApi api = WpApi();

  wp.WordPress wordPress = wp.WordPress(
    baseUrl: "https://viralsharebuzz.com/wp-json/wp/v2/posts",
  );

  _fetchPosts() {
    Future<List<wp.Post>> posts = wordPress.fetchPosts(
      postParams: wp.ParamsPostList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 10,        
      ),
      fetchAuthor: true,
      fetchFeaturedMedia: true,
      fetchComments: true
    );

    return posts;
  }

  _getPostImage(wp.Post post) {
    if (post.featuredMedia == null) {
      return SizedBox();
    }
    return Image.network(post.featuredMedia.sourceUrl);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: FutureBuilder(
        future: _fetchPosts(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                wp.Post post = snapshot.data[index];
                return Text(post.title.rendered.toString());
              },
            );
          } else if(snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: Text("No Internet"),
            );
          } else if(snapshot.hasError) {
            return Center(
              child: Text("Data fetching failed"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
