import 'package:flutter/material.dart';
import 'detail.dart';
main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("首页"),
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ButtonWidget()],
                ))));
  }
}

class ButtonWidget extends StatelessWidget {
  void _jumpToDetail(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx){
        return DetailScreen();
      }
    ));
  }
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("跳转详情页"),
      onPressed: ()=>_jumpToDetail(context),
    );
  }
}

