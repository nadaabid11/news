import 'dart:convert';
import 'package:flutter_news2/SportsModel.dart';
import 'package:http/http.dart' as http;


class FetchSports{
  Future<List <SportsModel> >fetchSports() async{
    http.Response response = await http.get("http://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=b96820cfa4ed40c9b504f2363d91de1d");
    if(response.statusCode==200) {
      var body = jsonDecode(response.body);
      List<SportsModel>sports=[];
      print(body);
      print('='*50);
      print(body['articles']);
      for (var item in body['articles']){
        sports.add(SportsModel.fromJson(item));
      }
      return sports;
    }else {
      return null;
    }
  }
}
