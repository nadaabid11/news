import 'dart:convert';
import 'package:flutter_news2/BusinessModel.dart';
import 'package:http/http.dart' as http;

class FetchApi{
  Future<List <BusinessModel> >fetchBusiness() async{
    http.Response response = await http.get('http://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=b96820cfa4ed40c9b504f2363d91de1d');
    if(response.statusCode==200) {
        var body = jsonDecode(response.body);
        List<BusinessModel>business=[];
        for (var item in body['articles']){
          business.add(BusinessModel.fromJson(item));
        }
        return business;
      }else {
      return null;
    }
  }
}