import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '豆瓣',
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评分组件"),
      ),
      body: Center(
        child: StarRating(count: 10,),//测试参数传递
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  final double rating; //多少分
  final double maxRating; //满分是多少分
  final int count; //数量
  final double size; //大小
  final Color unSelectedColor; //未选中颜色
  final Color selectedColor; //选中颜色

  StarRating({
    @required this.rating, //必选参数
    this.maxRating = 10, //这里开始是可选参数,并给默认值
    this.count = 5,
    this.size = 30,
    this.unSelectedColor = const Color(0xffbbbbbb), //默认rgb颜色,要用常量声明
    this.selectedColor = Colors.red
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
    Row(
    mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (index) {
        return Icon(
          Icons.star_border,
          color: widget.unSelectedColor,
          size: widget.size,
        );
      })
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.star,
            color: widget.selectedColor,
            size: widget.size,
          ),
          Icon(
            Icons.star,
            color: widget.selectedColor,
            size: widget.size,
          ),
          Icon(
            Icons.star,
            color: widget.selectedColor,
            size: widget.size,
          ),
        ],
      ),
      ],
    );
  }
}
