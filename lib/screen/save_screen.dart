import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:monews/screen/post_screen.dart';

import '../constants/color.dart';
import '../model/news.dart';
import '../constants/newshot.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  var newsBox = Hive.box<News>('newsBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              //   backgroundColor: white,
              elevation: 0,
              title: Container(
                  height: 28,
                  width: 80,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        left: 5,
                        child: Row(
                          children: [
                            Text(
                              'نیوز',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context).canvasColor),
                            ),
                            Text(
                              'مو',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          left: 0,
                          child: Container(
                              height: 14,
                              width: 14,
                              child: Image.asset(
                                'images/Union.png',
                                color: Theme.of(context).hintColor,
                              ))),
                    ],
                  )),
              centerTitle: true,
              leading: SizedBox(
                height: 25,
                width: 25,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: newsBox.listenable(),
              builder: (context, value, child) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var news = newsBox.values.toList()[index];
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          news.delete();
                        },
                        child: _getKhabarLike(context, news),
                      );
                    },
                    childCount: newsBox.values.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

//////////////////////////////////////
  Widget _getKhabarLike(BuildContext context, News news) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostScreen(
                          newsHot: news,
                        )));
          },
          child: Container(
            color: Theme.of(context).cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, right: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          news.titel,
                          style: Theme.of(context).textTheme.headline5,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          news.summary,
                          style: Theme.of(context).textTheme.headline4,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('images/short_menu.png'),
                            Spacer(),
                            Text(
                              news.newsname,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(width: 5,),
                            Container(
                              height: 16,
                              width: 16,
                              child: Image.asset(news.newsicon),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 8, bottom: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            width: 116,
                            height: 116,
                            child: Image.asset(
                              news.image,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Positioned(
                      right: 13,
                      top: 13,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 28,
                          width: 69,
                          color: Theme.of(context).canvasColor.withOpacity(0.5),
                          child: Center(
                              child: Text(
                            news.type,
                            style: TextStyle(color: whitee, fontSize: 10),
                          )),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
