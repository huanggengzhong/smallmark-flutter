import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main()=>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('文本组件练习') ,
      ),
//      body: TextRichDemo(),//文本样式1
      body: TextDemo(),//文本样式2
    );
  }
}

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
//        text: "Hello World",
//        style: TextStyle(color: Colors.red, fontSize: 20)
            children: [
              TextSpan(text: "Hello World", style: TextStyle(color: Colors.red)),
              TextSpan(text: "Hello flutter", style: TextStyle(color: Colors.green)),
              WidgetSpan(child: Icon(Icons.favorite, color: Colors.red,)),
              TextSpan(text: "Hello dart", style: TextStyle(color: Colors.blue)),
            ]
        )
    );
  }
}


// Text Widget
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
//      textScaleFactor: 1.5,
      style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
    );
  }
}