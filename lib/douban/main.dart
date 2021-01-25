import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '豆瓣',
        theme: ThemeData(
            primaryColor: Colors.green,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("豆瓣App"),
      ),
      body: HYStarRating()
        );
  }
}

class HYStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  HYStarRating({
  @required this.rating,
  this.maxRating = 10,
  this.size = 30,
  this.unselectedColor = const Color(0xffbbbbbb),
  this.selectedColor = const Color(0xffe0aa46),
  Widget unselectedImage,
      Widget selectedImage,
  this.count = 5,
}): unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor,),
selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor);

@override
_HYStarRatingState createState() => _HYStarRatingState();
}

class _HYStarRatingState extends State<HYStarRating> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(children: getUnSelectImage(), mainAxisSize: MainAxisSize.min),
          Row(children: getSelectImage(), mainAxisSize: MainAxisSize.min),
        ],
      ),
    );
  }

  // 获取评星
  List<Widget> getUnSelectImage() {
    return List.generate(widget.count, (index) => widget.unselectedImage);
  }

  List<Widget> getSelectImage() {
    // 1.计算Star个数和剩余比例等
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    double leftValue = widget.rating - entireCount * oneValue;
    double leftRatio = leftValue / oneValue;

    // 2.获取start
    List<Widget> selectedImages = [];
    for (int i = 0; i < entireCount; i++) {
      selectedImages.add(widget.selectedImage);
    }

    // 3.计算
    Widget leftStar = ClipRect(
      clipper: MyRectClipper(width: leftRatio * widget.size),
      child: widget.selectedImage,
    );
    selectedImages.add(leftStar);

    return selectedImages;
  }
}


class MyRectClipper extends CustomClipper<Rect>{
  final double width;

  MyRectClipper({
    this.width
  });

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}