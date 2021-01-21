import 'package:flutter/material.dart';
import 'package:flutter_news2/core/book_mark_controller.dart';
import 'package:flutter_news2/core/book_mark_model.dart';
import 'package:intl/intl.dart';
import '../view_screen.dart';

class NewsTile extends StatefulWidget {
  final String subtitle;
  final String title;
  final String image;
  final String details;
  final Function afterRemove;
  final bool bookMark;
  NewsTile({this.subtitle, this.title, this.image,this.details, this.afterRemove, this.bookMark = true});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  bool isMarked = false;
  BookMarkController _bookMarkController = BookMarkController();
  @override
  void initState() {
    check();
    super.initState();
  }

  check()async{
    isMarked =await _bookMarkController.check(widget.image);
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.white24,
      padding: EdgeInsets.only(left: 10),
      onPressed: () {
        Navigator.push(context ,MaterialPageRoute(builder: (context) =>ViewScreen(
          title:  widget.title,
          imageUrl: widget.image,
          details: widget.details,

        ),));
      },
      child: Container(
        margin: EdgeInsets.only(left: 2,top: 20),
        child:
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/3.5,
              height: MediaQuery.of(context).size.height/6.9,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.fill)),
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.55,
              height: MediaQuery.of(context).size.height/6.9,
              color: Colors.white30,
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 13,
                          color:Colors.black,
                          fontWeight: FontWeight.w400),),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        DateFormat.yMMMEd().format(DateTime.parse(widget.subtitle)),
                        style: TextStyle(
                            fontSize: 12,
                            color:Colors.black54,
                            fontWeight: FontWeight.w400),),
                      if(widget.bookMark)
                      IconButton(
                        onPressed:()async{
                          if(isMarked){
                            await _bookMarkController.remove(widget.image);
                          }else {
                            await _bookMarkController.add(BookMarkModel(
                                widget.title, widget.image, widget.subtitle,widget.details));
                          }
                          isMarked = !isMarked;
                          setState(() {});
                          if(widget.afterRemove != null)
                            widget.afterRemove();
                        },
                        icon: (
                            Icon(
                              isMarked ? Icons.bookmark : Icons.bookmark_border,
                          color: Color.fromRGBO(252,103 , 2, 1),)),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),),
    );
  }
}