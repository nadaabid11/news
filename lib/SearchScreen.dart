import 'package:flutter/material.dart';
import 'package:flutter_news2/widgets/news_tile.dart';
import 'AllnewsModel.dart';
import 'fetchallApi.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<AllnewsModel> news;
  List<AllnewsModel> searchList = [];
  String searchKeyWord;
  bool _isLoading = true;
  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews()async{
    news = await FetchallApi().fetchAllnews();
    setState(()=> _isLoading = false);
  }

  Future search(String value)async{
    searchList = [];
    news.forEach((element) {
      String title = element.title.toLowerCase();
      if(title.contains(value.toLowerCase())){
        setState(()=> searchList.add(element));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(252,103 , 2, 1))
      ),
    ) : Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          TextField(
            onChanged: (value)=> searchKeyWord = value,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: "Enter search",
              prefixIcon: IconButton(icon: IconButton(icon: Icon(Icons.search), onPressed: ()=> search(searchKeyWord),
                padding: EdgeInsetsDirectional.only(top: 1,start: 5), iconSize: 26, ),),
               border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(252, 103, 2, 1) )) ,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(252, 103, 2, 1),
                width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              filled: true
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child:  searchList.isEmpty ? Text('No Results!',)
                :ListView.builder(
              itemCount: searchList.length,
              itemBuilder: (_,index)=> NewsTile(
                image: searchList[index].imageUrl,
                subtitle: searchList[index].time,
                details: searchList[index].details,
                title: searchList[index].title,
                bookMark: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

