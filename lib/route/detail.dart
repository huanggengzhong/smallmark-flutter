import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
//  接收传递过来的参数
  final String message;

  DetailScreen(this.message);

  @override
  Widget build(BuildContext context) {
//    回到首页
    void _backToHome(BuildContext context) {
      Navigator.of(context).pop("详情页的数据");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("回到首页"), onPressed: () => _backToHome(context)),
            Text("${message}"),
          ],
        ),
      ),
    );
  }
}
