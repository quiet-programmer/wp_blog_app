import 'package:flutter/material.dart';

import './wp_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'serif'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FadeInImage.assetNetwork(
                                placeholder: 'images/loading.gif',
                                image: imageUrl),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              wppost['title']['rendered'],
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Image.asset('images/workloading.gif'));
            }
          },
        ),
      ),
    );
  }
}
