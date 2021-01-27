import 'package:flutter/material.dart';
import './widget/dash_line.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: DashLine(axis: Axis.horizontal,count: 10,dashedWidth: 8,),
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              child: DashLine(axis: Axis.vertical,count: 10,dashedHeight: 8,),
            ),
          ],
        ), //测试参数传递
      ),
    );
  }
}


