import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_news2/AllnewsModel.dart';

class FetchallApi{
  Future<List <AllnewsModel> >fetchAllnews() async{
    http.Response response = await http.get("http://newsapi.org/v2/top-headlines?country=eg&apiKey=df1a070b89e64ce78ba286cea86af31b");
    if(response.statusCode==200) {
      var body = jsonDecode(response.body);
      List<AllnewsModel>allnews=[];
      for (var item in body['articles']){
        allnews.add(AllnewsModel.fromJson(item));
      }
      return allnews;
    }else {
      return null;
    }
  }
}