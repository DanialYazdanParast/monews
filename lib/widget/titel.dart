import 'package:flutter/material.dart';
 Widget getTitel(BuildContext context, String titr) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'مشاهده بیشتر',
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            '$titr ',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }