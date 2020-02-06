import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../wp_api.dart';

class HorizontalView extends StatefulWidget {
  @override
  _HorizontalViewState createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WP Blog App"),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  Map wppost = snapshot.data[index];
                  var imageUrl =
                      wppost['_embedded']['wp:featuredmedia'][0]['source_url'];
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 10.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Image.network(imageUrl),
                          Container(
                            width: double.infinity,
                            height: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'images/loading.gif',
                                  image: imageUrl),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              wppost['title']['rendered'],
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(parse(
                                    (wppost['excerpt']['rendered']).toString())
                                .documentElement
                                .text),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Image.asset('images/workloading.gif'),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Center(
                      child: Text(
                        "Sorry for the delay... But your Internet might be slow",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}