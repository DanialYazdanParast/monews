import 'package:flutter/material.dart';
import 'package:monews/constants/color.dart';
import 'package:monews/screen/post_screen.dart';
import 'package:monews/widget/titel.dart';

import '../constants/news_like.dart';
import '../model/news.dart';
import '../constants/newshot.dart';

class HomeScreen extends StatefulWidget {
  final Function() toggleThemeMode;

  HomeScreen({
    super.key,
    required this.toggleThemeMode,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //  backgroundColor: white,
        body: SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
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
                    child: InkWell(
                      onTap: widget.toggleThemeMode,
                      child: Image.asset('images/notification-status.png',
                          color: Theme.of(context).hintColor.withOpacity(0.8)),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: TabBar(
                        unselectedLabelColor: gray,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Theme.of(context).canvasColor),
                        indicatorPadding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        tabs: [
                          Tab(
                            text: 'دنبال میکنید',
                          ),
                          Tab(
                            text: 'پیشنهادی',
                          ),
                        ],
                      ),
                    ),
                  ),
                )

                // SliverPersistentHeader(
                //   delegate: TabBarViewDelegate(

                //     TabBar(
                //       unselectedLabelColor: gray,

                //       indicator: BoxDecoration(
                //           borderRadius: BorderRadius.circular(18), color: Theme.of(context).canvasColor),
                //       indicatorPadding:
                //           EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                //       tabs: [
                //         Tab(
                //           text: 'دنبال میکنید',
                //         ),
                //         Tab(
                //           text: 'پیشنهادی',
                //         ),
                //       ],
                //     ),
                //   ),
                //   //  pinned: true,
                //   floating: true,
                // )
              ];
            },
//---------------------------------------------//
            body: TabBarView(children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        News newsLike = newsLikes[index];
                        return _getKhabarLike(context, newsLike);
                      }, childCount: newsLikes.length),
                    ),
                  )
                ],
              ),
              //////////////////////
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: getTitel(context, 'خبر های داغ'),
                  ),
                  SliverToBoxAdapter(
                    child: getPostKhabarDagh(),
                  ),
                  SliverToBoxAdapter(
                    child: getTitel(context, 'خبر هایی که علاقه داری'),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      News newsLike = newsLikes[index];
                      return _getKhabarLike(context, newsLike);
                    }, childCount: newsLikes.length),
                  )
                ],
              ),
            ])),
      ),
    ));
  }
//---------------------------------------------//

  Widget _getKhabarLike(BuildContext context, News newsLike) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostScreen(
                  newsHot: newsLike,
                ),
              ),
            );
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
                          newsLike.titel,
                          style: Theme.of(context).textTheme.headline5,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          newsLike.summary,
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
                              newsLike.newsname,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 16,
                              width: 16,
                              child: Image.asset(newsLike.newsicon),
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
                          width: 69,
                          color: Theme.of(context).canvasColor.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              newsLike.type,
                              style: TextStyle(color: whitee, fontSize: 10),
                            ),
                          ),
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

////////////////////////////////////
  Widget getPostKhabarDagh() {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Container(
        height: 294,
        width: 280,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newsHots.length,
              itemBuilder: (context, index) {
                News newsHot = newsHots[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostScreen(
                                  newsHot: newsHot,
                                )));
                  },
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 281,
                            width: 280,
                            color: Theme.of(context).cardColor,
                            child: Column(children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        height: 159,
                                        width: 280,
                                        child: Image.asset(
                                          '${newsHot.image}',
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Container(
                                        height: 28,
                                        width: 58,
                                        color: Theme.of(context)
                                            .canvasColor
                                            .withOpacity(0.5),
                                        child: Center(
                                          child: Text(
                                            '${newsHot.type}',
                                            style: TextStyle(
                                                color: whitee, fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Container(
                                              height: 14,
                                              width: 14,
                                              color:
                                                  Theme.of(context).canvasColor,
                                              child: Center(
                                                  child: Icon(
                                                Icons.bolt,
                                                color: Colors.white,
                                                size: 12,
                                              ))),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'پیشنهاد مونیوز',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: gray,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '${newsHot.time}',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: gray,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${newsHot.titel}',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 16,
                        child: Container(
                          height: 30,
                          width: 245,
                          // color: red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 16,
                                width: 16,
                                child: Image.asset('${newsHot.newsicon}'),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${newsHot.newsname}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Spacer(),
                              Image.asset('images/short_menu.png'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }


}
/////////////////////////

// class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar _tabBar;
//   TabBarViewDelegate(
//     this._tabBar,
//   );
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     // TODO: implement build
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 28),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Theme.of(context).cardColor,
//             borderRadius: BorderRadius.circular(21)),
//         child: _tabBar,
//       ),
//     );
//   }

//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
