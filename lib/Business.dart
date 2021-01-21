import 'package:flutter/material.dart';
import 'package:flutter_news2/BusinessModel.dart';
import 'package:flutter_news2/fetchApi.dart';
import 'package:flutter_news2/widgets/news_tile.dart';
class BusinessScreen extends StatefulWidget {
  @override
  BusinessScreenState createState() => BusinessScreenState();
}

class BusinessScreenState extends State<BusinessScreen> {
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi =FetchApi();
    return Scaffold(
      body: FutureBuilder<List <BusinessModel>>(
        future: fetchApi.fetchBusiness(),
          builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(252,103 , 2, 1))
              ),
            );
          }else {
              List<BusinessModel> business = snapshot.data;
              return business == null ? Center(child: Text('No Articles!'),) : ListView.builder(
                itemCount: business.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return  NewsTile(
                    title: snapshot.data[index].title,
                    //TODO: مكنتيش عامله السطر دا اصلا مكنتيش جايبه الداتا من الاسنابشوت  وتبصيها فالاسكرين عشان تتعرض ف كان بيشوفها ب نل
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