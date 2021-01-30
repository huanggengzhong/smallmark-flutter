import 'package:flutter/material.dart';
import './widget/MovieRankWidget.dart';
class MovieListItem extends StatelessWidget {
  final Map movies;
  final int index;
  MovieListItem(this.movies,this.index);
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
        ],
      ),
    );
  }
}
