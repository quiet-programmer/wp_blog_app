import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "Music",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "Video",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "Entertainment",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "NL TV",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "News",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "NL List",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "DJ Mix",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "Talk Zone",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: ListTile(
                    leading: Icon(Icons.view_list),
                    title: Text(
                      "Sport",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
