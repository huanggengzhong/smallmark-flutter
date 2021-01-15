import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局组件'),
      ),

//      body:AlignDemo()
//        body:CenterDemo()
      body: StackDemo(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("点击了244333"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//Row组件布局
class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          color: Colors.red,
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.red,
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.red,
        ),
        Container(
          width: 80,
          height: 100,
          color: Colors.red,
        ),
      ],
    );
  }
}

//MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, // 主轴对齐方式
//    MainAxisSize mainAxisSize = MainAxisSize.max, // 水平方向尽可能大
//CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, // 交叉处对齐方式
//    TextDirection textDirection, // 水平方向子widget的布局顺序（默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左））
//VerticalDirection verticalDirection = VerticalDirection.down, // 表示Row纵轴（垂直）的对齐方向
//    TextBaseline textBaseline, // 如果上面是baseline对齐方式，那么选择什么模式（有两种可选）

//Column布局
class HYHomeContentColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.down,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Container(
          width: 80,
          height: 60,
          color: Colors.red,
          child: Text(
            "Hellxo",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          width: 120,
          height: 100,
          color: Colors.green,
          child: Text(
            "Woxrld",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          width: 90,
          height: 80,
          color: Colors.blue,
          child: Text(
            "abxc",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 50,
          height: 120,
          color: Colors.orange,
          child: Text(
            "cxba",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ],
    );
  }
}

class HYHomeContentExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
//          Flexible 组件可以控制 Row、Column、Flex 的子控件占满父组件，比如，Row 中有3个子组件，两边的宽是100，中间的占满剩余的空间，代码如下：
//          Flexible(
//            fit: FlexFit.tight,
//            flex: 1,
//            child: Container(
//              width: 80,
//              height: 60,
//              color: Colors.red,
//            ),
//          ),
//          Flexible(
//            fit: FlexFit.tight,
//            flex: 2,
//            child: Container(
//              width: 120,
//              height: 60,
//              color: Colors.green,
//            ),
//          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 80,
              height: 60,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 120,
              height: 60,
              color: Colors.green,
            ),
          ),

          Container(
            width: 90,
            height: 80,
            color: Colors.blue,
          ),
          Container(
            width: 50,
            height: 120,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class StackDemo extends StatefulWidget {
  bool _isFavor=true;
  @override
  _StackDemoState createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8), //只有某个地方有padding
              color: Color.fromARGB(150, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '好好看',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  IconButton(icon: Icon(Icons.favorite,color:Colors.red,), onPressed: ()=>{
                    print("点击了图标"),
                  })
                ],
              ),
            ))
      ],
    );
  }
}



