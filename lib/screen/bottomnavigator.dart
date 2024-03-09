import 'package:flutter/material.dart';
import 'package:monews/constants/color.dart';
import 'package:monews/screen/save_screen.dart';

import 'home_screen.dart';
import 'main_screen.dart';

class BottomNavigator extends StatefulWidget {
  Function() toggleThemeMode;

  BottomNavigator({
    super.key,
    required this.toggleThemeMode,
  });

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedBottom = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).accentColor,
          onTap: (int index) {
            setState(() {
              _selectedBottom = index;
            });
          },
          currentIndex: _selectedBottom,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_profile.png'),
              activeIcon: Image.asset(
                'images/icon_profile.png',
                color: Theme.of(context).canvasColor,
              ),
              label: 'item 1',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_save.png'),
              activeIcon: Image.asset(
                'images/icon_save.png',
                color: Theme.of(context).canvasColor,
              ),
              label: 'item 2',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_discover.png'),
              activeIcon: Image.asset(
                'images/icon_discover.png',
                color: Theme.of(context).canvasColor,
              ),
              label: 'item 3',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icon_home.png'),
              activeIcon: Image.asset(
                'images/icon_home.png',
                color: Theme.of(context).canvasColor,
              ),
              label: 'item 4',
            ),
          ]),
      body: IndexedStack(
        index: _selectedBottom,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      SaveScreen(),
      MainScreen(),
      HomeScreen(
        toggleThemeMode: widget.toggleThemeMode,
      ),
    ];
  }
}
