import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:wp_blog_app/app/screens/blog_View.dart';
import 'package:wp_blog_app/const_values.dart';
import 'package:wp_blog_app/models/posts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  Box? storeData;

  displayTime(String date) {
    return DateFormat.yMMMMEEEEd().format(DateTime.parse(date));
  }

  @override
  void initState() {
    super.initState();
    storeData = Hive.box(appState);
  }

  /*
  * All the null exception in the body is because I stored a bool which I use
  * in changing the theme from dark mode to light mode.
  * this has been chnanged and fixed but if any user have the app installed
  * on their phones before that issue will still be there.
  * I will come up with a way to fix this soon.
  */

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: storeData!.listenable(),
      builder: (context, Box box, _) {
        // List<int> keys = box.keys.cast<int>().toList();
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                itemCount: storeData!.keys.toList().length,
                itemBuilder: (_, index) {
                  final keys = box.keys.toList()[index];
                  final Posts post = box.get(keys);
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return BlogView(index: post);
                      }));
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text('Warning'),
                            content: const Text(
                              'You are about to delete this bookmark are '
                              'you sure about this?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  storeData!.delete(keys);
                                  Navigator.pop(context);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          post.image == null
                              ? Container()
                              : Container(
                                  width: 100.w,
                                  height: 100.h,
                                  margin: const EdgeInsets.only(left: 20),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: post.image ?? '',
                                    fit: BoxFit.cover,
                                    width: setContainerWidth(100),
                                    height: setContainerHeight(100),
                                    placeholder: (_, url) {
                                      return Image.asset(
                                        'assets/images/newLoading.gif',
                                        width: 50,
                                        height: 50,
                                      );
                                    },
                                  ),
                                ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: post.title == null
                                      ? Container()
                                      : Text(
                                          '${post.title}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: setTextSize(18),
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.fade,
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: post.time == null
                                      ? Container()
                                      : Text(
                                          "${displayTime(post.time.toString())}",
                                        ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
