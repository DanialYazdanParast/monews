import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

part 'news.g.dart';

@HiveType(typeId: 1)
class News extends HiveObject {
  News(
      {required this.image,
      required this.titel,
      required this.summary,
      required this.description,
      required this.type,
      required this.newsicon,
      required this.newsname,
      required this.time,
      required this.hashtag});

  @HiveField(0)
  String image;
  @HiveField(1)
  String titel;
  @HiveField(2)
  String summary;
  @HiveField(3)
  String description;
  @HiveField(4)
  String type;
  @HiveField(5)
  String newsicon;
  @HiveField(6)
  String newsname;
  @HiveField(7)
  String time;
  @HiveField(8)
  List<String> hashtag;
}
