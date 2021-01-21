import 'package:flutter/material.dart';
import 'package:flutter_news2/ScienceModel.dart';
import 'package:flutter_news2/fetchScience.dart';
import 'package:flutter_news2/widgets/news_tile.dart';
class ScienceScreen extends StatefulWidget {
  @override
  ScienceScreenState createState() => ScienceScreenState();
}
class ScienceScreenState extends State<ScienceScreen> {
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    FetchScience fetchScience =FetchScience();
    return Scaffold(
      body: FutureBuilder(
          future: fetchScience.fetchScience(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(252,103 , 2, 1))
                ),
              );
            }else {
              List<ScienceModel> science = snapshot.data;
              return science == null ? Center(child: Text('No Articles!'),) : ListView.builder(
                itemCount: science.length,
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