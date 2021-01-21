import 'dart:convert';

import 'package:flutter_news2/core/book_mark_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookMarkController {

  SharedPreferences _sharedPreferences;

  Future add(BookMarkModel model)async{
    _sharedPreferences = await SharedPreferences.getInstance();
    Map<String,String> news = model.toJson();
    final encodedNews = json.encode(news);
    _sharedPreferences.setString(model.imageUrl, encodedNews);
  }

  Future remove(String key)async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.remove(key);
  }

  Future<bool> check(String key)async{
    _sharedPreferences = await SharedPreferences.getInstance();
    bool containedKey = _sharedPreferences.containsKey(key);
    return containedKey;
  }

  Future<List<BookMarkModel>> getAllNews()async{
    List<BookMarkModel> allNews = [];
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.getKeys().forEach((element) {
      final decodedNews = json.decode(_sharedPreferences.getString(element));
      allNews.add(BookMarkModel.fromJson(decodedNews));
    });
    return allNews;
  }

}