import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: '豆瓣', home: HomePage());
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
        child: StarRating(
          rating:7,
          count: 6,
        ), //测试参数传递
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

  StarRating({@required this.rating, //必选参数
    this.maxRating = 10, //这里开始是可选参数,并给默认值
    this.count = 5,
    this.size = 30,
    this.unSelectedColor = const Color(0xffbbbbbb), //默认rgb颜色,要用常量声明
    this.selectedColor = Colors.red});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  //  抽离生成组件的函数(未选择的情况)
  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return Icon(
        Icons.star_border,
        color: widget.unSelectedColor,
        size: widget.size,
      );
    });
  }

//  抽离生成组件的函数
  List<Widget> buildSelectedStar() {
    //1.创建star
    List<Widget> stars = [];
    final star = Icon(
      Icons.star,
      color: widget.selectedColor,
      size: widget.size,
    );

//    2.创建满填充的star

    double oneValue=widget.maxRating / widget.count;//一个星占多少
    int entireCount=(widget.rating / oneValue).floor();//多少个满


//    添加满星
    for(var i=0;i<entireCount;i++){
      stars.add(star);
    }
//    //3.没有满填充的star,用到裁剪组件ClipRect

//    将最终结果返回
    return stars;

  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: buildSelectedStar(),
      ),
    ]);
  }
}
