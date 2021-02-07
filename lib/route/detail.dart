import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    回到首页
    void _backToHome(BuildContext context) {
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("详情页"),
            RaisedButton(
                child: Text("回到首页"), onPressed: () => _backToHome(context))
          ],
        ),
      ),
    );
  }
}
