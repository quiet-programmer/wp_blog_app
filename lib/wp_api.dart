import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wp_blog_app/models/posts.dart';

class WpApi {

  static const API = "https://www.naijaloaded.com.ng/wp-json/wp/v2/posts?_embed";
  static const headers = {
    "Accept": "application/json"
  };
  // static const API = "https://www.naijatechguy.com/wp-json/wp/v2/posts?_embed";
  // static const headers = {
  //   "Accept": "application/json"
  // };

  Future<List<Posts>> fetchTopPosts() async {
    final response = await http.get(
      API,
      headers: headers,
    );

    var convertDataToJson = jsonDecode(response.body);
    List<Posts> posts = List();

    convertDataToJson.forEach((post) {

      String title = post['title']['rendered'];
      if (title.length > 30) {
        title = post['title']['rendered'].substring(1, 30) + "...";
      }
      var imageUrl = post['_embedded']['wp:featuredmedia'] != null
                            ? post['_embedded']['wp:featuredmedia'][0]
                                ['source_url']
                            : Text("Error");
      // var image = post['url'];
      // String image = post['url'];
      posts.add(Posts(title: title, image: imageUrl));
      
    });


    return posts;
  }

  Future<List<Posts>> fetchListPosts() async {
    final response = await http.get(
      API,
      headers: headers,
    );

    var convertDataToJson = jsonDecode(response.body);
    List<Posts> posts = List();

    convertDataToJson.forEach((post) {

      String title = post['title']['rendered'];
      if (title.length > 30) {
        title = post['title']['rendered'].substring(1, 30) + "...";
      }
      var imageUrl = post['_embedded']['wp:featuredmedia'] != null
                            ? post['_embedded']['wp:featuredmedia'][0]
                                ['source_url']
                            : Text("Error");
      // var image = post['url'];
      // String image = post['url'];
      posts.add(Posts(title: title, image: imageUrl));

    });


    return posts;
  }
}
