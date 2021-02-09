import 'package:flutter/material.dart';
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于页"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("1111111"),
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
