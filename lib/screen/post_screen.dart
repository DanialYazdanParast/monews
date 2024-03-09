import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/color.dart';
import '../model/news.dart';
import '../constants/newshot.dart';

class PostScreen extends StatefulWidget {
  News newsHot;
  PostScreen({super.key, required this.newsHot});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final newsBox = Hive.box<News>('newsBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: whitee,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: black,
            elevation: 0,
            expandedHeight: 250,
            floating: true,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            bottom: PreferredSize(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      height: 30,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                height: 5,
                                width: 67,
                                color: gray,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                preferredSize: Size.fromHeight(30)),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.newsHot.image,
                fit: BoxFit.cover,
              ),
            ),
            centerTitle: true,
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('images/icon_arrow_right.png')),
            ],
            leading: Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                Image.asset('images/icon_menu.png'),
                SizedBox(
                  width: 24,
                ),
                InkWell(
                    onTap: () {
                      var news = News(
                          image: widget.newsHot.image,
                          titel: widget.newsHot.titel,
                          summary: widget.newsHot.summary,
                          description: widget.newsHot.description,
                          type: widget.newsHot.type,
                          newsicon: widget.newsHot.newsicon,
                          newsname: widget.newsHot.newsname,
                          time: widget.newsHot.time,
                          hashtag: widget.newsHot.hashtag);
                      newsBox.add(news);
                      

                      
                    },
                    child: Image.asset('images/icon_frame.png')),
              ],
            ),
            leadingWidth: 100,
          ),
          SliverToBoxAdapter(
            child: _getHeder(context),
          ),
          SliverToBoxAdapter(
            child: _getPostTitr(),
          ),
          SliverToBoxAdapter(
            child: _getHashtag(),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 200),
            child: Column(
              children: [
                Text(
                  widget.newsHot.summary,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.newsHot.description,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        width: 3,
                        height: 200,
                        color: Theme.of(context).canvasColor),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  Padding _getHashtag() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 20),
      child: SizedBox(
        height: 36,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemCount: widget.newsHot.hashtag.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      color: Theme.of(context).canvasColor.withOpacity(0.6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Center(
                            child: Text(
                          widget.newsHot.hashtag[index],
                          style: TextStyle(color: whitee, fontSize: 10),
                        )),
                      ),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding _getPostTitr() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 27, bottom: 20),
      child: Text(
        widget.newsHot.titel,
        style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).hintColor,
            fontWeight: FontWeight.w700),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Padding _getHeder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.newsHot.time,
            style: Theme.of(context).textTheme.headline4,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              color: Theme.of(context).canvasColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.newsHot.newsname,
                        style: TextStyle(color: gray, fontSize: 8)),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                        height: 16,
                        width: 16,
                        child: Image.asset(
                          widget.newsHot.newsicon,
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text('پیشنهاد مونیوز',
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(
                width: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                    height: 14,
                    width: 14,
                    color: Theme.of(context).canvasColor,
                    child: Center(
                        child: Icon(
                      Icons.bolt,
                      color: Colors.white,
                      size: 12,
                    ))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
