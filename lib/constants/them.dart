import 'package:flutter/material.dart';

import 'color.dart';

class MyAppThemeConfig {
  final Color primaryTextColor;
  final Color backgroundColor;
  final Color more;
  final Color card;
  final Color navigashen;

  MyAppThemeConfig.dark()
      : primaryTextColor = white,
        backgroundColor = dblack,
        card = greypost,
        more = purple,
        navigashen =dblack;

  MyAppThemeConfig.light()
      : primaryTextColor = black,
        backgroundColor = white,
        card = whitee,
        more = red,
        navigashen = whitee;

  ThemeData getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      cardColor: card,
      canvasColor: more,
      accentColor: navigashen,
      hintColor: primaryTextColor,
      appBarTheme: AppBarTheme(backgroundColor: backgroundColor, elevation: 0),
      fontFamily: 'SM',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: more.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      )),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 14,
          color: red,
        ),
        headline2: TextStyle(
          fontSize: 16,
          color: primaryTextColor,
        ),
        headline3: TextStyle(
          fontSize: 12,
          color: more,
        ),
        headline4: TextStyle(
          fontSize: 10,
          color: gray,
        ),
        headline5: TextStyle(
          fontSize: 14,
          color: primaryTextColor,
          fontWeight: FontWeight.w700,
        ),
        headline6: TextStyle(
          fontSize: 8,
          color: primaryTextColor,
        ),
      ),
    );
  }
}
