import 'package:flutter/material.dart';
import './pages/main/main.dart';


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
        title: Text("豆瓣App"),
      ),
      body: MainPage()
    );
  }
}



