import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wp_blog_app/models/posts.dart';

class WpApi {

  static const api = "https://www.naijaloaded.com.ng/wp-json/wp/v2/";
  static const headers = {"Accept": "application/json"};

  Future<List<Posts>> fetchTopPosts() async {

    var response = await http.get(
      Uri.encodeFull(api + "posts?_embed"),
      headers: headers,
    );

    var convertDataToJson = jsonDecode(response.body);

    List<Posts> posts = [];

    convertDataToJson.forEach((post) {
      String title = post['title']['rendered'];

      // if (title.length > 30) {
      //   title = post['title']['rendered'].substring(0, 20) + "...";
      //   print(title);
      // }

      // var imageUrl = post['_embedded']['wp:featuredmedia'] != null
      //     ? post['_embedded']['wp:featuredmedia'][0]['source_url']
      //     : Image.network(
      //         'assets/images/img_error.jpg',
      //       );

      //       print(imageUrl.toString());

      var time = post['date'];
      print(time.toString());

      posts.add(Posts(title: title, time: time));

    });

    return posts;
  }

  // Future<List<Posts>> get topPost {
  //   return _fetchTopPosts();
  // }

  Future<List<Posts>> fetchListPosts() async {
    final response = await http.get(
      api,
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
          ? post['_embedded']['wp:featuredmedia'][0]['source_url']
          : Text("Error");

      posts.add(Posts(title: title, image: imageUrl));
    });
    return posts;
  }
}
