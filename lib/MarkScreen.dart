import 'package:flutter/material.dart';
import 'package:flutter_news2/core/book_mark_controller.dart';
import 'package:flutter_news2/core/book_mark_model.dart';
import 'package:flutter_news2/widgets/news_tile.dart';

class MarkScreen extends StatefulWidget {
  @override
  MarkScreenState createState() => MarkScreenState();
}

class MarkScreenState extends State<MarkScreen> {
  List<BookMarkModel> allNews;

  @override
  void initState() {
    getAllNews();
    super.initState();
  }

  bool _isLoading = true;

  void getAllNews()async{
    allNews =await BookMarkController().getAllNews();
    setState(()=> _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(
      child: CircularProgressIndicator(),
    ) : allNews.isEmpty ? Center(
      child: Text('BookMark is Empty...'),
    ) : ListView.builder(
      itemCount: allNews.length,
      itemBuilder: (_,index)=> NewsTile(
        title: allNews[index].title,
        image: allNews[index].imageUrl,
        subtitle: allNews[index].time,
        details: allNews[index].details,
        afterRemove: ()=> getAllNews(),
      ),
    );
  }
}