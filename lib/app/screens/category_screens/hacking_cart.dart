import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wp_blog_app/app/screens/post_view.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/widgets/refresh_button.dart';
import 'package:wp_blog_app/wp_api.dart';

class HackingScreen extends StatefulWidget {
  @override
  _HackingScreenState createState() => _HackingScreenState();
}

class _HackingScreenState extends State<HackingScreen> {
  WpApi api = WpApi();

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  displayTime(String date) {
    return DateFormat.yMMMMEEEEd().format(DateTime.parse(date));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NaijaTechGuy Blog"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder(
            future: api.fetchOtherCategories(419),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return ListView.builder(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        var post = snapshot.data[index];
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {
                            return PostView(
                              posts: post,
                            );
                          }),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20, top: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: setContainerWidth(100),
                              height: setContainerHeight(100),
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    snapshot.data[index].image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data[index].image,
                                fit: BoxFit.cover,
                                width: setContainerWidth(100),
                                height: setContainerHeight(100),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data[index].title
                                                .substring(0, 20) +
                                            "...",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: setTextSize(18),
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${displayTime(snapshot.data[index].time)}",
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Sorry please check you intetnet connection, and swipe on pull down to refresh \n \n Or",
                        style: TextStyle(),
                      ),
                      RefreshButton(
                        text: 'Refresh',
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Center(
                        child: Image.asset(
                          'assets/images/newLoading.gif',
                          width: 350,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Please check if you are connected to the internet and swipe or pull down to refresh \n \n Or",
                          style: TextStyle(),
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RefreshButton(
                        text: 'Refresh',
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
