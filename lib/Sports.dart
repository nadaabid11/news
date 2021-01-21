import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_news2/SportsModel.dart';
import 'package:flutter_news2/fetchsports.dart';
import 'package:flutter_news2/view_screen.dart';
import 'package:flutter_news2/widgets/news_tile.dart';
class SportsScreen extends StatefulWidget {
  @override
  SportsScreenState createState() => SportsScreenState();
}

class SportsScreenState extends State<SportsScreen> {
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    FetchSports fetchSports =FetchSports();
    return Scaffold(
      body: FutureBuilder(
          future: fetchSports.fetchSports(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(252,103 , 2, 1)),
                  ),
              );
            }else {
              List<SportsModel> sports = snapshot.data;
              return sports == null ? Center(child: Text('No Articles!'),) : ListView.builder(
                itemCount: sports.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return  NewsTile(
                    title: snapshot.data[index].title,
                    details: snapshot.data[index].details,
                    subtitle: snapshot.data[index].time,
                    image: snapshot.data[index].imageUrl,
                  );
                },
              );
            }
          }),
    );
  }
}