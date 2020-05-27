import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wp_blog_app/models/posts.dart';

class WpApi {
  static const api = "https://www.naijaloaded.com.ng/wp-json/wp/v2/posts";
  static const headers = {"Accept": "application/json"};

  Future<List<Posts>> fetchTopPosts() async {
    final response = await http.get(
      api,
      headers: headers,
    );
    List<Posts> posts = List();

    var convertDataToJson = json.decode(response.body);

      convertDataToJson.forEach((post) {
        String title = post['title']['rendered'];

        if (title.length > 30) {
          title = post['title']['rendered'].substring(1, 20) + "...";
        }

        var imageUrl = post['_embedded']['wp:featuredmedia'] != null
            ? post['_embedded']['wp:featuredmedia'][0]['source_url']
            : Container(
                width: 100,
                height: 100,
                child: Image.network(
                  'assets/images/img_error.jpg',
                ),
              );
        var time = post['date'];
        posts.add(Posts(title: title, image: imageUrl, time: time));
      });

    return posts;
  }

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
