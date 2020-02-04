import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPosts() async {
  final response = await http.get(
    "https://www.naijaloaded.com.ng/wp-json/wp/v2/posts?_embed",
    headers: {"Accept" : "application/json"},
    );

    var convertDataToJson = jsonDecode(response.body);
    return convertDataToJson;
}