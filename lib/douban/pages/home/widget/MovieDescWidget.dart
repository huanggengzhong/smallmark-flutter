import 'package:flutter/material.dart';
Widget getMovieDescWidget(String desc){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Color(0xfff2f2f2),
      borderRadius: BorderRadius.circular(5)
    ),
    child: Text(desc,style: TextStyle(fontSize: 18,color: Colors.black54),),
  );
}
