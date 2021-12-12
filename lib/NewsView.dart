import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  final String imgurl;
  final String title;
  NewsView({this.title,this.imgurl});


  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: <Widget>[
            Image.network(imgurl),
            SizedBox(height: 10,),
            Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          ],
        )
      );
  }
}
