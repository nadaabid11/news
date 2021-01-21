import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String details;
  final String subtitle;
  ViewScreen({ this.title, this.imageUrl,this.details,this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height /2.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                  fit: BoxFit.fill
              ),
            ),
            child: IconButton(
              alignment: Alignment.topLeft,
              iconSize: 25,
              onPressed: ()=> Navigator.pop(context),
              icon: (Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10, left: 25),
                height: MediaQuery.of(context).size.height / 11,
                width: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color.fromRGBO(252, 103, 2, 1),
                ),
              ),
              SizedBox(width: 5,),
              Expanded(
                child: Text(title,
                  overflow: TextOverflow.visible,
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
            width: MediaQuery.of(context).size.width / 1.15,
            height: MediaQuery.of(context).size.height/2,
            color: Colors.white30,
            margin: EdgeInsets.only(top: 20, left: 25, right: 10),
            child: Expanded(
              child: Text( details.toString()=='null'? '': details,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
            )) ],
            ),
    );
  }
}
//DateFormat.yMMMEd().format(DateTime.parse(description)