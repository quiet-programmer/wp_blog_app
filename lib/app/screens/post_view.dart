import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';

class PostView extends StatefulWidget {
  final Posts? posts;

  const PostView({Key? key, @required this.posts}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  displayTime(String date) {
    return DateFormat.yMMMMEEEEd().format(DateTime.parse(date));
  }

  Box? storeData;

  @override
  void initState() {
    super.initState();
    storeData = Hive.box(appState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(33),
                      bottomRight: Radius.circular(33),
                    ),
                    image: DecorationImage(
                        image: NetworkImage('${widget.posts!.image}'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${widget.posts!.title}',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '${displayTime(widget.posts!.time.toString())}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          Posts post = Posts(
                            title: widget.posts!.title,
                            image: widget.posts!.image,
                            contents: widget.posts!.contents,
                            time: widget.posts!.time,
                            authur: widget.posts!.authur,
                          );
                          await storeData!.add(post);
                          Fluttertoast.showToast(
                            msg: 'Bookmarked!!!',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                        },
                        child: const Icon(
                          Icons.bookmark_border,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${widget.posts!.contents}',
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
