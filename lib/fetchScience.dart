import 'dart:convert';
import 'package:flutter_news2/ScienceModel.dart';
import 'package:http/http.dart' as http;


class FetchScience{
  Future<List <ScienceModel> >fetchScience() async{
    http.Response response = await http.get("http://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=b96820cfa4ed40c9b504f2363d91de1d");
    if(response.statusCode==200) {
      var body = jsonDecode(response.body);
      List<ScienceModel>science=[];
      print(body);
      print('='*50);
      print(body['articles']);
      for (var item in body['articles']){
        science.add(ScienceModel.fromJson(item));
      }
      return science;
    }else {
      return null;
    }
  }
}
