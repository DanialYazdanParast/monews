import 'package:flutter/material.dart';
import 'package:monews/constants/color.dart';

import 'bottomnavigator.dart';

class SplashScreen extends StatefulWidget {
  final Function() toggleThemeMode;
  SplashScreen({super.key, required this.toggleThemeMode});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    navigashen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        image: DecorationImage(
          image: AssetImage(
            'images/group.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Container(
                height: 60,
                width: 150,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      left: 9,
                      top: 3,
                      child: Row(
                        children: [
                          Text(
                            'نیوز',
                            style: TextStyle(
                                fontSize: 50,
                                color: Theme.of(context).canvasColor),
                          ),
                          Text(
                            'مو',
                            style: TextStyle(
                                fontSize: 50,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Container(
                        height: 33,
                        width: 33,
                        child: Image.asset(
                          'images/Union.png',
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Column(
                children: [
                  Text(
                    'توسعه',
                    style: TextStyle(fontSize: 12, color: gray),
                  ),
                  Text(
                    'datiego',
                    style: TextStyle(
                        fontSize: 16, color: Theme.of(context).canvasColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigashen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BottomNavigator(
            toggleThemeMode: widget.toggleThemeMode,
          );
        },
      ),
    );
  }
}
