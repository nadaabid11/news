import 'package:flutter/material.dart';
import 'package:flutter_news2/HomeScreen.dart';
import 'package:flutter_news2/MarkScreen.dart';
import 'package:flutter_news2/SearchScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  List _screens = [
    HomeScreen(),
    SearchScreen(),
    MarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: Color.fromRGBO(252, 103, 2, 1),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25,
                ),
                //label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search,
                    size: 25),
                //label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  size: 25,
                ),
                //label: '',
              ),
            ],
          ),
          body: _screens[_currentIndex],
        ));
  }
}
