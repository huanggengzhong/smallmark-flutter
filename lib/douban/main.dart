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
          rating: 10,
//          count:6
        ), //测试参数传递
      ),
    );
  }
}

class StarRating extends StatefulWidget {
  final double rating; //多少分
  final double maxRating; //满分是多少分,默认10分
  final int count; //数量,默认5个
  final double size; //图标大小,默认30
  final Color unSelectedColor; //未选中颜色,默认灰色
  final Color selectedColor; //选中颜色,默认红色
//  是否传递图片
  final Widget unselectedImage;
  final Widget selectedImage;

  StarRating({
    @required this.rating, //必选参数
    this.maxRating = 10, //这里开始是可选参数,并给默认值
    this.count = 5,
    this.size = 30,
    this.unSelectedColor = const Color(0xffbbbbbb), //默认rgb颜色,要用常量声明
    this.selectedColor = Colors.red,
    Widget unselectedImage,
    Widget selectedImage,
  })  : unselectedImage = unselectedImage ??
//      ??意思前面的内容为空则使用后面的初始化赋值
            Icon(
              Icons.star_border,
              color: unSelectedColor,
              size: size,
            ),
        selectedImage = selectedImage ??
            Icon(
              Icons.star,
              color: selectedColor,
              size: size,
            );

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  //  抽离生成组件的函数(未选择的情况)
  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

//  抽离生成组件的函数
  List<Widget> buildSelectedStar() {
    //1.创建star
    List<Widget> stars = [];
    final star = widget.selectedImage;

//    2.创建满填充的star

    double oneValue = widget.maxRating / widget.count; //一个星占多少分
    int entireCount = (widget.rating / oneValue).floor(); //计算出多少个满

//    添加满星
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }
//    //3.没有满填充的star,用到裁剪组件ClipRect 3.5-3=0.5*widget.size
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
      clipper: StarRect(leftWidth),
      child: star,
    );

    stars.add(ClipRect(
      child: halfStar,
    ));
    
//    增加判断如果超出限定
    if(stars.length>widget.count){
      return  stars.sublist(0,widget.count);
    }

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

//矩形裁剪

class StarRect extends CustomClipper<Rect> {
  //传入Rect矩形作为泛型
  double width;

  StarRect(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height); //裁剪宽度,高度不变
  }

  bool shouldReclip(CustomClipper oldClipper) {
    //要不要重新裁剪
    return oldClipper != this.width;
  }
}
