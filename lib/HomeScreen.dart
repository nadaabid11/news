import 'package:flutter/material.dart';
import 'package:flutter_news2/Allnews.dart';
import 'package:flutter_news2/Business.dart';
import 'package:flutter_news2/Science.dart';
import 'package:flutter_news2/Sports.dart';
import 'package:flutter_news2/Tech.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('News App',
          style: TextStyle(
              color: Color.fromRGBO(252, 103, 2, 1),
              fontSize: 18),
        ),
        elevation:1, automaticallyImplyLeading: true,
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Color.fromRGBO(252, 103, 2, 1),
          indicatorWeight: 2,
          onTap: (index){},
          tabs: <Widget>[
            Tab(child:
              Text('All news',
              style:TextStyle(
                  color: Color.fromRGBO(168, 170, 170, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.normal) ,),),
            Tab(child: Text('Business',
              style:TextStyle(
                  color: Color.fromRGBO(168, 170, 170, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.normal) ,),),
            Tab(child: Text('Sports',
              style:TextStyle(
                  color: Color.fromRGBO(168, 170, 170, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.normal) ,),),
            Tab(child: Text('Tech',
              style:TextStyle(
                  color: Color.fromRGBO(168, 170, 170, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.normal) ,),),
            Tab(child: Text('Science',
              style:TextStyle(
                  color: Color.fromRGBO(168, 170, 170, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.normal) ,),),


          ],),
       ),
        body: TabBarView(
          children: <Widget>[
            AllnewsScreen(),
            BusinessScreen(),
            SportsScreen(),
            TechScreen(),
            ScienceScreen()

          ],
        ),


              

        ),

        );
  }
}