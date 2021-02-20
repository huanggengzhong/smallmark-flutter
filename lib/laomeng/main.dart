
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
        child: Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: "Home: ",
                  style: TextStyle(color: Colors.red)
              ),
              TextSpan(
                  text: "https://flutterchina.club",

              ),
            ]
        )),
      ),
    );
  }
}

