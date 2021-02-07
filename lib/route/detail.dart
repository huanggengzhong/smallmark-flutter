import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情页"),
      ),
      body: Container(
        child: Text("我是详情页"),
      ),
    );
  }
}
