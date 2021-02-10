import 'package:flutter/material.dart';
class AboutPage extends StatelessWidget {
  static const String routeName="/about";

  @override
  Widget build(BuildContext context) {
    //  获取参数
    final message=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("关于页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("获取首页参数:$message"),
            RaisedButton(
              child: Text("返回首页"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
