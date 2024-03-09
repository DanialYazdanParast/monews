import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:monews/screen/splash_screen.dart';
import 'constants/them.dart';
import 'model/news.dart';

void main()async {
await Hive.initFlutter();
Hive.registerAdapter(NewsAdapter());
 await Hive.openBox<News>('newsBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      home: SplashScreen(toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        }, ),
    );
  }
}

