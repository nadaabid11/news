import 'package:flutter/material.dart';
import 'package:flutter_news2/core/book_mark_controller.dart';
import 'package:flutter_news2/core/book_mark_model.dart';
import 'package:intl/intl.dart';
import '../view_screen.dart';

class AllnewsTile extends StatefulWidget {
  final String subtitle;
  final String title;
  final String image;
  final String details;
  final Function afterRemove;
  final bool bookMark;
  AllnewsTile({this.subtitle, this.title, this.image,this.details, this.afterRemove, this.bookMark = true});

  @override
  AllnewsTileState createState() => AllnewsTileState();
}

class AllnewsTileState extends State<AllnewsTile> {
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
    return FlatButton(padding: EdgeInsets.only(left: 0,right: 0),
      splashColor: Colors.white24,
      onPressed: () {
        Navigator.push(context ,MaterialPageRoute(builder: (context) =>ViewScreen(
          title:  widget.title,
          imageUrl: widget.image,
          details: widget.details,

        ),));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height /2.4,
       child: Column(
         children: <Widget>[
           Container( height: MediaQuery.of(context).size.height /3.5,
             decoration: BoxDecoration(
               image: DecorationImage(
                   image: NetworkImage(widget.image),
                   fit: BoxFit.fill
               ),
             ),),
           Row(
             children: <Widget>[
               Container(
                 margin: EdgeInsets.only(top: 5, left: 25),
                 height: MediaQuery.of(context).size.height / 14,
                 width: 3,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(2),
                   color: Color.fromRGBO(252, 103, 2, 1),
                 ),
               ),
               SizedBox(width: 5,),
               Expanded(
                 child: Text(widget.title,
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2,
                   style: TextStyle(
                       fontSize: 15,
                       color: Colors.black,
                       fontWeight: FontWeight.bold),
                 ),
               ),
             ],
           ),
           Container(
             height: 18,
             margin: EdgeInsets.symmetric(horizontal: 40),
             child: Row(
               children: <Widget>[
                 Container(
                   child: Text(
                     DateFormat.yMMMEd().format(DateTime.parse(widget.subtitle)),
                     style: TextStyle(
                         fontSize: 12,
                         color:Colors.black54,
                         fontWeight: FontWeight.w400),),
                 ),
                 if(widget.bookMark)
                   IconButton(padding: EdgeInsets.only(top: 0),
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
             ),
           )
         ],
       ),
      ),
    );
  }
}