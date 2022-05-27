import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wp_blog_app/app/screens/post_view.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:wp_blog_app/widgets/refresh_button.dart';

import '../wp_api.dart';
import '../const_values.dart';

class HorizontalView extends StatefulWidget {
  const HorizontalView({Key? key}) : super(key: key);

  @override
  _HorizontalViewState createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {
  WpApi api = WpApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.fetchTopPosts(),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return SizedBox(
            height: 220.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) {
                Posts post = snapshot.data[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return PostView(
                          posts: post,
                        );
                      }),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      post.image != null
                          ? Container(
                              width: 250.w,
                              height: 150.h,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${post.image}',
                                fit: BoxFit.cover,
                                width: 250.w,
                                height: 150.h,
                                placeholder: (_, url) {
                                  return Image.asset(
                                    'assets/images/newLoading.gif',
                                    width: 50,
                                    height: 50,
                                  );
                                },
                              ),
                            )
                          : Container(
                              width: 250.w,
                              height: 150.h,
                              margin: const EdgeInsets.only(left: 20),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/img_error.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      Expanded(
                        child: Container(
                          width: 250.w,
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              '${post.title}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              maxLines: 2,
                              minFontSize: 15,
                              overflow: TextOverflow.fade,
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: Column(
              children: <Widget>[
                const Text(
                  "Sorry please check you intetnet connection, and swipe on pull down to refresh \n \n Or",
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 20.0,
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
          return Column(
            children: <Widget>[
              const SizedBox(height: 10.0),
              Center(
                child: Image.asset(
                  'assets/images/newLoading.gif',
                  width: 350,
                  height: 200,
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
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
    );
  }
}
