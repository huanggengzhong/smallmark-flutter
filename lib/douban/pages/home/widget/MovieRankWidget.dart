import 'package:flutter/material.dart';
Widget getMovieRankWidget(index){
  return Container(
    padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: Color.fromARGB(255, 238, 205, 144)
    ),
    child: Text("No.${index+1}",
    style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 131, 95, 36)),),
  );
}