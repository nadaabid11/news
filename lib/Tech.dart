import 'package:flutter/material.dart';
import 'package:flutter_news2/TechModel.dart';
import 'package:flutter_news2/fetchTech.dart';
import 'package:flutter_news2/widgets/news_tile.dart';
class TechScreen extends StatefulWidget {
  @override
  TechScreenState createState() => TechScreenState();
}

class TechScreenState extends State<TechScreen> {
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    FetchTech fetchTech =FetchTech();
    return Scaffold(
      body: FutureBuilder(
          future: fetchTech.fetchTech(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(252,103 , 2, 1))
                ),
              );
            }else {
              List<TechModel> tech = snapshot.data;
              return tech == null ? Center(child: Text('No Articles!'),) : ListView.builder(
                itemCount: tech.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return   NewsTile(
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