import 'package:flutter/material.dart';
import 'package:flutter_news2/AllnewsModel.dart';
import 'package:flutter_news2/fetchallApi.dart';
import 'package:flutter_news2/widgets/allnews_tile.dart';
class AllnewsScreen extends StatefulWidget {
  @override
  AllnewsScreenState createState() => AllnewsScreenState();
}
class AllnewsScreenState extends State<AllnewsScreen> {
  Widget buildTextForm({String title,image}){
  }
  Widget build(BuildContext context) {
    FetchallApi fetchallApi =FetchallApi();
    return Scaffold(
      body: FutureBuilder(
              future: fetchallApi.fetchAllnews(),
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(252,103 , 2, 1))),
                  );
                }else {
                  List<AllnewsModel> allnews = snapshot.data;
                  return allnews == null ? Center(child: Text('No Articles!'),) : ListView.builder(
                    itemCount: allnews.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return  AllnewsTile(
                        title: snapshot.data[index].title,
                        image: snapshot.data[index].imageUrl,
                        details: snapshot.data[index].details,
                        subtitle: snapshot.data[index].time,
                      );
                    },
                  );
                }
              })
    );
  }
}
//https://www.very.co.uk/assets/static/2020/11/contingency/13-apple/macbook-pro/desktop/4thway.jpg
//https://www.very.co.uk/assets/static/2020/10/4thways/27-microsoft-cat-ban/desktop/microsoft-cat-ban.jpg