import 'package:flutter/material.dart';
import 'package:monews/screen/post_screen.dart';
import 'package:monews/widget/titel.dart';

import '../constants/categorys.dart';
import '../constants/color.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:marquee/marquee.dart';

import '../constants/kabar_gozari.dart';
import '../constants/news_like.dart';
import '../constants/newshot.dart';
import '../model/news.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
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
                  leading: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('images/icon_search.png',
                          color: Theme.of(context).hintColor),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('images/icon_filter_edit.png',
                          color: Theme.of(context).hintColor),
                    ],
                  ),
                  leadingWidth: 100,
                ),
                SliverToBoxAdapter(
                  child: _getSlider(),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 32, right: 24),
                  sliver: SliverToBoxAdapter(child: _getCategory()),
                ),
                SliverToBoxAdapter(
                  child: getTitel(context, 'خبر های داغ'),
                ),
                SliverToBoxAdapter(
                  child: _getKhabarGozariha(),
                ),
                SliverToBoxAdapter(
                  child: getTitel(context, 'پیشنهاد سردبیر'),
                ),
                SliverToBoxAdapter(
                  child: _getPishnahadSarDabir(),
                ),
              ],
            ),
            Positioned(
                child: Container(
              height: 48,
              color: Theme.of(context).canvasColor,
              child: Marquee(
                text:
                    '   ....  بی‌نظمی شدید در مراسم رونمایی از کاپ جام جهانی و قهر نماینده فیفا',
                style: TextStyle(fontSize: 14, color: whitee),
              ),
            ))
          ],
        ),
      ),
    );
  }

////////////////////////////////
  Padding _getPishnahadSarDabir() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 48),
      child: SizedBox(
        height: 159,
        width: 271,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              itemCount: newsLikes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                 News newsLike = newsLikes[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                        onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostScreen(
                                  newsHot: newsLike,
                                )));
                  },
                      child: Container(
                          color: Theme.of(context).cardColor,
                          height: 159,
                          width: 271,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                      height: 159,
                                      width: 271,
                                      child: Image.asset(
                                        newsLike.image,
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
                                    color: Theme.of(context)
                                        .canvasColor
                                        .withOpacity(0.5),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        newsLike.type,
                                        style: TextStyle(
                                            color: whitee, fontSize: 10),
                                      ),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

///////////////////////////
  Widget _getKhabarGozariha() {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: SizedBox(
        height: 185,
        width: 133,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              itemCount: khabarGozaris.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                KhabarGozari khabarGozari = khabarGozaris[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Theme.of(context).cardColor,
                      // height: 200,
                      width: 133,
                      child: Column(children: [
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                            height: 56,
                            width: 56,
                            child: Image.asset(
                              khabarGozari.image,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          khabarGozari.titel,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: Theme.of(context).elevatedButtonTheme.style,
                            onPressed: () {},
                            child: Text(
                              'دنبال کردن',
                              style: TextStyle(color: whitee),
                            )),
                        SizedBox(
                          height: 16,
                        ),
                      ]),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

///////////////////////////////////////
  SizedBox _getCategory() {
    return SizedBox(
      height: 36,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorys.length,
          itemBuilder: (context, index) {
         var category =categorys[index];
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      indexCategory = index;
                    });
                  },
                  child: Container(
                    color: indexCategory == index
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Center(
                          child: Text(
                        category,
                        style: TextStyle(
                          color: indexCategory == index ? white : gray,
                          fontSize: 12,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

///////////////////////////////////////////////
  Widget _getSlider() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 180,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Image.asset(
                "images/Banner$index.png",
                fit: BoxFit.fill,
                
              ),
            );
          },
          itemCount: 2,
          autoplay: true,
          //  pagination: SwiperPagination(),
          //  control: SwiperControl(),
        ),
      ),
    );
  }
}
