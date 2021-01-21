import 'package:flutter/material.dart';
import 'package:flutter_news2/splash_screen.dart';
import 'BottomNavigationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

