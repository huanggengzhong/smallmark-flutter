
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Container(
//        发现TextRich没有用,用下面语法有用
        child: TextField(
          decoration: InputDecoration(
              hintText: "请输入姓名",
              labelText:"姓名",
              labelStyle: TextStyle(color: Colors.red),
              helperText: "姓名长度为6-10个字母",
              helperMaxLines: 1,
              helperStyle: TextStyle(color: Colors.blue)
          ),
        ),
      ),
    );
  }
}

