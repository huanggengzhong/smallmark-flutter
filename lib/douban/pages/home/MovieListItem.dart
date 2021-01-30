import 'package:flutter/material.dart';
import './widget/MovieRankWidget.dart';
import './widget/MovieDescWidget.dart';
import './widget/MovieContentWidget.dart';
class MovieListItem extends StatelessWidget {
  final Map movie;
  final int index;
  MovieListItem(this.movie,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 10,color: Color(0xffe2e2d2)))
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      // 1.电影排名
          getMovieRankWidget(index),
        SizedBox(height: 12,),
//          2.具体内容
        getMovieContentWidget(movie),
SizedBox(height: 12,),

//        3.描述
        getMovieDescWidget(movie['desc'])

        ],
      ),
    );
  }
}
