import 'dart:convert';
import 'package:flutter_news2/TechModel.dart';
import 'package:http/http.dart' as http;


class FetchTech{
  Future<List <TechModel> >fetchTech() async{
    http.Response response = await http.get("http://newsapi.org/v2/top-headlines?country=eg&category=technology&apiKey=b96820cfa4ed40c9b504f2363d91de1d");
    if(response.statusCode==200) {
      var body = jsonDecode(response.body);
      List<TechModel>tech=[];
      print(body);
      print('='*50);
      print(body['articles']);
      for (var item in body['articles']){
        tech.add(TechModel.fromJson(item));
      }
      return tech;
    }else {
      return null;
    }
  }
}