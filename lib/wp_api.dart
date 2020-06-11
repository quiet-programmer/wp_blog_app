import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wp_blog_app/models/posts.dart';

class WpApi {
  static const api = "https://www.naijatechguy.com/wp-json/wp/v2/";
  static const listApi = "https://www.naijatechguy.com/wp-json/wp/v2/";
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

      if (title.length > 30) {
        title = post['title']['rendered'].substring(0, 20) + "...";
      }

      var imageUrl = post['_embedded']['wp:featuredmedia'] != null
          ? post['_embedded']['wp:featuredmedia'][0]['source_url']
          : Image.network(
              'assets/images/img_error.jpg',
            );

      // var time = post['date'];

      posts.add(Posts(title: title, image: imageUrl));
    });

    return posts;
  }

  Future<List<Posts>> fetchListPosts() async {
    var response = await http.get(
      Uri.encodeFull(listApi + "posts?_embed&categories=467"),
      headers: headers,
    );

    var convertDataToJson = jsonDecode(response.body);

    List<Posts> posts = [];

    convertDataToJson.forEach((post) {
      String title = post['title']['rendered'];

      if (title.length > 30) {
        title = post['title']['rendered'].substring(0, 50) + "...";
      }

      var imageUrl = post['_embedded']['wp:featuredmedia'] != null
          ? post['_embedded']['wp:featuredmedia'][0]['source_url']
          : Image.network(
              'assets/images/img_error.jpg',
              fit: BoxFit.cover,
              width: 100,
              height: 90,
            );

      // var time = post['date'];

      posts.add(Posts(title: title, image: imageUrl));
    });

    return posts;
  }

}
