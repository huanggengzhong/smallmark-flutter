import 'package:flutter/material.dart';
import './../../../widget/dash_line.dart';
import './../../../widget/star_rating.dart';
Widget getMovieContentWidget(Map movie){
  return Container(
    height:150,
    child:Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(movie['avater']),
        ),
        Expanded(//剩余内容填充组件
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(movie['title']),
                StarRating(rating: movie['rate'],count:5),
                Text(movie['juqing']),
              ],
            ),
          ),
        ),
        Container(
          width: 1,
          height: 130,
          child: DashLine(axis: Axis.vertical,count: 12,dashedHeight: 6,dashedWidth: .5,),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Icon(Icons.favorite_border,size: 20,color: Colors.red,),
              SizedBox(height: 10,),
              Text("想看")
            ],
          ),
        )
      ],
    )

  );
}
